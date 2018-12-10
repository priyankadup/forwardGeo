//
//  ViewController.swift
//  knowurbasics1
//
//  Created by Student-001 on 19/11/18.
//  Copyright © 2018 ra. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import GoogleSignIn

class ViewController: UIViewController,GIDSignInDelegate,GIDSignInUIDelegate {
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            let userId = user.userID                  // For client-side use only!
            let idToken = user.authentication.idToken // Safe to send to the server
            let fullName = user.profile.name
            let givenName = user.profile.givenName
            let familyName = user.profile.familyName
            let email = user.profile.email
            // ...
        }

    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loginButton : FBSDKLoginButton = FBSDKLoginButton()
        loginButton.center = self.view.center
        loginButton.readPermissions = ["public_profile","email"]
        self.view.addSubview(loginButton)
        
        let googleSignInButton = GIDSignInButton();
        googleSignInButton.frame = CGRect(x: 0, y: 185, width: 167, height: 30)
        view.addSubview(googleSignInButton)
      //  if
        //    FBSDKAccessToken.currentAccessTokenIsActive()
//        {
//            //user is logged in,do work such as go to next view controller.
//            print("user is logged in successfully...")
//        }
//
        // Initialize sign-in
        
    
        
        GIDSignIn.sharedInstance().uiDelegate = self
         GIDSignIn.sharedInstance().delegate = self
        }
        
        func application(_ app: UIApplication, open url: URL, options: [UIApplicationOpenURLOptionsKey : Any] = [:]) -> Bool {
            return GIDSignIn.sharedInstance().handle(url as URL?,
                                                     sourceApplication: options[UIApplicationOpenURLOptionsKey.sourceApplication] as? String,
                                                     annotation: options[UIApplicationOpenURLOptionsKey.annotation])
        }
        
        // google sign-in code
        //GIDSignIn.sharedInstance().uiDelegate = self;
       // GIDSignIn.sharedInstance().Delegate = self;
        
    
   

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

