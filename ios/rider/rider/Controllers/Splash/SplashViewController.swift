//
//  SplashViewController.swift
//  Rider
//
//  Copyright © 2018 Minimalistic Apps. All rights reserved.
//

import UIKit
import Firebase
import SPAlert
import FirebaseMessaging
import FirebasePhoneAuthUI

class SplashViewController: UIViewController {
    let defaults:UserDefaults = UserDefaults.standard
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var textLoading: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        
    }
    
    func connectSocket() {
        Messaging.messaging().token() { (fcmToken, error) in
            if let error = error {
                print("Error fetching remote instance ID: \(error)")
                return
            }
            self.performSegue(withIdentifier: "segueShowHost", sender: nil)
        }
    }
    
    @IBAction func onLoginClicked(_ sender: UIButton) {
        let auth = FUIAuth.defaultAuthUI()
        auth?.delegate = self
        FUIAuth.defaultAuthUI()?.delegate = self
        let phoneProvider = FUIPhoneAuth.init(authUI: FUIAuth.defaultAuthUI()!)
        FUIAuth.defaultAuthUI()?.providers = [phoneProvider]
        phoneProvider.signIn(withPresenting: self, phoneNumber: nil)
    }
    
    func tryLogin(firebaseToken: String) {
        Network.shared.apollo.perform(mutation: LoginMutation(firebaseToken: firebaseToken)) { result in
            switch result {
            case .success(let response):
                UserDefaultsConfig.jwtToken = response.data?.login.jwtToken
                self.connectSocket()
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaultsConfig.jwtToken != nil {
            connectSocket()
        } else {
            indicatorLoading.isHidden = true
            textLoading.isHidden = true
            buttonLogin.isHidden = false
        }
    }
}
extension SplashViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if(user == nil) {
            return
        }
        indicatorLoading.isHidden = false
        textLoading.isHidden = false
        buttonLogin.isHidden = true
        user?.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                print(error)
                return;
            }
            
            self.tryLogin(firebaseToken: idToken!)
        }
    }
}
