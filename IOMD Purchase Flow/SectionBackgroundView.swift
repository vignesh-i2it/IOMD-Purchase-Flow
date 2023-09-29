//
//  SectionBackgroundView.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 29/09/23.
//

import UIKit

class SectionBackgroundView: UIView {
    
 

    override init(frame: CGRect) {
            super.init(frame: frame)
            setupUI()
        }

        required init?(coder: NSCoder) {
            super.init(coder: coder)
            setupUI()
        }

        private func setupUI() {
          
            layer.cornerRadius = 10
            backgroundColor = UIColor(hex: "#EDEDED")
        }
}
