//
//  FavoritesViewController.swift
//  AppStoreLightweight
//
//  Created by Vali Zairov on 2/23/21.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var items = [AppStoreItem.Item]()
    
    //action for removing from userdefaults, reload table.
    //For smoother UI, use deleteRows at
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cellFavorites", for: indexPath) as UITableViewCell
        return cell
    }
    

    @IBOutlet weak var tableViewController: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        print("FavoritesViewController")
        //load from userDefaults to items array
        //reload table
    }
    

}
