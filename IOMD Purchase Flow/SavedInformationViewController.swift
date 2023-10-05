//
//  SavedInformationViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 08/09/23.
//

import UIKit

struct SectionItem {
    var title : String
    var subheading: String
    var items: [String]
    var isExpanded: Bool
    var isTokenized: Bool
}

struct cardItem {
    var name : String
    var number : String
    var expiry : String
    var isHidden : Bool
}

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
    var plainTableView: UITableView!
    @IBOutlet weak var savedBackButton: UIButton!
    @IBOutlet weak var yourScrollView: UIScrollView!
    
    let sectionTitles = ["User", "Name", "Address", "Card", "Email", "Phone"]
    
    let headerSection = ["", "Male User", "Patty", "Williams", ""]
    
    var cardData: [[String: String]] = [
        ["firstName": "Jack", "lastName": "Dawson","cardNumber": "8765 5678 9862 6543",
            "expiryDate": "12/25"],
        ["firstName": "Jill", "lastName": "McGill","cardNumber": "9876 3452 6292 7318",
            "expiryDate": "08/23"]
    ]
        
    var sectionsExpanded: [Int: Bool] = [:]
    var currentEmailSection: [String] = []
    var currentPhoneSection: [String] = []
    var currentAddressSection: [String] = []
    var currentCardSection: [String] = []
    var isButton3Active = false
    
    var listSection = [SectionItem]()
    
    var personalListSection = [SectionItem]()
    var tokenizedListSection = [SectionItem]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let item1 = SectionItem(title: "User", subheading: "", items: [""], isExpanded: false, isTokenized: false)
        let item2 = SectionItem(title: "Name", subheading: "This is your tokenized name to keep yours private.", items: ["jason derulo"], isExpanded: false, isTokenized: false)
        let item3 = SectionItem(title: "Address", subheading: "Your tokenized address keeps your location safe.", items: ["2101 Chestnut St, Unit 624, Philadelphia PA 19103", "43456 sd St, Unit 211, Tennesse TA 43232"], isExpanded: false, isTokenized: false)
        let item4 = SectionItem(title: "Card", subheading: "This tokenized card is linked to yours, keeping it safe.", items: ["4321 3432 2432 7891", "8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543"], isExpanded: false, isTokenized: false)
        let item5 = SectionItem(title: "Email", subheading: "Using your personal email. No spam protection.", items: ["jasonderulo@gmail.com", "jackdawson@gmail.com"], isExpanded: false, isTokenized: false)
        let item6 = SectionItem(title: "Phone", subheading: "Your tokenized phone number hides your real one" , items: ["8734234523", "92438 43425"], isExpanded: false, isTokenized: false)

        listSection.append(item1)
        listSection.append(item2)
        listSection.append(item3)
        listSection.append(item4)
        listSection.append(item5)
        listSection.append(item6)
                
        
        personalListSection = listSection.filter { item in
            return item.isTokenized == false
        }
        
        tokenizedListSection = listSection.filter { item in
            return item.isTokenized == true
        }
        button2.isSelected = true
        view2.isHidden = false
        
        view1.isHidden = true
        view3.isHidden = true
        
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
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
        
        plainTableView = UITableView(frame: .zero, style: .plain)
        plainTableView.delegate = self
        plainTableView.dataSource = self
        
        view.addSubview(plainTableView)

        plainTableView.isHidden = true

        plainTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            plainTableView.topAnchor.constraint(equalTo: tableView.topAnchor),
            plainTableView.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            plainTableView.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
            plainTableView.bottomAnchor.constraint(equalTo: tableView.bottomAnchor)
            ])
        
        view.insertSubview(plainTableView, belowSubview: stackView)
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        tableView.register(TokenizedHeaderView.self, forHeaderFooterViewReuseIdentifier: "TokenizedHeaderView")
        
        plainTableView.register(TokenizedHeaderView.self, forHeaderFooterViewReuseIdentifier: "TokenizedHeaderView")
        
        let customCellNib = UINib(nibName: "myTabCell", bundle: nil)
        tableView.register(customCellNib, forCellReuseIdentifier: "myTabCell")
        plainTableView.register(customCellNib, forCellReuseIdentifier: "myTabCell")
        
        let customHeaderCellNib = UINib(nibName: "myCustomHeaderCell", bundle: nil)
        tableView.register(customHeaderCellNib, forCellReuseIdentifier: "myCustomHeaderCell")
        plainTableView.register(customHeaderCellNib, forCellReuseIdentifier: "myCustomHeaderCell")
        
        let customCardCellNib = UINib(nibName: "CardTableViewCell", bundle: nil)
        tableView.register(customCardCellNib, forCellReuseIdentifier: "CardTableViewCell")
        plainTableView.register(customCardCellNib, forCellReuseIdentifier: "CardTableViewCell")
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        plainTableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
    
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
            view1.isHidden = false
        } else if sender == button2 {
            isButton3Active = false
            view2.isHidden = false
        } else if sender == button3 {
            isButton3Active = true
            view3.isHidden = false
        }
        
        button1.isSelected = (sender == button1)
        button2.isSelected = (sender == button2)
        button3.isSelected = (sender == button3)
        
        if sender == button1 || sender == button3 {
            tableView.isHidden = true
            plainTableView.isHidden = false
            plainTableView.reloadData()
        } else if sender == button2 {
            plainTableView.isHidden = true
            tableView.isHidden = false
            tableView.reloadData()
        }
        //tableView.reloadData()
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
        
        if button3.isSelected {
            return 1
        } else if button2.isSelected {
            return tokenizedListSection.count
        } else {
            return personalListSection.count
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        if button3.isSelected {
            return cardData.count
        } else if button2.isSelected {
            if section == 0 {
                return 1
            } else {
                return tokenizedListSection[section].isExpanded ? tokenizedListSection[section].items.count : 1
            }
        } else {
            return personalListSection[section].isExpanded ? personalListSection[section].items.count : 1

//            return listSection[section].items.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if button3.isSelected {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            
            let card = cardData[indexPath.row]
        
            cell.nameLabel.text = "\(card["firstName"] ?? "") \(card["lastName"] ?? "")"

            cell.expiryDateLabel.text = card["expiryDate"]
            
            cell.cardNumberLabel.text = cell.isCardVisible ? card["cardNumber"] : maskCardNumber(cardNumber: card["cardNumber"] ?? "")
            
            func maskCardNumber(cardNumber: String) -> String {
                
                if let lastFourDigits = cardNumber.range(of: "\\d{4}$", options: .regularExpression)
                {
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
            
        } else if button1.isSelected {
            
            if indexPath.section == 0 {
    
                let cell = plainTableView.dequeueReusableCell(withIdentifier: "myCustomHeaderCell", for: indexPath) as! myCustomHeaderCell
    
                cell.label1.text = headerSection[2]
                cell.label2.text = headerSection[3]
                cell.label3.text = headerSection[4]
    
                cell.imageView1.image = UIImage(named: headerSection[0])
                cell.imageView2.image = UIImage(named: headerSection[1])
    
                return cell
    
            } else {
    
                let cell = plainTableView.dequeueReusableCell(withIdentifier: "myTabCell", for: indexPath) as! myTabCell
      
                cell.iconView.image = UIImage(named: "Tokenized User")
                cell.value.text = listSection[indexPath.section].items[indexPath.row]
                return cell
            }
            
        } else {
            
            if indexPath.section == 0 {
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "myCustomHeaderCell", for: indexPath) as! myCustomHeaderCell
    
                cell.label1.text = headerSection[2]
                cell.label2.text = headerSection[3]
                cell.label3.text = headerSection[4]
    
                cell.imageView1.image = UIImage(named: headerSection[0])
                cell.imageView2.image = UIImage(named: headerSection[1])
    
                return cell
    
            } else {
    
                let cell = tableView.dequeueReusableCell(withIdentifier: "myTabCell", for: indexPath) as! myTabCell
            
                cell.iconView.image = UIImage(named: "Tokenized User")
                cell.value.text = listSection[indexPath.section].items[indexPath.row]
            
                let cellBackgroundView = SectionBackgroundView()
                
                cellBackgroundView.isHeader = false
                cellBackgroundView.isLastRow = indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1
                    cell.backgroundView = cellBackgroundView

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
        
        
        if button1.isSelected {
            
            if section == 0 {
                return nil
            } else {
                
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
                
                headerView.titleLabel.text = sectionTitles[section]
                
                return headerView
                
            }
            
        } else if button2.isSelected {
            
            if section == 0 {
                
                return nil
                
            } else {
                
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TokenizedHeaderView") as! TokenizedHeaderView
                headerView.headingLabel.text = listSection[section].title
                headerView.subheadingLabel.text = listSection[section].subheading
                headerView.dropDownButton.tag = section
                headerView.dropDownButton.addTarget(self, action: #selector(toggleSection), for: .touchUpInside)
                
                headerView.dropDownButton.setTitle(listSection[section].isExpanded ? "▲" : "▼", for: .normal)
                
                let sectionBackgroundView = SectionBackgroundView()
                sectionBackgroundView.isHeader = true
                sectionBackgroundView.addSubview(headerView)
                
                headerView.translatesAutoresizingMaskIntoConstraints = false
                NSLayoutConstraint.activate([
                    headerView.topAnchor.constraint(equalTo: sectionBackgroundView.topAnchor),
                    headerView.leadingAnchor.constraint(equalTo: sectionBackgroundView.leadingAnchor),
                    headerView.trailingAnchor.constraint(equalTo: sectionBackgroundView.trailingAnchor),
                    headerView.bottomAnchor.constraint(equalTo: sectionBackgroundView.bottomAnchor),
                ])
                
                return sectionBackgroundView
            }
        } else {
            return nil
        }
    }
    
        
    @objc func toggleSection(_ sender: UIButton) {
        let section = sender.tag
        listSection[section].isExpanded = !listSection[section].isExpanded
        tableView.reloadSections([section], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        if section == 0 {
            return 0
        } else {
            return 50.0
        }
    }
}
