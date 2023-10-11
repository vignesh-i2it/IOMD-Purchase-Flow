//
//  CardUsageViewController.swift
//  IOMD Purchase Flow
//
//  Created by Vignesh on 06/10/23.
//

import UIKit

class UsedCardsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var headingView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    let sectionTitles = ["Last Transaction", "Others"]
    var transactions: [[String: String]] = []
    var lastTransaction: [[String: String]] = []
    var otherTransactions: [[String: String]] = []
        
    //sample transactions
//    let transactions = [
//        ["merchant": "curativelifestyle", "cardNumber": "4111 1111 1111 1111", "cardId": "123", "timeStamp": "2023-10-06T12:22:12"],
//        ["merchant": "coravin", "cardId": "123", "cardNumber": "4111 1111 1111 1111", "timeStamp": "2023-10-04T14:22:12"],
//        ["cardId": "789", "cardNumber": "4111 1111 1111 3333", "merchant": "curativelifestyle", "timeStamp": "2023-09-09T20:22:12"],
//        ["timeStamp": "2023-08-05T19:22:12", "cardId": "456", "merchant": "coravin", "cardNumber": "4111 1111 1111 2222"]
//    ]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setupUI()
        fetchDataAndPrepareData()
    }
    
    func setupUI() {
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 30, left: 0, bottom: 0, right: 0)
        headingView.layer.cornerRadius = headingView.frame.size.height / 2
        headingView.layer.masksToBounds = false
        headingView.backgroundColor = UIColor(hex: "#8877F2")
        
        headingView.layer.shadowColor = UIColor.black.cgColor
        headingView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        headingView.layer.shadowOpacity = 0.5
        headingView.layer.shadowRadius = 4.0
        headingView.layer.masksToBounds = false
        
        tableView.layer.cornerRadius = 25
        tableView.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        tableView.clipsToBounds = true
        tableView.layer.masksToBounds = true
        
        shadowView.layer.cornerRadius = 25
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 2.0)
        shadowView.layer.shadowOpacity = 0.5
        shadowView.layer.shadowRadius = 4.0
        shadowView.layer.masksToBounds = false
    
        let UsedCardsCellNib = UINib(nibName: "UsedCardsTableViewCell", bundle: nil)
        tableView.register(UsedCardsCellNib, forCellReuseIdentifier: "UsedCardsTableViewCell")
        
        tableView.register(CustomHeaderView.self, forHeaderFooterViewReuseIdentifier: "CustomHeaderView")
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "UsedCardsTableViewCell", for: indexPath) as! UsedCardsTableViewCell
            
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
            
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "CustomHeaderView") as! CustomHeaderView
        headerView.titleLabel.text = sectionTitles[section]
        return headerView
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
