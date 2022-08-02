//
//  CreateCompanyVC.swift
//  IntermediateCDTraining
//
//  Created by iMac on 8/2/22.
//

import UIKit

class CreateCompanyVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkBlue
        
        navigationItem.title = "Create Company"
        
        let config = UIImage.SymbolConfiguration(pointSize: 30, weight: .light, scale: .large)
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.left.square.fill", withConfiguration: config), style: .plain, target: self, action: #selector(backToCompanies))
        
        navigationItem.leftBarButtonItem?.tintColor = .white
        
        setupNavigationStyle()
    }
    
    @objc func backToCompanies() {
        dismiss(animated: true, completion: nil)
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
