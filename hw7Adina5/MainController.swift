//
//  MainController.swift
//  hw7Adina5
//
//  Created by my macbook on 9/2/22.
//

import UIKit
import SnapKit


class MainControoler: UIViewController {
    
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Exit", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickRegister(view:)), for: .touchUpInside)
        return view
        
    }()
    
    private lazy var tableView: UITableView = {
            let view = UITableView()
            view.delegate = self
            view.dataSource = self
            return view
        }()
    @objc func clickRegister(view: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
    @objc func addMessages(){
        messagePhoto.append(UIImage(named: "Tom")!)
        message2.append("Tom Holland")
        messagePhoto.append(UIImage(named: "Parker")!)
        message2.append("Piter Parker")
        messagePhoto.append(UIImage(named: "Streng")!)
        message2.append("Doctor Streng")
        messagePhoto.append(UIImage(named: "Emdjey")!)
        message2.append("Love")
    }
    
   
    
    private lazy var messagePhoto: [UIImage] = []
    private lazy var message2: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorColor = .black
        tableView.separatorInset = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        
        view.backgroundColor = .white
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
        setupView()
        setupConstraint()
        addMessages()
    }

private func setupView(){
        tableView.register(CustomTableViewCell.self, forCellReuseIdentifier: "CustomTableViewCell")
        tableView.register(SecondCustomCell.self, forCellReuseIdentifier: "SecondCustomCell")
    }
    
    private func setupConstraint(){
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(clickBack.snp.bottom)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview()
        }
       
    }
}

extension MainControoler: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messagePhoto.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let messagesController = MessagesController()
        messagesController.title1.text = message2[indexPath.row]
        messagesController.titlePhoto.image = messagePhoto[indexPath.row]
        present(messagesController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as! CustomTableViewCell
        cell.title1.text = message2[index]
        cell.titlePhoto.image = messagePhoto[index]
      return cell
        }
    
    
    
    }
    

