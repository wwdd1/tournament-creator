//
//  ParticipantTeamCell.swift
//  Concentration
//
//  Created by Mehmet Cetin on 02/08/2019.
//  Copyright © 2019 Mehmet Cetin. All rights reserved.
//

import UIKit

class ParticipantTeamCell: UITableViewCell {
    var actionRemove: (() -> Void)? = nil
    
    @IBOutlet weak var teamNameLabel: UILabel!
    @IBAction func onTapRemove(_ sender: UIButton) {
        actionRemove?()
    }
}
