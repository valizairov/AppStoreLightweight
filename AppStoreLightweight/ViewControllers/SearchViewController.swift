//
//  SearchViewController.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBox: UITextField!
    @IBAction func performSearch(_ sender: Any) {
        guard let searchTerm = searchBox.text?.replacingOccurrences(of: " ", with: "+")
        else { return }
        DispatchQueue.global().async { [weak self] in
            let model = DataManager.shared.returnItems(searchTerm)
            self?.items = model
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    
    @IBAction func markAsFavorite(_ sender: UIButton) {
        print("id: \(sender.tag), itemName: \(favorites[sender.tag])")
        //Save to UserDefaults or Plist
        //Use sets for do/undo favorite action and display
    }
    
    var items: [String: [AppStoreItem.Item]] = [:]
    var favorites: [Int: AppStoreItem.Item] = [:] //to keep track of favorite button
    var indexes: [Int: Int] = [:] //how many items per section
    var sectionNames: [String] = []

    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var i = 0
        for (k, v) in items {
            indexes[i] = v.count
            i += 1
            sectionNames.append(k)
        }
        return indexes[section] ?? 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if sectionNames.count > 0 {
            return sectionNames[section]
        }
        return ""
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath) as! CustomCell
        let sectionName = sectionNames[indexPath.section]
        if let item = items[sectionName]?[indexPath.row] {
            cell.titleLabel.text = item.name
            cell.genreLabel.text = item.genre
            cell.linkLabel.text = item.url
            let favIndex = item.id ?? 0
            favorites[favIndex] = item
            if let artwork = item.artwork, let imageURL = URL(string: artwork) {
                let imageData = try! Data(contentsOf: imageURL)
                cell.artWorkImageView.image = UIImage(data: imageData)
            } else {
                //default placeholder
                cell.artWorkImageView.image = UIImage()
            }
            cell.favoriteButton.tag = item.id ?? 0
        }
        
        return cell
    }
    

    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
