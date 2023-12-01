

import UIKit

protocol NovelListBusinessLogic
{
    func setupData(page:Int)
}


class NovelListInteractor: NovelListBusinessLogic {

    var presenter: NovelListPresentationLogic?
    
    var NovelListWorker:BaseWorkerService = BaseWorkerService()
    
    func setupData(page:Int) {
        NovelListWorker.getTopNovel(page: page){ [weak self] response in
            switch response {
            case .success(let response):
           self?.presenter?.setupDataOnComplete(response: response)
            case .failure(let error):
                print(String(describing: error))
            }
        }
    
    }

}

