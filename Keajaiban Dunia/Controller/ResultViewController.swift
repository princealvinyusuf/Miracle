//
//  ResultViewController.swift
//  Keajaiban Dunia
//
//  Created by Muhammad Harviando on 17/06/21.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit
import RealmSwift

class ResultViewController: UIViewController {
    
    var realm = try! Realm()
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBAction func saveButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Save Data?", message: "Do You Want to save data", preferredStyle: .alert)
        let action = UIAlertAction(title: "Save", style: .default) { (action) in
            let newData = KeajaibanObject()
            newData.descriptionData = self.descriptionData!
            newData.image = self.image!
            newData.title = self.titleData!
            self.save(keajaibanObject: newData)
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    var image: String?
    var titleData: String?
    var descriptionData: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))

        if let safeImage = image, let safeTitle = titleData, let safeDescription = descriptionData {
            
            imageView.image = UIImage(named: safeImage)
            titleLabel.text = safeTitle
            descriptionLabel.text = safeDescription
        }
    }
    
    func save(keajaibanObject: KeajaibanObject) {
        do {
            try realm.write() {
                realm.add(keajaibanObject)
            }
        } catch {
            print("Error saving category \(error)")
        }
        
    }
    

    
}
