//
//  CardUsageViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 06/10/23.
//

import UIKit

class UsedCardsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var headingView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var table1Button: UIButton!
    @IBOutlet weak var table2Button: UIButton!
    @IBOutlet weak var table3Button: UIButton!
    
    @IBOutlet weak var button1View: UIView!
    @IBOutlet weak var button2View: UIView!
    @IBOutlet weak var button3View: UIView!
    
    @IBOutlet weak var scrollView: UIView!
    
    @IBOutlet weak var horizontalScrollView: UIScrollView!
    
    @IBOutlet weak var tableView1: UITableView!
    @IBOutlet weak var tableView2: UITableView!
    @IBOutlet weak var tableView3: UITableView!
    
    var currentTableView: UITableView?
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    let sectionTitles = ["Last Transaction", "Others"]
    var transactions: [[String: String]] = []
    var lastTransaction: [[String: String]] = []
    var otherTransactions: [[String: String]] = []
        
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        fetchDataAndPrepareData()
        
        horizontalScrollView.delegate = self
        
        horizontalScrollView.setContentOffset(CGPoint(x: horizontalScrollView.frame.width, y: 0), animated: false)
    }
    
    @IBAction func table1ButtonTapped(_ sender: UIButton) {
        scrollToTableView(tableView1)
        button1View.isHidden = false
        button2View.isHidden = true
        button3View.isHidden = true
    }
    
    @IBAction func table2ButtonTapped(_ sender: UIButton) {
        scrollToTableView(tableView2)
        button1View.isHidden = true
        button2View.isHidden = false
        button3View.isHidden = true
    }
    
    @IBAction func table3ButtonTapped(_ sender: UIButton) {
        scrollToTableView(tableView3)
        button1View.isHidden = true
        button2View.isHidden = true
        button3View.isHidden = false
    }

    func scrollToTableView(_ tableView: UITableView) {
        if let index = [tableView1, tableView2, tableView3].firstIndex(of: tableView) {
            currentTableView = tableView
            
            //let xOffset = CGFloat(index) * horizontalScrollView.frame.width
            //horizontalScrollView.setContentOffset(CGPoint(x: xOffset, y: 0), animated: true)
            
            let rectToScroll = CGRect(x: CGFloat(index) * horizontalScrollView.frame.width, y: 0, width: horizontalScrollView.frame.width, height: horizontalScrollView.frame.height)
                   horizontalScrollView.scrollRectToVisible(rectToScroll, animated: true)
               
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageWidth = horizontalScrollView.frame.width
        let currentPage = Int(horizontalScrollView.contentOffset.x / pageWidth)

        switch currentPage {
        case 0:
            currentTableView = tableView1
            button1View.isHidden = false
            button2View.isHidden = true
            button3View.isHidden = true
        case 1:
            currentTableView = tableView2
            button1View.isHidden = true
            button2View.isHidden = false
            button3View.isHidden = true
        case 2:
            currentTableView = tableView3
            button1View.isHidden = true
            button2View.isHidden = true
            button3View.isHidden = false
        default:
            break
        }
    }
    
    func setupUI() {
        
        button1View.isHidden = true
        button3View.isHidden = true
        
        button1View.layer.cornerRadius = button1View.frame.size.height / 2
        button2View.layer.cornerRadius = button2View.frame.size.height / 2
        button3View.layer.cornerRadius = button3View.frame.size.height / 2
        
        addShadow(to: button1View)
        addShadow(to: button2View)
        addShadow(to: button3View)
        
        table1Button.layer.cornerRadius = table1Button.frame.size.height / 2
        table1Button.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        
        table3Button.layer.cornerRadius = table3Button.frame.size.height / 2
        table3Button.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        
        tableView1.delegate = self
        tableView1.dataSource = self
        self.tableView1.contentInset = UIEdgeInsets(top: 85, left: 0, bottom: 0, right: 0)
        
        tableView2.delegate = self
        tableView2.dataSource = self
        self.tableView2.contentInset = UIEdgeInsets(top: 85, left: 0, bottom: 0, right: 0)
        
        tableView3.delegate = self
        tableView3.dataSource = self
        self.tableView3.contentInset = UIEdgeInsets(top: 85, left: 0, bottom: 0, right: 0)
        
        headingView.layer.cornerRadius = headingView.frame.size.height / 2
        headingView.layer.masksToBounds = false
        headingView.backgroundColor = UIColor(hex: "#8877F2")
        
        headingView.layer.shadowColor = UIColor.black.cgColor
        headingView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        headingView.layer.shadowOpacity = 0.5
        headingView.layer.shadowRadius = 4.0
        headingView.layer.masksToBounds = false
        
        tableView1.layer.cornerRadius = 25
        tableView1.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView1.clipsToBounds = true
        tableView1.layer.masksToBounds = true
        
        tableView2.layer.cornerRadius = 25
        tableView2.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView2.clipsToBounds = true
        tableView2.layer.masksToBounds = true
        
        tableView3.layer.cornerRadius = 25
        tableView3.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView3.clipsToBounds = true
        tableView3.layer.masksToBounds = true
        
        scrollView.layer.cornerRadius = 25
        scrollView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        scrollView.clipsToBounds = true
        scrollView.layer.masksToBounds = true
        
        shadowView.layer.cornerRadius = 25
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 4.0
        shadowView.layer.masksToBounds = false
    
        let UsedCardsCellNib = UINib(nibName: "UsedCardsTableViewCell", bundle: nil)
        
        tableView1.register(UsedCardsCellNib, forCellReuseIdentifier: "UsedCardsTableViewCell")
        tableView1.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        tableView2.register(UsedCardsCellNib, forCellReuseIdentifier: "UsedCardsTableViewCell")
        tableView2.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
        
        tableView3.register(UsedCardsCellNib, forCellReuseIdentifier: "UsedCardsTableViewCell")
        tableView3.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
    }
    
    func addShadow(to view: UIView) {
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.5
        view.layer.shadowOffset = CGSize(width: 0, height: 2)
        view.layer.shadowRadius = 4
        view.layer.masksToBounds = false
    }
    
    func fetchDataAndPrepareData() {
        if let url = Bundle.main.url(forResource: "transactions", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                if let jsonString = String(data: data, encoding: .utf8) {
                    parseAndSortData(from: jsonString)
                    separateTransactions()
                }
            } catch {
                print("Error loading data from file: \(error)")
            }
        } else {
            print("Unable to find transactions.json in the bundle")
        }
    }
    
    func parseAndSortData(from jsonString: String) {
        if let jsonData = jsonString.data(using: .utf8) {
            if let jsonObject = try? JSONSerialization.jsonObject(with: jsonData, options: []) as? [String: [[String: Any]]] {
                for (merchant, transactionArray) in jsonObject {
                    for transaction in transactionArray {
                        var transactionWithMerchant = transaction
                        transactionWithMerchant["merchant"] = merchant
                        transactionWithMerchant["timeStamp"] = transactionWithMerchant.removeValue(forKey: "lastUpdated")
                        transactions.append(transactionWithMerchant as! [String : String])
                    }
                }
                
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
                transactions.sort(by: { firstTransaction, secondTransaction in
                    if let firstTimestamp = firstTransaction["timeStamp"],
                       let firstDate = dateFormatter.date(from: firstTimestamp),
                       let secondTimestamp = secondTransaction["timeStamp"],
                       let secondDate = dateFormatter.date(from: secondTimestamp) {
                        return firstDate > secondDate
                    } else {
                        return false
                    }
                })
            }
        }
    }
    
    func separateTransactions() {
        if transactions.count > 0 {
            lastTransaction = [transactions[0]]
            otherTransactions = Array(transactions.dropFirst())
        }
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
            case 0:
                return 1
            case 1:
                return otherTransactions.count
            default:
                return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if tableView == tableView1 {
            
            let cell = tableView1.dequeueReusableCell(withIdentifier: "UsedCardsTableViewCell", for: indexPath) as! UsedCardsTableViewCell
                
                var transaction: [String: String]
            
                if indexPath.section == 0 {
                    transaction = lastTransaction[indexPath.row]
                } else {
                    transaction = otherTransactions[indexPath.row]
                }
            
                let timeStamp = transaction["timeStamp"]!
                let (formattedDate, time) = parseTimestamp(timeStamp)

                cell.cardNumber.text = transaction["cardNumber"]
                cell.merchantUsedAt.text = transaction["merchant"]
                cell.Date.text = formattedDate
                cell.timeStampValue.text = time
            
                return cell
            
        } else if tableView == tableView2 {
            
            let cell = tableView1.dequeueReusableCell(withIdentifier: "UsedCardsTableViewCell", for: indexPath) as! UsedCardsTableViewCell
                
                var transaction: [String: String]
            
                if indexPath.section == 0 {
                    transaction = lastTransaction[indexPath.row]
                } else {
                    transaction = otherTransactions[indexPath.row]
                }
            
                let timeStamp = transaction["timeStamp"]!
                let (formattedDate, time) = parseTimestamp(timeStamp)

                cell.cardNumber.text = transaction["cardNumber"]
                cell.merchantUsedAt.text = transaction["merchant"]
                cell.Date.text = formattedDate
                cell.timeStampValue.text = time
            
                return cell
            
        } else {
            
            let cell = tableView1.dequeueReusableCell(withIdentifier: "UsedCardsTableViewCell", for: indexPath) as! UsedCardsTableViewCell
                
                var transaction: [String: String]
            
                if indexPath.section == 0 {
                    transaction = lastTransaction[indexPath.row]
                } else {
                    transaction = otherTransactions[indexPath.row]
                }
            
                let timeStamp = transaction["timeStamp"]!
                let (formattedDate, time) = parseTimestamp(timeStamp)

                cell.cardNumber.text = transaction["cardNumber"]
                cell.merchantUsedAt.text = transaction["merchant"]
                cell.Date.text = formattedDate
                cell.timeStampValue.text = time
            
                return cell
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if tableView == tableView1 {
            
            let headerView = tableView1.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
            headerView.titleLabel.text = sectionTitles[section]
            return headerView
            
        } else if tableView == tableView2 {
            
            let headerView = tableView2.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
            headerView.titleLabel.text = sectionTitles[section]
            return headerView
            
        } else {
            
            let headerView = tableView2.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
            headerView.titleLabel.text = sectionTitles[section]
            return headerView
            
        }
            
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45.0
    }
    
    func parseTimestamp(_ timeStamp: String) -> (date: String, time: String) {
        
        let components = timeStamp.split(separator: "T")
        let dateString = String(components[0])
        let time = String(components[1])

        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let date = dateFormatter.date(from: dateString)!
        dateFormatter.dateFormat = "dd MMM yyyy"
        let formattedDateString = dateFormatter.string(from: date)
        
        return (formattedDateString, time)
    }
}
