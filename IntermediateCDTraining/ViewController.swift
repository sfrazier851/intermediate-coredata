//
//  ViewController.swift
//  IntermediateCDTraining
//
//  Created by iMac on 8/1/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationItem.title = "Companies"
        
        
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        self.navigationController?.setStatusBar(backgroundColor: lightRed)
    }
    
    func setupNavigationStyle() {
        //navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.isTranslucent = false
        
        let lightRed = UIColor(red: 247/255, green: 66/255, blue: 82/255, alpha: 1)
        
        navigationController?.navigationBar.backgroundColor = lightRed
        navigationController?.navigationBar.tintColor = lightRed
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    }

    /*
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    */

}

