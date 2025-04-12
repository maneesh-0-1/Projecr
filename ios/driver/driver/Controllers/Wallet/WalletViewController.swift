import UIKit
import Eureka
import SPAlert

class WalletViewController: FormViewController {
    var amount: Double?
    var currency: String?
    let amounts: [Double] = [5, 20, 50]
    var methodsRow: SegmentedRow<WalletQuery.Data.PaymentGateway> {
        get {
            return (self.form.rowBy(tag: "methods") as? SegmentedRow<WalletQuery.Data.PaymentGateway>)!
        }
    }
        
    var amountRow: StepperRow {
        get {
            return (self.form.rowBy(tag: "amount") as? StepperRow)!
        }
    }
    
    var creditsRow: PushRow<WalletQuery.Data.DriverWallet> {
        get {
            return (self.form.rowBy(tag: "credits") as? PushRow<WalletQuery.Data.DriverWallet>)!
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadingOverlay.shared.showOverlay(view: self.view)
        Network.shared.apollo.fetch(query: WalletQuery()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let data):
                guard let methods = data.data else {
                    self.dismiss(animated: true, completion: nil)
                    return
                }
                if methods.driverWallets.count < 1 && self.currency == nil {
                    SPAlert.present(title: NSLocalizedString("You need to do at least one trip so wallet would be enabled for you.", comment: ""), preset: .exclamation)
                    self.navigationController?.popViewController(animated: true)
                    return
                }
                if methods.paymentGateways.count < 1 {
                    SPAlert.present(title: NSLocalizedString("You need to do at least one trip so wallet would be enabled for you.", comment: ""), preset: .error)
                    self.navigationController?.popViewController(animated: true)
                    return
                }
                self.creditsRow.options = methods.driverWallets
                self.creditsRow.updateCell()
                self.methodsRow.options = methods.paymentGateways
                self.methodsRow.value = self.methodsRow.options![0]
                self.methodsRow.updateCell()
                if methods.paymentGateways.count > 1 {
                    self.methodsRow.hidden = false
                    self.methodsRow.evaluateHidden()
                }
                if self.amount != nil {
                    self.creditsRow.value = self.creditsRow.options!.first() { $0.currency == self.currency }
                    self.creditsRow.updateCell()
                    self.amountRow.value = self.amount! - (self.creditsRow.value?.balance ?? 0)
                    if self.creditsRow.value == nil {
                        self.creditsRow.hidden = true
                        self.creditsRow.evaluateHidden()
                    }
                    if self.amountRow.value! <= 0.0 {
                        self.navigationController?.popViewController(animated: true)
                    }
                    //self.amountRow.cell.stepper.minimumValue = self.amount!
                    self.amountRow.reload()
                } else {
                    self.creditsRow.value = self.creditsRow.options!.first
                    self.creditsRow.updateCell()
                }
                
            case .failure(let error):
                error.showAlert()
            }
        }
        form +++ Section(header: "", footer: self.amount == nil ? "" : NSLocalizedString("You can charge your wallet for an amount more than your \"Service Fee\" and your future Service Fees will be deducted automatically from your in-app wallet.", comment: "")) {
            $0.tag = "sec_currrent_credit"
            }
            <<< LabelRow("fee") {
                $0.title = NSLocalizedString("Service Fee", comment: "Wallet screen service fee")
                if self.amount != nil {
                    let formatter = NumberFormatter()
                    formatter.locale = Locale.current
                    formatter.numberStyle = .currency
                    formatter.currencyCode = self.currency
                    $0.value = formatter.string(from: NSNumber(value: self.amount!))!
                }
                $0.hidden = Condition(booleanLiteral: (self.amount == nil))
            }
            <<< PushRow<WalletQuery.Data.DriverWallet>("credits") {
                $0.title = NSLocalizedString("Credit", comment: "Wallet screen credit")
                $0.selectorTitle = NSLocalizedString("Current Credit", comment: "")
                $0.disabled = Condition(booleanLiteral: (self.currency != nil))
                $0.displayValueFor = {
                    if $0 == nil { return nil }
                    let formatter = NumberFormatter()
                    formatter.locale = Locale.current
                    formatter.numberStyle = .currency
                    formatter.currencyCode = $0!.currency
                    return formatter.string(from: NSNumber(value: $0!.balance))!
                }
            }.onPresent { from, to in
                to.sectionKeyForValue = { option -> String in
                    return option.currency
                }
            }
        form +++ Section(NSLocalizedString("Add credit", comment: "Wallet section title")) {
            $0.tag = "sec_add_credit"
            }
        <<< SegmentedRow<WalletQuery.Data.PaymentGateway>("methods") {
                $0.options = []
                $0.hidden = true
                $0.displayValueFor = { gateway in
                    return gateway?.title
                }
            }.onChange { row in
                if row.cell.segmentedControl.selectedSegmentIndex < 0 {
                    return
                }
            }
            <<< StepperRow("amount") {
                $0.value = self.amount ?? 0
                $0.title = NSLocalizedString("Amount", comment: "Wallet's amount field description")
            }
            <<< SegmentedRow<String>("amounts") {
                $0.cell.segmentedControl.isMomentary = true
                $0.cell.segmentedControl.addTarget(self, action: #selector(self.selectedPresetValue), for: .valueChanged)
                $0.options = self.amounts.map({return String("+\($0)")})
        }
            +++ Section("") {_ in
        }
            <<< ButtonRow("button_pay") {
                $0.title = NSLocalizedString("Pay!", comment: "Wallet Pay Button")
            }.onCellSelection() {cell, row in
                guard let amountRowValue = self.amountRow.value, Int(amountRowValue) > 0 else {
                    SPAlert.present(title: NSLocalizedString("Amount required", comment: ""), preset: .exclamation)
                    return
                }
                Network.shared.apollo.perform(mutation: TopUpWalletMutation(input: TopUpWalletInput(gatewayId: self.methodsRow.value!.id, amount: Double(amountRowValue), currency: self.creditsRow.value?.currency ?? self.currency!, token: Optional.none, pin: Optional.none, otp: Optional.none, transactionId: Optional.none))) { result in
                    switch result {
                    case .success(let res):
                        if let address = res.data?.topUpWallet.url,let url = URL(string: address), UIApplication.shared.canOpenURL(url) {
                            UIApplication.shared.open(url, completionHandler: nil)
                        }
                        
                    case .failure(let error):
                        error.showAlert()
                    }
                }
        }
    }
    
    @objc func selectedPresetValue(r: UISegmentedControl) {
        self.amountRow.value = (self.amountRow.value ?? 0) + Double(self.amounts[r.selectedSegmentIndex])
        self.amountRow.updateCell()
    }
    
}

extension WalletViewController: WebPaymentResultDelegate {
    func paid() {
        _ = self.navigationController?.popViewController(animated: true)
        SPAlert.present(title: NSLocalizedString("Payment Successful", comment: ""), preset: .done)
    }
    
    func canceled() {
        
    }
}

extension WalletQuery.Data.PaymentGateway: Equatable {
    public static func == (lhs: WalletQuery.Data.PaymentGateway, rhs: WalletQuery.Data.PaymentGateway) -> Bool {
        return lhs.id == rhs.id
    }
}

extension WalletQuery.Data.DriverWallet: Equatable {
    public static func == (lhs: WalletQuery.Data.DriverWallet, rhs: WalletQuery.Data.DriverWallet) -> Bool {
        return lhs.id == rhs.id
    }
}
