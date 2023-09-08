//
//  CustomHeaderView.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class CustomHeaderView: UITableViewHeaderFooterView {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label.font = UIFont(name: "Plus Jakarta Sans", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        //label.textColor = UIColor(hex: "#58565E")

        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    private func setupUI() {
        
        contentView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16).isActive = true
        
        titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
    }
}
