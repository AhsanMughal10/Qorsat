//
//  ApplyViewController.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 17/02/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class ApplyViewController: UIViewController {

    
    @IBOutlet weak var countryTableView: UITableView!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var searchBar: UISearchBar!
   
    var imagesArray = [ UIImage(named: "S1") , UIImage(named: "S2") , UIImage(named: "S3") ,
    UIImage(named: "S4"), UIImage(named: "S5"), UIImage(named: "S6"), UIImage(named: "S7")]
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundImage = UIImage()
        
        countryTableView.delegate = self
        countryTableView.dataSource = self
       countryTableView.rowHeight = UITableView.automaticDimension
        

    countryTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0);
        if #available(iOS 11.0, *) {
            countryTableView.contentInsetAdjustmentBehavior = .never
        } else {
            automaticallyAdjustsScrollViewInsets = false
        }
    
        countryTableView.layer.cornerRadius = 12.0
        countryTableView.layer.masksToBounds = true
        countryTableView.isEditing = false
        
        
        addTapGesturerRecognizer()
      
    }
    
    func addTapGesturerRecognizer() {
           let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
           tapGesture.numberOfTapsRequired = 1
           tapGesture.isEnabled = true
           tapGesture.cancelsTouchesInView = false
           self.view.addGestureRecognizer(tapGesture)
           
       }
       @objc func dismissKeyboard() {
           searchBar.resignFirstResponder()
       }
    
    @IBAction func menuButtonPressed(_ sender: UIButton) {
    }
}
extension ApplyViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
          print("Button Clicked")
          self.searchBar.endEditing(true)
      }
      func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
    
          searchBar.becomeFirstResponder()
          print("Begin Editing")
      }
      func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
          print("Text :: " , searchText)
      }
      
    
}
extension ApplyViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return imagesArray.count
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
           return 15
       }

       // Make the background color show through
       func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "countrycell", for: indexPath) as? ApplySectionCell {
            cell.imageView?.image = imagesArray[indexPath.section]
        //    cell.imageView?.autoresizingMask = [.flexibleWidth , .flexibleHeight]
            cell.layoutMargins = UIEdgeInsets.zero
            cell.contentView.clipsToBounds = true


         cell.imageView?.contentMode = .scaleAspectFill
            cell.layer.borderColor = UIColor.black.cgColor
                      cell.layer.borderWidth = 1
                      cell.layer.cornerRadius = 8
                      cell.clipsToBounds = true
            return cell
        }
        return UITableViewCell()
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        let currentImage = imagesArray[indexPath.row]
//        guard let imageCrop = currentImage?.getCropRatio() else { return 1.77 }
//        return tableView.frame.width / imageCrop
//
//    }
    
    
}
extension UIImage {
    func getCropRatio()->CGFloat{
        let widthRatio = CGFloat(self.size.width/self.size.height)
        return widthRatio
    }
}
