//
//  RegisterController.swift
//  hw7Adina5
//
//  Created by my macbook on 10/2/22.
//

import Foundation
import UIKit

class RegisterController: UIViewController{
    
    private lazy var titleRegister: UILabel = {
            let view = UILabel()
            view.textColor = .black
            view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
            view.text = "Register to Telegram"
            return view
        }()
    
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Exit", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickBack(sender:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var nameRegister: UITextField = {
        let view = UITextField()
        view.placeholder = "name"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var phoneRegister: UITextField = {
        let view = UITextField()
        view.placeholder = "phone"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var emailRegister: UITextField = {
        let view = UITextField()
        view.placeholder = "email"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    private lazy var passwordRegister: UITextField = {
        let view = UITextField()
        view.placeholder = "password"
        view.font = UIFont.systemFont(ofSize: 20)
        view.isSecureTextEntry = true
        view.textColor = .black
        return view
    }()
    private lazy var repeatpasswordRegister: UITextField = {
        let view = UITextField()
        view.placeholder = "repeatpassword"
        view.font = UIFont.systemFont(ofSize: 20)
        view.isSecureTextEntry = true
        view.textColor = .black
        return view
    }()
    private lazy var buttonRegister: UIButton = {
        let view = UIButton()
        view.setTitle("Done", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.addTarget(self, action: #selector(clickRegister(view:)), for: .touchUpInside)
        view.layer.cornerRadius = 30 / 2
        view.backgroundColor = .black
        return view
    }()
    
    private lazy var  registerLayout = UIView()
    func validLogin(myLogin: String) -> Bool
        {
            let login =  ("[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}")
            let loginTesting = NSPredicate(format: "SELF MATCHES %@", login)
            return loginTesting.evaluate(with: myLogin)
        }
    

    
            
            
        
    @objc func clickRegister(view: UIButton){
        let login = validLogin(myLogin: emailRegister.text!)
        
        let textpassword = passwordRegister.text!.count
        let repeatPassword = passwordRegister.text! == repeatpasswordRegister.text!
        let textCount = (nameRegister.text!.count != 0) && phoneRegister.text!.count >= 7
        
        if (textpassword >= 7) && login && repeatPassword && textCount{
            navigationController?.popToRootViewController(animated: true)
           
        }else {
            let alertController = UIAlertController(title: "Error", message: "make sure the text is correct", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "OK", style: .cancel)
            alertController.addAction(alertAction)
            
            self.present(alertController, animated: true)
           
       
        
        }
        
    }
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.width / 20)
            make.left.equalToSuperview().offset(view.frame.width / 30)
        }
        
        view.addSubview(registerLayout)
        registerLayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(380)
        }
        
        registerLayout.addSubview(titleRegister)
        titleRegister.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        registerLayout.addSubview(nameRegister)
        nameRegister.snp.makeConstraints { make in
            make.top.equalTo(titleRegister.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(phoneRegister)
        phoneRegister.snp.makeConstraints { make in
            make.top.equalTo(nameRegister.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(emailRegister)
        emailRegister.snp.makeConstraints { make in
            make.top.equalTo(phoneRegister.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(passwordRegister)
        passwordRegister.snp.makeConstraints { make in
            make.top.equalTo(emailRegister.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(repeatpasswordRegister)
        repeatpasswordRegister.snp.makeConstraints { make in
            make.top.equalTo(passwordRegister.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        registerLayout.addSubview(buttonRegister)
        buttonRegister.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview().offset(-30)
            make.height.equalTo(40)
            
            
        }
        
    }
    
    @objc func clickBack(sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}
