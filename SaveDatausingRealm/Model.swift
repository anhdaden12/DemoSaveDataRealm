//
//  Model.swift
//  SaveDatausingRealm
//
//  Created by Ngoc on 8/17/19.
//  Copyright © 2019 Ngoc. All rights reserved.
//

import Foundation
import RealmSwift


class Item: Object {
    @objc dynamic var name = ""
    @objc dynamic var price = 0
    //@objc dynamic var image = #imageLiteral(resourceName: "5")
    override static func primaryKey() -> String? {
        return "name"
    }
}
