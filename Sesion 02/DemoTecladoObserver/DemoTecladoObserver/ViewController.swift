//
//  ViewController.swift
//  DemoTecladoObserver
//
//  Created by user178680 on 9/7/20.
//  Copyright © 2020 Jack Rackham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBAction func clickBtnHideKeyboard(_ sender: Any) {
        self.view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector:  #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(_ notification: Notification){
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        	
        print("El frame del teclado es: \(keyboardFrame)")
        print("El tiempo de animacion es: \(animationDuration)")
    }
    
    @objc func keyboardWillHide(_ notification: Notification){
        print("EL TECLADO SE VA!!")
    }

}

