//
//  MessagesController.swift
//  hw7Adina5
//
//  Created by my macbook on 11/2/22.
//

import Foundation
import UIKit
import SnapKit

class MessagesController: UIViewController {
    
    private lazy var title1: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    private lazy var titlePhoto: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "tom-holland-1")
        view.layer.cornerRadius = 58/2
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
    private lazy var textMessage: UITextField = {
        let view = UITextField()
        view.borderStyle = .roundedRect
        view.layer.cornerRadius = 50/2
        view.placeholder = "Messages..."
        view.font = .systemFont(ofSize: 12, weight: .black)
        return view
    }()
    private lazy var totalView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        view.addSubview(totalView)
        totalView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        totalView.addSubview(title1)
        title1.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(8)
            make.centerY.equalToSuperview()
            make.left.equalToSuperview().offset(30+36)
        }
        totalView.addSubview(titlePhoto)
        titlePhoto.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(5)
            make.top.equalToSuperview().offset(10)
            make.height.equalToSuperview().dividedBy(10)
            make.width.equalToSuperview().dividedBy(6.5)
            make.centerY.equalToSuperview()
        }
        totalView.addSubview(textMessage)
        textMessage.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.bottom.equalToSuperview().offset(-10)
            make.height.equalTo(30)
        }
    }
    @objc func clickBack(sender: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
}


