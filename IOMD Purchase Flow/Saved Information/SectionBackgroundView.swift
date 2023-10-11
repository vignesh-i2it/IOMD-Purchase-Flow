//
//  SectionBackgroundView.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 29/09/23.
//

import UIKit

class SectionBackgroundView: UIView {
    
    var isHeader = false
    var isLastRow = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupUI()
    }

    private func setupUI() {
        //layer.cornerRadius = 10
        backgroundColor = UIColor(hex: "#FFFFFF")
    }
    
    override func layoutSubviews() {

        super.layoutSubviews()

        if isHeader {
            layer.cornerRadius = 10
            layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else if isLastRow {
            layer.cornerRadius = 10
            layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        } else {
            layer.cornerRadius = 0
            layer.maskedCorners = []
        }
    }
}
