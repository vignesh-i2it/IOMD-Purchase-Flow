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
    
    var isCardVisible = false
    
    var showButtonAction: (() -> Void)?
    
    @IBAction func showButtonTapped(_ sender: UIButton) {
        showButtonAction?()
    }
    
    var deleteButtonAction: (() -> Void)?
    
    @IBAction func deleteButtonTapped(_ sender: UIButton) {
        deleteButtonAction?()
    }
}
