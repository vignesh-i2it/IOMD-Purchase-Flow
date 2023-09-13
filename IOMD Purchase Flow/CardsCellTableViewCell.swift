//
//  CardsCellTableViewCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 12/09/23.
//

import UIKit

class CardsCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var cardImge: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var cardNumberLabel: UILabel!
    @IBOutlet weak var expiryDateLabel: UILabel!
    @IBOutlet weak var showButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
        
        var eyeButtonAction: (() -> Void)?
        var deleteButtonAction: (() -> Void)?
        
        var showCardDetails: Bool = false {
            didSet {
                cardNumberLabel.text = showCardDetails ? cardDetails["cardNumber"] : "•••• ••••"
                
                let symbolName = showCardDetails ? "eye.fill" : "eye.slash.fill"
                let configuration = UIImage.SymbolConfiguration(pointSize: 16)
                let image = UIImage(systemName: symbolName, withConfiguration: configuration)
                
                showButton.setImage(image, for: .normal)

            }
        }
        
        var cardDetails: [String: String] = [:] {
            didSet {
                nameLabel.text = "\(cardDetails["firstName"] ?? "") \(cardDetails["lastName"] ?? "")"
                expiryDateLabel.text = cardDetails["expiryDate"]
            }
        }
        
        override func awakeFromNib() {
            super.awakeFromNib()
            
            showButton.addTarget(self, action: #selector(showButtonTapped), for: .touchUpInside)
            deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        }
        
        @objc func showButtonTapped() {
            showCardDetails.toggle()
            eyeButtonAction?()
        }
        
        @objc func deleteButtonTapped() {
            deleteButtonAction?()
        }
    }
