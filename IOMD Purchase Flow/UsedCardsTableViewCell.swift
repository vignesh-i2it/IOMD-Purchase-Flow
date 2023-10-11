//
//  UsedCardsTableViewCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 06/10/23.
//

import UIKit

class UsedCardsTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var cardNumber: UILabel!
    
    @IBOutlet weak var merchantUsedAt: UILabel!
    
    @IBOutlet weak var Date: UILabel!
    
    @IBOutlet weak var timeStampValue: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        //self.contentView.backgroundColor = UIColor(hex: "#FAFAFA")
        
    }
}
