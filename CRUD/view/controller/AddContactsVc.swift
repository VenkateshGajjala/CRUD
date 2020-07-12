//
//  AddContactsVc.swift
//  PhableAssignment
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit

class AddContactsVc: UIViewController {
    @IBOutlet weak var viewHeader: UIView!
    @IBOutlet weak var txtfieldFirstName: UITextField!
    @IBOutlet weak var txtfieldLastName: UITextField!
    @IBOutlet weak var txtfieldMobileNum: UITextField!
    @IBOutlet weak var btnSave: UIButton!
    
    var isContactAdd:Bool?
    var viewModelAddContact = AddContactViewModel()
    var contactDetails:ContactDetails?
    let maxLength = 10

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        setupValues()
    }
    private func setUpUI(){
        let titleName:String = isContactAdd ?? true ? "SAVE" : "UPDATE"
        btnSave.tag = isContactAdd ?? true ? 100 : 101   // save = 100, update = 101
        btnSave.setTitle(titleName, for: .normal)
        // adding corner radius to button
        btnSave.layer.cornerRadius = 5.0
        btnSave.layer.masksToBounds = true
    }
    private func setupValues(){
        txtfieldFirstName.text = contactDetails?.firstName ?? ""
        txtfieldLastName.text = contactDetails?.lastName ?? ""
        txtfieldMobileNum.text = contactDetails?.mobileNumber ?? ""
    }
    
    // MARK:- IB ACTIONS
    @IBAction func saveBtnPressed(_ sender: Any) {
        self.view.endEditing(true)
        viewModelAddContact.validateFeilds(txtfieldFirstName, txtfieldLastName, txtfieldMobileNum, btnSave.tag, self, contactDetails )
    }
    
}
// MARK:- UITextFieldDelegate
extension AddContactsVc: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 3{
            let currentString: NSString = textField.text! as NSString
            let newString: NSString =
                currentString.replacingCharacters(in: range, with: string) as NSString
            return newString.length <= maxLength
        }else{
            return true
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField.tag {
        case 1:
            txtfieldLastName.becomeFirstResponder()
            break
        case 2:
            txtfieldMobileNum.becomeFirstResponder()
            break
        default:
            
            txtfieldFirstName.becomeFirstResponder()
            break
        }
        return true
    }
}
