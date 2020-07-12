//
//  ContactsListTvCell.swift
//  PhableAssignment
//
//  Created by Venkatesh on 12/07/20.
//  Copyright © 2020 Venkatesh. All rights reserved.
//

import UIKit

class ContactsListTvCell: UITableViewCell {

    @IBOutlet weak var labelUserName: UILabel!
    @IBOutlet weak var labelUserNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var contactDetails:ContactDetails? = nil{
        didSet{
            labelUserName.text = contactDetails?.firstName ?? ""
            labelUserNumber.text = contactDetails?.mobileNumber ?? ""
        }
    }

}
