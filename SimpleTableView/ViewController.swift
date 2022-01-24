//
//  ViewController.swift
//  SimpleTableView
//
//  Created by Santhosh on 17/01/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myTable: UITableView!
    var dataArray: [DataModel]?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.myTable.delegate = self
        self.myTable.dataSource = self
        dataArray = [DataModel]()
        
        for index in 1...20 {
            let dataModel = DataModel()
            if index % 2 == 0 {
                dataModel.text = "Number \(index)"
                dataModel.type = .plainText
                dataArray?.append(dataModel)
            } else {
                dataModel.text = "Number \(index)"
                dataModel.image = "mario_PNG125"
                dataModel.type = .image
                dataArray?.append(dataModel)
            }
        }
        
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return dataArray?.count ?? 0
        default:
            return 1
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            switch dataArray?[indexPath.row].type {
            case .plainText:
                let cell = tableView.dequeueReusableCell(withIdentifier: "MyTableViewCellIdentifier", for: indexPath)
                if let cellIs = cell as? MyTableViewCell {
                    cellIs.setData(data: dataArray?[indexPath.row])
                }
                return cell
            default:
                let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCellIdentifier", for: indexPath)
                if let cellIs = cell as? ImageTableViewCell {
                    cellIs.setData(data: dataArray?[indexPath.row])
                }
                return cell
            }
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ImageTableViewCellIdentifier", for: indexPath)
            if let cellIs = cell as? ImageTableViewCell {
                cellIs.setData(data: dataArray?[indexPath.row])
            }
            return cell
        }
 
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            return "Student Data"
        default:
            return "Teachers Data"
        }
        
        
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .gray
        
        let headerLabel = UILabel(frame: CGRect(x: 20, y: 0, width: 200, height: 40))
        headerLabel.text = "Header \(section)"
        view.addSubview(headerLabel)
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         print(indexPath)
        print(dataArray?[indexPath.row].text ?? "")
        switch indexPath.section {
        case 0:
            print("")
            switch indexPath.row {
            case 0:
                print("")
            default:
                print("")
            }
        default:
            print("")
        }
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if indexPath.row % 2 == 0 {
            return true
        }
       return false
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let edit = UIContextualAction(style: .normal, title: "Edit", handler: { (ac: UIContextualAction, view: UIView, success: @escaping (Bool) -> Void) in
            print("Edit clicked for Section: \(indexPath.section) Row: \(indexPath.row)")
        })
        edit.backgroundColor = .green
        let add = UIContextualAction(style: .normal, title: "Add", handler: { (ac: UIContextualAction, view: UIView, success: @escaping (Bool) -> Void) in
            print("Add clicked for Section: \(indexPath.section) Row: \(indexPath.row)")
        })
        add.backgroundColor = .blue
        
        let archive = UIContextualAction(style: .normal, title: "Archive", handler: { (ac: UIContextualAction, view: UIView, success: @escaping (Bool) -> Void) in
            print("Archive clicked for Section: \(indexPath.section) Row: \(indexPath.row)")
        })
        archive.backgroundColor = .red
        
        let config = UISwipeActionsConfiguration(actions: [edit, add, archive])
        return config
    }
    
    
    
}

