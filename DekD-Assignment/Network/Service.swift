
import Foundation
import Moya


public enum Service {
    case getTopNovel(request: GetNovelList.Request)
    case getBannerList
}


extension Service : TargetType{
    
    public var baseURL: URL {
        let url = "https://www.dek-d.com"
        let api = "/api/rest"
        
        return URL(string: url+api)!
    }
    
    
    public var path: String {
        switch self {
        case .getTopNovel:
            return "/open/quiz/novel/list"
        case .getBannerList:
            return "/campaign/list"
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case .getBannerList :
            return .requestPlain
        
        case .getTopNovel(request: let request):
            return .requestParameters(parameters: ["page": request], encoding:
               URLEncoding.queryString)
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getBannerList ,.getTopNovel :
            return .get
        }
    }
    
    public var headers: [String : String]? {
        return ["SECRET": "DrVDKp2ancYmyW2b3wRVU6yssBcjiyJ4"]
    }
    
}





