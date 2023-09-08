//
//  PurchaseViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class PurchaseViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var yourScrollView: UIScrollView!

    
    let sectionTitles = ["Header Section", "Items", "Name", "Card Details"]

    let itemsSection = ["imagePlaceholder"]

    let headerSection = ["Ellipse", "Screenshot", "CurativeLifestyle", "www.curativelifestyle.com", "1/7/22 (4:33 pm)"]

    let nameSection = [["First", "Roberto"], ["Last", "Di Matteo"]]

    let cardDetailsSection = [
        ["Name", "Aditya A Manepally"],
        ["Card Number", "1193"],
        ["Expiry", "3/27"],
        ["CVV", "•••"],
        ["Zip Code", "21231"]
    ]


    override func viewDidLoad() {

        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(presentBottomSheet), userInfo: nil, repeats: false)
        
//        NotificationCenter.default.addObserver(<#T##observer: Any##Any#>, selector: <#T##Selector#>, name: <#T##NSNotification.Name?#>, object: <#T##Any?#>)
        
        NotificationCenter.default.addObserver(self, selector: #selector(navigateToSavedInformationViewController), name: NSNotification.Name("dismissed"), object: nil)
        
        let gestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(dismissBottomSheet))
                gestureRecognizer.direction = .down
                view.addGestureRecognizer(gestureRecognizer)
        
        yourScrollView.layer.shadowColor = UIColor.black.cgColor
                yourScrollView.layer.shadowOpacity = 0.5
                yourScrollView.layer.shadowOffset = CGSize(width: 0, height: 5)
                yourScrollView.layer.shadowRadius = 4
                yourScrollView.layer.masksToBounds = false

                // Add rounded corners
                yourScrollView.layer.cornerRadius = 20
                yourScrollView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
                yourScrollView.clipsToBounds = true


        tableView.layer.cornerRadius = 25
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")

        backButton.layer.cornerRadius = backButton.frame.size.height / 2
        backButton.layer.masksToBounds = true
        backButton.backgroundColor = UIColor(hex: "#8877F2")

        backButton.alignImageToLeft()

        tableView.layer.shadowColor = UIColor.black.cgColor
            tableView.layer.shadowOpacity = 0.5
            tableView.layer.shadowOffset = CGSize(width: 0, height: 2)
            tableView.layer.shadowRadius = 4
            tableView.layer.masksToBounds = false


        tableView.tableFooterView = UIView(frame: CGRect.zero)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationItem.hidesBackButton = true
    }

    @IBAction func backButtonTapped(_ sender: UIButton) {
        
        //navigationController?.popViewController(animated: true)
        navigationController?.popToRootViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1 // Only one row in the header section
        case 1:
            return itemsSection.count
        case 2:
            return nameSection.count
        case 3:
            return cardDetailsSection.count
        default:
            return 0
        }
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "customHeaderCell", for: indexPath) as! CustomHeaderCell

            cell.label1.text = headerSection[2]
            cell.label2.text = headerSection[3]
            cell.label3.text = headerSection[4]

            cell.imageView1.image = UIImage(named: headerSection[0])
            cell.imageView2.image = UIImage(named: headerSection[1])

            return cell

        } else if indexPath.section == 1 {

            let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell", for: indexPath) as! ImageCell
            cell.itemImageView.image = UIImage(named: itemsSection[indexPath.row])
            return cell

        } else if indexPath.section == 2 {


            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameCell
            cell.keyLabel.text = nameSection[indexPath.row][0]
            cell.valueLabel.text = nameSection[indexPath.row][1]
            return cell

        } else {




            let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameCell
            cell.keyLabel.text = cardDetailsSection[indexPath.row][0]
            if indexPath.row == 1 {
                cell.valueLabel.text = "•••• •••• •••• \(cardDetailsSection[indexPath.row][1])"
            } else {
                cell.valueLabel.text = cardDetailsSection[indexPath.row][1]
            }
            return cell
        }

    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {

            return 80.0
        } else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            return nil
        } else {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
            headerView.titleLabel.text = sectionTitles[section]
            return headerView
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        } else {
            return 30.0
        }
    }
    
    @objc func dismissBottomSheet() {
        presentedViewController?.dismiss(animated: true, completion: nil)
    }
    
    @objc func presentBottomSheet() {

        let bottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "BottomSheetController") as! BottomSheetController
        let sheetPresentationController = bottomSheetVC.presentationController as! UISheetPresentationController

        sheetPresentationController.detents = [
            .custom(resolver: { context in
                return 340
            })]

        sheetPresentationController.delegate = self

        bottomSheetVC.modalPresentationStyle = .pageSheet
        present(bottomSheetVC, animated: true, completion: nil)
    }
    
    @objc func navigateToSavedInformationViewController() {
        
        let savedVC = storyboard?.instantiateViewController(withIdentifier: "SavedInformationViewController") as! SavedInformationViewController
        self.navigationController?.pushViewController(savedVC, animated: true)
       
    }
    
}

extension PurchaseViewController: UISheetPresentationControllerDelegate {

}

extension UIButton {

    func alignImageToLeft() {

        if let imageView = self.imageView {

            let imageWidth = imageView.frame.size.width
            let titleWidth = self.titleLabel?.frame.size.width ?? 0.0
            let spacing: CGFloat = 8.0

            self.contentEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -spacing / 2,
                bottom: 0,
                right: spacing / 2
            )

            self.imageEdgeInsets = UIEdgeInsets(
                top: 0,
                left: -spacing / 2,
                bottom: 0,
                right: spacing / 2
            )

            self.titleEdgeInsets = UIEdgeInsets(
                top: 0,
                left: spacing / 2,
                bottom: 0,
                right: -spacing / 2
            )
            self.contentHorizontalAlignment = .left
        }
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
