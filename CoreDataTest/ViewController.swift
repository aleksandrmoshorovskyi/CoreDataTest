//
//  ViewController.swift
//  CoreDataTest
//
//  Created by Aleksandr Moroshovskyi on 04.05.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        textField.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myTableViewCell")
        else {
            assertionFailure()
            return UITableViewCell()
        }
        
        cell.textLabel?.text = dataSource[indexPath.row].name
        cell.detailTextLabel?.text = dataSource[indexPath.row].image?.description
        
        return cell
    }
    

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var imageText: UITextField!
    
    @IBAction func addButtonAction(_ sender: UIButton) {
        
        guard let url = URL(string: imageText.text ?? "") else { return }
        
        //CoreDataService().insertMyAppData(name: nameText.text ?? "", image: url)
        storeData(name: nameText.text ?? "", image: url)
        
        dataSource = fetchAllData()
        tableView.reloadData()
    }
    
    @IBAction func deleteAllBtnAction(_ sender: UIButton) {
        
        deleteAllData()
        
        dataSource = fetchAllData()
        tableView.reloadData()
    }
    
    var dataSource: [MyAppData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameText.delegate = self
        imageText.delegate = self
        
        tableView.dataSource = self
        tableView.delegate = self
        
        dataSource = fetchAllData()
    }
}

// MARK: - CoreData
extension ViewController {
    
    func storeData(name: String, image: URL) {
        
        let coreDataService = CoreDataService.shared
        coreDataService.insertMyAppData(name: name, image: image)
    }
    
    func fetchAllData() -> [MyAppData] {
        
        let coreDataService = CoreDataService.shared
        return coreDataService.fetchAllInfo()
    }
    
    func deleteAllData() {
        
        let coreDataService = CoreDataService.shared
        coreDataService.deleteAllInfo()
    }
}
