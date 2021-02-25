//
//  Model.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

struct AppStoreItem: Decodable {
    
    var song: [Item]?
    var book: [Item]?
    var album: [Item]?
    var coachedAudio: [Item]?
    var featureMovie: [Item]?
    var interactiveBooklet: [Item]?
    var musicVideo: [Item]?
    var pdfPodcast: [Item]?
    var podcastEpisode: [Item]?
    var softwarePackage: [Item]?
    var tvEpisode: [Item]?
    var artist: [Item]?
    
    enum CodingKeys: String, CodingKey {
        case song
        case book
        case album
        case coachedAudio = "coached-audio"
        case featureMovie = "feature-movie"
        case interactiveBooklet = "interactive-booklet"
        case musicVideo = "music-video"
        case pdfPodcast = "pdf podcast"
        case podcastEpisode = "podcast-episode"
        case softwarePackage = "software-package"
        case tvEpisode = "tv-episode"
        case artist = "artist"
    }
    
    struct Item: Decodable {
        var id: Int
        var name: String
        var artwork: String
        var genre: String
        var url: String
        
        enum  CodingKeys: String, CodingKey {
            case id, name, artwork, genre, url
        }
        
        init(from decoder: Decoder) throws {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            id = try container.decode(Int.self, forKey: .id)
            name = try container.decode(String.self, forKey: .name)
            artwork = try container.decode(String.self, forKey: .artwork)
            genre = try container.decode(String.self, forKey: .genre)
            url = try container.decode(String.self, forKey: .url)
        }
    }
}
