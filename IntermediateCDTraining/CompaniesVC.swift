//
//  ViewController.swift
//  IntermediateCDTraining
//
//  Created by iMac on 8/1/22.
//

import UIKit
import CoreData

class CompaniesVC: UITableViewController, CreateCompanyVCDelegate {

    func didAddCompany(company: Company) {
        companies.append(company)
        
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    
    var companies = [Company]()
    
    /*
    var companies = [
        Company(name: "Google", founded: Date()),
        Company(name: "Apple", founded: Date()),
        Company(name: "Facebook", founded: Date())
    ]
    */
    /*
    func addCompany(company name: String) {
        companies.append(Company(name: name, founded: Date()))
        
        let newIndexPath = IndexPath(row: companies.count - 1, section: 0)
        tableView.insertRows(at: [newIndexPath], with: .automatic)
    }
    */
    
    private func fetchCompanies() {
        let context = CoreDataManager.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Company")
        
        do {
            let companies = try context.fetch(fetchRequest)
            
            companies.forEach({ (company) in
                print((company as! Company).name!)
            })
            
            self.companies = companies as! [Company]
            self.tableView.reloadData()
            
        } catch let fetchErr {
            print("Failed to fetch companies: ", fetchErr)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchCompanies()
        
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
        tableView.backgroundColor = .darkBlue
        //tableView.separatorStyle = .none
        tableView.separatorColor = .white
        tableView.tableFooterView = UIView()
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "plus.app.fill", withConfiguration: config), style: .plain, target: self, action: #selector(handleAddCompany))
        
        /*  BUTTON DOESN'T APPEAR
        let addButton = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        addButton.setBackgroundImage(UIImage(systemName: "plus.app.fill", withConfiguration: config), for: .normal)
        addButton.addTarget(self, action: #selector(handleAddCompany), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        */
 
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        setupNavigationStyle()
    }
    
    @objc func handleAddCompany() {
        
        let createCompanyVC = CreateCompanyVC()
        let createCompanyNC = UINavigationController(rootViewController: createCompanyVC)
        createCompanyNC.modalPresentationStyle = .fullScreen
        
        //createCompanyVC.companiesVC = self
        createCompanyVC.delegate = self
        
        present(createCompanyNC, animated: true, completion: nil)
        
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView()
        view.backgroundColor = .lightBlue
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
        
        cell.backgroundColor = .tealColor
        
        let company = companies[indexPath.row]
        
        let format = DateFormatter()
        format.dateFormat = "MMM dd, yyyy"
        
        cell.textLabel?.text = company.name!// + " - " + format.string(from: company.founded)
        //cell.textLabel?.text = "COMPANY NAME - FOUNDED DATE"
        cell.textLabel?.textColor = .white
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setStatusBar(backgroundColor: .lightRed)
    }
    
    func setupNavigationStyle() {
        //navigationController?.navigationBar.barStyle = .default
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .lightRed
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        navigationController?.navigationBar.isTranslucent = false
        
        navigationController?.navigationBar.backgroundColor = .lightRed
        navigationController?.navigationBar.tintColor = .lightRed
        
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    /*
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    */

}

