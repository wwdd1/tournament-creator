//
//  TounamentDetailsViewController.swift
//  Concentration
//
//  Created by Mehmet Cetin on 06/08/2019.
//  Copyright © 2019 Mehmet Cetin. All rights reserved.
//

import UIKit

class TounamentDetailsViewController: UIViewController {
    
    var teams: [Team]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Team count is: \(teams!.count)")
    }

}
