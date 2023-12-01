
import Foundation



public enum GetNovelList{
    public struct Request
   {
       public var page: Int
       init(page: Int) {
           self.page = page
       }
   }
    public struct Response
   {
        public var NovelList: NovelListModel?
   }
   
    public struct ViewModel
   {
        public var NovelList: NovelListModel?
   }
}

public struct NovelListModel: Codable {
    public private(set) var pageInfo: PageInfo
    public private(set) var list: [List]
}

public struct List: Codable{
    public private(set) var novel: Novel?
}


public struct Novel: Codable {
    public private(set) var id: Int?
    public private(set) var updatedAt: String?
    public private(set) var title: String?
    public private(set) var type: String?
    public private(set) var description: String?
    public private(set) var totalChapter: Int?
    public private(set) var category: Category?
    public private(set) var tags: [String]?
    public private(set) var owners: [Owner]?
    public private(set) var thumbnail: Thumbnail?
    public private(set) var engagement: Engagement?
    public private(set) var order: Int?
}


public struct Category: Codable {
    public private(set) var main: Int?
    public private(set) var sub: Int?
    public private(set) var mainTitle: String?
    public private(set) var subTitle: String?
}


public struct Engagement: Codable {
    public private(set) var view: View?
    public private(set) var comment: Comment?
}


public struct Comment: Codable {
    public private(set) var primary: Int?
    public private(set) var overall: Int?
}


public struct View: Codable {
    public private(set) var month: Int?
    public private(set) var overall: Int?
}


public struct Owner: Codable {
    public private(set) var id: Int?
    public private(set) var username: String?
    public private(set) var alias: String?
    public private(set) var role: String?
}


public struct Thumbnail: Codable {
    public private(set) var normal: String?
    public private(set) var landscape: String?
}

