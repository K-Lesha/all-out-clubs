import Foundation

public struct Club: Codable, Hashable {
    public let id: String
    public let name: String
    public let country: String
    public let value: Int
    public let image: URL
    public let european_titles: Int
    public let stadium: Stadium
    public let location: Location
}

public struct Stadium: Codable, Hashable {
    public let size: Int
    public let name: String
}

public struct Location: Codable, Hashable {
    public let lat: Double
    public let lng: Double
}
