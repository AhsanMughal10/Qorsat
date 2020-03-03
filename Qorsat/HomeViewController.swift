//
//  HomeViewController.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 17/02/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UISearchBarDelegate {
    
    @IBOutlet weak var stackViewHeightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var applyButton: UIButton!
    @IBOutlet weak var menuStackView: UIStackView!
    
    @IBOutlet weak var aboutButton: UIButton!
    
    @IBOutlet weak var separator1: UIView!
    
    @IBOutlet weak var contactButton: UIButton!
    
    @IBOutlet weak var separator2: UIView!
    
    @IBOutlet weak var changeButton: UIButton!
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.layer.masksToBounds = true
        searchBar.barTintColor = UIColor.clear
        searchBar.backgroundImage = UIImage()
        searchBar.delegate = self
            
        applyButton.cornerCalculation(r: 1)
        applyButton.layer.masksToBounds = true
        applyButton.titleLabel?.adjustsFontSizeToFitWidth = true

        menuStackView.customize(backgroundColor: .white, radiusSize: 12.0)
        addTapGesturerRecognizer()
        setDeviceBasedBackgroundImage()
      
    }
    private func setDeviceBasedBackgroundImage() {
        
    }
  
    @IBAction func aboutButtonPressed(_ sender: Any) {
    }
    
    @IBAction func contactButtonPressed(_ sender: Any) {
    }
    @IBAction func changeLanguageButtonPressed(_ sender: Any) {
        
        if let popoverContent = self.storyboard?.instantiateViewController(withIdentifier: "settingsPopUp") as? ChangeLanguagePopUp
        {

            popoverContent.modalPresentationStyle = .overCurrentContext
            popoverContent.modalTransitionStyle = .coverVertical
            self.present(popoverContent, animated: true, completion: nil)

        }
      
       


        
    }
    @IBAction func menuButtonPressed(_ sender: Any) {
        

       
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 1.0, options: .curveEaseOut, animations: {


 
            self.aboutButton.isHidden = !self.aboutButton.isHidden
            self.aboutButton.alpha = self.aboutButton.isHidden ? 0 : 1

            self.separator1.isHidden = !self.separator1.isHidden
            self.separator1.alpha = self.separator1.isHidden ? 0 : 1

            self.contactButton.isHidden = !self.contactButton.isHidden
            self.contactButton.alpha = self.contactButton.isHidden ? 0 : 1

            self.separator2.isHidden = !self.separator2.isHidden
            self.separator2.alpha = self.separator2.isHidden ? 0 : 1

            self.changeButton.isHidden = !self.changeButton.isHidden
            self.changeButton.alpha = self.changeButton.isHidden ? 0 : 1
            
            self.menuStackView.alpha = self.changeButton.isHidden ? 0 : 1



        }, completion: nil)

        
        
    }
    @IBAction func applyButtonPressed(_ sender: Any) {
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
extension UIView{
    func cornerCalculation(r: CGFloat) {
        self.layer.cornerRadius = self.frame.height/2 * r
    }

  

    func hideAnimated(in stackView: UIStackView) {
        if !self.isHidden {
            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    self.isHidden = true
                    stackView.layoutIfNeeded()
                },
                completion: nil
            )
        }
    }

    func showAnimated(in stackView: UIStackView) {
        if self.isHidden {
            UIView.animate(
                withDuration: 0.35,
                delay: 0,
                usingSpringWithDamping: 0.9,
                initialSpringVelocity: 1,
                options: [],
                animations: {
                    self.isHidden = false
                    stackView.layoutIfNeeded()
                },
                completion: nil
            )
        }
    }
    
}
extension UIStackView {

    func addBackground(color: UIColor) {
        let subview = UIView(frame: bounds)
        subview.backgroundColor = color
        subview.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        insertSubview(subview, at: 0)
    }
    
    
        func customize(backgroundColor: UIColor = .clear, radiusSize: CGFloat = 0) {
            let subView = UIView(frame: bounds)
            subView.backgroundColor = backgroundColor
            subView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            insertSubview(subView, at: 0)

            subView.layer.cornerRadius = radiusSize
            subView.layer.masksToBounds = true
            subView.clipsToBounds = true
        }
    

}
