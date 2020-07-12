//
//  UIviewController+Extenstion.swift
//  PhableAssignment
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import Foundation
import UIKit
extension UIViewController{
    class func alert(title:String, message:String,target:UIViewController){
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default) {
        (result: UIAlertAction) -> Void in
        })
        target.present(alert, animated: true, completion: nil)
    }
}
