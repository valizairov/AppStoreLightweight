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
