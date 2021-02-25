//
//  SearchViewController.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var items: AppStoreItem?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.song?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellSearch", for: indexPath) as! CustomCell
        if let item = items?.song?[indexPath.row] {
            //cell.artWorkImageView =
            cell.titleLabel.text = item.name
            cell.genreLabel.text = item.genre
            cell.linkLabel.text = item.url
            if let imageURL = URL(string: item.artwork) {
                let imageData = try! Data(contentsOf: imageURL)
                cell.artWorkImageView.image = UIImage(data: imageData)
            } else {
                //default placeholder
                cell.artWorkImageView.image = UIImage()
            }
        }
        
        return cell
    }
    

    @IBOutlet weak var tableViewController: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async { [weak self] in
            let model = DataManager.shared.fetchData()
            self?.items = model
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
    }
}
