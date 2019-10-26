//
//  DevTappticSearchAlert.swift
//  DevTapptic
//
//  Created by Konrad Uciechowski on 13/04/2019.
//  Copyright © 2019 Homeflix. All rights reserved.
//

import UIKit

class DevTappticSearchAlert {

    var alert: UIAlertController
    
    var _title: String?
    var _message: String?
    var _acceptButtonTitle: String
    var _cancelButtonTitle: String
    var _searchPhrasePlaceholder: String
    var _query: String?
    
    init(title: String?, message: String?, acceptButtonTitle: String, cancelButtonTitle: String, searchPhrasePlaceholder: String) {
        alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        _title = title
        _message = message
        _acceptButtonTitle = acceptButtonTitle
        _cancelButtonTitle = cancelButtonTitle
        _searchPhrasePlaceholder = searchPhrasePlaceholder
        initSearchAlert()
    }
    
    func initSearchAlert() {

        alert.title = _title
        alert.message = _message
        
        let searchAction = UIAlertAction(title: _acceptButtonTitle, style: .default) { (_) in
            self._query = self.alert.textFields?[0].text
        }
        
        let cancelAction = UIAlertAction(title: _cancelButtonTitle, style: .cancel) { (_) in }
        
        alert.addTextField { (textField) in
            textField.placeholder = self._searchPhrasePlaceholder
//            textField.keyboardAppearance = .dark
            self.getTextFieldToolBar(textField: textField)
        }
        
        alert.addAction(searchAction)
        alert.addAction(cancelAction)
        
    }
    
    func getTextFieldToolBar(textField: UITextField) {
        let toolBar = getKeyboardToolBar(buttonText: "Hide search", function: #selector(hideKeyboard(sender:)))
        textField.inputAccessoryView = toolBar
    }
    
    func getKeyboardToolBar(buttonText: String, function: Selector, withSpace: Bool = true) -> UIToolbar {
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        var buttonsArray = Array<UIBarButtonItem>()
        if withSpace {
            let spaceButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.flexibleSpace, target: nil, action: nil)
            buttonsArray.append(spaceButton)
        }
        let buttonAction = UIBarButtonItem(title: buttonText, style: .plain, target: self, action: function)
        buttonsArray.append(buttonAction)
        toolBar.items = buttonsArray
        return toolBar
    }
    
    @objc func hideKeyboard(sender: Any) {
        alert.dismiss(animated: true, completion: nil)
    }
    
}
