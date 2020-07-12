//
//  AddContactViewModel.swift
//  PhableAssignment
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit
import Realm
import RealmSwift
class AddContactViewModel: NSObject {
    
    func validateFeilds(_ firstName:UITextField,_ lastName:UITextField,_ mobileNumber:UITextField,_ tag:Int,_ vc:UIViewController, _ userdetails:ContactDetails?){
        if firstName.text?.isEmpty ?? true{
            UIViewController.alert(title: "Error", message: AlertMessages.enter_first_name, target: vc)
        }else if lastName.text?.isEmpty ?? true{
            UIViewController.alert(title:  "Error", message: AlertMessages.enter_last_name, target: vc)
        }else if mobileNumber.text?.isEmpty ?? true{
            UIViewController.alert(title:  "Error", message: AlertMessages.enter_mobile_number, target: vc)
        }else if mobileNumber.text?.count ?? 0 <= 9{
            UIViewController.alert(title:  "Error", message: AlertMessages.enter_valid_mobile_number, target: vc)
        }else{
            // SAVE DETAILS IN REALM DB
            if tag == 100{ //Save
                let contactDetails = ContactDetails(firstName: firstName.text ?? "", lastName: lastName.text ?? "", mobileNumber: mobileNumber.text ?? "")
                RealmService.shared.create(contactDetails)
                vc.navigationController?.popViewController(animated: true)
            }else{ // update
                let dict:[String:Any] = ["firstName": firstName.text ?? "","lastName": lastName.text ?? "","mobileNumber": mobileNumber.text ?? ""]
                RealmService.shared.update(userdetails!, with: dict)

                vc.navigationController?.popViewController(animated: true)
            }

        }
        
    }

}
