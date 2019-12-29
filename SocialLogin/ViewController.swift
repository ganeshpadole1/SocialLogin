//
//  ViewController.swift
//  SocialLogin
//
//  Created by ganesh padole on 29/12/19.
//  Copyright © 2019 ganesh padole. All rights reserved.
//

import UIKit
import GoogleSignIn
//781751498270-1vjap95370dgqvbt1bf6hi1o9kng8et8.apps.googleusercontent.com

class ViewController: UIViewController, GIDSignInDelegate {

    @IBOutlet weak var signInButton: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self

        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
           if let error = error {
               if (error as NSError).code == GIDSignInErrorCode.hasNoAuthInKeychain.rawValue {
                   print("The user has not signed in before or they have since signed out.")
               } else {
                   print("\(error.localizedDescription)")
               }
               return
           }
           print(user.profile.hasImage)
           // Perform any operations on signed in user here.
           let userId = user.userID                  // For client-side use only!
           let idToken = user.authentication.idToken // Safe to send to the server
           let fullName = user.profile.name
           let givenName = user.profile.givenName
           let familyName = user.profile.familyName
           let email = user.profile.email
           
           print(userId ?? 0)
           print(idToken as Any)
           print(fullName as Any)
           print(givenName as Any)
           print(familyName as Any)
           print(email as Any)
       }

    @IBAction func signInGoogle(_ sender: UIButton) {
         GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance()?.signIn()
    }
}

