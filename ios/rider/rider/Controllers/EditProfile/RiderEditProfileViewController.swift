//
//  EditProfileViewController.swift
//  Rider
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit
import Eureka
import SPAlert
import ImageRow
import Kingfisher

class RiderEditProfileViewController: FormViewController {
    var downloading = false
    var rider: GetRiderQuery.Data.Rider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.shared.apollo.fetch(query: GetRiderQuery()) { result in
            switch(result) {
            case .success(let data):
                guard let rider = data.data?.rider else {
                    self.dismiss(animated: true)
                    return
                }
                self.form +++ Section(NSLocalizedString("Images", comment: "Profile's image section header"))
                    <<< ImageRow() {
                        $0.tag = "profile_row"
                        $0.title = NSLocalizedString("Profile Image", comment: "Profile's image field title")
                        $0.allowEditor = true
                        $0.useEditedImage = true
                        if let address = rider.media?.address {
                            let url = URL(string: Config.Backend + address.replacingOccurrences(of: " ", with: "%20"))
                            ImageDownloader.default.downloadImage(with: url!, completionHandler: { result in
                                switch result {
                                case .success(let value):
                                    self.downloading = true
                                    (self.form.rowBy(tag: "profile_row")! as! ImageRow).value = value.image
                                    (self.form.rowBy(tag: "profile_row")! as! ImageRow).reload()
                                    self.downloading = false
                                case .failure(let error):
                                    print(error)
                                }
                            })
                        }
                        $0.sourceTypes = .PhotoLibrary
                        $0.clearAction = .no
                    }.onChange {
                        if(!self.downloading) {
                            let data = $0.value?.jpegData(compressionQuality: 0.7)
                            $0.title = NSLocalizedString("Uploading, Please wait...", comment: "Uploading image state")
                            $0.disabled = true
                            $0.reload()
                            //TODO: Upload Profile picture functionality
//                            UpdateProfileImage(data: data!).execute() { result in
//                                self.form.rowBy(tag: "profile_row")!.title = NSLocalizedString("Profile Image", comment: "Profile's image field title")
//                                self.form.rowBy(tag: "profile_row")!.disabled = false
//                                self.form.rowBy(tag: "profile_row")!.reload()
//                                switch result {
//                                case .success(let response):
//                                    SPAlert.present(title: NSLocalizedString("Profile image updated", comment: ""), preset: .done)
//                                    self.rider.media = response
//                                    UserDefaultsConfig.user = try! self.rider.asDictionary()
//
//                                case .failure(let error):
//                                    error.showAlert()
//                                }
//                            }
                        }
                    }
                    .cellUpdate { cell, row in
                        cell.accessoryView?.layer.cornerRadius = 17
                        cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
                    }
                    +++ Section(NSLocalizedString("Basic Info", comment: "Profile Basic Info section header"))
                    <<< PhoneRow(){
                        $0.title = NSLocalizedString("Mobile Number", comment: "Profile Mobile Number field title")
                        $0.disabled = true
                        $0.value = rider.mobileNumber
                    }
                    <<< EmailRow(){
                        $0.title = NSLocalizedString("E-Mail", comment: "Profile Email field title")
                        $0.value = rider.email
                    }.onChange { self.rider.email = $0.value }
                    <<< TextRow(){
                        $0.title = NSLocalizedString("Name", comment: "Profile Name field")
                        $0.value = rider.firstName
                        $0.placeholder = NSLocalizedString("First Name", comment: "Profile First Name Field")
                    }.onChange { self.rider.firstName = $0.value ?? "" }
                    <<< TextRow(){
                        $0.title = " "
                        $0.placeholder = NSLocalizedString("Last Name", comment: "Profile Last Name field")
                        $0.value = rider.lastName
                    }.onChange { self.rider.lastName = $0.value ?? "" }
                    +++ Section(NSLocalizedString("Additional Info", comment: "Profile's additional Info section"))
                    <<< PushRow<Gender>() {
                        $0.title = NSLocalizedString("Gender", comment: "Profile's gender field title")
                        $0.selectorTitle = NSLocalizedString("Select Your Gender", comment: "Profile's gender field selector title")
                        $0.options = [Gender.male, Gender.female, Gender.unknown]
                        $0.value = rider.gender
                        $0.displayValueFor = {(value: Cell<Gender>.Value?) in
                            return value?.rawValue ?? ""
                        }
                    }.onChange { row in
                        self.rider.gender = row.value
                    }
                    <<< TextRow() {
                        $0.title = NSLocalizedString("E-Mail", comment: "Profile email field title")
                        $0.value = rider.email
                    }.onChange { self.rider.email = $0.value ?? "" }
                
            case .failure(let error):
                error.showAlert()
            
            }
        }
        
    }
    @IBAction func onSaveProfileClicked(_ sender: Any) {
        Network.shared.apollo.perform(mutation: UpdateProfileMutation(firstName: self.rider.firstName ?? "", lastName: self.rider.lastName ?? "", gender: self.rider.gender ?? Gender.unknown, email: self.rider.email ?? "")) { result in
            switch result {
            case .success(_):
                _ = self.navigationController?.popViewController(animated: true)
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
}
