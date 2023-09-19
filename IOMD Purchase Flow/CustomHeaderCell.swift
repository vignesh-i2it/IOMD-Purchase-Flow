//
//  CustomHeaderCell.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class CustomHeaderCell: UITableViewCell {

    @IBOutlet weak var imageView1: UIImageView!
    @IBOutlet weak var imageView2: UIImageView!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!

    override func awakeFromNib() {
        
        super.awakeFromNib()
        
        label1.font = UIFont(name: "Plus Jakarta Sans", size: 16)
        label1.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        label2.font = UIFont(name: "Plus Jakarta Sans", size: 12)
        label2.font = UIFont.systemFont(ofSize: 12, weight: .thin)
        
        label3.font = UIFont(name: "Plus Jakarta Sans", size: 12)
        label3.font = UIFont.systemFont(ofSize: 12, weight: .thin)
    }
}
