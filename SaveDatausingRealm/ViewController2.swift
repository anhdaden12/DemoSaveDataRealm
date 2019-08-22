//
//  ViewController2.swift
//  SaveDatausingRealm
//
//  Created by Ngoc on 8/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController2: UIViewController {

    let realm = try! Realm()
     var itemtoSave = Item()
    @IBOutlet weak var textname: UITextField!
    
    @IBOutlet weak var textPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if itemtoSave.name != "" {
            textname.text = itemtoSave.name
            textPrice.text = "\(itemtoSave.price)"
        }
        
    }
    

   
    @IBAction func onClickSave(_ sender: Any) {
        if itemtoSave.name != "" {
            try! realm.write {
                let item = Item()
                item.name = textname.text!
                item.price = Int(textPrice.text!)!
                realm.add(item, update: .modified)
            }
        } else {
            itemtoSave.name = textname.text ?? ""
            itemtoSave.price = Int(textPrice.text!) ?? 0
            try! realm.write {
                self.realm.add(itemtoSave)
            }
        }
        navigationController?.popViewController(animated: true)
    }
    
}
