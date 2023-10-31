//
//  myTabCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 05/10/23.
//

import UIKit

class myTabCell: UITableViewCell {

    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        contentView.backgroundColor = UIColor(hex: "#FAFAFA")
        
        value.font = UIFont(name: "Plus Jakarta Sans", size: 14)
        value.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        value.textColor = .black
        
        textField.isHidden = true
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.spellCheckingType = .no

        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        value.numberOfLines = 0
        value.lineBreakMode = .byWordWrapping
    }
    
    var editAction: ((Bool) -> Void)?
        
    var isEditingMode: Bool = false
        
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditingMode.toggle()
        if isEditingMode {
            editButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            editButton.tintColor = .systemGreen
            textField.text = value.text
            textField.isHidden = false
            value.isHidden = true
            textField.becomeFirstResponder()
        } else {
            editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
            editButton.tintColor = .black
            value.text = textField.text
            value.isHidden = false
            textField.isHidden = true
            textField.resignFirstResponder()
            editAction?(true)
        }
    }
    
    
}
