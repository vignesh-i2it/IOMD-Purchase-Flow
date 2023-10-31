//
//  TokenizedHeadingTableViewCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 16/10/23.
//

import UIKit

class TokenizedHeadingTableViewCell: UITableViewCell {
    
    @IBOutlet weak var headingLabel: UILabel!
    
    @IBOutlet weak var subheadingLabel: UILabel!
    
    @IBOutlet weak var dropDownButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor(hex: "#FAFAFA")
        
        headingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 14)
        headingLabel.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        headingLabel.textColor = .black

        subheadingLabel.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        subheadingLabel.textColor = UIColor(hex: "#8877F2")

        dropDownButton.tintColor = UIColor.black
        dropDownButton.setTitle("▼", for: .normal)

        //setupConstraints()
    }
    
//    func setupConstraints() {
//            NSLayoutConstraint.activate([
//                headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
//                headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
//                headingLabel.trailingAnchor.constraint(lessThanOrEqualTo: dropDownButton.leadingAnchor, constant: -8),
//
//                subheadingLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4),
//                subheadingLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
//                subheadingLabel.trailingAnchor.constraint(lessThanOrEqualTo: dropDownButton.leadingAnchor, constant: -8),
//                subheadingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
//
//                dropDownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//                dropDownButton.centerYAnchor.constraint(equalTo: centerYAnchor),
//                dropDownButton.widthAnchor.constraint(equalToConstant: 30),
//                dropDownButton.heightAnchor.constraint(equalToConstant: 30)
//            ])
//        }
    }
