//
//  BottomSheetController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    
    @IBOutlet weak var firstSheet: UIView!
    @IBOutlet weak var nextButton1: UIButton!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    
    @IBOutlet weak var secondSheet: UIView!
    @IBOutlet weak var nextButton2: UIButton!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var spinner2: UIActivityIndicatorView!
    
    
    @IBOutlet weak var thirdSheet: UIView!
    @IBOutlet weak var nextButton3: UIButton!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var spinner3: UIActivityIndicatorView!

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#1E1D21")
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true
        
        nextButton1.layer.cornerRadius = nextButton1.frame.size.height / 2
        nextButton1.layer.masksToBounds = true
        nextButton1.backgroundColor = UIColor(hex: "#8877F2")
        
        nextButton2.layer.cornerRadius = nextButton2.frame.size.height / 2
        nextButton2.layer.masksToBounds = true
        nextButton2.backgroundColor = UIColor(hex: "#8877F2")
        
        nextButton3.layer.cornerRadius = nextButton3.frame.size.height / 2
        nextButton3.layer.masksToBounds = true
        nextButton3.backgroundColor = UIColor(hex: "#45D4A2 ")
        
        configureStepStyle()
        
        configureHeadingLabel()
        
        configureView(withTag: 140, cornerCorners: [.topLeft, .topRight], backgroundColor: UIColor(hex: "#2C2B2F"))
        configureView(withTag: 150, backgroundColor: UIColor(hex: "#45444E"))
        configureView(withTag: 160, cornerCorners: [.bottomLeft, .bottomRight], backgroundColor: UIColor(hex: "#2C2B2F"))
        
        configureView(withTag: 240, cornerCorners: [.topLeft, .topRight, .bottomLeft, .bottomRight], backgroundColor: UIColor(hex: "#FFFFFF"))
        configureView(withTag: 250, backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0))
        
        configureView(withTag: 340, cornerCorners: [.topLeft, .topRight], backgroundColor: UIColor(hex: "#2C2B2F"))
        configureView(withTag: 350, backgroundColor: UIColor(hex: "#45444E"))  // No corner radius
        configureView(withTag: 360, cornerCorners: [.bottomLeft, .bottomRight], backgroundColor: UIColor(hex: "#2C2B2F"))
    }
    
    private func configureStepStyle() {
        
        if let label = view.viewWithTag(100) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor(hex: "#928A8A")
        }
        
        if let label = view.viewWithTag(200) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor(hex: "#928A8A")
        }
    }

    private func configureHeadingLabel() {
        
        if let headingLabel = view.viewWithTag(120) as? UILabel {
            headingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 16)
            headingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        if let subheadingLabel = view.viewWithTag(130) as? UILabel {
            subheadingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            subheadingLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            subheadingLabel.textColor = UIColor(hex: "#E2E0F0")
        }
        
        if let headingLabel2 = view.viewWithTag(220) as? UILabel {
            headingLabel2.font = UIFont(name: "Plus Jakarta Sans", size: 16)
            headingLabel2.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        
        if let headingLabel3 = view.viewWithTag(320) as? UILabel {
            headingLabel3.font = UIFont(name: "Plus Jakarta Sans", size: 16)
            headingLabel3.font = UIFont.systemFont(ofSize: 16, weight: .bold)
                }
                
        if let subheadingLabel3 = view.viewWithTag(330) as? UILabel {
            subheadingLabel3.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            subheadingLabel3.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    private func configureView(withTag tag: Int, cornerCorners: UIRectCorner = [], backgroundColor: UIColor) {
        
        if let viewWithTag = stackView1.viewWithTag(tag) {
            viewWithTag.backgroundColor = backgroundColor
            if !cornerCorners.isEmpty {
                viewWithTag.roundCorners(cornerCorners, radius: 8)
            }
            configureLabel(in: viewWithTag)
        }
        
        if let viewWithTag = stackView2.viewWithTag(tag) {
            viewWithTag.backgroundColor = backgroundColor
            if !cornerCorners.isEmpty {
                viewWithTag.roundCorners(cornerCorners, radius: 8)
            }
            configureLabel(in: viewWithTag)
        }
        
        if let viewWithTag = stackView3.viewWithTag(tag) {
            viewWithTag.backgroundColor = backgroundColor
            if !cornerCorners.isEmpty {
                viewWithTag.roundCorners(cornerCorners, radius: 8)
            }
            configureLabel(in: viewWithTag)
        }
    }
    
    private func configureLabel(in view: UIView) {
        
        if let label = view.viewWithTag(170) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        
        if let label = view.viewWithTag(180) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            label.textColor = UIColor(hex: "#45D5A2")
        }
        
        if let textField = view.viewWithTag(270) as? UITextField {
            textField.textAlignment = .center
            textField.backgroundColor = UIColor(hex: "#DFDCF3")
        }
        
        if let label = view.viewWithTag(280) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
            label.textColor = UIColor(hex: "#58565E")
        }
        
        if let textView = view.viewWithTag(290) as? UITextView {
            textView.backgroundColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0)
            textView.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            textView.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            textView.textColor = UIColor(hex: "#D4D1E7")
        }
        
        if let label = view.viewWithTag(370) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 16)
            label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        }
    }

    @IBAction func nextButton1Tapped(_ sender: UIButton) {
        sender.setTitle("", for: .normal)

        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        sender.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: sender.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: sender.centerYAnchor).isActive = true
        spinner.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.firstSheet.isHidden = true
            self?.secondSheet.isHidden = false
        }
    }
    
    @IBAction func nextButton2Tapped(_ sender: UIButton) {
        (sender as AnyObject).setTitle("", for: .normal)

        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        (sender as AnyObject).addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: (sender as AnyObject).centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: (sender as AnyObject).centerYAnchor).isActive = true
        spinner.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.secondSheet.isHidden = true
            self?.thirdSheet.isHidden = false
        }
    }
    
    @IBAction func nextButton3Tapped(_ sender: UIButton) {
        (sender as AnyObject).setTitle("", for: .normal)

        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        (sender as AnyObject).addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: (sender as AnyObject).centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: (sender as AnyObject).centerYAnchor).isActive = true
        spinner.startAnimating()
        
//

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.dismiss(animated: true, completion: nil)
            NotificationCenter.default.post(name: NSNotification.Name("dismissed"),
                          object: nil,
                          userInfo: nil)
        }
        
    }

    private func startSpinner() {
        spinner.startAnimating()
    }
    
    private func stopSpinner() {
        spinner.stopAnimating()
    }
    
}

extension UIView {
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(
            roundedRect: bounds,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )

        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath

        layer.mask = maskLayer
    }
}
