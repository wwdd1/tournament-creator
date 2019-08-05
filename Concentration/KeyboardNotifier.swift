//
//  File.swift
//  Concentration
//
//  Created by Mehmet Cetin on 05/08/2019.
//  Copyright © 2019 Mehmet Cetin. All rights reserved.
//

import Foundation
import UIKit

protocol IKeyboardNotifier {
    func keyboardWillChange(notification: Notification) -> Void
}

class KeyboardNotifier {
    var _delegate: IKeyboardNotifier

    init(delegate: IKeyboardNotifier) {
        _delegate = delegate
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillChange(notification:)), name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillChangeFrameNotification, object: nil)
    }
    
    @objc func keyboardWillChange(notification: Notification) {
        _delegate.keyboardWillChange(notification: notification);
    }
}
