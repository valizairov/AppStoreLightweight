//
//  DataManager.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

import Foundation
import UIKit

final class DataManager {
    static let shared = DataManager()
    private init() {}
    
    func returnItems() -> [String: [AppStoreItem.Item]] {
        var items: [String: [AppStoreItem.Item]] = [:]
        if let data = fetchData() {
            if let obj = data.song {
                items["Song"] = obj
            }
            if let obj = data.book {
                items["Book"] = obj
            }
            if let obj = data.album {
                items["Album"] = obj
            }
            if let obj = data.coachedAudio {
                items["Coached Audio"] = obj
            }
            if let obj = data.featureMovie {
                items["Feature Movie"] = obj
            }
            if let obj = data.interactiveBooklet {
                items["Interactive Booklet"] = obj
            }
            if let obj = data.musicVideo {
                items["Music Video"] = obj
            }
            if let obj = data.pdfPodcast {
                items["PDF Podcast"] = obj
            }
            if let obj = data.podcastEpisode {
                items["Podcast Episode"] = obj
            }
            if let obj = data.softwarePackage {
                items["Software Package"] = obj
            }
            if let obj = data.tvEpisode {
                items["TV Episode"] = obj
            }
            if let obj = data.artist {
                items["Artist"] = obj
            }
        }
        return items
    }

    func fetchData() -> AppStoreItem? {
        print("fetching the data")
        guard let fileURL = Bundle.main.url(forResource: "sample", withExtension: "json") else {
            print("couldn't find the file")
            return nil
        }
        
        do {
            let data = try Data(contentsOf: fileURL)
            let model = try JSONDecoder().decode(AppStoreItem.self, from: data)
            return model

        } catch let error {
            print(error)
            return nil
        }
        
    }
    
}
