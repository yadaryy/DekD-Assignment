
import Foundation
import Moya

protocol WorkerService {
    var provider: MoyaProvider<Service> { get }
    func getBannerList(completion: @escaping (Result<[BannerListModel], Error>) -> Void)
    func getTopNovel(page: Int, completion: @escaping (Result<NovelListModel, Error>) -> Void)
}

class BaseWorkerService: WorkerService{
    func getBannerList(completion: @escaping (Result<[BannerListModel], Error>) -> Void) {
        request(target: .getBannerList, completion: completion)
    }
    func getTopNovel(page: Int, completion: @escaping (Result<NovelListModel, Error>) -> Void) {
        request(target: .getTopNovel(request: GetNovelList.Request(page: page) ), completion: completion)
    }
    var provider = MoyaProvider<Service>(plugins: [NetworkLoggerPlugin()])
    
}

private extension BaseWorkerService {
    private func request<T: Decodable>(target: Service, completion: @escaping (Result<T, Error>) -> ()) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(results))
                } catch let error {
                    completion(.failure(error))
                }
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
