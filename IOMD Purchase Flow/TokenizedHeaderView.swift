//
//  TokenizedHeaderView.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 21/09/23.
//


import UIKit

class TokenizedHeaderView: UITableViewHeaderFooterView {
    
    let headingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Plus Jakarta Sans", size: 16)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    let subheadingLabel: UILabel = {
        let label = UILabel()
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Plus Jakarta Sans", size: 10)
        label.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return label
    }()
    
    let dropDownButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = UIColor.black
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("▼", for: .normal) // For simplicity, using Unicode for down arrow.
        return button
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        addSubview(headingLabel)
        addSubview(subheadingLabel)
        addSubview(dropDownButton)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            headingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            headingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            headingLabel.trailingAnchor.constraint(lessThanOrEqualTo: dropDownButton.leadingAnchor, constant: -8),
            
            subheadingLabel.topAnchor.constraint(equalTo: headingLabel.bottomAnchor, constant: 4),
            subheadingLabel.leadingAnchor.constraint(equalTo: headingLabel.leadingAnchor),
            subheadingLabel.trailingAnchor.constraint(lessThanOrEqualTo: dropDownButton.leadingAnchor, constant: -8),
            subheadingLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            dropDownButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            dropDownButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            dropDownButton.widthAnchor.constraint(equalToConstant: 30),
            dropDownButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
}
