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
    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    @IBOutlet weak var label4: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        itemImageView.contentMode = .scaleAspectFill
        
        label1.font = UIFont(name: "Plus Jakarta Sans", size: 12)
        label1.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        
        label2.font = UIFont(name: "Plus Jakarta Sans", size: 10)
        label2.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        
        label3.font = UIFont(name: "Plus Jakarta Sans", size: 10)
        label3.font = UIFont.systemFont(ofSize: 10, weight: .semibold)
        
        label4.font = UIFont(name: "Plus Jakarta Sans", size: 10)
        label4.font = UIFont.systemFont(ofSize: 10, weight: .regular)
    }
}


