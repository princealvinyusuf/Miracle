//
//  ViewController.swift
//  Keajaiban Dunia
//
//  Created by Muhammad Harviando on 17/06/21.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var keajaibanModel = KeajaibanModel()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()
        tableView.rowHeight = 130
    }
    



}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return keajaibanModel.keajaiban.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as! KeajaibanTableViewCell
        let index = keajaibanModel.keajaiban[indexPath.row]
        cell.photoImageView.image = UIImage(named: index.image)
        cell.titleLabel.text = index.title
        cell.descriptionLabel.text = index.description
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let resultVC = storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        
        
        
        
        let index = keajaibanModel.keajaiban[indexPath.row]
        
        resultVC.image = index.image
        resultVC.titleData = index.title
        resultVC.descriptionData = index.description
        self.navigationController?.pushViewController(resultVC, animated: true)
        
    }
    
    
    
    
}



