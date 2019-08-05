//
//  Store.swift
//  Concentration
//
//  Created by Mehmet Cetin on 05/08/2019.
//  Copyright © 2019 Mehmet Cetin. All rights reserved.
//

import Foundation

class Store {
    static var shared: Store = Store()

    var teams: [Team] = []
    
    func persist() {
        // TODO: UserDefaults
    }
}
