//
//  CreateCompanyVC.swift
//  IntermediateCDTraining
//
//  Created by iMac on 8/2/22.
//

import UIKit
import CoreData

// Custom Delegation

protocol CreateCompanyVCDelegate {
    func didAddCompany(company: Company)
}

class CreateCompanyVC: UIViewController {
    
    var delegate: CreateCompanyVCDelegate?
    
    //var companiesVC: CompaniesVC?
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Name:"
        label.textColor = .black
        //label.backgroundColor = .red
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let nameTextField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Enter Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
        textField.textColor = .black
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        view.backgroundColor = .darkBlue
        
        navigationItem.title = "Create Company"
        
        let configLeft = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left.square.fill", withConfiguration: configLeft), style: .plain, target: self, action: #selector(backToCompanies))
        
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        let configRight = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "checkmark.square.fill", withConfiguration: configRight), style: .plain, target: self, action: #selector(saveCompany))
        
        navigationItem.rightBarButtonItem?.tintColor = .white
        
        setupNavigationStyle()
    }
    
    @objc private func backToCompanies() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func saveCompany() {
        guard let companyName = self.nameTextField.text else { return }
        
        if companyName.count >= 3 {
            let context = CoreDataManager.shared.persistentContainer.viewContext
            
            let company = NSEntityDescription.insertNewObject(forEntityName: "Company", into: context)
            
            company.setValue(companyName, forKey: "name")
            
            do {
                try context.save()
                
                self.dismiss(animated: true) {
                    self.delegate?.didAddCompany(company: company as! Company)
                }
                
            } catch let saveErr {
                print("Failed to save company: ", saveErr)
            }
        }
    }
    
    private func setupUI() {
        let lightBlueBackgroundView = UIView()
        lightBlueBackgroundView.backgroundColor = UIColor.lightBlue
        lightBlueBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lightBlueBackgroundView)
        
        NSLayoutConstraint.activate([
            lightBlueBackgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            lightBlueBackgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            lightBlueBackgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),
            lightBlueBackgroundView.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.topAnchor),
            nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            //nameLabel.rightAnchor.constraint(equalTo: view.rightAnchor),
            nameLabel.widthAnchor.constraint(equalToConstant: 100),
            nameLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        view.addSubview(nameTextField)
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            nameTextField.leftAnchor.constraint(equalTo: nameLabel.rightAnchor),
            nameTextField.rightAnchor.constraint(equalTo: view.rightAnchor),
            nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor)
        ])
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
    
}
