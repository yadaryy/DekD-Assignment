

import Foundation

public enum GetBannerList{

    public struct Response
    {
        public var BannerList: BannerListModel?
    }
    public struct ViewModel
    {
        public var BannerList: BannerListModel?
    }
}

public struct BannerListModel: Codable {
    public private(set) var pageInfo: PageInfo?
    public private(set) var list: [ListBanner]?
}

public struct ListBanner: Codable {
    public private(set) var id: String?
    public private(set) var createdAt: String?
    public private(set) var updatedAt: String?
    public private(set) var startedAt: String?
    public private(set) var endedAt: String?
    public private(set) var published: Bool?
    public private(set) var payload: Payload?
}

public struct Payload: Codable {
    public private(set) var url: String?
    public private(set) var imageURL: ImageURL?

    public enum CodingKeys: String, CodingKey {
        case url
        case imageURL = "imageUrl"
    }
}

public struct ImageURL: Codable {
    public private(set) var mobile: String?
    public private(set) var tablet: String?
}

