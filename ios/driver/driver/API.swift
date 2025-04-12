// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public struct PointInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - lat
  ///   - lng
  public init(lat: Double, lng: Double) {
    graphQLMap = ["lat": lat, "lng": lng]
  }

  public var lat: Double {
    get {
      return graphQLMap["lat"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lat")
    }
  }

  public var lng: Double {
    get {
      return graphQLMap["lng"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lng")
    }
  }
}

public enum OrderStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case requested
  case notFound
  case noCloseFound
  case found
  case driverAccepted
  case arrived
  case waitingForPrePay
  case driverCanceled
  case riderCanceled
  case started
  case waitingForPostPay
  case waitingForReview
  case finished
  case booked
  case expired
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Requested": self = .requested
      case "NotFound": self = .notFound
      case "NoCloseFound": self = .noCloseFound
      case "Found": self = .found
      case "DriverAccepted": self = .driverAccepted
      case "Arrived": self = .arrived
      case "WaitingForPrePay": self = .waitingForPrePay
      case "DriverCanceled": self = .driverCanceled
      case "RiderCanceled": self = .riderCanceled
      case "Started": self = .started
      case "WaitingForPostPay": self = .waitingForPostPay
      case "WaitingForReview": self = .waitingForReview
      case "Finished": self = .finished
      case "Booked": self = .booked
      case "Expired": self = .expired
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .requested: return "Requested"
      case .notFound: return "NotFound"
      case .noCloseFound: return "NoCloseFound"
      case .found: return "Found"
      case .driverAccepted: return "DriverAccepted"
      case .arrived: return "Arrived"
      case .waitingForPrePay: return "WaitingForPrePay"
      case .driverCanceled: return "DriverCanceled"
      case .riderCanceled: return "RiderCanceled"
      case .started: return "Started"
      case .waitingForPostPay: return "WaitingForPostPay"
      case .waitingForReview: return "WaitingForReview"
      case .finished: return "Finished"
      case .booked: return "Booked"
      case .expired: return "Expired"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: OrderStatus, rhs: OrderStatus) -> Bool {
    switch (lhs, rhs) {
      case (.requested, .requested): return true
      case (.notFound, .notFound): return true
      case (.noCloseFound, .noCloseFound): return true
      case (.found, .found): return true
      case (.driverAccepted, .driverAccepted): return true
      case (.arrived, .arrived): return true
      case (.waitingForPrePay, .waitingForPrePay): return true
      case (.driverCanceled, .driverCanceled): return true
      case (.riderCanceled, .riderCanceled): return true
      case (.started, .started): return true
      case (.waitingForPostPay, .waitingForPostPay): return true
      case (.waitingForReview, .waitingForReview): return true
      case (.finished, .finished): return true
      case (.booked, .booked): return true
      case (.expired, .expired): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [OrderStatus] {
    return [
      .requested,
      .notFound,
      .noCloseFound,
      .found,
      .driverAccepted,
      .arrived,
      .waitingForPrePay,
      .driverCanceled,
      .riderCanceled,
      .started,
      .waitingForPostPay,
      .waitingForReview,
      .finished,
      .booked,
      .expired,
    ]
  }
}

public enum DriverStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case online
  case offline
  case blocked
  case inService
  case waitingDocuments
  case pendingApproval
  case softReject
  case hardReject
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Online": self = .online
      case "Offline": self = .offline
      case "Blocked": self = .blocked
      case "InService": self = .inService
      case "WaitingDocuments": self = .waitingDocuments
      case "PendingApproval": self = .pendingApproval
      case "SoftReject": self = .softReject
      case "HardReject": self = .hardReject
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .online: return "Online"
      case .offline: return "Offline"
      case .blocked: return "Blocked"
      case .inService: return "InService"
      case .waitingDocuments: return "WaitingDocuments"
      case .pendingApproval: return "PendingApproval"
      case .softReject: return "SoftReject"
      case .hardReject: return "HardReject"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DriverStatus, rhs: DriverStatus) -> Bool {
    switch (lhs, rhs) {
      case (.online, .online): return true
      case (.offline, .offline): return true
      case (.blocked, .blocked): return true
      case (.inService, .inService): return true
      case (.waitingDocuments, .waitingDocuments): return true
      case (.pendingApproval, .pendingApproval): return true
      case (.softReject, .softReject): return true
      case (.hardReject, .hardReject): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DriverStatus] {
    return [
      .online,
      .offline,
      .blocked,
      .inService,
      .waitingDocuments,
      .pendingApproval,
      .softReject,
      .hardReject,
    ]
  }
}

public struct UpdateDriverInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - carProductionYear
  ///   - carModelId
  ///   - carColorId
  ///   - firstName
  ///   - lastName
  ///   - status
  ///   - certificateNumber
  ///   - email
  ///   - carPlate
  ///   - mediaId
  ///   - gender
  ///   - accountNumber
  ///   - bankName
  ///   - bankRoutingNumber
  ///   - bankSwift
  ///   - address
  ///   - documents
  ///   - notificationPlayerId
  public init(carProductionYear: Swift.Optional<Int?> = nil, carModelId: Swift.Optional<GraphQLID?> = nil, carColorId: Swift.Optional<GraphQLID?> = nil, firstName: Swift.Optional<String?> = nil, lastName: Swift.Optional<String?> = nil, status: Swift.Optional<DriverStatus?> = nil, certificateNumber: Swift.Optional<String?> = nil, email: Swift.Optional<String?> = nil, carPlate: Swift.Optional<String?> = nil, mediaId: Swift.Optional<Double?> = nil, gender: Swift.Optional<Gender?> = nil, accountNumber: Swift.Optional<String?> = nil, bankName: Swift.Optional<String?> = nil, bankRoutingNumber: Swift.Optional<String?> = nil, bankSwift: Swift.Optional<String?> = nil, address: Swift.Optional<String?> = nil, documents: Swift.Optional<[String]?> = nil, notificationPlayerId: Swift.Optional<String?> = nil) {
    graphQLMap = ["carProductionYear": carProductionYear, "carModelId": carModelId, "carColorId": carColorId, "firstName": firstName, "lastName": lastName, "status": status, "certificateNumber": certificateNumber, "email": email, "carPlate": carPlate, "mediaId": mediaId, "gender": gender, "accountNumber": accountNumber, "bankName": bankName, "bankRoutingNumber": bankRoutingNumber, "bankSwift": bankSwift, "address": address, "documents": documents, "notificationPlayerId": notificationPlayerId]
  }

  public var carProductionYear: Swift.Optional<Int?> {
    get {
      return graphQLMap["carProductionYear"] as? Swift.Optional<Int?> ?? Swift.Optional<Int?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carProductionYear")
    }
  }

  public var carModelId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["carModelId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carModelId")
    }
  }

  public var carColorId: Swift.Optional<GraphQLID?> {
    get {
      return graphQLMap["carColorId"] as? Swift.Optional<GraphQLID?> ?? Swift.Optional<GraphQLID?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carColorId")
    }
  }

  public var firstName: Swift.Optional<String?> {
    get {
      return graphQLMap["firstName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: Swift.Optional<String?> {
    get {
      return graphQLMap["lastName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var status: Swift.Optional<DriverStatus?> {
    get {
      return graphQLMap["status"] as? Swift.Optional<DriverStatus?> ?? Swift.Optional<DriverStatus?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "status")
    }
  }

  public var certificateNumber: Swift.Optional<String?> {
    get {
      return graphQLMap["certificateNumber"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "certificateNumber")
    }
  }

  public var email: Swift.Optional<String?> {
    get {
      return graphQLMap["email"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "email")
    }
  }

  public var carPlate: Swift.Optional<String?> {
    get {
      return graphQLMap["carPlate"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "carPlate")
    }
  }

  public var mediaId: Swift.Optional<Double?> {
    get {
      return graphQLMap["mediaId"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "mediaId")
    }
  }

  public var gender: Swift.Optional<Gender?> {
    get {
      return graphQLMap["gender"] as? Swift.Optional<Gender?> ?? Swift.Optional<Gender?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gender")
    }
  }

  public var accountNumber: Swift.Optional<String?> {
    get {
      return graphQLMap["accountNumber"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "accountNumber")
    }
  }

  public var bankName: Swift.Optional<String?> {
    get {
      return graphQLMap["bankName"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bankName")
    }
  }

  public var bankRoutingNumber: Swift.Optional<String?> {
    get {
      return graphQLMap["bankRoutingNumber"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bankRoutingNumber")
    }
  }

  public var bankSwift: Swift.Optional<String?> {
    get {
      return graphQLMap["bankSwift"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "bankSwift")
    }
  }

  public var address: Swift.Optional<String?> {
    get {
      return graphQLMap["address"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  public var documents: Swift.Optional<[String]?> {
    get {
      return graphQLMap["documents"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "documents")
    }
  }

  public var notificationPlayerId: Swift.Optional<String?> {
    get {
      return graphQLMap["notificationPlayerId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "notificationPlayerId")
    }
  }
}

public enum Gender: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case male
  case female
  case unknown
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Male": self = .male
      case "Female": self = .female
      case "Unknown": self = .unknown
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .male: return "Male"
      case .female: return "Female"
      case .unknown: return "Unknown"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: Gender, rhs: Gender) -> Bool {
    switch (lhs, rhs) {
      case (.male, .male): return true
      case (.female, .female): return true
      case (.unknown, .unknown): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [Gender] {
    return [
      .male,
      .female,
      .unknown,
    ]
  }
}

public enum PaymentGatewayType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case stripe
  case brainTree
  case payPal
  case paytm
  case razorpay
  case paystack
  case payU
  case instamojo
  case flutterwave
  case payGate
  case mips
  case mercadoPago
  case amazonPaymentServices
  case myTMoney
  case wayForPay
  case customLink
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Stripe": self = .stripe
      case "BrainTree": self = .brainTree
      case "PayPal": self = .payPal
      case "Paytm": self = .paytm
      case "Razorpay": self = .razorpay
      case "Paystack": self = .paystack
      case "PayU": self = .payU
      case "Instamojo": self = .instamojo
      case "Flutterwave": self = .flutterwave
      case "PayGate": self = .payGate
      case "MIPS": self = .mips
      case "MercadoPago": self = .mercadoPago
      case "AmazonPaymentServices": self = .amazonPaymentServices
      case "MyTMoney": self = .myTMoney
      case "WayForPay": self = .wayForPay
      case "CustomLink": self = .customLink
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .stripe: return "Stripe"
      case .brainTree: return "BrainTree"
      case .payPal: return "PayPal"
      case .paytm: return "Paytm"
      case .razorpay: return "Razorpay"
      case .paystack: return "Paystack"
      case .payU: return "PayU"
      case .instamojo: return "Instamojo"
      case .flutterwave: return "Flutterwave"
      case .payGate: return "PayGate"
      case .mips: return "MIPS"
      case .mercadoPago: return "MercadoPago"
      case .amazonPaymentServices: return "AmazonPaymentServices"
      case .myTMoney: return "MyTMoney"
      case .wayForPay: return "WayForPay"
      case .customLink: return "CustomLink"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PaymentGatewayType, rhs: PaymentGatewayType) -> Bool {
    switch (lhs, rhs) {
      case (.stripe, .stripe): return true
      case (.brainTree, .brainTree): return true
      case (.payPal, .payPal): return true
      case (.paytm, .paytm): return true
      case (.razorpay, .razorpay): return true
      case (.paystack, .paystack): return true
      case (.payU, .payU): return true
      case (.instamojo, .instamojo): return true
      case (.flutterwave, .flutterwave): return true
      case (.payGate, .payGate): return true
      case (.mips, .mips): return true
      case (.mercadoPago, .mercadoPago): return true
      case (.amazonPaymentServices, .amazonPaymentServices): return true
      case (.myTMoney, .myTMoney): return true
      case (.wayForPay, .wayForPay): return true
      case (.customLink, .customLink): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PaymentGatewayType] {
    return [
      .stripe,
      .brainTree,
      .payPal,
      .paytm,
      .razorpay,
      .paystack,
      .payU,
      .instamojo,
      .flutterwave,
      .payGate,
      .mips,
      .mercadoPago,
      .amazonPaymentServices,
      .myTMoney,
      .wayForPay,
      .customLink,
    ]
  }
}

public struct TopUpWalletInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - gatewayId
  ///   - amount
  ///   - currency
  ///   - token
  ///   - pin
  ///   - otp
  ///   - transactionId
  public init(gatewayId: GraphQLID, amount: Double, currency: String, token: Swift.Optional<String?> = nil, pin: Swift.Optional<Double?> = nil, otp: Swift.Optional<Double?> = nil, transactionId: Swift.Optional<String?> = nil) {
    graphQLMap = ["gatewayId": gatewayId, "amount": amount, "currency": currency, "token": token, "pin": pin, "otp": otp, "transactionId": transactionId]
  }

  public var gatewayId: GraphQLID {
    get {
      return graphQLMap["gatewayId"] as! GraphQLID
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "gatewayId")
    }
  }

  public var amount: Double {
    get {
      return graphQLMap["amount"] as! Double
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  public var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var token: Swift.Optional<String?> {
    get {
      return graphQLMap["token"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "token")
    }
  }

  public var pin: Swift.Optional<Double?> {
    get {
      return graphQLMap["pin"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "pin")
    }
  }

  public var otp: Swift.Optional<Double?> {
    get {
      return graphQLMap["otp"] as? Swift.Optional<Double?> ?? Swift.Optional<Double?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "otp")
    }
  }

  public var transactionId: Swift.Optional<String?> {
    get {
      return graphQLMap["transactionId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "transactionId")
    }
  }
}

public enum TopUpWalletStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case ok
  case redirect
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OK": self = .ok
      case "Redirect": self = .redirect
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .ok: return "OK"
      case .redirect: return "Redirect"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TopUpWalletStatus, rhs: TopUpWalletStatus) -> Bool {
    switch (lhs, rhs) {
      case (.ok, .ok): return true
      case (.redirect, .redirect): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TopUpWalletStatus] {
    return [
      .ok,
      .redirect,
    ]
  }
}

public enum DriverDeductTransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case withdraw
  case commission
  case correction
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Withdraw": self = .withdraw
      case "Commission": self = .commission
      case "Correction": self = .correction
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .withdraw: return "Withdraw"
      case .commission: return "Commission"
      case .correction: return "Correction"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DriverDeductTransactionType, rhs: DriverDeductTransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.withdraw, .withdraw): return true
      case (.commission, .commission): return true
      case (.correction, .correction): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DriverDeductTransactionType] {
    return [
      .withdraw,
      .commission,
      .correction,
    ]
  }
}

public enum TransactionAction: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case recharge
  case deduct
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Recharge": self = .recharge
      case "Deduct": self = .deduct
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .recharge: return "Recharge"
      case .deduct: return "Deduct"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionAction, rhs: TransactionAction) -> Bool {
    switch (lhs, rhs) {
      case (.recharge, .recharge): return true
      case (.deduct, .deduct): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionAction] {
    return [
      .recharge,
      .deduct,
    ]
  }
}

public enum DriverRechargeTransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case orderFee
  case bankTransfer
  case inAppPayment
  case gift
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OrderFee": self = .orderFee
      case "BankTransfer": self = .bankTransfer
      case "InAppPayment": self = .inAppPayment
      case "Gift": self = .gift
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .orderFee: return "OrderFee"
      case .bankTransfer: return "BankTransfer"
      case .inAppPayment: return "InAppPayment"
      case .gift: return "Gift"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: DriverRechargeTransactionType, rhs: DriverRechargeTransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.orderFee, .orderFee): return true
      case (.bankTransfer, .bankTransfer): return true
      case (.inAppPayment, .inAppPayment): return true
      case (.gift, .gift): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [DriverRechargeTransactionType] {
    return [
      .orderFee,
      .bankTransfer,
      .inAppPayment,
      .gift,
    ]
  }
}

