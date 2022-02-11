//
//  HelpController.swift
//  hw7Adina5
//
//  Created by my macbook on 10/2/22.
//

import Foundation
import UIKit
import SnapKit

class HelpController: UIViewController{
    private lazy var scrollView = UIScrollView()
    private lazy var HelpLayout = UIView()
  
    private lazy var clickBack: UIButton = {
        let view = UIButton()
        view.backgroundColor = .white
        view.setTitle("<Exit", for: .normal)
        view.setTitleColor(.black, for: .normal)
        view.addTarget(self, action: #selector(clickRegister(view:)), for: .touchUpInside)
        return view
    }()
    
    private lazy var HelpText: UILabel = {
      let view = UILabel()
      view.textColor = .black
      view.text = "Для входа приложения 'Telegram' сначала прочтите условия о соглашении.\n\nСледующий шаг - вам нужно пройти простую регистрацию.\n\nНаслаждайтесь использованием нашего приложения"
        view.numberOfLines = 0
      return view
    }()
    @objc func clickRegister(view: UIButton){
        navigationController?.popToRootViewController(animated: true)
    }
   
    override func viewDidLoad() {
        
        view.backgroundColor = .white
        view.addSubview(HelpLayout)
        HelpLayout.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(200)
        }
                
        HelpLayout.addSubview(HelpText)
        HelpText.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.height.equalToSuperview()
            make.width.equalToSuperview()
            
        }
        
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.top.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        view.addSubview(clickBack)
        clickBack.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.left.equalToSuperview().offset(16)
        }
    }
}
