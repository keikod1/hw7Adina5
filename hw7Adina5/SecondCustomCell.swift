//
//  SecondCustomCell.swift
//  hw7Adina5
//
//  Created by my macbook on 10/2/22.
//

import Foundation
import UIKit
import SnapKit

class SecondCustomCell: UITableViewCell{
    
    lazy var title1: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 15, weight: .bold)
        view.adjustsFontSizeToFitWidth = true
        return view
    }()
    lazy var titlePhoto: UIImageView = {
        let view = UIImageView()
        view.image = .init(named: "tom-holland-1")
        view.layer.cornerRadius = 45/2
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFill
        return view
    }()
    
override func layoutSubviews() {
        addSubview(titlePhoto)
        titlePhoto.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(8)
            make.centerY.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.5)
            make.width.equalTo(contentView.frame.width / 5)
        }
        addSubview(title1)
        title1.snp.makeConstraints { make in
            make.left.equalTo(titlePhoto.snp.right).offset(16)
            make.centerY.equalToSuperview()
        }
    }
}