public enum TimeQuery: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case daily
  case weekly
  case monthly
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Daily": self = .daily
      case "Weekly": self = .weekly
      case "Monthly": self = .monthly
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .daily: return "Daily"
      case .weekly: return "Weekly"
      case .monthly: return "Monthly"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TimeQuery, rhs: TimeQuery) -> Bool {
    switch (lhs, rhs) {
      case (.daily, .daily): return true
      case (.weekly, .weekly): return true
      case (.monthly, .monthly): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TimeQuery] {
    return [
      .daily,
      .weekly,
      .monthly,
    ]
  }
}

public enum MessageStatus: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case sent
  case delivered
  case seen
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Sent": self = .sent
      case "Delivered": self = .delivered
      case "Seen": self = .seen
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .sent: return "Sent"
      case .delivered: return "Delivered"
      case .seen: return "Seen"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MessageStatus, rhs: MessageStatus) -> Bool {
    switch (lhs, rhs) {
      case (.sent, .sent): return true
      case (.delivered, .delivered): return true
      case (.seen, .seen): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [MessageStatus] {
    return [
      .sent,
      .delivered,
      .seen,
    ]
  }
}

public enum ServicePaymentMethod: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case cashCredit
  case onlyCredit
  case onlyCash
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CashCredit": self = .cashCredit
      case "OnlyCredit": self = .onlyCredit
      case "OnlyCash": self = .onlyCash
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .cashCredit: return "CashCredit"
      case .onlyCredit: return "OnlyCredit"
      case .onlyCash: return "OnlyCash"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: ServicePaymentMethod, rhs: ServicePaymentMethod) -> Bool {
    switch (lhs, rhs) {
      case (.cashCredit, .cashCredit): return true
      case (.onlyCredit, .onlyCredit): return true
      case (.onlyCash, .onlyCash): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [ServicePaymentMethod] {
    return [
      .cashCredit,
      .onlyCredit,
      .onlyCash,
    ]
  }
}

public final class AnnouncementsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Announcements {
      announcements {
        __typename
        title
        description
        startAt
      }
    }
    """

  public let operationName: String = "Announcements"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("announcements", type: .nonNull(.list(.nonNull(.object(Announcement.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(announcements: [Announcement]) {
      self.init(unsafeResultMap: ["__typename": "Query", "announcements": announcements.map { (value: Announcement) -> ResultMap in value.resultMap }])
    }

    public var announcements: [Announcement] {
      get {
        return (resultMap["announcements"] as! [ResultMap]).map { (value: ResultMap) -> Announcement in Announcement(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Announcement) -> ResultMap in value.resultMap }, forKey: "announcements")
      }
    }

    public struct Announcement: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Announcement"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("description", type: .nonNull(.scalar(String.self))),
          GraphQLField("startAt", type: .nonNull(.scalar(Timestamp.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(title: String, description: String, startAt: Timestamp) {
        self.init(unsafeResultMap: ["__typename": "Announcement", "title": title, "description": description, "startAt": startAt])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var description: String {
        get {
          return resultMap["description"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var startAt: Timestamp {
        get {
          return resultMap["startAt"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "startAt")
        }
      }
    }
  }
}

public final class GetMessagesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetMessages {
      driver(id: "1") {
        __typename
        id
        firstName
        lastName
        media {
          __typename
          address
        }
        orders {
          __typename
          nodes {
            __typename
            id
            conversations {
              __typename
              ...MessageFragment
            }
          }
        }
      }
    }
    """

  public let operationName: String = "GetMessages"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageFragment.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driver", arguments: ["id": "1"], type: .object(Driver.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driver: Driver? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }])
    }

    public var driver: Driver? {
      get {
        return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "driver")
      }
    }

    public struct Driver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("orders", type: .nonNull(.object(Order.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, orders: Order) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "orders": orders.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var orders: Order {
        get {
          return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "orders")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverOrdersConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Array of nodes.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("conversations", type: .nonNull(.list(.nonNull(.object(Conversation.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, conversations: [Conversation]) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "conversations": conversations.map { (value: Conversation) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var conversations: [Conversation] {
            get {
              return (resultMap["conversations"] as! [ResultMap]).map { (value: ResultMap) -> Conversation in Conversation(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Conversation) -> ResultMap in value.resultMap }, forKey: "conversations")
            }
          }

          public struct Conversation: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["OrderMessage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
                GraphQLField("sentByDriver", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
                GraphQLField("status", type: .nonNull(.scalar(MessageStatus.self))),
                GraphQLField("content", type: .nonNull(.scalar(String.self))),
                GraphQLField("request", type: .nonNull(.object(Request.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, sentAt: Timestamp, sentByDriver: Bool, status: MessageStatus, content: String, request: Request) {
              self.init(unsafeResultMap: ["__typename": "OrderMessage", "id": id, "sentAt": sentAt, "sentByDriver": sentByDriver, "status": status, "content": content, "request": request.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var id: GraphQLID {
              get {
                return resultMap["id"]! as! GraphQLID
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            public var sentAt: Timestamp {
              get {
                return resultMap["sentAt"]! as! Timestamp
              }
              set {
                resultMap.updateValue(newValue, forKey: "sentAt")
              }
            }

            public var sentByDriver: Bool {
              get {
                return resultMap["sentByDriver"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "sentByDriver")
              }
            }

            public var status: MessageStatus {
              get {
                return resultMap["status"]! as! MessageStatus
              }
              set {
                resultMap.updateValue(newValue, forKey: "status")
              }
            }

            public var content: String {
              get {
                return resultMap["content"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "content")
              }
            }

            public var request: Request {
              get {
                return Request(unsafeResultMap: resultMap["request"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "request")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var messageFragment: MessageFragment {
                get {
                  return MessageFragment(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }

            public struct Request: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Order"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(rider: Rider) {
                self.init(unsafeResultMap: ["__typename": "Order", "rider": rider.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var rider: Rider {
                get {
                  return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "rider")
                }
              }

              public struct Rider: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["Rider"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                    GraphQLField("firstName", type: .scalar(String.self)),
                    GraphQLField("lastName", type: .scalar(String.self)),
                    GraphQLField("media", type: .object(Medium.selections)),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
                  self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                public var id: GraphQLID {
                  get {
                    return resultMap["id"]! as! GraphQLID
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "id")
                  }
                }

                public var firstName: String? {
                  get {
                    return resultMap["firstName"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "firstName")
                  }
                }

                public var lastName: String? {
                  get {
                    return resultMap["lastName"] as? String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "lastName")
                  }
                }

                public var media: Medium? {
                  get {
                    return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
                  }
                  set {
                    resultMap.updateValue(newValue?.resultMap, forKey: "media")
                  }
                }

                public struct Medium: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Media"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("address", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(address: String) {
                    self.init(unsafeResultMap: ["__typename": "Media", "address": address])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  public var address: String {
                    get {
                      return resultMap["address"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "address")
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class SendMessageMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SendMessage($orderId: ID!, $content: String!) {
      createOneOrderMessage(
        input: {orderMessage: {requestId: $orderId, content: $content}}
      ) {
        __typename
        ...MessageFragment
      }
    }
    """

  public let operationName: String = "SendMessage"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageFragment.fragmentDefinition)
    return document
  }

  public var orderId: GraphQLID
  public var content: String

  public init(orderId: GraphQLID, content: String) {
    self.orderId = orderId
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["orderId": orderId, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOneOrderMessage", arguments: ["input": ["orderMessage": ["requestId": GraphQLVariable("orderId"), "content": GraphQLVariable("content")]]], type: .nonNull(.object(CreateOneOrderMessage.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOneOrderMessage: CreateOneOrderMessage) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOneOrderMessage": createOneOrderMessage.resultMap])
    }

    public var createOneOrderMessage: CreateOneOrderMessage {
      get {
        return CreateOneOrderMessage(unsafeResultMap: resultMap["createOneOrderMessage"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOneOrderMessage")
      }
    }

    public struct CreateOneOrderMessage: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderMessage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("sentByDriver", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("status", type: .nonNull(.scalar(MessageStatus.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("request", type: .nonNull(.object(Request.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, sentAt: Timestamp, sentByDriver: Bool, status: MessageStatus, content: String, request: Request) {
        self.init(unsafeResultMap: ["__typename": "OrderMessage", "id": id, "sentAt": sentAt, "sentByDriver": sentByDriver, "status": status, "content": content, "request": request.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var sentAt: Timestamp {
        get {
          return resultMap["sentAt"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "sentAt")
        }
      }

      public var sentByDriver: Bool {
        get {
          return resultMap["sentByDriver"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "sentByDriver")
        }
      }

      public var status: MessageStatus {
        get {
          return resultMap["status"]! as! MessageStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var request: Request {
        get {
          return Request(unsafeResultMap: resultMap["request"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "request")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var messageFragment: MessageFragment {
          get {
            return MessageFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Request: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rider: Rider) {
          self.init(unsafeResultMap: ["__typename": "Order", "rider": rider.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rider: Rider {
          get {
            return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "rider")
          }
        }

        public struct Rider: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rider"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("firstName", type: .scalar(String.self)),
              GraphQLField("lastName", type: .scalar(String.self)),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return resultMap["firstName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String? {
            get {
              return resultMap["lastName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("address", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(address: String) {
              self.init(unsafeResultMap: ["__typename": "Media", "address": address])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var address: String {
              get {
                return resultMap["address"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "address")
              }
            }
          }
        }
      }
    }
  }
}

public final class NewMessageReceivedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription NewMessageReceived {
      newMessageReceived {
        __typename
        ...MessageFragment
      }
    }
    """

  public let operationName: String = "NewMessageReceived"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + MessageFragment.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("newMessageReceived", type: .nonNull(.object(NewMessageReceived.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(newMessageReceived: NewMessageReceived) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "newMessageReceived": newMessageReceived.resultMap])
    }

    public var newMessageReceived: NewMessageReceived {
      get {
        return NewMessageReceived(unsafeResultMap: resultMap["newMessageReceived"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "newMessageReceived")
      }
    }

    public struct NewMessageReceived: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderMessage"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("sentByDriver", type: .nonNull(.scalar(Bool.self))),
          GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("status", type: .nonNull(.scalar(MessageStatus.self))),
          GraphQLField("content", type: .nonNull(.scalar(String.self))),
          GraphQLField("request", type: .nonNull(.object(Request.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, sentAt: Timestamp, sentByDriver: Bool, status: MessageStatus, content: String, request: Request) {
        self.init(unsafeResultMap: ["__typename": "OrderMessage", "id": id, "sentAt": sentAt, "sentByDriver": sentByDriver, "status": status, "content": content, "request": request.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var sentAt: Timestamp {
        get {
          return resultMap["sentAt"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "sentAt")
        }
      }

      public var sentByDriver: Bool {
        get {
          return resultMap["sentByDriver"]! as! Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "sentByDriver")
        }
      }

      public var status: MessageStatus {
        get {
          return resultMap["status"]! as! MessageStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var content: String {
        get {
          return resultMap["content"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "content")
        }
      }

      public var request: Request {
        get {
          return Request(unsafeResultMap: resultMap["request"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "request")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var messageFragment: MessageFragment {
          get {
            return MessageFragment(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Request: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rider: Rider) {
          self.init(unsafeResultMap: ["__typename": "Order", "rider": rider.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rider: Rider {
          get {
            return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "rider")
          }
        }

        public struct Rider: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rider"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("firstName", type: .scalar(String.self)),
              GraphQLField("lastName", type: .scalar(String.self)),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var firstName: String? {
            get {
              return resultMap["firstName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String? {
            get {
              return resultMap["lastName"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "lastName")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Media"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("address", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(address: String) {
              self.init(unsafeResultMap: ["__typename": "Media", "address": address])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var address: String {
              get {
                return resultMap["address"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "address")
              }
            }
          }
        }
      }
    }
  }
}

public final class MeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Me {
      driver(id: 1) {
        __typename
        ...BasicProfile
      }
    }
    """

  public let operationName: String = "Me"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BasicProfile.fragmentDefinition)
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driver", arguments: ["id": 1], type: .object(Driver.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driver: Driver? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }])
    }

    public var driver: Driver? {
      get {
        return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "driver")
      }
    }

    public struct Driver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("softRejectionNote", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
          GraphQLField("orders", arguments: ["paging": ["limit": 1]], type: .nonNull(.object(Order.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, softRejectionNote: String? = nil, status: DriverStatus, orders: Order) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "softRejectionNote": softRejectionNote, "status": status, "orders": orders.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var mobileNumber: String {
        get {
          return resultMap["mobileNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mobileNumber")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var softRejectionNote: String? {
        get {
          return resultMap["softRejectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "softRejectionNote")
        }
      }

      public var status: DriverStatus {
        get {
          return resultMap["status"]! as! DriverStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var orders: Order {
        get {
          return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "orders")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var basicProfile: BasicProfile {
          get {
            return BasicProfile(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverOrdersConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Array of nodes.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var expectedTimestamp: Timestamp {
            get {
              return resultMap["expectedTimestamp"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "expectedTimestamp")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costBest: Double {
            get {
              return resultMap["costBest"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costBest")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var durationBest: Int {
            get {
              return resultMap["durationBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "durationBest")
            }
          }

          public var paidAmount: Double {
            get {
              return resultMap["paidAmount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "paidAmount")
            }
          }

          public var etaPickup: Timestamp? {
            get {
              return resultMap["etaPickup"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "etaPickup")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var rider: Rider {
            get {
              return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "rider")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var currentOrder: CurrentOrder {
              get {
                return CurrentOrder(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(paymentMethod: ServicePaymentMethod) {
              self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var paymentMethod: ServicePaymentMethod {
              get {
                return resultMap["paymentMethod"]! as! ServicePaymentMethod
              }
              set {
                resultMap.updateValue(newValue, forKey: "paymentMethod")
              }
            }
          }

          public struct Rider: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Rider"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .scalar(String.self)),
                GraphQLField("lastName", type: .scalar(String.self)),
                GraphQLField("media", type: .object(Medium.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
              self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mobileNumber: String {
              get {
                return resultMap["mobileNumber"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mobileNumber")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String? {
              get {
                return resultMap["lastName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }

            public var media: Medium? {
              get {
                return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class AvailableOrdersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AvailableOrders {
      availableOrders {
        __typename
        ...AvailableOrder
      }
    }
    """

  public let operationName: String = "AvailableOrders"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AvailableOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("availableOrders", type: .nonNull(.list(.nonNull(.object(AvailableOrder.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(availableOrders: [AvailableOrder]) {
      self.init(unsafeResultMap: ["__typename": "Query", "availableOrders": availableOrders.map { (value: AvailableOrder) -> ResultMap in value.resultMap }])
    }

    public var availableOrders: [AvailableOrder] {
      get {
        return (resultMap["availableOrders"] as! [ResultMap]).map { (value: ResultMap) -> AvailableOrder in AvailableOrder(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AvailableOrder) -> ResultMap in value.resultMap }, forKey: "availableOrders")
      }
    }

    public struct AvailableOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AvailableOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Double.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Double, status: OrderStatus, currency: String, costBest: Double, distanceBest: Int, durationBest: Int, addresses: [String], points: [Point]) {
        self.init(unsafeResultMap: ["__typename": "AvailableOrder", "id": id, "status": status, "currency": currency, "costBest": costBest, "distanceBest": distanceBest, "durationBest": durationBest, "addresses": addresses, "points": points.map { (value: Point) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Double {
        get {
          return resultMap["id"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var distanceBest: Int {
        get {
          return resultMap["distanceBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "distanceBest")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var availableOrder: AvailableOrder {
          get {
            return AvailableOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class OrderCreatedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription OrderCreated {
      orderCreated {
        __typename
        ...AvailableOrder
      }
    }
    """

  public let operationName: String = "OrderCreated"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AvailableOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orderCreated", type: .nonNull(.object(OrderCreated.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orderCreated: OrderCreated) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "orderCreated": orderCreated.resultMap])
    }

    public var orderCreated: OrderCreated {
      get {
        return OrderCreated(unsafeResultMap: resultMap["orderCreated"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "orderCreated")
      }
    }

    public struct OrderCreated: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AvailableOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Double.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Double, status: OrderStatus, currency: String, costBest: Double, distanceBest: Int, durationBest: Int, addresses: [String], points: [Point]) {
        self.init(unsafeResultMap: ["__typename": "AvailableOrder", "id": id, "status": status, "currency": currency, "costBest": costBest, "distanceBest": distanceBest, "durationBest": durationBest, "addresses": addresses, "points": points.map { (value: Point) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Double {
        get {
          return resultMap["id"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var distanceBest: Int {
        get {
          return resultMap["distanceBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "distanceBest")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var availableOrder: AvailableOrder {
          get {
            return AvailableOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class OrderRemovedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription OrderRemoved {
      orderRemoved {
        __typename
        id
      }
    }
    """

  public let operationName: String = "OrderRemoved"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orderRemoved", type: .nonNull(.object(OrderRemoved.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orderRemoved: OrderRemoved) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "orderRemoved": orderRemoved.resultMap])
    }

    public var orderRemoved: OrderRemoved {
      get {
        return OrderRemoved(unsafeResultMap: resultMap["orderRemoved"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "orderRemoved")
      }
    }

    public struct OrderRemoved: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AvailableOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Double.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Double) {
        self.init(unsafeResultMap: ["__typename": "AvailableOrder", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Double {
        get {
          return resultMap["id"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class OrderUpdatedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription OrderUpdated {
      orderUpdated {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "OrderUpdated"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orderUpdated", type: .nonNull(.object(OrderUpdated.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(orderUpdated: OrderUpdated) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "orderUpdated": orderUpdated.resultMap])
    }

    public var orderUpdated: OrderUpdated {
      get {
        return OrderUpdated(unsafeResultMap: resultMap["orderUpdated"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "orderUpdated")
      }
    }

    public struct OrderUpdated: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdOn: Timestamp {
        get {
          return resultMap["createdOn"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdOn")
        }
      }

      public var expectedTimestamp: Timestamp {
        get {
          return resultMap["expectedTimestamp"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "expectedTimestamp")
        }
      }

      public var startTimestamp: Timestamp? {
        get {
          return resultMap["startTimestamp"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "startTimestamp")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var paidAmount: Double {
        get {
          return resultMap["paidAmount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "paidAmount")
        }
      }

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var service: Service {
        get {
          return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "service")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var rider: Rider {
        get {
          return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rider")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var currentOrder: CurrentOrder {
          get {
            return CurrentOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(paymentMethod: ServicePaymentMethod) {
          self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
          }
        }
      }

      public struct Rider: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Rider"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("media", type: .object(Medium.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
          self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var media: Medium? {
          get {
            return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "media")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String) {
            self.init(unsafeResultMap: ["__typename": "Media", "address": address])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }
        }
      }
    }
  }
}

public final class UpdateDriverLocationMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateDriverLocation($point: PointInput!) {
      updateDriversLocationNew(point: $point) {
        __typename
        ...AvailableOrder
      }
    }
    """

  public let operationName: String = "UpdateDriverLocation"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AvailableOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var point: PointInput

  public init(point: PointInput) {
    self.point = point
  }

  public var variables: GraphQLMap? {
    return ["point": point]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateDriversLocationNew", arguments: ["point": GraphQLVariable("point")], type: .nonNull(.list(.nonNull(.object(UpdateDriversLocationNew.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateDriversLocationNew: [UpdateDriversLocationNew]) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateDriversLocationNew": updateDriversLocationNew.map { (value: UpdateDriversLocationNew) -> ResultMap in value.resultMap }])
    }

    public var updateDriversLocationNew: [UpdateDriversLocationNew] {
      get {
        return (resultMap["updateDriversLocationNew"] as! [ResultMap]).map { (value: ResultMap) -> UpdateDriversLocationNew in UpdateDriversLocationNew(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: UpdateDriversLocationNew) -> ResultMap in value.resultMap }, forKey: "updateDriversLocationNew")
      }
    }

    public struct UpdateDriversLocationNew: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AvailableOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(Double.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Double, status: OrderStatus, currency: String, costBest: Double, distanceBest: Int, durationBest: Int, addresses: [String], points: [Point]) {
        self.init(unsafeResultMap: ["__typename": "AvailableOrder", "id": id, "status": status, "currency": currency, "costBest": costBest, "distanceBest": distanceBest, "durationBest": durationBest, "addresses": addresses, "points": points.map { (value: Point) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: Double {
        get {
          return resultMap["id"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var distanceBest: Int {
        get {
          return resultMap["distanceBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "distanceBest")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var availableOrder: AvailableOrder {
          get {
            return AvailableOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class UpdateOrderStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateOrderStatus($orderId: ID!, $status: OrderStatus!, $cashPayment: Float) {
      updateOneOrder(
        input: {id: $orderId, update: {status: $status, paidAmount: $cashPayment}}
      ) {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "UpdateOrderStatus"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var orderId: GraphQLID
  public var status: OrderStatus
  public var cashPayment: Double?

  public init(orderId: GraphQLID, status: OrderStatus, cashPayment: Double? = nil) {
    self.orderId = orderId
    self.status = status
    self.cashPayment = cashPayment
  }

  public var variables: GraphQLMap? {
    return ["orderId": orderId, "status": status, "cashPayment": cashPayment]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneOrder", arguments: ["input": ["id": GraphQLVariable("orderId"), "update": ["status": GraphQLVariable("status"), "paidAmount": GraphQLVariable("cashPayment")]]], type: .nonNull(.object(UpdateOneOrder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneOrder: UpdateOneOrder) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneOrder": updateOneOrder.resultMap])
    }

    public var updateOneOrder: UpdateOneOrder {
      get {
        return UpdateOneOrder(unsafeResultMap: resultMap["updateOneOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneOrder")
      }
    }

    public struct UpdateOneOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdOn: Timestamp {
        get {
          return resultMap["createdOn"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdOn")
        }
      }

      public var expectedTimestamp: Timestamp {
        get {
          return resultMap["expectedTimestamp"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "expectedTimestamp")
        }
      }

      public var startTimestamp: Timestamp? {
        get {
          return resultMap["startTimestamp"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "startTimestamp")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var paidAmount: Double {
        get {
          return resultMap["paidAmount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "paidAmount")
        }
      }

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var service: Service {
        get {
          return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "service")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var rider: Rider {
        get {
          return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rider")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var currentOrder: CurrentOrder {
          get {
            return CurrentOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(paymentMethod: ServicePaymentMethod) {
          self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
          }
        }
      }

      public struct Rider: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Rider"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("media", type: .object(Medium.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
          self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var media: Medium? {
          get {
            return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "media")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String) {
            self.init(unsafeResultMap: ["__typename": "Media", "address": address])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }
        }
      }
    }
  }
}

public final class UpdateDriverStatusMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateDriverStatus($status: DriverStatus!, $fcmId: String) {
      updateOneDriver(
        input: {id: "1", update: {status: $status, notificationPlayerId: $fcmId}}
      ) {
        __typename
        ...BasicProfile
      }
    }
    """

  public let operationName: String = "UpdateDriverStatus"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BasicProfile.fragmentDefinition)
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var status: DriverStatus
  public var fcmId: String?

  public init(status: DriverStatus, fcmId: String? = nil) {
    self.status = status
    self.fcmId = fcmId
  }

  public var variables: GraphQLMap? {
    return ["status": status, "fcmId": fcmId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneDriver", arguments: ["input": ["id": "1", "update": ["status": GraphQLVariable("status"), "notificationPlayerId": GraphQLVariable("fcmId")]]], type: .nonNull(.object(UpdateOneDriver.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneDriver: UpdateOneDriver) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneDriver": updateOneDriver.resultMap])
    }

    public var updateOneDriver: UpdateOneDriver {
      get {
        return UpdateOneDriver(unsafeResultMap: resultMap["updateOneDriver"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneDriver")
      }
    }

    public struct UpdateOneDriver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("softRejectionNote", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
          GraphQLField("orders", arguments: ["paging": ["limit": 1]], type: .nonNull(.object(Order.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, softRejectionNote: String? = nil, status: DriverStatus, orders: Order) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "softRejectionNote": softRejectionNote, "status": status, "orders": orders.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var mobileNumber: String {
        get {
          return resultMap["mobileNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mobileNumber")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var softRejectionNote: String? {
        get {
          return resultMap["softRejectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "softRejectionNote")
        }
      }

      public var status: DriverStatus {
        get {
          return resultMap["status"]! as! DriverStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var orders: Order {
        get {
          return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "orders")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var basicProfile: BasicProfile {
          get {
            return BasicProfile(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverOrdersConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Array of nodes.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var expectedTimestamp: Timestamp {
            get {
              return resultMap["expectedTimestamp"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "expectedTimestamp")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costBest: Double {
            get {
              return resultMap["costBest"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costBest")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var durationBest: Int {
            get {
              return resultMap["durationBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "durationBest")
            }
          }

          public var paidAmount: Double {
            get {
              return resultMap["paidAmount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "paidAmount")
            }
          }

          public var etaPickup: Timestamp? {
            get {
              return resultMap["etaPickup"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "etaPickup")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var rider: Rider {
            get {
              return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "rider")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var currentOrder: CurrentOrder {
              get {
                return CurrentOrder(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(paymentMethod: ServicePaymentMethod) {
              self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var paymentMethod: ServicePaymentMethod {
              get {
                return resultMap["paymentMethod"]! as! ServicePaymentMethod
              }
              set {
                resultMap.updateValue(newValue, forKey: "paymentMethod")
              }
            }
          }

          public struct Rider: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Rider"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .scalar(String.self)),
                GraphQLField("lastName", type: .scalar(String.self)),
                GraphQLField("media", type: .object(Medium.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
              self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mobileNumber: String {
              get {
                return resultMap["mobileNumber"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mobileNumber")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String? {
              get {
                return resultMap["lastName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }

            public var media: Medium? {
              get {
                return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class UpdateProfileMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateProfile($input: UpdateDriverInput!) {
      updateOneDriver(input: {id: "1", update: $input}) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "UpdateProfile"

  public var input: UpdateDriverInput

  public init(input: UpdateDriverInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneDriver", arguments: ["input": ["id": "1", "update": GraphQLVariable("input")]], type: .nonNull(.object(UpdateOneDriver.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneDriver: UpdateOneDriver) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneDriver": updateOneDriver.resultMap])
    }

    public var updateOneDriver: UpdateOneDriver {
      get {
        return UpdateOneDriver(unsafeResultMap: resultMap["updateOneDriver"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneDriver")
      }
    }

    public struct UpdateOneDriver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class GetDriverQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetDriver {
      driver(id: "1") {
        __typename
        id
        status
        firstName
        lastName
        gender
        email
        mobileNumber
        accountNumber
        bankName
        bankRoutingNumber
        address
        softRejectionNote
        documents {
          __typename
          id
          address
        }
        bankSwift
        media {
          __typename
          id
          address
        }
        carPlate
        carProductionYear
        certificateNumber
        carColorId
        carModelId
      }
      carModels {
        __typename
        id
        name
      }
      carColors {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "GetDriver"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driver", arguments: ["id": "1"], type: .object(Driver.selections)),
        GraphQLField("carModels", type: .nonNull(.list(.nonNull(.object(CarModel.selections))))),
        GraphQLField("carColors", type: .nonNull(.list(.nonNull(.object(CarColor.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driver: Driver? = nil, carModels: [CarModel], carColors: [CarColor]) {
      self.init(unsafeResultMap: ["__typename": "Query", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "carModels": carModels.map { (value: CarModel) -> ResultMap in value.resultMap }, "carColors": carColors.map { (value: CarColor) -> ResultMap in value.resultMap }])
    }

    public var driver: Driver? {
      get {
        return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "driver")
      }
    }

    public var carModels: [CarModel] {
      get {
        return (resultMap["carModels"] as! [ResultMap]).map { (value: ResultMap) -> CarModel in CarModel(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CarModel) -> ResultMap in value.resultMap }, forKey: "carModels")
      }
    }

    public var carColors: [CarColor] {
      get {
        return (resultMap["carColors"] as! [ResultMap]).map { (value: ResultMap) -> CarColor in CarColor(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: CarColor) -> ResultMap in value.resultMap }, forKey: "carColors")
      }
    }

    public struct Driver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(Gender.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("accountNumber", type: .scalar(String.self)),
          GraphQLField("bankName", type: .scalar(String.self)),
          GraphQLField("bankRoutingNumber", type: .scalar(String.self)),
          GraphQLField("address", type: .scalar(String.self)),
          GraphQLField("softRejectionNote", type: .scalar(String.self)),
          GraphQLField("documents", type: .nonNull(.list(.nonNull(.object(Document.selections))))),
          GraphQLField("bankSwift", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("carPlate", type: .scalar(String.self)),
          GraphQLField("carProductionYear", type: .scalar(Int.self)),
          GraphQLField("certificateNumber", type: .scalar(String.self)),
          GraphQLField("carColorId", type: .scalar(GraphQLID.self)),
          GraphQLField("carModelId", type: .scalar(GraphQLID.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: DriverStatus, firstName: String? = nil, lastName: String? = nil, gender: Gender? = nil, email: String? = nil, mobileNumber: String, accountNumber: String? = nil, bankName: String? = nil, bankRoutingNumber: String? = nil, address: String? = nil, softRejectionNote: String? = nil, documents: [Document], bankSwift: String? = nil, media: Medium? = nil, carPlate: String? = nil, carProductionYear: Int? = nil, certificateNumber: String? = nil, carColorId: GraphQLID? = nil, carModelId: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "status": status, "firstName": firstName, "lastName": lastName, "gender": gender, "email": email, "mobileNumber": mobileNumber, "accountNumber": accountNumber, "bankName": bankName, "bankRoutingNumber": bankRoutingNumber, "address": address, "softRejectionNote": softRejectionNote, "documents": documents.map { (value: Document) -> ResultMap in value.resultMap }, "bankSwift": bankSwift, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "carPlate": carPlate, "carProductionYear": carProductionYear, "certificateNumber": certificateNumber, "carColorId": carColorId, "carModelId": carModelId])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: DriverStatus {
        get {
          return resultMap["status"]! as! DriverStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var gender: Gender? {
        get {
          return resultMap["gender"] as? Gender
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      public var email: String? {
        get {
          return resultMap["email"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "email")
        }
      }

      public var mobileNumber: String {
        get {
          return resultMap["mobileNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mobileNumber")
        }
      }

      public var accountNumber: String? {
        get {
          return resultMap["accountNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accountNumber")
        }
      }

      public var bankName: String? {
        get {
          return resultMap["bankName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankName")
        }
      }

      public var bankRoutingNumber: String? {
        get {
          return resultMap["bankRoutingNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankRoutingNumber")
        }
      }

      public var address: String? {
        get {
          return resultMap["address"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }

      public var softRejectionNote: String? {
        get {
          return resultMap["softRejectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "softRejectionNote")
        }
      }

      public var documents: [Document] {
        get {
          return (resultMap["documents"] as! [ResultMap]).map { (value: ResultMap) -> Document in Document(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Document) -> ResultMap in value.resultMap }, forKey: "documents")
        }
      }

      public var bankSwift: String? {
        get {
          return resultMap["bankSwift"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "bankSwift")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var carPlate: String? {
        get {
          return resultMap["carPlate"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "carPlate")
        }
      }

      public var carProductionYear: Int? {
        get {
          return resultMap["carProductionYear"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "carProductionYear")
        }
      }

      public var certificateNumber: String? {
        get {
          return resultMap["certificateNumber"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "certificateNumber")
        }
      }

      public var carColorId: GraphQLID? {
        get {
          return resultMap["carColorId"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "carColorId")
        }
      }

      public var carModelId: GraphQLID? {
        get {
          return resultMap["carModelId"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "carModelId")
        }
      }

      public struct Document: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "id": id, "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }
    }

    public struct CarModel: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CarModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "CarModel", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }

    public struct CarColor: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CarColor"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "CarColor", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class LoginMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Login($firebaseToken: String!) {
      login(input: {firebaseToken: $firebaseToken}) {
        __typename
        jwtToken
      }
    }
    """

  public let operationName: String = "Login"

  public var firebaseToken: String

  public init(firebaseToken: String) {
    self.firebaseToken = firebaseToken
  }

  public var variables: GraphQLMap? {
    return ["firebaseToken": firebaseToken]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("login", arguments: ["input": ["firebaseToken": GraphQLVariable("firebaseToken")]], type: .nonNull(.object(Login.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(login: Login) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "login": login.resultMap])
    }

    public var login: Login {
      get {
        return Login(unsafeResultMap: resultMap["login"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "login")
      }
    }

    public struct Login: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Login"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("jwtToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(jwtToken: String) {
        self.init(unsafeResultMap: ["__typename": "Login", "jwtToken": jwtToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var jwtToken: String {
        get {
          return resultMap["jwtToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "jwtToken")
        }
      }
    }
  }
}

public final class SetDocumentsOnDriverMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SetDocumentsOnDriver($driverId: ID!, $relationIds: [ID!]!) {
      updateOneDriver(input: {id: $driverId, update: {status: PendingApproval}}) {
        __typename
        ...BasicProfile
      }
      setDocumentsOnDriver(input: {id: $driverId, relationIds: $relationIds}) {
        __typename
        ...BasicProfile
      }
    }
    """

  public let operationName: String = "SetDocumentsOnDriver"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BasicProfile.fragmentDefinition)
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var driverId: GraphQLID
  public var relationIds: [GraphQLID]

  public init(driverId: GraphQLID, relationIds: [GraphQLID]) {
    self.driverId = driverId
    self.relationIds = relationIds
  }

  public var variables: GraphQLMap? {
    return ["driverId": driverId, "relationIds": relationIds]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneDriver", arguments: ["input": ["id": GraphQLVariable("driverId"), "update": ["status": "PendingApproval"]]], type: .nonNull(.object(UpdateOneDriver.selections))),
        GraphQLField("setDocumentsOnDriver", arguments: ["input": ["id": GraphQLVariable("driverId"), "relationIds": GraphQLVariable("relationIds")]], type: .nonNull(.object(SetDocumentsOnDriver.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneDriver: UpdateOneDriver, setDocumentsOnDriver: SetDocumentsOnDriver) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneDriver": updateOneDriver.resultMap, "setDocumentsOnDriver": setDocumentsOnDriver.resultMap])
    }

    public var updateOneDriver: UpdateOneDriver {
      get {
        return UpdateOneDriver(unsafeResultMap: resultMap["updateOneDriver"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneDriver")
      }
    }

    public var setDocumentsOnDriver: SetDocumentsOnDriver {
      get {
        return SetDocumentsOnDriver(unsafeResultMap: resultMap["setDocumentsOnDriver"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "setDocumentsOnDriver")
      }
    }

    public struct UpdateOneDriver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("softRejectionNote", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
          GraphQLField("orders", arguments: ["paging": ["limit": 1]], type: .nonNull(.object(Order.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, softRejectionNote: String? = nil, status: DriverStatus, orders: Order) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "softRejectionNote": softRejectionNote, "status": status, "orders": orders.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var mobileNumber: String {
        get {
          return resultMap["mobileNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mobileNumber")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var softRejectionNote: String? {
        get {
          return resultMap["softRejectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "softRejectionNote")
        }
      }

      public var status: DriverStatus {
        get {
          return resultMap["status"]! as! DriverStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var orders: Order {
        get {
          return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "orders")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var basicProfile: BasicProfile {
          get {
            return BasicProfile(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverOrdersConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Array of nodes.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var expectedTimestamp: Timestamp {
            get {
              return resultMap["expectedTimestamp"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "expectedTimestamp")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costBest: Double {
            get {
              return resultMap["costBest"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costBest")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var durationBest: Int {
            get {
              return resultMap["durationBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "durationBest")
            }
          }

          public var paidAmount: Double {
            get {
              return resultMap["paidAmount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "paidAmount")
            }
          }

          public var etaPickup: Timestamp? {
            get {
              return resultMap["etaPickup"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "etaPickup")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var rider: Rider {
            get {
              return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "rider")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var currentOrder: CurrentOrder {
              get {
                return CurrentOrder(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(paymentMethod: ServicePaymentMethod) {
              self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var paymentMethod: ServicePaymentMethod {
              get {
                return resultMap["paymentMethod"]! as! ServicePaymentMethod
              }
              set {
                resultMap.updateValue(newValue, forKey: "paymentMethod")
              }
            }
          }

          public struct Rider: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Rider"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .scalar(String.self)),
                GraphQLField("lastName", type: .scalar(String.self)),
                GraphQLField("media", type: .object(Medium.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
              self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mobileNumber: String {
              get {
                return resultMap["mobileNumber"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mobileNumber")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String? {
              get {
                return resultMap["lastName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }

            public var media: Medium? {
              get {
                return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }
    }

    public struct SetDocumentsOnDriver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
          GraphQLField("softRejectionNote", type: .scalar(String.self)),
          GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
          GraphQLField("orders", arguments: ["paging": ["limit": 1]], type: .nonNull(.object(Order.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, softRejectionNote: String? = nil, status: DriverStatus, orders: Order) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "softRejectionNote": softRejectionNote, "status": status, "orders": orders.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var mobileNumber: String {
        get {
          return resultMap["mobileNumber"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mobileNumber")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public var softRejectionNote: String? {
        get {
          return resultMap["softRejectionNote"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "softRejectionNote")
        }
      }

      public var status: DriverStatus {
        get {
          return resultMap["status"]! as! DriverStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var orders: Order {
        get {
          return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "orders")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var basicProfile: BasicProfile {
          get {
            return BasicProfile(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverOrdersConnection"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(nodes: [Node]) {
          self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Array of nodes.
        public var nodes: [Node] {
          get {
            return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var expectedTimestamp: Timestamp {
            get {
              return resultMap["expectedTimestamp"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "expectedTimestamp")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costBest: Double {
            get {
              return resultMap["costBest"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costBest")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var durationBest: Int {
            get {
              return resultMap["durationBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "durationBest")
            }
          }

          public var paidAmount: Double {
            get {
              return resultMap["paidAmount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "paidAmount")
            }
          }

          public var etaPickup: Timestamp? {
            get {
              return resultMap["etaPickup"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "etaPickup")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var rider: Rider {
            get {
              return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "rider")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var currentOrder: CurrentOrder {
              get {
                return CurrentOrder(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(paymentMethod: ServicePaymentMethod) {
              self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var paymentMethod: ServicePaymentMethod {
              get {
                return resultMap["paymentMethod"]! as! ServicePaymentMethod
              }
              set {
                resultMap.updateValue(newValue, forKey: "paymentMethod")
              }
            }
          }

          public struct Rider: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Rider"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .scalar(String.self)),
                GraphQLField("lastName", type: .scalar(String.self)),
                GraphQLField("media", type: .object(Medium.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
              self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var mobileNumber: String {
              get {
                return resultMap["mobileNumber"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "mobileNumber")
              }
            }

            public var firstName: String? {
              get {
                return resultMap["firstName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String? {
              get {
                return resultMap["lastName"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }

            public var media: Medium? {
              get {
                return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class HistoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query History {
      completed: orders(filter: {status: {in: [Finished, WaitingForReview]}}) {
        __typename
        ...historyOrderItem
      }
      canceled: orders(filter: {status: {eq: DriverCanceled}}) {
        __typename
        ...historyOrderItem
      }
    }
    """

  public let operationName: String = "History"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + HistoryOrderItem.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orders", alias: "completed", arguments: ["filter": ["status": ["in": ["Finished", "WaitingForReview"]]]], type: .nonNull(.object(Completed.selections))),
        GraphQLField("orders", alias: "canceled", arguments: ["filter": ["status": ["eq": "DriverCanceled"]]], type: .nonNull(.object(Canceled.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(completed: Completed, canceled: Canceled) {
      self.init(unsafeResultMap: ["__typename": "Query", "completed": completed.resultMap, "canceled": canceled.resultMap])
    }

    public var completed: Completed {
      get {
        return Completed(unsafeResultMap: resultMap["completed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "completed")
      }
    }

    public var canceled: Canceled {
      get {
        return Canceled(unsafeResultMap: resultMap["canceled"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "canceled")
      }
    }

    public struct Completed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Array of edges.
      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      /// Paging information
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var historyOrderItem: HistoryOrderItem {
          get {
            return HistoryOrderItem(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "OrderEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The node containing the Order
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, points: [Point], service: Service) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var finishTimestamp: Timestamp? {
            get {
              return resultMap["finishTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "finishTimestamp")
            }
          }

          public var distanceBest: Int {
            get {
              return resultMap["distanceBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "distanceBest")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("media", type: .nonNull(.object(Medium.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, media: Medium) {
              self.init(unsafeResultMap: ["__typename": "Service", "name": name, "media": media.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var media: Medium {
              get {
                return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            GraphQLField("endCursor", type: .scalar(ConnectionCursor.self)),
            GraphQLField("startCursor", type: .scalar(ConnectionCursor.self)),
            GraphQLField("hasPreviousPage", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil, endCursor: ConnectionCursor? = nil, startCursor: ConnectionCursor? = nil, hasPreviousPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor, "hasPreviousPage": hasPreviousPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// true if paging forward and there are more records.
        public var hasNextPage: Bool? {
          get {
            return resultMap["hasNextPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// The cursor of the last returned record.
        public var endCursor: ConnectionCursor? {
          get {
            return resultMap["endCursor"] as? ConnectionCursor
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// The cursor of the first returned record.
        public var startCursor: ConnectionCursor? {
          get {
            return resultMap["startCursor"] as? ConnectionCursor
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }

        /// true if paging backwards and there are more records.
        public var hasPreviousPage: Bool? {
          get {
            return resultMap["hasPreviousPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasPreviousPage")
          }
        }
      }
    }

    public struct Canceled: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Array of edges.
      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      /// Paging information
      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var historyOrderItem: HistoryOrderItem {
          get {
            return HistoryOrderItem(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["OrderEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "OrderEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The node containing the Order
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Order"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
              GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
              GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
              GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
              GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, points: [Point], service: Service) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          public var status: OrderStatus {
            get {
              return resultMap["status"]! as! OrderStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var createdOn: Timestamp {
            get {
              return resultMap["createdOn"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdOn")
            }
          }

          public var addresses: [String] {
            get {
              return resultMap["addresses"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "addresses")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var costAfterCoupon: Double {
            get {
              return resultMap["costAfterCoupon"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "costAfterCoupon")
            }
          }

          public var startTimestamp: Timestamp? {
            get {
              return resultMap["startTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startTimestamp")
            }
          }

          public var finishTimestamp: Timestamp? {
            get {
              return resultMap["finishTimestamp"] as? Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "finishTimestamp")
            }
          }

          public var distanceBest: Int {
            get {
              return resultMap["distanceBest"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "distanceBest")
            }
          }

          public var points: [Point] {
            get {
              return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
            }
          }

          public var service: Service {
            get {
              return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "service")
            }
          }

          public struct Point: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Point"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
                GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(lat: Double, lng: Double) {
              self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var lat: Double {
              get {
                return resultMap["lat"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lat")
              }
            }

            public var lng: Double {
              get {
                return resultMap["lng"]! as! Double
              }
              set {
                resultMap.updateValue(newValue, forKey: "lng")
              }
            }

            public var fragments: Fragments {
              get {
                return Fragments(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }

            public struct Fragments {
              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public var point: Point {
                get {
                  return Point(unsafeResultMap: resultMap)
                }
                set {
                  resultMap += newValue.resultMap
                }
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("media", type: .nonNull(.object(Medium.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, media: Medium) {
              self.init(unsafeResultMap: ["__typename": "Service", "name": name, "media": media.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            public var media: Medium {
              get {
                return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "media")
              }
            }

            public struct Medium: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String) {
                self.init(unsafeResultMap: ["__typename": "Media", "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PageInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("hasNextPage", type: .scalar(Bool.self)),
            GraphQLField("endCursor", type: .scalar(ConnectionCursor.self)),
            GraphQLField("startCursor", type: .scalar(ConnectionCursor.self)),
            GraphQLField("hasPreviousPage", type: .scalar(Bool.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(hasNextPage: Bool? = nil, endCursor: ConnectionCursor? = nil, startCursor: ConnectionCursor? = nil, hasPreviousPage: Bool? = nil) {
          self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor, "hasPreviousPage": hasPreviousPage])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// true if paging forward and there are more records.
        public var hasNextPage: Bool? {
          get {
            return resultMap["hasNextPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasNextPage")
          }
        }

        /// The cursor of the last returned record.
        public var endCursor: ConnectionCursor? {
          get {
            return resultMap["endCursor"] as? ConnectionCursor
          }
          set {
            resultMap.updateValue(newValue, forKey: "endCursor")
          }
        }

        /// The cursor of the first returned record.
        public var startCursor: ConnectionCursor? {
          get {
            return resultMap["startCursor"] as? ConnectionCursor
          }
          set {
            resultMap.updateValue(newValue, forKey: "startCursor")
          }
        }

        /// true if paging backwards and there are more records.
        public var hasPreviousPage: Bool? {
          get {
            return resultMap["hasPreviousPage"] as? Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "hasPreviousPage")
          }
        }
      }
    }
  }
}

public final class WriteComplaintMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation WriteComplaint($orderId: ID!, $subject: String!, $content: String) {
      createOneComplaint(
        input: {complaint: {requestId: $orderId, subject: $subject, content: $content}}
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "WriteComplaint"

  public var orderId: GraphQLID
  public var subject: String
  public var content: String?

  public init(orderId: GraphQLID, subject: String, content: String? = nil) {
    self.orderId = orderId
    self.subject = subject
    self.content = content
  }

  public var variables: GraphQLMap? {
    return ["orderId": orderId, "subject": subject, "content": content]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOneComplaint", arguments: ["input": ["complaint": ["requestId": GraphQLVariable("orderId"), "subject": GraphQLVariable("subject"), "content": GraphQLVariable("content")]]], type: .nonNull(.object(CreateOneComplaint.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOneComplaint: CreateOneComplaint) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOneComplaint": createOneComplaint.resultMap])
    }

    public var createOneComplaint: CreateOneComplaint {
      get {
        return CreateOneComplaint(unsafeResultMap: resultMap["createOneComplaint"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOneComplaint")
      }
    }

    public struct CreateOneComplaint: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Complaint"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID) {
        self.init(unsafeResultMap: ["__typename": "Complaint", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class WalletQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Wallet {
      driverWallets {
        __typename
        id
        balance
        currency
      }
      paymentGateways {
        __typename
        id
        title
        type
        publicKey
      }
    }
    """

  public let operationName: String = "Wallet"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driverWallets", type: .nonNull(.list(.nonNull(.object(DriverWallet.selections))))),
        GraphQLField("paymentGateways", type: .nonNull(.list(.nonNull(.object(PaymentGateway.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driverWallets: [DriverWallet], paymentGateways: [PaymentGateway]) {
      self.init(unsafeResultMap: ["__typename": "Query", "driverWallets": driverWallets.map { (value: DriverWallet) -> ResultMap in value.resultMap }, "paymentGateways": paymentGateways.map { (value: PaymentGateway) -> ResultMap in value.resultMap }])
    }

    public var driverWallets: [DriverWallet] {
      get {
        return (resultMap["driverWallets"] as! [ResultMap]).map { (value: ResultMap) -> DriverWallet in DriverWallet(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: DriverWallet) -> ResultMap in value.resultMap }, forKey: "driverWallets")
      }
    }

    public var paymentGateways: [PaymentGateway] {
      get {
        return (resultMap["paymentGateways"] as! [ResultMap]).map { (value: ResultMap) -> PaymentGateway in PaymentGateway(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: PaymentGateway) -> ResultMap in value.resultMap }, forKey: "paymentGateways")
      }
    }

    public struct DriverWallet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DriverWallet"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("balance", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, balance: Double, currency: String) {
        self.init(unsafeResultMap: ["__typename": "DriverWallet", "id": id, "balance": balance, "currency": currency])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var balance: Double {
        get {
          return resultMap["balance"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "balance")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }
    }

    public struct PaymentGateway: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaymentGateway"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(PaymentGatewayType.self))),
          GraphQLField("publicKey", type: .scalar(String.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, type: PaymentGatewayType, publicKey: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "PaymentGateway", "id": id, "title": title, "type": type, "publicKey": publicKey])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var title: String {
        get {
          return resultMap["title"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "title")
        }
      }

      public var type: PaymentGatewayType {
        get {
          return resultMap["type"]! as! PaymentGatewayType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var publicKey: String? {
        get {
          return resultMap["publicKey"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "publicKey")
        }
      }
    }
  }
}

public final class TopUpWalletMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation TopUpWallet($input: TopUpWalletInput!) {
      topUpWallet(input: $input) {
        __typename
        status
        url
      }
    }
    """

  public let operationName: String = "TopUpWallet"

  public var input: TopUpWalletInput

  public init(input: TopUpWalletInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("topUpWallet", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(TopUpWallet.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(topUpWallet: TopUpWallet) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "topUpWallet": topUpWallet.resultMap])
    }

    public var topUpWallet: TopUpWallet {
      get {
        return TopUpWallet(unsafeResultMap: resultMap["topUpWallet"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "topUpWallet")
      }
    }

    public struct TopUpWallet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TopUpWalletResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("status", type: .nonNull(.scalar(TopUpWalletStatus.self))),
          GraphQLField("url", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(status: TopUpWalletStatus, url: String) {
        self.init(unsafeResultMap: ["__typename": "TopUpWalletResponse", "status": status, "url": url])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var status: TopUpWalletStatus {
        get {
          return resultMap["status"]! as! TopUpWalletStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var url: String {
        get {
          return resultMap["url"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "url")
        }
      }
    }
  }
}

public final class TransactionsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Transactions {
      driverTransacions {
        __typename
        edges {
          __typename
          node {
            __typename
            createdAt
            amount
            currency
            refrenceNumber
            deductType
            action
            rechargeType
          }
        }
      }
    }
    """

  public let operationName: String = "Transactions"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driverTransacions", type: .nonNull(.object(DriverTransacion.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driverTransacions: DriverTransacion) {
      self.init(unsafeResultMap: ["__typename": "Query", "driverTransacions": driverTransacions.resultMap])
    }

    public var driverTransacions: DriverTransacion {
      get {
        return DriverTransacion(unsafeResultMap: resultMap["driverTransacions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "driverTransacions")
      }
    }

    public struct DriverTransacion: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["DriverTransacionConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "DriverTransacionConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Array of edges.
      public var edges: [Edge] {
        get {
          return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["DriverTransacionEdge"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("node", type: .nonNull(.object(Node.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node) {
          self.init(unsafeResultMap: ["__typename": "DriverTransacionEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The node containing the DriverTransacion
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["DriverTransacion"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("refrenceNumber", type: .scalar(String.self)),
              GraphQLField("deductType", type: .scalar(DriverDeductTransactionType.self)),
              GraphQLField("action", type: .nonNull(.scalar(TransactionAction.self))),
              GraphQLField("rechargeType", type: .scalar(DriverRechargeTransactionType.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(createdAt: Timestamp, amount: Double, currency: String, refrenceNumber: String? = nil, deductType: DriverDeductTransactionType? = nil, action: TransactionAction, rechargeType: DriverRechargeTransactionType? = nil) {
            self.init(unsafeResultMap: ["__typename": "DriverTransacion", "createdAt": createdAt, "amount": amount, "currency": currency, "refrenceNumber": refrenceNumber, "deductType": deductType, "action": action, "rechargeType": rechargeType])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var createdAt: Timestamp {
            get {
              return resultMap["createdAt"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "createdAt")
            }
          }

          public var amount: Double {
            get {
              return resultMap["amount"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "amount")
            }
          }

          public var currency: String {
            get {
              return resultMap["currency"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "currency")
            }
          }

          public var refrenceNumber: String? {
            get {
              return resultMap["refrenceNumber"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "refrenceNumber")
            }
          }

          public var deductType: DriverDeductTransactionType? {
            get {
              return resultMap["deductType"] as? DriverDeductTransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "deductType")
            }
          }

          public var action: TransactionAction {
            get {
              return resultMap["action"]! as! TransactionAction
            }
            set {
              resultMap.updateValue(newValue, forKey: "action")
            }
          }

          public var rechargeType: DriverRechargeTransactionType? {
            get {
              return resultMap["rechargeType"] as? DriverRechargeTransactionType
            }
            set {
              resultMap.updateValue(newValue, forKey: "rechargeType")
            }
          }
        }
      }
    }
  }
}

public final class GetStatsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetStats($timeFrame: TimeQuery!) {
      getStats(timeframe: $timeFrame) {
        __typename
        currency
        dataset {
          __typename
          count
          current
          distance
          earning
          name
          time
        }
      }
    }
    """

  public let operationName: String = "GetStats"

  public var timeFrame: TimeQuery

  public init(timeFrame: TimeQuery) {
    self.timeFrame = timeFrame
  }

  public var variables: GraphQLMap? {
    return ["timeFrame": timeFrame]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getStats", arguments: ["timeframe": GraphQLVariable("timeFrame")], type: .nonNull(.object(GetStat.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getStats: GetStat) {
      self.init(unsafeResultMap: ["__typename": "Query", "getStats": getStats.resultMap])
    }

    public var getStats: GetStat {
      get {
        return GetStat(unsafeResultMap: resultMap["getStats"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "getStats")
      }
    }

    public struct GetStat: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["StatisticsResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("dataset", type: .nonNull(.list(.nonNull(.object(Dataset.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(currency: String, dataset: [Dataset]) {
        self.init(unsafeResultMap: ["__typename": "StatisticsResult", "currency": currency, "dataset": dataset.map { (value: Dataset) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var dataset: [Dataset] {
        get {
          return (resultMap["dataset"] as! [ResultMap]).map { (value: ResultMap) -> Dataset in Dataset(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Dataset) -> ResultMap in value.resultMap }, forKey: "dataset")
        }
      }

      public struct Dataset: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Datapoint"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .nonNull(.scalar(Double.self))),
            GraphQLField("current", type: .nonNull(.scalar(String.self))),
            GraphQLField("distance", type: .nonNull(.scalar(Double.self))),
            GraphQLField("earning", type: .nonNull(.scalar(Double.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("time", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Double, current: String, distance: Double, earning: Double, name: String, time: Double) {
          self.init(unsafeResultMap: ["__typename": "Datapoint", "count": count, "current": current, "distance": distance, "earning": earning, "name": name, "time": time])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var count: Double {
          get {
            return resultMap["count"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        public var current: String {
          get {
            return resultMap["current"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "current")
          }
        }

        public var distance: Double {
          get {
            return resultMap["distance"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "distance")
          }
        }

        public var earning: Double {
          get {
            return resultMap["earning"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "earning")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var time: Double {
          get {
            return resultMap["time"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "time")
          }
        }
      }
    }
  }
}

public struct MessageFragment: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment MessageFragment on OrderMessage {
      __typename
      id
      sentAt
      sentByDriver
      sentAt
      status
      content
      request {
        __typename
        rider {
          __typename
          id
          firstName
          lastName
          media {
            __typename
            address
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["OrderMessage"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
      GraphQLField("sentByDriver", type: .nonNull(.scalar(Bool.self))),
      GraphQLField("sentAt", type: .nonNull(.scalar(Timestamp.self))),
      GraphQLField("status", type: .nonNull(.scalar(MessageStatus.self))),
      GraphQLField("content", type: .nonNull(.scalar(String.self))),
      GraphQLField("request", type: .nonNull(.object(Request.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, sentAt: Timestamp, sentByDriver: Bool, status: MessageStatus, content: String, request: Request) {
    self.init(unsafeResultMap: ["__typename": "OrderMessage", "id": id, "sentAt": sentAt, "sentByDriver": sentByDriver, "status": status, "content": content, "request": request.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var sentAt: Timestamp {
    get {
      return resultMap["sentAt"]! as! Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "sentAt")
    }
  }

  public var sentByDriver: Bool {
    get {
      return resultMap["sentByDriver"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "sentByDriver")
    }
  }

  public var status: MessageStatus {
    get {
      return resultMap["status"]! as! MessageStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var content: String {
    get {
      return resultMap["content"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "content")
    }
  }

  public var request: Request {
    get {
      return Request(unsafeResultMap: resultMap["request"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "request")
    }
  }

  public struct Request: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Order"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rider: Rider) {
      self.init(unsafeResultMap: ["__typename": "Order", "rider": rider.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var rider: Rider {
      get {
        return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "rider")
      }
    }

    public struct Rider: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rider"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var firstName: String? {
        get {
          return resultMap["firstName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String? {
        get {
          return resultMap["lastName"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "lastName")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Media"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("address", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(address: String) {
          self.init(unsafeResultMap: ["__typename": "Media", "address": address])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var address: String {
          get {
            return resultMap["address"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "address")
          }
        }
      }
    }
  }
}

public struct BasicProfile: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment BasicProfile on Driver {
      __typename
      id
      mobileNumber
      firstName
      lastName
      media {
        __typename
        address
      }
      softRejectionNote
      status
      orders(paging: {limit: 1}) {
        __typename
        nodes {
          __typename
          ...CurrentOrder
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Driver"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
      GraphQLField("media", type: .object(Medium.selections)),
      GraphQLField("softRejectionNote", type: .scalar(String.self)),
      GraphQLField("status", type: .nonNull(.scalar(DriverStatus.self))),
      GraphQLField("orders", arguments: ["paging": ["limit": 1]], type: .nonNull(.object(Order.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil, softRejectionNote: String? = nil, status: DriverStatus, orders: Order) {
    self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "softRejectionNote": softRejectionNote, "status": status, "orders": orders.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var mobileNumber: String {
    get {
      return resultMap["mobileNumber"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "mobileNumber")
    }
  }

  public var firstName: String? {
    get {
      return resultMap["firstName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String? {
    get {
      return resultMap["lastName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var media: Medium? {
    get {
      return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "media")
    }
  }

  public var softRejectionNote: String? {
    get {
      return resultMap["softRejectionNote"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "softRejectionNote")
    }
  }

  public var status: DriverStatus {
    get {
      return resultMap["status"]! as! DriverStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var orders: Order {
    get {
      return Order(unsafeResultMap: resultMap["orders"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "orders")
    }
  }

  public struct Medium: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Media"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("address", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(address: String) {
      self.init(unsafeResultMap: ["__typename": "Media", "address": address])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var address: String {
      get {
        return resultMap["address"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "address")
      }
    }
  }

  public struct Order: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["DriverOrdersConnection"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("nodes", type: .nonNull(.list(.nonNull(.object(Node.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(nodes: [Node]) {
      self.init(unsafeResultMap: ["__typename": "DriverOrdersConnection", "nodes": nodes.map { (value: Node) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Array of nodes.
    public var nodes: [Node] {
      get {
        return (resultMap["nodes"] as! [ResultMap]).map { (value: ResultMap) -> Node in Node(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: Node) -> ResultMap in value.resultMap }, forKey: "nodes")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var createdOn: Timestamp {
        get {
          return resultMap["createdOn"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdOn")
        }
      }

      public var expectedTimestamp: Timestamp {
        get {
          return resultMap["expectedTimestamp"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "expectedTimestamp")
        }
      }

      public var startTimestamp: Timestamp? {
        get {
          return resultMap["startTimestamp"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "startTimestamp")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costBest: Double {
        get {
          return resultMap["costBest"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costBest")
        }
      }

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
        }
      }

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
        }
      }

      public var paidAmount: Double {
        get {
          return resultMap["paidAmount"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "paidAmount")
        }
      }

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var service: Service {
        get {
          return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "service")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var rider: Rider {
        get {
          return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "rider")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var currentOrder: CurrentOrder {
          get {
            return CurrentOrder(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(paymentMethod: ServicePaymentMethod) {
          self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
          }
        }
      }

      public struct Rider: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Rider"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .scalar(String.self)),
            GraphQLField("lastName", type: .scalar(String.self)),
            GraphQLField("media", type: .object(Medium.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
          self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
          }
        }

        public var firstName: String? {
          get {
            return resultMap["firstName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String? {
          get {
            return resultMap["lastName"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }

        public var media: Medium? {
          get {
            return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "media")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String) {
            self.init(unsafeResultMap: ["__typename": "Media", "address": address])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }
        }
      }
    }
  }
}

public struct Point: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment Point on Point {
      __typename
      lat
      lng
    }
    """

  public static let possibleTypes: [String] = ["Point"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
      GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(lat: Double, lng: Double) {
    self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var lat: Double {
    get {
      return resultMap["lat"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "lat")
    }
  }

  public var lng: Double {
    get {
      return resultMap["lng"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "lng")
    }
  }
}

public struct AvailableOrder: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AvailableOrder on AvailableOrder {
      __typename
      id
      status
      currency
      costBest
      distanceBest
      durationBest
      addresses
      points {
        __typename
        ...Point
      }
    }
    """

  public static let possibleTypes: [String] = ["AvailableOrder"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(Double.self))),
      GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
      GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
      GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
      GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
      GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: Double, status: OrderStatus, currency: String, costBest: Double, distanceBest: Int, durationBest: Int, addresses: [String], points: [Point]) {
    self.init(unsafeResultMap: ["__typename": "AvailableOrder", "id": id, "status": status, "currency": currency, "costBest": costBest, "distanceBest": distanceBest, "durationBest": durationBest, "addresses": addresses, "points": points.map { (value: Point) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: Double {
    get {
      return resultMap["id"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var status: OrderStatus {
    get {
      return resultMap["status"]! as! OrderStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var costBest: Double {
    get {
      return resultMap["costBest"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "costBest")
    }
  }

  public var distanceBest: Int {
    get {
      return resultMap["distanceBest"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "distanceBest")
    }
  }

  public var durationBest: Int {
    get {
      return resultMap["durationBest"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "durationBest")
    }
  }

  public var addresses: [String] {
    get {
      return resultMap["addresses"]! as! [String]
    }
    set {
      resultMap.updateValue(newValue, forKey: "addresses")
    }
  }

  public var points: [Point] {
    get {
      return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
    }
  }

  public struct Point: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Point"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(lat: Double, lng: Double) {
      self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var lat: Double {
      get {
        return resultMap["lat"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lat")
      }
    }

    public var lng: Double {
      get {
        return resultMap["lng"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lng")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var point: Point {
        get {
          return Point(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }
}

public struct CurrentOrder: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CurrentOrder on Order {
      __typename
      id
      createdOn
      expectedTimestamp
      startTimestamp
      status
      currency
      costBest
      costAfterCoupon
      durationBest
      paidAmount
      etaPickup
      points {
        __typename
        ...Point
      }
      service {
        __typename
        paymentMethod
      }
      addresses
      rider {
        __typename
        mobileNumber
        firstName
        lastName
        media {
          __typename
          address
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["Order"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
      GraphQLField("expectedTimestamp", type: .nonNull(.scalar(Timestamp.self))),
      GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
      GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
      GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
      GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
      GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
      GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
      GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
      GraphQLField("service", type: .nonNull(.object(Service.selections))),
      GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
      GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, createdOn: Timestamp, expectedTimestamp: Timestamp, startTimestamp: Timestamp? = nil, status: OrderStatus, currency: String, costBest: Double, costAfterCoupon: Double, durationBest: Int, paidAmount: Double, etaPickup: Timestamp? = nil, points: [Point], service: Service, addresses: [String], rider: Rider) {
    self.init(unsafeResultMap: ["__typename": "Order", "id": id, "createdOn": createdOn, "expectedTimestamp": expectedTimestamp, "startTimestamp": startTimestamp, "status": status, "currency": currency, "costBest": costBest, "costAfterCoupon": costAfterCoupon, "durationBest": durationBest, "paidAmount": paidAmount, "etaPickup": etaPickup, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap, "addresses": addresses, "rider": rider.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var createdOn: Timestamp {
    get {
      return resultMap["createdOn"]! as! Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "createdOn")
    }
  }

  public var expectedTimestamp: Timestamp {
    get {
      return resultMap["expectedTimestamp"]! as! Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "expectedTimestamp")
    }
  }

  public var startTimestamp: Timestamp? {
    get {
      return resultMap["startTimestamp"] as? Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "startTimestamp")
    }
  }

  public var status: OrderStatus {
    get {
      return resultMap["status"]! as! OrderStatus
    }
    set {
      resultMap.updateValue(newValue, forKey: "status")
    }
  }

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
    }
  }

  public var costBest: Double {
    get {
      return resultMap["costBest"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "costBest")
    }
  }

  public var costAfterCoupon: Double {
    get {
      return resultMap["costAfterCoupon"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "costAfterCoupon")
    }
  }

  public var durationBest: Int {
    get {
      return resultMap["durationBest"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "durationBest")
    }
  }

  public var paidAmount: Double {
    get {
      return resultMap["paidAmount"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "paidAmount")
    }
  }

  public var etaPickup: Timestamp? {
    get {
      return resultMap["etaPickup"] as? Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "etaPickup")
    }
  }

  public var points: [Point] {
    get {
      return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
    }
  }

  public var service: Service {
    get {
      return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "service")
    }
  }

  public var addresses: [String] {
    get {
      return resultMap["addresses"]! as! [String]
    }
    set {
      resultMap.updateValue(newValue, forKey: "addresses")
    }
  }

  public var rider: Rider {
    get {
      return Rider(unsafeResultMap: resultMap["rider"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "rider")
    }
  }

  public struct Point: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Point"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
        GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(lat: Double, lng: Double) {
      self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var lat: Double {
      get {
        return resultMap["lat"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lat")
      }
    }

    public var lng: Double {
      get {
        return resultMap["lng"]! as! Double
      }
      set {
        resultMap.updateValue(newValue, forKey: "lng")
      }
    }

    public var fragments: Fragments {
      get {
        return Fragments(unsafeResultMap: resultMap)
      }
      set {
        resultMap += newValue.resultMap
      }
    }

    public struct Fragments {
      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var point: Point {
        get {
          return Point(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }
    }
  }

  public struct Service: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Service"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(paymentMethod: ServicePaymentMethod) {
      self.init(unsafeResultMap: ["__typename": "Service", "paymentMethod": paymentMethod])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var paymentMethod: ServicePaymentMethod {
      get {
        return resultMap["paymentMethod"]! as! ServicePaymentMethod
      }
      set {
        resultMap.updateValue(newValue, forKey: "paymentMethod")
      }
    }
  }

  public struct Rider: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Rider"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("firstName", type: .scalar(String.self)),
        GraphQLField("lastName", type: .scalar(String.self)),
        GraphQLField("media", type: .object(Medium.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mobileNumber: String, firstName: String? = nil, lastName: String? = nil, media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Rider", "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var mobileNumber: String {
      get {
        return resultMap["mobileNumber"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mobileNumber")
      }
    }

    public var firstName: String? {
      get {
        return resultMap["firstName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String? {
      get {
        return resultMap["lastName"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "lastName")
      }
    }

    public var media: Medium? {
      get {
        return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Media"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("address", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(address: String) {
        self.init(unsafeResultMap: ["__typename": "Media", "address": address])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var address: String {
        get {
          return resultMap["address"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "address")
        }
      }
    }
  }
}

public struct HistoryOrderItem: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment historyOrderItem on OrderConnection {
      __typename
      edges {
        __typename
        node {
          __typename
          id
          status
          createdOn
          addresses
          currency
          costAfterCoupon
          startTimestamp
          finishTimestamp
          distanceBest
          points {
            __typename
            ...Point
          }
          service {
            __typename
            name
            media {
              __typename
              address
            }
          }
        }
      }
      pageInfo {
        __typename
        hasNextPage
        endCursor
        startCursor
        hasPreviousPage
      }
    }
    """

  public static let possibleTypes: [String] = ["OrderConnection"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
      GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(edges: [Edge], pageInfo: PageInfo) {
    self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Array of edges.
  public var edges: [Edge] {
    get {
      return (resultMap["edges"] as! [ResultMap]).map { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) }
    }
    set {
      resultMap.updateValue(newValue.map { (value: Edge) -> ResultMap in value.resultMap }, forKey: "edges")
    }
  }

  /// Paging information
  public var pageInfo: PageInfo {
    get {
      return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
    }
  }

  public struct Edge: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["OrderEdge"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("node", type: .nonNull(.object(Node.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(node: Node) {
      self.init(unsafeResultMap: ["__typename": "OrderEdge", "node": node.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// The node containing the Order
    public var node: Node {
      get {
        return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "node")
      }
    }

    public struct Node: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("createdOn", type: .nonNull(.scalar(Timestamp.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, points: [Point], service: Service) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "service": service.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var status: OrderStatus {
        get {
          return resultMap["status"]! as! OrderStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var createdOn: Timestamp {
        get {
          return resultMap["createdOn"]! as! Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "createdOn")
        }
      }

      public var addresses: [String] {
        get {
          return resultMap["addresses"]! as! [String]
        }
        set {
          resultMap.updateValue(newValue, forKey: "addresses")
        }
      }

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
        }
      }

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
        }
      }

      public var startTimestamp: Timestamp? {
        get {
          return resultMap["startTimestamp"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "startTimestamp")
        }
      }

      public var finishTimestamp: Timestamp? {
        get {
          return resultMap["finishTimestamp"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "finishTimestamp")
        }
      }

      public var distanceBest: Int {
        get {
          return resultMap["distanceBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "distanceBest")
        }
      }

      public var points: [Point] {
        get {
          return (resultMap["points"] as! [ResultMap]).map { (value: ResultMap) -> Point in Point(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Point) -> ResultMap in value.resultMap }, forKey: "points")
        }
      }

      public var service: Service {
        get {
          return Service(unsafeResultMap: resultMap["service"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "service")
        }
      }

      public struct Point: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Point"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("lat", type: .nonNull(.scalar(Double.self))),
            GraphQLField("lng", type: .nonNull(.scalar(Double.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(lat: Double, lng: Double) {
          self.init(unsafeResultMap: ["__typename": "Point", "lat": lat, "lng": lng])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var lat: Double {
          get {
            return resultMap["lat"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lat")
          }
        }

        public var lng: Double {
          get {
            return resultMap["lng"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "lng")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var point: Point {
            get {
              return Point(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String, media: Medium) {
          self.init(unsafeResultMap: ["__typename": "Service", "name": name, "media": media.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        public var media: Medium {
          get {
            return Medium(unsafeResultMap: resultMap["media"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "media")
          }
        }

        public struct Medium: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Media"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String) {
            self.init(unsafeResultMap: ["__typename": "Media", "address": address])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }
        }
      }
    }
  }

  public struct PageInfo: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["PageInfo"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("hasNextPage", type: .scalar(Bool.self)),
        GraphQLField("endCursor", type: .scalar(ConnectionCursor.self)),
        GraphQLField("startCursor", type: .scalar(ConnectionCursor.self)),
        GraphQLField("hasPreviousPage", type: .scalar(Bool.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hasNextPage: Bool? = nil, endCursor: ConnectionCursor? = nil, startCursor: ConnectionCursor? = nil, hasPreviousPage: Bool? = nil) {
      self.init(unsafeResultMap: ["__typename": "PageInfo", "hasNextPage": hasNextPage, "endCursor": endCursor, "startCursor": startCursor, "hasPreviousPage": hasPreviousPage])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// true if paging forward and there are more records.
    public var hasNextPage: Bool? {
      get {
        return resultMap["hasNextPage"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "hasNextPage")
      }
    }

    /// The cursor of the last returned record.
    public var endCursor: ConnectionCursor? {
      get {
        return resultMap["endCursor"] as? ConnectionCursor
      }
      set {
        resultMap.updateValue(newValue, forKey: "endCursor")
      }
    }

    /// The cursor of the first returned record.
    public var startCursor: ConnectionCursor? {
      get {
        return resultMap["startCursor"] as? ConnectionCursor
      }
      set {
        resultMap.updateValue(newValue, forKey: "startCursor")
      }
    }

    /// true if paging backwards and there are more records.
    public var hasPreviousPage: Bool? {
      get {
        return resultMap["hasPreviousPage"] as? Bool
      }
      set {
        resultMap.updateValue(newValue, forKey: "hasPreviousPage")
      }
    }
  }
}
