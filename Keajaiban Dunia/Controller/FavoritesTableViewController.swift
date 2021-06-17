//
//  FavoritesTableViewController.swift
//  Keajaiban Dunia
//
//  Created by Muhammad Harviando on 17/06/21.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit
import RealmSwift

class FavoritesTableViewController: UITableViewController {
    
    var realm = try! Realm()
    var keajaiban: Results<KeajaibanObject>?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
        tableView.rowHeight = 130
    }
    
    func loadData() {
        keajaiban = realm.objects(KeajaibanObject.self)
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return keajaiban?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellAja", for: indexPath) as! FavoriteTableViewCell
        
        let index = keajaiban![indexPath.row]
        cell.titleLabel.text = index.title
        cell.photoImageView.image = UIImage(named: index.image)
        cell.descriptionLabel.text = index.descriptionData
        return cell
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let update = UITableViewRowAction(style: .normal, title: "Update") { action, index in
            print("update")
            
        }
        let delete = UITableViewRowAction(style: .default, title: "Delete") { action, index in
            print("Delete")
            self.delete(at: indexPath)
            tableView.reloadData()
           
        }
        return [delete, update]
    }
    
    func delete(at indexPath: IndexPath) {
        if let keajaibanData = keajaiban?[indexPath.row] {
            do {
                try realm.write() {
                    realm.delete(keajaibanData)
                }
            } catch {
                print("error")
            }
        }
        
    }

}
