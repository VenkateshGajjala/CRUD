//
//  ContactListVc.swift
//  PhableAssignment
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit
import RealmSwift
class ContactListVc: UIViewController {
    // IBOutlet
    @IBOutlet weak var tblVW: UITableView!
    // INSTANCES
    var userdetailsArray : Results<ContactDetails>!
    var notificationToken:NotificationToken?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let realm = RealmService.shared.realm
        userdetailsArray = realm.objects(ContactDetails.self)
        tblVW.delegate = self
        tblVW.dataSource = self

        notificationToken = realm.observe { (notification, realm) in
            self.tblVW.reloadData()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
    }
    
    //MARK:- SHOW DELETE ALERT
    func confirmDelete(_ position: Int) {
        let alert = UIAlertController(title: "Delete Contact", message: AlertMessages.permanent_delete_alert_message, preferredStyle: .actionSheet)
        let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { result in
            RealmService.shared.delete(self.userdetailsArray[position])
            self.tblVW.reloadData()
        }
        let CancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(deleteAction)
        alert.addAction(CancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

//MARK:- TABLEVIEW DELEGATE AND DATA SOURCE METHODS
extension ContactListVc: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userdetailsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let detailsCell = tableView.dequeueReusableCell(withIdentifier: TvCellIdentifierNames.contactsListTvCell) as? ContactsListTvCell else {
            return UITableViewCell()
        }
        detailsCell.contactDetails = userdetailsArray[indexPath.row]
        return detailsCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let destination = self.storyboard?.instantiateViewController(identifier: UIstoryBoardIdentifiers.addContactsVc) as! AddContactsVc
        destination.contactDetails = userdetailsArray[indexPath.row]
        destination.isContactAdd = false
        self.navigationController?.pushViewController(destination, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            confirmDelete(indexPath.row)
        }
    }
}
