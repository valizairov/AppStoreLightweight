//
//  Model.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

struct AppStoreItem: Decodable {
    
    var results: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case results
    }
    
    struct Item: Decodable {
        var id: Int?
        var name: String?
        var artwork: String?
        var genre: String?
        var url: String?
        var kind: String?
        
        enum  CodingKeys: String, CodingKey {
            case id = "trackId"
            case name = "trackName"
            case artwork = "artworkUrl30"
            case genre = "primaryGenreName"
            case url = "trackViewUrl"
            case kind
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            artwork = try container.decode(String.self, forKey: .artwork)
            genre = try container.decode(String.self, forKey: .genre)
            url = try container.decode(String.self, forKey: .url)
            kind = try container.decode(String.self, forKey: .kind)
        }
    }
}
