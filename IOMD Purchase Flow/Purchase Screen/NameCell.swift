//
//  TableViewCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class NameCell: UITableViewCell {
    
    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        keyLabel.font = UIFont(name: "Plus Jakarta Sans", size: 12)
        keyLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        keyLabel.textColor = UIColor(hex: "#848484")
            
        valueLabel.font = UIFont(name: "Plus Jakarta Sans", size: 12)
        valueLabel.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        
    }

}
