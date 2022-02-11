//
//  ForgotPasswordController.swift
//  hw7Adina5
//
//  Created by my macbook on 10/2/22.
//

import Foundation
import UIKit
import SnapKit

class ForgotPasswordController: UIViewController {
    private lazy var forgotlayout = UIView()
    
    private lazy var loginfield: UITextField = {
        let view = UITextField()
        view.placeholder = "Email"
        view.font = UIFont.systemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    
    private lazy var titleForgot: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        view.text = "Forgot Password"
        return view
    }()
    
    private lazy var loginButton: UIButton = {
        let view = UIButton()
        view.setTitle("отправить", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        view.addTarget(self, action: #selector(clickLogin(view:)), for: .touchUpInside)
        view.backgroundColor = .black
        view.layer.cornerRadius = 48 / 2
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
    
    @objc func clickLogin(view: UIButton){
        let alert = UIAlertController(title: "успешно", message: "отправлено", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default) {
                      UIAlertAction in
                      NSLog("OK Pressed")
        self.navigationController?.pushViewController(ViewController(), animated: true)
                  }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
        
    }
    override func viewDidLoad() {
        view.backgroundColor = .white
        
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(view.frame.width / 20)
            make.left.equalToSuperview().offset(view.frame.width / 30)
        }
        
        view.addSubview(forgotlayout)
        forgotlayout.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(255)
        }
        forgotlayout.addSubview(titleForgot)
        titleForgot.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
        }
        forgotlayout.addSubview(loginfield)
        loginfield.snp.makeConstraints { make in
            make.top.equalTo(titleForgot.snp.bottom).offset(30)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
        }
        forgotlayout.addSubview(loginButton)
        loginButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-30)
            make.bottom.equalToSuperview()
            make.height.equalTo(40)
        }
    }
    @objc func clickBack(sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}

