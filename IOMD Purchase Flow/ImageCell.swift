//
//  ImageCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import Foundation
import UIKit

class ImageCell: UITableViewCell {

    @IBOutlet weak var itemImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        itemImageView.contentMode = .scaleAspectFill
    }
}


