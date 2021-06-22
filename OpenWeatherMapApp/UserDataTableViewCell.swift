//
//  OrderTableViewCell.swift
//  OrderManagementApp
//
//  Created by Santosh Kumar on 31/03/21.
//

import UIKit

class UserDataTableViewCell: UITableViewCell {
    
    
//    @IBOutlet weak var vwMain: UIView!
//
//    @IBOutlet weak var lblFirstName: UILabel!
//
//    @IBOutlet weak var lblLastName: UILabel!
//
//    @IBOutlet weak var lblEmail: UILabel!
//
//    @IBOutlet weak var txtFirstName: UITextField!
//
//    @IBOutlet weak var txtLastName: UITextField!
//    @IBOutlet weak var txtEmail: UITextField!
    
   
    @IBOutlet weak var vwMain: UIView!
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var lblFirstName_Value: UITextField!
    
    @IBOutlet weak var lblLastName_Value: UITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    
    @IBOutlet weak var lblEmail_Value: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        vwMain.backgroundColor = UIColor.white
        vwMain.isUserInteractionEnabled = true
        vwMain.layer.cornerRadius = 5.0
        vwMain.layer.shadowOpacity = 0.5
        vwMain.layer.shadowRadius = 5.0
        vwMain.layer.shadowOffset = CGSize(width: 0, height: 0)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
