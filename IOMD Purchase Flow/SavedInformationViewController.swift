//
//  SavedInformationViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

class SavedInformationViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var defaultView1: UIView!
    @IBOutlet weak var defaultView2: UIView!
    @IBOutlet weak var defaultView3: UIView!
    
    @IBOutlet weak var view1: UIView!
    @IBOutlet weak var view2: UIView!
    @IBOutlet weak var view3: UIView!
    
    @IBOutlet weak var stackView: UIStackView!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var savedBackButton: UIButton!
    @IBOutlet weak var yourScrollView: UIScrollView!
    
    let sectionTitles = ["Header Section", "email", "phone", "address", "card"]
    
    let headerSection = ["", "Male User", "Patty", "Williams", ""]
    
    let emailSection1 = ["email1@example.com", "email1@example.com", "email1@example.com"]
    let emailSection2 = ["email2@example.com", "email2@example.com", "email2@example.com"]
    
    let phoneSection1 = ["123-456-7890"]
    let phoneSection2 = ["987-654-3210"]
    
    let addressSection1 = ["123 Main St, City1", "456 Elm St, City1"]
    let addressSection2 = ["789 Oak St, City2", "101 Pine St, City2"]
    
    let cardDetailsSection1 = ["xxxx1234"]
    let cardDetailsSection2 = ["xxxx5678"]
    
    var cardData: [[String: String]] = [
        ["firstName": "Jack", "lastName": "Dawson","cardNumber": "8765 5678 9862 6543",
            "expiryDate": "12/25"],
        ["firstName": "Jill", "lastName": "McGill","cardNumber": "9876 3452 6292 7318",
            "expiryDate": "08/23"]
    ]
    
    var currentEmailSection: [String] = []
    var currentPhoneSection: [String] = []
    var currentAddressSection: [String] = []
    var currentCardSection: [String] = []
    
    var isButton3Active = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        button2.isSelected = true
        view2.isHidden = false
        
        view1.isHidden = true
        view3.isHidden = true
        
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        currentEmailSection = emailSection2
        currentPhoneSection = phoneSection2
        currentAddressSection = addressSection2
        currentCardSection = cardDetailsSection2
        
        defaultView1.layer.cornerRadius = defaultView1.frame.size.height / 2
        defaultView1.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        defaultView3.layer.cornerRadius = defaultView3.frame.size.height / 2
        defaultView3.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        defaultView1.backgroundColor = UIColor(hex: "#EDEDED")
        defaultView2.backgroundColor = UIColor(hex: "#EDEDED")
        defaultView3.backgroundColor = UIColor(hex: "#EDEDED")
        
        addShadow(to: view1)
        addShadow(to: view2)
        addShadow(to: view3)
        
        addShadow(to: stackView)
        
        view1.layer.cornerRadius = view1.frame.size.height / 2
        view2.layer.cornerRadius = view2.frame.size.height / 2
        view3.layer.cornerRadius = view3.frame.size.height / 2
        
        navigationItem.hidesBackButton = true
        self.navigationItem.leftBarButtonItem = nil
        self.navigationItem.hidesBackButton = true
        
        savedBackButton.addTarget(self, action: #selector(savedBackButtonTapped), for: .touchUpInside)
        
        yourScrollView.layer.shadowColor = UIColor.black.cgColor
        yourScrollView.layer.shadowOpacity = 0.5
        yourScrollView.layer.shadowOffset = CGSize(width: 0, height: 5)
        yourScrollView.layer.shadowRadius = 4
        yourScrollView.layer.masksToBounds = false
        yourScrollView.layer.cornerRadius = 20
        yourScrollView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        yourScrollView.clipsToBounds = true
        
        tableView.layer.cornerRadius = 25
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        
        savedBackButton.layer.cornerRadius = savedBackButton.frame.size.height / 2
        savedBackButton.layer.masksToBounds = true
        savedBackButton.backgroundColor = UIColor(hex: "#8877F2")
        savedBackButton.alignImageToLeft()
        
        tableView.layer.shadowColor = UIColor.black.cgColor
        tableView.layer.shadowOpacity = 0.5
        tableView.layer.shadowOffset = CGSize(width: 0, height: 2)
        tableView.layer.shadowRadius = 4
        tableView.layer.masksToBounds = false
        
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        
    }
    
    @objc func buttonTapped(_ sender: UIButton) {
        view1.isHidden = true
        view2.isHidden = true
        view3.isHidden = true
        
        if sender == button1 {
            isButton3Active = false
            currentEmailSection = emailSection1
            currentPhoneSection = phoneSection1
            currentAddressSection = addressSection1
            currentCardSection = cardDetailsSection1
            view1.isHidden = false
        } else if sender == button2 {
            isButton3Active = false
            currentEmailSection = emailSection2
            currentPhoneSection = phoneSection2
            currentAddressSection = addressSection2
            currentCardSection = cardDetailsSection2
            view2.isHidden = false
        } else if sender == button3 {
            isButton3Active = true
            view3.isHidden = false
        }
        
        button1.isSelected = (sender == button1)
        button2.isSelected = (sender == button2)
        button3.isSelected = (sender == button3)
        
        tableView.reloadData()
    }
    
    func addShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
    }
    
    @objc func savedBackButtonTapped(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if isButton3Active {
            return 1
        } else {
            return sectionTitles.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isButton3Active {
            return cardData.count
        } else {
            switch section {
            case 0:
                return 1
            case 1:
                return currentEmailSection.count
            case 2:
                return currentPhoneSection.count
            case 3:
                return currentAddressSection.count
            case 4:
                return currentCardSection.count
            default:
                return 0
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if isButton3Active {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardsCellTableViewCell", for: indexPath) as! CardsCellTableViewCell
            
            let card = cardData[indexPath.row]
        
            cell.nameLabel.text = "\(card["firstName"] ?? "") \(card["lastName"] ?? "")"

            cell.expiryDateLabel.text = card["expiryDate"]
            
            cell.cardNumberLabel.text = cell.isCardVisible ? card["cardNumber"] : maskCardNumber(cardNumber: card["cardNumber"] ?? "")
            
            func maskCardNumber(cardNumber: String) -> String {
                if let lastFourDigits = cardNumber.range(of: "\\d{4}$", options: .regularExpression) {
                    let maskedSection = "•••• •••• •••• "
                    return maskedSection + cardNumber[lastFourDigits]
                }
                return cardNumber
            }

//            func maskCardNumber(cardNumber: String) -> String {
//                var segments = cardNumber.split(separator: " ")
//                for i in 0..<segments.count - 1 {
//                    segments[i] = "••••"
//                }
//                return segments.joined(separator: " ")
//            }

//            if !cell.isCardVisible, let cardNumber = card["cardNumber"] {
//                let maskedCardNumber = String(repeating: "•••• ", count: 3) + String(cardNumber.suffix(4))
//                cell.cardNumberLabel.text = maskedCardNumber
//            } else {
//                cell.cardNumberLabel.text = card["cardNumber"]
//            }
            
            let symbolName = cell.isCardVisible ? "eye.slash.fill" : "eye.fill"
            let configuration = UIImage.SymbolConfiguration(pointSize: 10)
            let image = UIImage(systemName: symbolName, withConfiguration: configuration)
            
            cell.showButton.setImage(image?.withRenderingMode(.alwaysTemplate), for: .normal)
            cell.showButton.tintColor = .black
    
            cell.showButtonAction = { [] in
                cell.isCardVisible.toggle()
                tableView.reloadRows(at: [indexPath], with: .automatic)
            }

            cell.deleteButtonAction = { [weak self] in
                
                let alertController = UIAlertController(title: "Confirm Deletion", message: "Are you sure you want to delete this card?", preferredStyle: .alert)

                let deleteAction = UIAlertAction(title: "Delete", style: .destructive) { (_) in
                    self?.cardData.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .fade)
                }

                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

                alertController.addAction(deleteAction)
                
                alertController.addAction(cancelAction)

                self?.present(alertController, animated: true, completion: nil)
            }
        
            return cell
            
        } else {
            
            if indexPath.section == 0 {
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "customHeaderCell", for: indexPath) as! CustomHeaderCell
    
                cell.label1.text = headerSection[2]
                cell.label2.text = headerSection[3]
                cell.label3.text = headerSection[4]
    
                cell.imageView1.image = UIImage(named: headerSection[0])
                cell.imageView2.image = UIImage(named: headerSection[1])
    
                return cell
    
            } else {
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath) as! NameCell
    
                cell.keyLabel.text = ""
    
                switch indexPath.section {
    
                case 1:
                    cell.valueLabel.text = currentEmailSection[indexPath.row]
                case 2:
                    cell.valueLabel.text = currentPhoneSection[indexPath.row]
                case 3:
                    cell.valueLabel.text = currentAddressSection[indexPath.row]
                case 4:
                    cell.valueLabel.text = currentCardSection[indexPath.row]
                default:
                    cell.valueLabel.text = ""
                }
    
                return cell
            }
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
}
