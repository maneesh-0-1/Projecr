//
//  SplashViewController.swift
//  Driver
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit
import SPAlert
import Firebase
import FirebasePhoneAuthUI
import FirebaseMessaging

class SplashViewController: UIViewController {
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    @IBOutlet weak var textLoading: UILabel!
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let token = UserDefaultsConfig.jwtToken {
            connectSocket(token: token)
        } else {
            self.loginState()
        }
    }
    
    func loginState() {
        indicatorLoading.isHidden = true
        textLoading.isHidden = true
        buttonLogin.isHidden = false
        buttonLogin.isEnabled = true
    }
    
    func loadingState() {
        indicatorLoading.isHidden = false
        textLoading.isHidden = false
        buttonLogin.isHidden = true
        buttonLogin.isEnabled = false
    }
    
    func connectSocket(token:String) {
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            switch result {
            case .success(let response):
                guard let user = response.data?.driver else {
                    return
                }
                switch user.status {
                case .online, .offline, .inService:
                    NotificationCenter.default.removeObserver(self)
                    self.performSegue(withIdentifier: "segueShowHost", sender: nil)
                    
                case .blocked, .hardReject:
                    let alert = UIAlertController(title: "Error", message: "Your access to the application has been denied by the administrator.", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Allright!", style: .default) { action in
                        alert.dismiss(animated: true, completion: nil)
                    })
                    self.present(alert, animated: true)
                    
                default:
                    self.showRegisterForm()
                }
                
            case .failure(_):
                self.loginState()
                
            }
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
        self.loadingState()
        Network.shared.apollo.perform(mutation: LoginMutation(firebaseToken: firebaseToken)) { result in
            switch result {
            case .success(let response):
                guard let token = response.data?.login.jwtToken else {
                    return
                }
                UserDefaultsConfig.jwtToken = token
                self.connectSocket(token: token)
                
                break
                
            case .failure(let error):
                self.loginState()
                error.showAlert()
            }
        }
    }
    
    func showRegisterForm() {
        self.buttonLogin.isHidden = true
        self.textLoading.isHidden = true
        self.indicatorLoading.isHidden = true
        self.performSegue(withIdentifier: "showRegister", sender: nil)
    }
}

extension SplashViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        if user == nil {
            return
        }
        user?.getIDTokenForcingRefresh(true) { idToken, error in
            if let error = error {
                print(error)
                return;
            }
            
            self.tryLogin(firebaseToken: idToken!)
        }
    }
}
