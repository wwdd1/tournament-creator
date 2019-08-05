//
//  ViewController.swift
//  Concentration
//
//  Created by Mehmet Cetin on 31/07/2019.
//  Copyright © 2019 Mehmet Cetin. All rights reserved.
//

import UIKit

class ViewController: UIViewController, IKeyboardNotifier {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addTeamTextField: UITextField!
    
    @IBAction func onTouchAddButton(_ sender: UIButton) {
        addParticipant(withTeamName: addTeamTextField.text ?? "Unknown Team")
        addTeamTextField.text = ""
    }

    var participantTeams : [Team] = []
    var keyboardNotifier : KeyboardNotifier? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboardNotifier = KeyboardNotifier(delegate: self)
    }
    
    deinit {
        print("deinit ViewController")
    }
    
    func addParticipant(withTeamName teamName: String) {
        let trimmed = teamName.trimmingCharacters(in: .whitespacesAndNewlines)
        if (trimmed == "") { return }
        let team = Team(withId: UUID().uuidString)
        team.name = trimmed
        participantTeams.insert(team, at: 0)
        tableView.reloadData()
    }
    
    func keyboardWillChange(notification: Notification) {
        print("Got keyboard event!");
        guard let keyboardRect = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue else {
            return
        }
        
        if (notification.name == UIResponder.keyboardWillShowNotification) {
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -keyboardRect.height).isActive = true
            print("keyboardShow")
        } else if (notification.name == UIResponder.keyboardWillHideNotification) {
            print("keyboardHide")
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: keyboardRect.height).isActive = true
        }
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (participantTeams.count == 0) {
            return 1
        } else {
            return participantTeams.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (participantTeams.count > 0) {
            let index = indexPath.row
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantTeamCell") as! ParticipantTeamCell;
            
            cell.teamNameLabel.text = participantTeams[index].name
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ParticipantsEmptyCell") as! ParticipantEmptyTableCell;
            return cell;
        }
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

