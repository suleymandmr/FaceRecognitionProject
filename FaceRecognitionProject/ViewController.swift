//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by eyüp yaşar demir on 24.05.2023.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func singInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        var error: NSError?
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error){
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "it is you") { success, error in
                if success ==  true {
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                    
                }else{
                    DispatchQueue.main.async {
                    self.myLabel.text = "Error!"
                    }
                }
                
            }
            
        }
    }
}

