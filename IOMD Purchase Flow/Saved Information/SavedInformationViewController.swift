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
    var imageName: String
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
    
    @IBOutlet weak var shadowView: UIView!
    
    let sectionTitles = ["User", "Name", "Address", "Card", "Email", "Phone"]
    
    let headerSection = ["", "Male User", "Patty", "Williams", ""]
    
    var userName: String = "Robert Di Matteo"
    
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
    
    var cardsList = [cardItem]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let item1 = SectionItem(title: "User", subheading: "", imageName: "", items: [""], isExpanded: false, isTokenized: false)
        let item2 = SectionItem(title: "Name", subheading: "This is your tokenized name to keep yours private.",imageName: "tokenized user icon", items: ["jason derulo"], isExpanded: false, isTokenized: false)
        let item3 = SectionItem(title: "Address", subheading: "Your tokenized address keeps your location safe.", imageName: "tokenized address icon", items: ["2101 Chestnut St, Unit 624, Philadelphia PA 19103", "43456 sd St, Unit 211, Tennesse TA 43232"], isExpanded: false, isTokenized: false)
        let item4 = SectionItem(title: "Card", subheading: "This tokenized card is linked to yours, keeping it safe.",imageName: "tokenized user icon", items: ["1111 3432 2432 7891", "2222 5678 9862 6543","3333 5678 9862 6543","4444 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543"], isExpanded: false, isTokenized: false)
        let item5 = SectionItem(title: "Email", subheading: "Using your personal email. No spam protection.", imageName: "tokenized user icon", items: ["jasonderulo@gmail.com", "jackdawson@gmail.com"], isExpanded: false, isTokenized: false)
        let item6 = SectionItem(title: "Phone", subheading: "Your tokenized phone number hides your real one",imageName: "tokenized phone icon", items: ["8734234523", "92438 43425"], isExpanded: false, isTokenized: false)
        
        
        let item7 = SectionItem(title: "User", subheading: "", imageName: "", items: [""], isExpanded: false, isTokenized: true)
        let item8 = SectionItem(title: "Name", subheading: "This is your tokenized name to keep yours private.", imageName: "tokenized user icon", items: ["Robert Di Matteo", "Dwayne Bravo", "Jason Derulo"], isExpanded: false, isTokenized: true)
        let item9 = SectionItem(title: "Address", subheading: "Your tokenized address keeps your location safe.", imageName: "tokenized address icon", items: ["2101 Chestnut St, Unit 624, Philadelphia PA 19103", "1241 Walnut St, Unit 421, Philadelphia PA 19103"], isExpanded: false, isTokenized: true)
        let item10 = SectionItem(title: "Card", subheading: "This tokenized card is linked to yours, keeping it safe.", imageName: "tokenized card icon", items: ["1111 3432 2432 7891", "2222 5678 9862 6543","3333 5678 9862 6543","4444 5678 9862 6543","5555 5678 9862 6543","6666 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543","8765 5678 9862 6543"], isExpanded: false, isTokenized: true)
        let item11 = SectionItem(title: "Email", subheading: "Using your personal email. No spam protection.", imageName: "tokenized email icon", items: ["jasonderulo@gmail.com", "jackdawson@gmail.com"], isExpanded: false, isTokenized: true)
        let item12 = SectionItem(title: "Phone", subheading: "Your tokenized phone number hides your real one", imageName: "tokenized phone icon", items: ["8734234523", "92438 43425"], isExpanded: false, isTokenized: true)

        listSection.append(item1)
        listSection.append(item2)
        listSection.append(item3)
        listSection.append(item4)
        listSection.append(item5)
        listSection.append(item6)
        listSection.append(item7)
        listSection.append(item8)
        listSection.append(item9)
        listSection.append(item10)
        listSection.append(item11)
        listSection.append(item12)
                
        personalListSection = listSection.filter { item in
            return item.isTokenized == false
        }
        
        tokenizedListSection = listSection.filter { item in
            return item.isTokenized == true
        }
        
        let card1 = cardItem(name: "Jack Dawson", number: "8765 5678 9862 6543", expiry: "12/25", isHidden: true)
        let card2 = cardItem(name: "Jack Dawson", number: "3456 5678 9862 6543", expiry: "12/25", isHidden: true)
        let card3 = cardItem(name: "Jack Dawson", number: "9301 5678 9862 6543", expiry: "12/25", isHidden: true)
        let card4 = cardItem(name: "Jack Dawson", number: "7635 5678 9862 6543", expiry: "12/25", isHidden: true)
        let card5 = cardItem(name: "Jack Dawson", number: "3932 5678 9862 6543", expiry: "12/25", isHidden: true)
        let card6 = cardItem(name: "Jack Dawson", number: "2229 5678 9862 6543", expiry: "12/25", isHidden: true)
        
        cardsList.append(card1)
        cardsList.append(card2)
        cardsList.append(card3)
        cardsList.append(card4)
        cardsList.append(card5)
        cardsList.append(card6)

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
        self.tableView.contentInset = UIEdgeInsets(top: 5, left: 0, bottom: 0, right: 0)
        tableView.sectionHeaderHeight = 0
        
        tableView.backgroundColor = UIColor.white
        
        shadowView.layer.cornerRadius = 25
        shadowView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 4.0
        shadowView.layer.masksToBounds = false
        
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
        
        let tokenizedHeadingNib = UINib(nibName: "TokenizedHeadingTableViewCell", bundle: nil)
        tableView.register(tokenizedHeadingNib, forCellReuseIdentifier: "TokenizedHeadingTableViewCell")
        plainTableView.register(tokenizedHeadingNib, forCellReuseIdentifier: "TokenizedHeadingTableViewCell")
        
        tableView.register(UINib(nibName: "UserNameTableViewCell", bundle: nil), forCellReuseIdentifier: "UserNameTableViewCell")
        plainTableView.register(UINib(nibName: "UserNameTableViewCell", bundle: nil), forCellReuseIdentifier: "UserNameTableViewCell")
    
        
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
                return tokenizedListSection[section].isExpanded ? tokenizedListSection[section].items.count + 1 : 2
            }
        } else {
            return personalListSection[section].isExpanded ? personalListSection[section].items.count : 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if button3.isSelected {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CardTableViewCell", for: indexPath) as! CardTableViewCell
            
            let card = cardsList[indexPath.row]
        
            cell.nameLabel.text = card.name
            cell.expiryDateLabel.text = card.expiry
            
            cell.cardNumberLabel.text = cell.isCardVisible ? card.number : maskCardNumber(cardNumber: card.number)
            
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
            
            let symbolName = card.isHidden ? "eye.slash.fill" : "eye.fill"
            
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
                cell.value.text = personalListSection[indexPath.section].items[indexPath.row]
                return cell
            }
            
        } else {
            
            if indexPath.section == 0 {
            
                let cell = tableView.dequeueReusableCell(withIdentifier: "UserNameTableViewCell", for: indexPath) as! UserNameTableViewCell
                    
                let formattedName = formatName(userName)
                cell.userNameLabel.attributedText = formattedName
                
                cell.userNameLabel.text = cell.userNameLabel.text?.replacingOccurrences(of: " ", with: "\n")
                                
                cell.editAction = { isEditing in
                    if isEditing {
                        self.saveUserName(cell.userNameLabel.text ??  "")
                    }
                }

                return cell
                
            } else {
                
                if indexPath.row == 0 {
                    
                    let cell = tableView.dequeueReusableCell(withIdentifier: "TokenizedHeadingTableViewCell", for: indexPath) as! TokenizedHeadingTableViewCell
       
                    cell.headingLabel.text = tokenizedListSection[indexPath.section].title
                    cell.subheadingLabel.text = tokenizedListSection[indexPath.section].subheading
                    cell.dropDownButton.tag = indexPath.section
                    cell.dropDownButton.addTarget(self, action: #selector(tokenizedToggle), for: .touchUpInside)
                    cell.dropDownButton.setTitle(tokenizedListSection[indexPath.section].isExpanded ? "▲" : "▼", for: .normal)
                    return cell
                    
                } else {

                    let cell = tableView.dequeueReusableCell(withIdentifier: "myTabCell", for: indexPath) as! myTabCell
                    cell.iconView.image = UIImage(named: tokenizedListSection[indexPath.section].imageName)
                    cell.value.text = tokenizedListSection[indexPath.section].items[indexPath.row - 1]
                    
                    cell.editAction = { isEditing in
                                if isEditing {
                                    self.saveEditedText(cell)
                                }
                            }
                    
                    return cell
                }
            }
        }
    }
    
    
    func formatName(_ name: String) -> NSAttributedString {
        let words = name.components(separatedBy: " ")
            if let firstWord = words.first {
                let attributedText = NSMutableAttributedString(string: name)
                attributedText.addAttributes([
                    .font: UIFont.boldSystemFont(ofSize: 18),
                    .foregroundColor: UIColor.black,
                ], range: (name as NSString).range(of: firstWord))
                return attributedText
            }
            return NSAttributedString(string: name)
    }
    
    private func saveEditedText(_ cell: myTabCell) {
            if let indexPath = tableView.indexPath(for: cell) {
                tokenizedListSection[indexPath.section].items[indexPath.row - 1] = cell.value.text ?? ""
            }
        }
    
    private func saveUserName(_ updatedName: String) {
        userName = updatedName
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            
            return 80.0
            
        } else if indexPath.row == 0 {
            
            return 40
            
        } else {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "myTabCell") as! myTabCell
            let text = tokenizedListSection[indexPath.section].items[indexPath.row - 1]
            cell.value.text = text
                        
            let labelHeight = cell.value.sizeThatFits(CGSize(width: cell.value.frame.size.width, height: CGFloat.greatestFiniteMagnitude)).height

            let cellHeight = labelHeight + 26

            return cellHeight
        }
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if button1.isSelected {
            
            if section == 0 {
                
                return nil
                
            } else {
                
                let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "TokenizedHeaderView") as! TokenizedHeaderView
                
                headerView.headingLabel.text = personalListSection[section].title
                headerView.subheadingLabel.text = personalListSection[section].subheading
                headerView.dropDownButton.tag = section
                headerView.dropDownButton.addTarget(self, action: #selector(personalizedToggle), for: .touchUpInside)
                
                headerView.dropDownButton.setTitle(personalListSection[section].isExpanded ? "▲" : "▼", for: .normal)
                
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
            
        } else if button2.isSelected {
            
            if section == 0 {
                
                return nil
                
            } else {
                
                return nil
        
            }
            
        } else {
            return nil
        }
    }
    
    @objc func personalizedToggle(_ sender: UIButton) {
        let section = sender.tag
        personalListSection[section].isExpanded = !personalListSection[section].isExpanded
        plainTableView.reloadSections([section], with: .automatic)
    }
    
    @objc func tokenizedToggle(_ sender: UIButton) {
        let section = sender.tag
        tokenizedListSection[section].isExpanded = !tokenizedListSection[section].isExpanded
        tableView.reloadSections([section], with: .automatic)
    }
    
//   func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        if section == 0 {
//            return 0
//        } else {
//            return 50.0
//        }
//    }
    
}
