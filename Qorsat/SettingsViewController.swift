//
//  SettingsViewController.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 17/02/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingTableViewHeight: NSLayoutConstraint!
    @IBOutlet weak var settingTableView: UITableView!
    var dataSource = ["Language" , "Contact us" , "About us" , "Report a bug"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        settingTableView.delegate = self
        settingTableView.dataSource = self
        settingTableView.isScrollEnabled = false
     
        
      let img = UIImage(named: "searchschoolAsset 264")
      navigationController?.navigationBar.setBackgroundImage(img, for: .default)
        
        
        
        let long = UIButton()



        long.setImage( UIImage(named: "backbutton"), for: .normal)
        long.tintColor = .white
        long.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
             let left = UIBarButtonItem(customView: long)
             self.navigationItem.leftBarButtonItem = left
        
       let longTitleLabel = UILabel()
        longTitleLabel.text = "Settings"
        longTitleLabel.font = UIFont(name: "Futura", size: 20)
        longTitleLabel.textColor = .white
        longTitleLabel.sizeToFit()

        let leftItem = UIBarButtonItem(customView: longTitleLabel)
        //self.navigationItem.leftBarButtonItem = leftItem

        self.navigationItem.leftBarButtonItems = [left,leftItem]
    }
      
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        settingTableViewHeight.constant = settingTableView.contentSize.height + 20

    }
    @objc func backButtonPressed() {

     
            self.tabBarController?.selectedIndex = 1
            

        
             
                  }

}
extension SettingsViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath) as? SettingsCell {
            cell.textLabel?.text = dataSource[indexPath.row]
            if indexPath.row == 0 {
                cell.languageLabel.isHidden = false
            }
                   return cell
        }
       return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "GENERAL SETTING"
    }
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.contentView.backgroundColor = self.view.backgroundColor
            headerView.backgroundView?.backgroundColor = self.view.backgroundColor
            headerView.textLabel?.textColor = .darkGray
            
        }
    }
    
}
