//
//  ViewController.swift
//  FbLogin
//
//  Created by Apple's on 20/04/18.
//  Copyright © 2018 Aadil. All rights reserved.
//

import UIKit
import FBSDKLoginKit

class ViewController: UIViewController, FBSDKLoginButtonDelegate {
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            self.notLogged.text = error.localizedDescription
            
        }else if result.isCancelled{
            self.notLogged.text = "USER CANCELLED LOG IN"
        } else {
            // successful Login
            
            self.notLogged.text = "LOGGED IN"
        }
        
        
    }
    
    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        self.notLogged.text = "USER LOGGED OUT"
    }
    

    @IBOutlet weak var notLogged: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnFbLogin = FBSDKLoginButton()
        btnFbLogin.readPermissions = ["email"]
        btnFbLogin.delegate = self
        btnFbLogin.center = self.view.center
        self.view.addSubview(btnFbLogin)
        
        if FBSDKAccessToken.current() != nil {
            self.notLogged.text = "LOGGED IN"
            
        } else {
            self.notLogged.text = "NOT LOGGED IN"
        }
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    

}

