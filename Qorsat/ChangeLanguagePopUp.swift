//
//  ChangeLanguagePopUp.swift
//  Qorsat
//
//  Created by Ahsan Mughal on 24/02/2020.
//  Copyright © 2020 Ahsan. All rights reserved.
//

import UIKit
class ChangeLanguagePopUp: UIViewController , UIGestureRecognizerDelegate {
    @IBOutlet weak var arabicButton: UIButton!
    
    @IBOutlet weak var englishButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        addGestureRecognizer()
    }
    
    private func  addGestureRecognizer() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(dismissPopUp))
        gesture.delegate = self
        self.view.addGestureRecognizer(gesture)
    }
    @objc private func dismissPopUp() {
        dismiss(animated: true, completion: nil)

    }
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        if (touch.view?.tag == 1) {
            return false
        }
        return true
    }
    
    @IBAction func englishSelected(_ sender: UIButton) {
        
       
        if sender.isSelected {
            sender.isSelected = false
            sender.setImage(UIImage(systemName: "circle"), for: .normal)
            
           

           }
           else {
            sender.isSelected = true
            sender.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
            if arabicButton.isSelected {
                arabicButton.isSelected = false
                arabicButton.setImage(UIImage(systemName: "circle"), for: .normal)

                
            }
              
           }
        
        
    }
    @IBAction func arabicSelected(_ sender: UIButton) {
      
        if sender.isSelected {
                   sender.isSelected = false
                   sender.setImage(UIImage(systemName: "circle"), for: .normal)
                   
                  

                  }
                  else {
                   sender.isSelected = true
                   sender.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
                   if englishButton.isSelected {
                       englishButton.isSelected = false
                       englishButton.setImage(UIImage(systemName: "circle"), for: .normal)

                       
                   }
                     
                  }
               
        
    }
    @IBAction func OkButtonPressed(_ sender: Any) {
        
        
        dismiss(animated: true, completion: nil)
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
