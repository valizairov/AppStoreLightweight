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
    //let searchTerm = "jack+johnson"
    
    func returnItems(_ searchTerm: String) -> [String: [AppStoreItem.Item]] {
        var items: [String: [AppStoreItem.Item]] = [:]
        fetchData(searchTerm: searchTerm, completion: { (appStoreItem) in
            if let appStoreItem = appStoreItem, let results = appStoreItem.results {
                for item in results {
                    let type = item.kind
                    if items[type] != nil {
                        items[type]?.append(item)
                    } else {
                        items[type] = [item]
                    }
                }
            }
        })
        return items
    }

    private func fetchData(searchTerm: String, completion: (AppStoreItem?) -> ()) {
        var model: AppStoreItem?
        if let url = URL(string: "\(API)\(searchTerm)") {
            do {
                let data = try? Data(contentsOf: url)
                model = try JSONDecoder().decode(AppStoreItem.self, from: data!)
                completion(model)
            } catch {
                print("Decoding problem")
                completion(nil)
            }
        }
    }
}
