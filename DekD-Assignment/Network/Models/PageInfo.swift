
import Foundation

public struct PageInfo: Codable {
    public private(set) var currentPage: Int?
    public private(set) var totalItems: Int?
    public private(set) var itemsPerPage: Int?
    public private(set) var hasPrevious: Bool?
    public private(set) var hasNext: Bool?
}
