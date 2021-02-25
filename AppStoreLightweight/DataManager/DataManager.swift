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
    
    let API = "https://itunes.apple.com/search?term="
    let searchTerm = "jack+johnson"
    
    func returnItems() -> [String: [AppStoreItem.Item]] {
        var items: [String: [AppStoreItem.Item]] = [:]
        if let data = fetchData(), let results = data.results {
            for item in results {
                let type = item.kind
                if items[type] != nil {
                    items[type]?.append(item)
                } else {
                    items[type] = [item]
                }
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
