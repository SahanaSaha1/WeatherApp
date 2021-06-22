//
//  UserFormViewController.swift
//  OpenWeatherMapApp
//
//  Created by AssetTelematics Pvt Ltd on 6/21/21.
//  Copyright © 2021 Asset Telematics. All rights reserved.
//

import UIKit

class UserFormViewController: UIViewController {
    
    @IBOutlet weak var lblFirstName: UILabel!
    
    @IBOutlet weak var lblTitle: UIView!
    
    
    @IBOutlet weak var txt_firstName: UITextField!
    
    @IBOutlet weak var lblLastName: UILabel!
    
    @IBOutlet weak var txt_LastName: UITextField!
    
    @IBOutlet weak var lblEmail: UILabel!
    
    
    @IBOutlet weak var txt_Email: UITextField!
    
    
    
    
    
    var arrUsers : [LoginUser] = []
    var userList : [UserData] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchRequest()
        // Do any additional setup after loading the view.
    }

    
    func fetchRequest(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            do{
                arrUsers = try context.fetch(LoginUser.fetchRequest())
                if(arrUsers.count > 0){
                    for user in arrUsers{
                        if(user.userId == appDelegate.userName){
                            let arrList = user.userData?.allObjects
                                if let orderList = arrList as? [UserData]{
                                    self.userList = orderList
                                DispatchQueue.main.async {
                                   // self.orderTblVw.reloadData()
                                }
                            }
                        }
                    }
                }else{
    //
                }
            }
            catch{
                
            }
            }
    
    
    
    @IBAction func btnSaveClicked(_ sender: Any) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let userData = UserData(context: self.context)
                           userData.firstName = txt_firstName.text
                           userData.lastName = txt_LastName.text
                           userData.email = txt_Email.text
                           for user in arrUsers{
                               if(user.userId == appDelegate.userName){
                                   user.addToUserData(userData)
                                   do{
                                       try self.context.save()
                                    DispatchQueue.main.async {
                                        let vc = DispalyUserDataVC()
                                        self.navigationController?.pushViewController(vc, animated: true)
                                       // self.orderTblVw.reloadData()
                                    }
                                   }
                                   catch{
                                       print("error")
                                   }
                               }
                           }
    }
    
    @IBAction func btnCancelClicked(_ sender: Any) {
        
        let vc = DispalyUserDataVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
