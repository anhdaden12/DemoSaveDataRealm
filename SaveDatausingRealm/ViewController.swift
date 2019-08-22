//
//  ViewController.swift
//  SaveDatausingRealm
//
//  Created by Ngoc on 8/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {

    let realm = try! Realm() //varn toan class
    
    //data fromdatabase
    
    var listItem: Results<Item> {
        get {
            return realm.objects(Item.self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Demo save data Realm"
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItem.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let item = listItem[indexPath.row]
        cell.textLabel?.text = item.name
        cell.detailTextLabel?.text = "\(item.price)"
       // cell.imageView?.image = item.image
        return cell
    }
    
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            try! self.realm.write {
                self.realm.delete(listItem[indexPath.row])
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController2
        if let index = tableView.indexPathForSelectedRow {
            vc.itemtoSave = listItem[index.row]
        }
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
}

