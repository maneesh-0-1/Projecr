import UIKit
import Eureka
import ImageRow
import Kingfisher

class EditProfileViewController: FormViewController {
    var driver: GetDriverQuery.Data.Driver!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Network.shared.apollo.fetch(query: GetDriverQuery()) { result in
            switch result {
            case .success(let data):
                guard let driver = data.data?.driver else {
                    self.dismiss(animated: true, completion: nil)
                    return
                }
                self.driver = driver
                self.form
                +++ Section(NSLocalizedString("Status", comment: ""))
                <<< LabelRow() {
                    $0.title = NSLocalizedString("Status", comment: "")
                    $0.disabled = true
                    $0.value = driver.status.rawValue
                }
                <<< LabelRow() {
                    $0.title = NSLocalizedString("Note", comment: "")
                    $0.disabled = true
                    $0.value = driver.softRejectionNote
                }
                +++ Section(NSLocalizedString("Images", comment: "Profile's image section header"))
                <<< ImageRow() {
                    $0.tag = "profile_row"
                    $0.title = NSLocalizedString("Profile Image", comment: "Profile's image field title")
                    $0.clearAction = .no
                    if let address = driver.media?.address {
                        let url = URL(string: Config.Backend + address.replacingOccurrences(of: " ", with: "%20"))
                        ImageDownloader.default.downloadImage(with: url!, completionHandler:  { result in
                            switch result {
                            case .success(let value):
                                (self.form.rowBy(tag: "profile_row")! as! ImageRow).value = value.image
                                (self.form.rowBy(tag: "profile_row")! as! ImageRow).reload()
                            case .failure(let error):
                                print(error)
                            }
                        })
                    }
                }
                .cellUpdate { cell, row in
                    cell.accessoryView?.layer.cornerRadius = 17
                    cell.accessoryView?.frame = CGRect(x: 0, y: 0, width: 34, height: 34)
                }.onChange { self.uploadMedia(document: false, dataImage: ($0.value?.jpegData(compressionQuality: 1))!) { media in
                    
                } }
                +++ Section(NSLocalizedString("Personal Info", comment: "Profile Personal Info section header"))
                <<< PhoneRow() {
                    $0.title = NSLocalizedString("Mobile Number", comment: "Profile Mobile Number field title")
                    $0.disabled = true
                    $0.value = driver.mobileNumber
                }
                <<< EmailRow() {
                    $0.title = NSLocalizedString("E-Mail", comment: "Profile Email field title")
                    $0.value = driver.email
                }.onChange { self.driver.email = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Name", comment: "Profile Name field")
                    $0.value = driver.firstName
                    $0.placeholder = NSLocalizedString("First Name", comment: "Profile First Name Field")
                }.onChange { self.driver.firstName = $0.value }
                <<< TextRow() {
                    $0.title = " "
                    $0.placeholder = NSLocalizedString("Last Name", comment: "Profile Last Name field")
                    $0.value = driver.lastName
                }.onChange { self.driver.lastName = $0.value }
                <<< PushRow<Gender>() {
                    $0.title = NSLocalizedString("Gender", comment: "Profile's gender field title")
                    $0.selectorTitle = NSLocalizedString("Select Your Gender", comment: "Profile's gender field selector title")
                    $0.options = [Gender.male, Gender.female, Gender.unknown]
                    $0.value = driver.gender
                    $0.displayValueFor = {(value: Cell<Gender>.Value?) in
                        return value?.rawValue ?? ""
                    }
                }.onChange { self.driver.gender = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Certificate Number", comment: "Profile Certificate Number field title")
                    $0.value = driver.certificateNumber
                }.onChange() { self.driver.certificateNumber = $0.value }
                <<< PushRow<GetDriverQuery.Data.CarColor>() {
                    $0.title = NSLocalizedString("Car Color", comment: "Profile Car color field title")
                    $0.selectorTitle = NSLocalizedString("Select Car color", comment: "Profile's Car color field selector title")
                    $0.options = data.data!.carColors
                    $0.value = data.data!.carColors.first(where: {color in color.id == driver.carColorId})
                    $0.displayValueFor = {(value: Cell<GetDriverQuery.Data.CarColor>.Value?) in
                        return value?.name
                    }
                }.onChange { self.driver.carColorId = $0.value!.id }
                <<< PushRow<GetDriverQuery.Data.CarModel>() {
                    $0.title = NSLocalizedString("Car Model", comment: "Profile Car model field title")
                    $0.selectorTitle = NSLocalizedString("Select Car model", comment: "Profile's Car model field selector title")
                    $0.options = data.data!.carModels
                    $0.value = data.data!.carModels.first(where: {color in color.id == driver.carModelId})
                    $0.displayValueFor = {(value: Cell<GetDriverQuery.Data.CarModel>.Value?) in
                        return value?.name
                    }
                }.onChange { self.driver.carModelId = $0.value!.id }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Car Plate", comment: "Profile Car plate field title")
                    $0.value = driver.carPlate
                }.onChange() { self.driver.carPlate = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Bank Name", comment: "Profile Bank name")
                    $0.value = driver.bankName
                }.onChange() { self.driver.bankName = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Bank Account Number or IBAN (if applicable)", comment: "Profile Bank account field title")
                    $0.value = driver.accountNumber
                }.onChange() { self.driver.accountNumber = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Bank Routing Number", comment: "Profile Bank Routing Number field title")
                    $0.value = driver.bankRoutingNumber
                }.onChange() { self.driver.bankRoutingNumber = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Bank SWIFT or BIC code (if applicable)", comment: "Profile Swift field title")
                    $0.value = driver.bankSwift
                }.onChange() { self.driver.bankSwift = $0.value }
                <<< TextRow() {
                    $0.title = NSLocalizedString("Your Address", comment: "Profile Address field title")
                    $0.value = driver.address
                }.onChange { self.driver.address = $0.value }
                
                +++ Section(header: NSLocalizedString("Services", comment: "Profile's Services Info section"), footer: NSLocalizedString("You can select services you can provide. Provider might change those and select other services for you accordingly.", comment: "Profile's Services Footer"))
                +++ Section(header: NSLocalizedString("Documents", comment: "Profile's Documents Info section"), footer: NSLocalizedString("After approval all your documents will be removed.", comment: "Profile's Documents Footer"))
                <<< ImageRow() {
                    $0.title = "ID"
                }.onChange { self.uploadMedia(document: true, dataImage: ($0.value?.jpegData(compressionQuality: 1))!) { document in
                    self.driver.documents.append(document)
                } }
                <<< ImageRow() {
                    $0.title = "Driver License"
                }.onChange { self.uploadMedia(document: true, dataImage: ($0.value?.jpegData(compressionQuality: 1))!) { document in
                    self.driver.documents.append(document)
                } }
                <<< ImageRow() {
                    $0.title = "Picture of Vehicle"
                }.onChange { self.uploadMedia(document: true, dataImage: ($0.value?.jpegData(compressionQuality: 1))!) { document in
                    self.driver.documents.append(document)
                } }
            case .failure(let error):
                error.showAlert()
            }
        }
        
    }
    
    @IBAction func onSaveButtonClicked(_ sender: UIBarButtonItem) {
        Network.shared.apollo.perform(
            mutation: UpdateProfileMutation(
                input: UpdateDriverInput(
                    carProductionYear: Optional(self.driver.carProductionYear),
                    carModelId: Optional(self.driver.carModelId),
                    carColorId: Optional(self.driver.carColorId),
                    firstName: Optional(self.driver.firstName),
                    lastName: Optional(driver.lastName),
                    status: .pendingApproval,
                    certificateNumber: Optional(self.driver.certificateNumber),
                    email: Optional(self.driver.email),
                    carPlate: Optional(self.driver.carPlate),
                    mediaId: self.driver.media?.id != nil ? Optional(Double(self.driver.media!.id)) : .none,
                    gender: Optional(self.driver.gender),
                    accountNumber: Optional(self.driver.accountNumber),
                    bankName: Optional(self.driver.bankName),
                    bankRoutingNumber: Optional(self.driver.bankRoutingNumber),
                    bankSwift: Optional(self.driver.bankSwift),
                    address: Optional(self.driver.address),
                    documents: Optional(self.driver.documents.map{ document in document.id}),
                    notificationPlayerId: .none)
            )
        ) { result in
            switch result {
            case .success(_):
                let title = NSLocalizedString("Message", comment: "")
                let message = NSLocalizedString("Registration was done successfully. You can exit the app now and check back later to see your approval status.", comment: "Registration successful")
                let dialog = UIAlertController(title: title, message: message, preferredStyle: .alert)
                dialog.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Message OK button"), style: .default))
                self.present(dialog, animated: true, completion: nil)
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    func uploadMedia(document: Bool, dataImage: Data, completionHandler: @escaping ((_ document: GetDriverQuery.Data.Driver.Document) -> Void)) {
        let url = document ? URL(string: "\(Config.Backend)upload_document")! : URL(string: "\(Config.Backend)upload_profile")!
        var request = URLRequest(url: url)
        request.setValue("Bearer \(UserDefaultsConfig.jwtToken ?? "")", forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        let boundary:String = "Boundary-\(UUID().uuidString)"
        request.timeoutInterval = 60
        request.allHTTPHeaderFields = ["Content-Type": "multipart/form-data; boundary=----\(boundary)"]
        var data: Data = Data()
        data.append("------\(boundary)\r\n")
        //Here you have to change the Content-Type
        data.append("Content-Disposition: form-data; name=\"file\"; filename=\"d.png\"\r\n")
        data.append("Content-Type: application/YourType\r\n\r\n")
        data.append(dataImage)
        data.append("\r\n")
        data.append("------\(boundary)--")
        
        request.httpBody = data
        DispatchQueue.global(qos: DispatchQoS.QoSClass.userInitiated).sync {
            URLSession.shared.dataTask(with: request, completionHandler: { data, response, error in
                DispatchQueue.main.async {
                    guard error == nil else {
                        print("Error fetching data from server\nERROR: \(String(describing: error))")
                        return
                    }
                    
                    guard let jsonData = data else {
                        print("Response Data is empty")
                        return
                    }
                    
                    let decoder = JSONDecoder()
                    let res = try! decoder.decode(Document.self, from: jsonData)
                    completionHandler(GetDriverQuery.Data.Driver.Document(id: res.id, address: res.address))
                }
            }).resume()
        }
    }
}
extension Data{
    mutating func append(_ string: String, using encoding: String.Encoding = .utf8) {
        if let data = string.data(using: encoding) {
            append(data)
        }
    }
}

extension GetDriverQuery.Data.CarColor: Equatable {
    public static func == (lhs: GetDriverQuery.Data.CarColor, rhs: GetDriverQuery.Data.CarColor) -> Bool {
        return lhs.id == rhs.id
    }
}

extension GetDriverQuery.Data.CarModel: Equatable {
    public static func == (lhs: GetDriverQuery.Data.CarModel, rhs: GetDriverQuery.Data.CarModel) -> Bool {
        return lhs.id == rhs.id
    }
}

struct Document: Decodable, Identifiable {
    let id: String
    let address: String
    
    
}
