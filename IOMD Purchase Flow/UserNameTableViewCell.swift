//
//  UserNameTableViewCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 29/10/23.
//

import UIKit

class UserNameTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var textField: UITextField!
    
    var editAction: ((Bool) -> Void)?
    
    var isEditingMode: Bool = false
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        userNameLabel.font = UIFont(name: "Plus Jakarta Sans", size: 18)
        userNameLabel.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        userNameLabel.textColor = .black
        userNameLabel.numberOfLines = 0
        userNameLabel.lineBreakMode = .byWordWrapping
        userNameLabel.text = userNameLabel.text?.replacingOccurrences(of: " ", with: "\n")
        
        setAttributedText()

        
        textField.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        
        editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
        editButton.tintColor = UIColor(hex: "#8877F2")
        
        textField.isHidden = true
        textField.autocorrectionType = .no
               textField.autocapitalizationType = .none
        textField.spellCheckingType = .no
        
    }
    
    @IBAction func editButtonTapped(_ sender: UIButton) {
        isEditingMode.toggle()
        if isEditingMode {
            editButton.setImage(UIImage(systemName: "checkmark"), for: .normal)
            editButton.tintColor = .systemGreen
            textField.text = userNameLabel.text
            textField.isHidden = false
            userNameLabel.isHidden = true
            textField.becomeFirstResponder()
            
            textField.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        } else {
            editButton.setImage(UIImage(systemName: "pencil"), for: .normal)
            editButton.tintColor = UIColor(hex: "#8877F2")
            userNameLabel.text = textField.text
            userNameLabel.isHidden = false
            textField.isHidden = true
            textField.resignFirstResponder()
            
            userNameLabel.text = userNameLabel.text?.replacingOccurrences(of: " ", with: "\n")

            editAction?(true)
            
            textField.font = UIFont.systemFont(ofSize: 18, weight: .regular)

        }
    }
    
    func setAttributedText() {
            guard let text = userNameLabel.text else { return }
            
            let attributedText = NSMutableAttributedString(string: text)
            
            // Split the text into words
            let words = text.components(separatedBy: " ")
            
            if let firstWord = words.first {
                let range = (text as NSString).range(of: firstWord)
                
                let attributes: [NSAttributedString.Key: Any] = [
                    .font: UIFont.boldSystemFont(ofSize: 18), // Set the first word in bold
                    .foregroundColor: UIColor.black, // Set the color here
                ]
                
                attributedText.addAttributes(attributes, range: range)
                userNameLabel.attributedText = attributedText
            }
        }

}
