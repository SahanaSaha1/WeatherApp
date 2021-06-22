//
//  LoginViewController.swift
//  OrderManagementApp
//
//  Created by Santosh Kumar on 31/03/21.
//

import UIKit

@available(iOS 13.0, *)
class LoginViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var vwMainLogin: UIView!
    @IBOutlet weak var lblLoginUserName: UILabel!
    @IBOutlet weak var lblLoginPassword: UILabel!
    @IBOutlet weak var txtLoginUserName: UITextField!
    @IBOutlet weak var txtLoginPassword: UITextField!
    
    @IBOutlet weak var btnLogin: UIButton!
    
    @IBOutlet weak var btnRemember: UIButton!
    
    var arrUsers : [LoginUser] = []
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        
        // Do any additional setup after loading the view.
        vwMainLogin.backgroundColor = UIColor.white
//        vwMainLogin.layer.borderWidth = 1
        vwMainLogin.layer.cornerRadius = 8.0
        vwMainLogin.layer.shadowOpacity = 0.2
        vwMainLogin.layer.shadowRadius = 3.0
        vwMainLogin.layer.shadowOffset = CGSize(width: 0, height: 0)
        
        btnLogin.layer.cornerRadius = 8
        
        
        let defaults = UserDefaults.standard
        if(defaults.value(forKey: "UserName") != nil && defaults.value(forKey: "Password") != nil){
            btnRemember.isSelected = true
            txtLoginUserName.text = defaults.value(forKey: "UserName") as? String
            txtLoginPassword.text = defaults.value(forKey: "Password") as? String
        }
    }
    
    
    func fetchRequest(){
        do{
            arrUsers = try context.fetch(LoginUser.fetchRequest())
            if(arrUsers.count > 0){
                if arrUsers.contains(where: { $0.userId == txtLoginUserName.text && $0.password == txtLoginPassword.text}) {
                    DispatchQueue.main.async {
                        if #available(iOS 13.0, *) {
                            let rvc : DispalyUserDataVC = DispalyUserDataVC()
                            self.navigationController?.pushViewController(rvc, animated: true)
                        } else {
                            // Fallback on earlier versions
                        }
                        
                    }
                    
                }else{
                    let alert = UIAlertController(title: "User Not Registered", message: "Please get Registered", preferredStyle: UIAlertController.Style.alert)
                               let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                                 alert.addAction(ok)
                                self.present(alert, animated:true, completion: nil)
                }
                
            }else{
                let alert = UIAlertController(title: "User Not Registered", message: "Please get Registered", preferredStyle: UIAlertController.Style.alert)
                           let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                             alert.addAction(ok)
                            self.present(alert, animated:true, completion: nil)
            }
        }
        catch{
            
        }

        }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if(textField == txtLoginUserName){
            textField.resignFirstResponder()
            txtLoginPassword.becomeFirstResponder()
        }else{
            self.view.endEditing(true)
        }
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if(textField == txtLoginUserName){
            let defaults = UserDefaults.standard
            if(defaults.value(forKey: "UserName") != nil) && textField.text != defaults.value(forKey: "UserName") as! String{
                btnRemember.isSelected = false
            }
        }
    }
    
    @IBAction func btnLoginClicked(_ sender: Any) {
        if (txtLoginUserName.text == "" || txtLoginPassword.text == ""){
            let alert = UIAlertController(title: "Alert", message: "Please fill all fields", preferredStyle: UIAlertController.Style.alert)
                       let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                         alert.addAction(ok)
                        self.present(alert, animated:true, completion: nil)
        }else{
            if #available(iOS 13.0, *) {
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.userName = txtLoginUserName.text!
                appDelegate.userPassword = txtLoginPassword.text!
                fetchRequest()
            } else {
                // Fallback on earlier versions
            }
            
        }
        
    }
    
    
    
    @IBAction func btnRememberClicked(_ sender: UIButton) {
      
        
        if (txtLoginUserName.text == "" || txtLoginPassword.text == ""){
            let alert = UIAlertController(title: "Alert", message: "Please fill all fields", preferredStyle: UIAlertController.Style.alert)
                       let ok = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                         alert.addAction(ok)
                        self.present(alert, animated:true, completion: nil)
        }else{
            sender.isSelected = !sender.isSelected
            do{
                arrUsers = try context.fetch(LoginUser.fetchRequest())
                if(btnRemember.isSelected == true){
                    if arrUsers.contains(where: { $0.userId == txtLoginUserName.text && $0.password == txtLoginPassword.text}) {
                        
                        let defaults = UserDefaults.standard
                        defaults.setValue(txtLoginUserName.text, forKey: "UserName")
                        defaults.setValue(txtLoginPassword.text, forKey: "Password")
                    }
                }
            }catch{
                
            }
            
        }
        
    }
    
    
    @IBAction func btnRegisterPageClicked(_ sender: Any) {
        if #available(iOS 13.0, *) {
            let rvc : RegistrationViewController = RegistrationViewController()
            self.navigationController?.pushViewController(rvc, animated: true)
        } else {
            // Fallback on earlier versions
        }
        
    }
    
    
}
