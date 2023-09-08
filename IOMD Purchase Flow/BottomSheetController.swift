//
//  BottomSheetController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//


import UIKit

class BottomSheetViewController: UIViewController {

    // Common properties and outlets
    @IBOutlet weak var nextButton1: UIButton!
    @IBOutlet weak var stackView1: UIStackView!
    @IBOutlet weak var spinner: UIActivityIndicatorView!

    // Outlets from the second sheet
    @IBOutlet weak var nextButton2: UIButton!
    @IBOutlet weak var stackView2: UIStackView!
    @IBOutlet weak var spinner2: UIActivityIndicatorView!

    // Outlets from the third sheet
    @IBOutlet weak var nextButton3: UIButton!
    @IBOutlet weak var stackView3: UIStackView!
    @IBOutlet weak var spinner3: UIActivityIndicatorView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(hex: "#1E1D21")
        view.layer.cornerRadius = 25
        view.layer.masksToBounds = true

        // Configure your UI elements and labels here
        configureUI()
    }

    private func configureUI() {
        configureStackView()
        configureStepStyle(tag: 100)
        configureHeadingLabel()
    }

    private func configureStackView() {
        for tag in 1...3 {
            if let viewWithTag = stackView1.viewWithTag(tag) {
                let backgroundColor = (tag == 2) ? UIColor(hex: "#45444E") : UIColor(hex: "#2C2B2F")
                let cornerCorners: UIRectCorner = (tag == 1) ? [.topLeft, .topRight] : (tag == 3) ? [.bottomLeft, .bottomRight] : []
                
                viewWithTag.backgroundColor = backgroundColor
                if !cornerCorners.isEmpty {
                    viewWithTag.roundCorners(cornerCorners, radius: 8)
                }
                configureLabel(in: viewWithTag)
            }
        }
    }

    private func configureStepStyle(tag: Int) {
        if let label = view.viewWithTag(tag) as? UILabel {
            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
            label.textColor = UIColor(hex: "#928A8A")
        }
    }

    private func configureHeadingLabel() {
        if let headingLabel = view.viewWithTag(200) as? UILabel {
            headingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 16)
            headingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        }
        if let subheadingLabel = view.viewWithTag(300) as? UILabel {
            subheadingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 14)
            subheadingLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
            subheadingLabel.textColor = UIColor(hex: "#E2E0F0")
        }
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        sender.setTitle("", for: .normal)

        let spinner = UIActivityIndicatorView(style: .medium)
        spinner.translatesAutoresizingMaskIntoConstraints = false
        sender.addSubview(spinner)
        spinner.centerXAnchor.constraint(equalTo: sender.centerXAnchor).isActive = true
        spinner.centerYAnchor.constraint(equalTo: sender.centerYAnchor).isActive = true
        spinner.startAnimating()

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.stopSpinner()
        }
    }

    private func stopSpinner() {
        spinner.stopAnimating()
    }
}

extension UIColor {
    convenience init(hex: String) {
        
        var hexString: String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if hexString.hasPrefix("#") {
            hexString.remove(at: hexString.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexString).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
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

    private func configureLabel(in view: UIView) {
        // ... (Your existing configureLabel function code)
    }
}



//import UIKit
//
//class BottomSheetController: UIViewController {
//
//    @IBOutlet weak var nextButton: UIButton!
//
//    @IBOutlet weak var stackView: UIStackView!
//
//    override func viewDidLoad() {
//
//        super.viewDidLoad()
//
//        view.backgroundColor = UIColor(hex: "#1E1D21")
//        view.layer.cornerRadius = 25
//        view.layer.masksToBounds = true
//
//        if let viewWithTag1 = stackView.viewWithTag(1) {
//            viewWithTag1.backgroundColor = UIColor(hex: "#2C2B2F")
//        }
//
//        if let viewWithTag2 = stackView.viewWithTag(2) {
//            viewWithTag2.backgroundColor = UIColor(hex: "#45444E")
//        }
//
//        if let viewWithTag3 = stackView.viewWithTag(3) {
//            viewWithTag3.backgroundColor = UIColor(hex: "#2C2B2F")
//        }
//
//        nextButton.layer.cornerRadius = nextButton.frame.size.height / 2
//        nextButton.layer.masksToBounds = true
//        nextButton.backgroundColor = UIColor(hex: "#8877F2")
//
//        configureStepStyle(tag: 100)
//
//        configureHeadingLabel()
//
//        configureView(withTag: 1, cornerCorners: [.topLeft, .topRight], backgroundColor: UIColor(hex: "#2C2B2F"))
//        configureView(withTag: 2, backgroundColor: UIColor(hex: "#45444E"))
//        configureView(withTag: 3, cornerCorners: [.bottomLeft, .bottomRight], backgroundColor: UIColor(hex: "#2C2B2F"))
//    }
//
//    private func configureStepStyle(tag: Int) {
//
//        if let label = view.viewWithTag(tag) as? UILabel {
//            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
//            label.font = UIFont.systemFont(ofSize: 14, weight: .bold)
//            label.textColor = UIColor(hex: "#928A8A")
//        }
//    }
//
//    private func configureHeadingLabel() {
//
//        if let headingLabel = view.viewWithTag(200) as? UILabel {
//            headingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 16)
//            headingLabel.font = UIFont.systemFont(ofSize: 16, weight: .bold)
//        }
//
//        if let subheadingLabel = view.viewWithTag(300) as? UILabel {
//            subheadingLabel.font = UIFont(name: "Plus Jakarta Sans", size: 14)
//            subheadingLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
//            subheadingLabel.textColor = UIColor(hex: "#E2E0F0")
//        }
//    }
//
//    private func configureView(withTag tag: Int, cornerCorners: UIRectCorner = [], backgroundColor: UIColor) {
//
//        if let viewWithTag = stackView.viewWithTag(tag) {
//            viewWithTag.backgroundColor = backgroundColor
//            if !cornerCorners.isEmpty {
//                viewWithTag.roundCorners(cornerCorners, radius: 8)
//            }
//            configureLabel(in: viewWithTag)
//        }
//    }
//
//    private func configureLabel(in view: UIView) {
//
//        if let label = view.viewWithTag(101) as? UILabel {
//            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
//            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//        }
//
//        if let label = view.viewWithTag(102) as? UILabel {
//            label.font = UIFont(name: "Plus Jakarta Sans", size: 14)
//            label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
//            label.textColor = UIColor(hex: "#45D5A2")
//        }
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//
//        super.viewWillAppear(animated)
//        preferredContentSize = CGSize(width: view.frame.width, height: 100)
//    }
//
//
//    @IBAction func nextButtonTapped(_ sender: UIButton) {
//
//
//        NotificationCenter.default.post(name: NSNotification.Name("dismissed"),
//              object: nil,
//              userInfo: nil)
//
//
//
//    }
//
//
//
//
//
//    @IBOutlet weak var spinner: UIActivityIndicatorView!
//
//    private func startSpinner() {
//        spinner.startAnimating()
//    }
//
//    private func stopSpinner() {
//        spinner.stopAnimating()
//    }
//
//
//
//}
//
//extension UIView {
//    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
//        let maskPath = UIBezierPath(
//            roundedRect: bounds,
//            byRoundingCorners: corners,
//            cornerRadii: CGSize(width: radius, height: radius)
//        )
//
//        let maskLayer = CAShapeLayer()
//        maskLayer.frame = bounds
//        maskLayer.path = maskPath.cgPath
//
//        layer.mask = maskLayer
//    }
//}
