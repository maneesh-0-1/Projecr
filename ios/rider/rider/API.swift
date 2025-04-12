// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public enum RiderAddressType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case home
  case work
  case partner
  case other
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "Home": self = .home
      case "Work": self = .work
      case "Partner": self = .partner
      case "Other": self = .other
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .home: return "Home"
      case .work: return "Work"
      case .partner: return "Partner"
      case .other: return "Other"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RiderAddressType, rhs: RiderAddressType) -> Bool {
    switch (lhs, rhs) {
      case (.home, .home): return true
      case (.work, .work): return true
      case (.partner, .partner): return true
      case (.other, .other): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RiderAddressType] {
    return [
      .home,
      .work,
      .partner,
      .other,
    ]
  }
}

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

public enum CalculateFareError: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case regionUnsupported
  case noServiceInRegion
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "RegionUnsupported": self = .regionUnsupported
      case "NoServiceInRegion": self = .noServiceInRegion
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .regionUnsupported: return "RegionUnsupported"
      case .noServiceInRegion: return "NoServiceInRegion"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: CalculateFareError, rhs: CalculateFareError) -> Bool {
    switch (lhs, rhs) {
      case (.regionUnsupported, .regionUnsupported): return true
      case (.noServiceInRegion, .noServiceInRegion): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [CalculateFareError] {
    return [
      .regionUnsupported,
      .noServiceInRegion,
    ]
  }
}

public struct CreateOrderInput: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - serviceId
  ///   - intervalMinutes
  ///   - points
  ///   - addresses
  public init(serviceId: Int, intervalMinutes: Int, points: [PointInput], addresses: [String]) {
    graphQLMap = ["serviceId": serviceId, "intervalMinutes": intervalMinutes, "points": points, "addresses": addresses]
  }

  public var serviceId: Int {
    get {
      return graphQLMap["serviceId"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "serviceId")
    }
  }

  public var intervalMinutes: Int {
    get {
      return graphQLMap["intervalMinutes"] as! Int
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "intervalMinutes")
    }
  }

  public var points: [PointInput] {
    get {
      return graphQLMap["points"] as! [PointInput]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "points")
    }
  }

  public var addresses: [String] {
    get {
      return graphQLMap["addresses"] as! [String]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "addresses")
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

public enum RiderDeductTransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case orderFee
  case withdraw
  case correction
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "OrderFee": self = .orderFee
      case "Withdraw": self = .withdraw
      case "Correction": self = .correction
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .orderFee: return "OrderFee"
      case .withdraw: return "Withdraw"
      case .correction: return "Correction"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RiderDeductTransactionType, rhs: RiderDeductTransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.orderFee, .orderFee): return true
      case (.withdraw, .withdraw): return true
      case (.correction, .correction): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RiderDeductTransactionType] {
    return [
      .orderFee,
      .withdraw,
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

public enum RiderRechargeTransactionType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case bankTransfer
  case gift
  case correction
  case inAppPayment
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "BankTransfer": self = .bankTransfer
      case "Gift": self = .gift
      case "Correction": self = .correction
      case "InAppPayment": self = .inAppPayment
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .bankTransfer: return "BankTransfer"
      case .gift: return "Gift"
      case .correction: return "Correction"
      case .inAppPayment: return "InAppPayment"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RiderRechargeTransactionType, rhs: RiderRechargeTransactionType) -> Bool {
    switch (lhs, rhs) {
      case (.bankTransfer, .bankTransfer): return true
      case (.gift, .gift): return true
      case (.correction, .correction): return true
      case (.inAppPayment, .inAppPayment): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RiderRechargeTransactionType] {
    return [
      .bankTransfer,
      .gift,
      .correction,
      .inAppPayment,
    ]
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

public final class GetAddressesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAddresses {
      riderAddresses {
        __typename
        id
        title
        type
        details
        location {
          __typename
          ...Point
        }
      }
    }
    """

  public let operationName: String = "GetAddresses"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("riderAddresses", type: .nonNull(.list(.nonNull(.object(RiderAddress.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(riderAddresses: [RiderAddress]) {
      self.init(unsafeResultMap: ["__typename": "Query", "riderAddresses": riderAddresses.map { (value: RiderAddress) -> ResultMap in value.resultMap }])
    }

    public var riderAddresses: [RiderAddress] {
      get {
        return (resultMap["riderAddresses"] as! [ResultMap]).map { (value: ResultMap) -> RiderAddress in RiderAddress(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RiderAddress) -> ResultMap in value.resultMap }, forKey: "riderAddresses")
      }
    }

    public struct RiderAddress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderAddress"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("title", type: .nonNull(.scalar(String.self))),
          GraphQLField("type", type: .nonNull(.scalar(RiderAddressType.self))),
          GraphQLField("details", type: .nonNull(.scalar(String.self))),
          GraphQLField("location", type: .nonNull(.object(Location.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, title: String, type: RiderAddressType, details: String, location: Location) {
        self.init(unsafeResultMap: ["__typename": "RiderAddress", "id": id, "title": title, "type": type, "details": details, "location": location.resultMap])
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

      public var type: RiderAddressType {
        get {
          return resultMap["type"]! as! RiderAddressType
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      public var details: String {
        get {
          return resultMap["details"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var location: Location {
        get {
          return Location(unsafeResultMap: resultMap["location"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "location")
        }
      }

      public struct Location: GraphQLSelectionSet {
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

public final class CreateAddressMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateAddress($title: String!, $details: String!, $lat: Float!, $lng: Float!) {
      createOneRiderAddress(
        input: {riderAddress: {title: $title, details: $details, location: {lat: $lat, lng: $lng}}}
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "CreateAddress"

  public var title: String
  public var details: String
  public var lat: Double
  public var lng: Double

  public init(title: String, details: String, lat: Double, lng: Double) {
    self.title = title
    self.details = details
    self.lat = lat
    self.lng = lng
  }

  public var variables: GraphQLMap? {
    return ["title": title, "details": details, "lat": lat, "lng": lng]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOneRiderAddress", arguments: ["input": ["riderAddress": ["title": GraphQLVariable("title"), "details": GraphQLVariable("details"), "location": ["lat": GraphQLVariable("lat"), "lng": GraphQLVariable("lng")]]]], type: .nonNull(.object(CreateOneRiderAddress.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOneRiderAddress: CreateOneRiderAddress) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOneRiderAddress": createOneRiderAddress.resultMap])
    }

    public var createOneRiderAddress: CreateOneRiderAddress {
      get {
        return CreateOneRiderAddress(unsafeResultMap: resultMap["createOneRiderAddress"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOneRiderAddress")
      }
    }

    public struct CreateOneRiderAddress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderAddress"]

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
        self.init(unsafeResultMap: ["__typename": "RiderAddress", "id": id])
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

public final class DeleteAddressMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation DeleteAddress($id: ID!) {
      deleteOneRiderAddress(input: {id: $id}) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "DeleteAddress"

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("deleteOneRiderAddress", arguments: ["input": ["id": GraphQLVariable("id")]], type: .nonNull(.object(DeleteOneRiderAddress.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(deleteOneRiderAddress: DeleteOneRiderAddress) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "deleteOneRiderAddress": deleteOneRiderAddress.resultMap])
    }

    public var deleteOneRiderAddress: DeleteOneRiderAddress {
      get {
        return DeleteOneRiderAddress(unsafeResultMap: resultMap["deleteOneRiderAddress"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "deleteOneRiderAddress")
      }
    }

    public struct DeleteOneRiderAddress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderAddressDeleteResponse"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil) {
        self.init(unsafeResultMap: ["__typename": "RiderAddressDeleteResponse", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}

public final class UpdateAddressMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateAddress($id: ID!, $title: String!, $details: String!, $lat: Float!, $lng: Float!) {
      updateOneRiderAddress(
        input: {id: $id, update: {title: $title, details: $details, location: {lat: $lat, lng: $lng}}}
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "UpdateAddress"

  public var id: GraphQLID
  public var title: String
  public var details: String
  public var lat: Double
  public var lng: Double

  public init(id: GraphQLID, title: String, details: String, lat: Double, lng: Double) {
    self.id = id
    self.title = title
    self.details = details
    self.lat = lat
    self.lng = lng
  }

  public var variables: GraphQLMap? {
    return ["id": id, "title": title, "details": details, "lat": lat, "lng": lng]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneRiderAddress", arguments: ["input": ["id": GraphQLVariable("id"), "update": ["title": GraphQLVariable("title"), "details": GraphQLVariable("details"), "location": ["lat": GraphQLVariable("lat"), "lng": GraphQLVariable("lng")]]]], type: .nonNull(.object(UpdateOneRiderAddress.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneRiderAddress: UpdateOneRiderAddress) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneRiderAddress": updateOneRiderAddress.resultMap])
    }

    public var updateOneRiderAddress: UpdateOneRiderAddress {
      get {
        return UpdateOneRiderAddress(unsafeResultMap: resultMap["updateOneRiderAddress"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneRiderAddress")
      }
    }

    public struct UpdateOneRiderAddress: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderAddress"]

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
        self.init(unsafeResultMap: ["__typename": "RiderAddress", "id": id])
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

public final class GetAnnouncementsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetAnnouncements {
      announcements(paging: {first: 50}) {
        __typename
        edges {
          __typename
          node {
            __typename
            id
            title
            startAt
            expireAt
            description
          }
        }
      }
    }
    """

  public let operationName: String = "GetAnnouncements"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("announcements", arguments: ["paging": ["first": 50]], type: .nonNull(.object(Announcement.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(announcements: Announcement) {
      self.init(unsafeResultMap: ["__typename": "Query", "announcements": announcements.resultMap])
    }

    public var announcements: Announcement {
      get {
        return Announcement(unsafeResultMap: resultMap["announcements"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "announcements")
      }
    }

    public struct Announcement: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AnnouncementConnection"]

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
        self.init(unsafeResultMap: ["__typename": "AnnouncementConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
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
        public static let possibleTypes: [String] = ["AnnouncementEdge"]

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
          self.init(unsafeResultMap: ["__typename": "AnnouncementEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The node containing the Announcement
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Announcement"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("title", type: .nonNull(.scalar(String.self))),
              GraphQLField("startAt", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("expireAt", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("description", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, title: String, startAt: Timestamp, expireAt: Timestamp, description: String) {
            self.init(unsafeResultMap: ["__typename": "Announcement", "id": id, "title": title, "startAt": startAt, "expireAt": expireAt, "description": description])
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

          public var startAt: Timestamp {
            get {
              return resultMap["startAt"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "startAt")
            }
          }

          public var expireAt: Timestamp {
            get {
              return resultMap["expireAt"]! as! Timestamp
            }
            set {
              resultMap.updateValue(newValue, forKey: "expireAt")
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
      currentOrder {
        __typename
        id
        conversations {
          __typename
          ...MessageFragment
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
        GraphQLField("currentOrder", type: .nonNull(.object(CurrentOrder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentOrder: CurrentOrder) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentOrder": currentOrder.resultMap])
    }

    public var currentOrder: CurrentOrder {
      get {
        return CurrentOrder(unsafeResultMap: resultMap["currentOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "currentOrder")
      }
    }

    public struct CurrentOrder: GraphQLSelectionSet {
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
              GraphQLField("driver", type: .object(Driver.selections)),
              GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(driver: Driver? = nil, rider: Rider) {
            self.init(unsafeResultMap: ["__typename": "Order", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "rider": rider.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var driver: Driver? {
            get {
              return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

          public struct Driver: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Driver"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
                GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
                GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
                GraphQLField("media", type: .object(Medium.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil) {
              self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

            public var firstName: String {
              get {
                return resultMap["firstName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String {
              get {
                return resultMap["lastName"]! as! String
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
            GraphQLField("driver", type: .object(Driver.selections)),
            GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(driver: Driver? = nil, rider: Rider) {
          self.init(unsafeResultMap: ["__typename": "Order", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "rider": rider.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var driver: Driver? {
          get {
            return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

        public struct Driver: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Driver"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
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
            GraphQLField("driver", type: .object(Driver.selections)),
            GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(driver: Driver? = nil, rider: Rider) {
          self.init(unsafeResultMap: ["__typename": "Order", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "rider": rider.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var driver: Driver? {
          get {
            return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

        public struct Driver: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Driver"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              GraphQLField("media", type: .object(Medium.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil) {
            self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
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

public final class HistoryQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query History {
      completed: orders(filter: {status: {eq: Finished}}) {
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
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("orders", alias: "completed", arguments: ["filter": ["status": ["eq": "Finished"]]], type: .nonNull(.object(Completed.selections))),
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
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
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
              GraphQLField("paymentGateway", type: .object(PaymentGateway.selections)),
              GraphQLField("driver", type: .object(Driver.selections)),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, paymentGateway: PaymentGateway? = nil, driver: Driver? = nil, service: Service) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "paymentGateway": paymentGateway.flatMap { (value: PaymentGateway) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap])
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

          public var paymentGateway: PaymentGateway? {
            get {
              return (resultMap["paymentGateway"] as? ResultMap).flatMap { PaymentGateway(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "paymentGateway")
            }
          }

          public var driver: Driver? {
            get {
              return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

          public struct PaymentGateway: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PaymentGateway"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String) {
              self.init(unsafeResultMap: ["__typename": "PaymentGateway", "title": title])
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
          }

          public struct Driver: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Driver"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
                GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(firstName: String, lastName: String) {
              self.init(unsafeResultMap: ["__typename": "Driver", "firstName": firstName, "lastName": lastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var firstName: String {
              get {
                return resultMap["firstName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String {
              get {
                return resultMap["lastName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("media", type: .nonNull(.object(Medium.selections))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(media: Medium, name: String) {
              self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
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

    public struct Canceled: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["OrderConnection"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("edges", type: .nonNull(.list(.nonNull(.object(Edge.selections))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge]) {
        self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
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
              GraphQLField("paymentGateway", type: .object(PaymentGateway.selections)),
              GraphQLField("driver", type: .object(Driver.selections)),
              GraphQLField("service", type: .nonNull(.object(Service.selections))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, paymentGateway: PaymentGateway? = nil, driver: Driver? = nil, service: Service) {
            self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "paymentGateway": paymentGateway.flatMap { (value: PaymentGateway) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap])
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

          public var paymentGateway: PaymentGateway? {
            get {
              return (resultMap["paymentGateway"] as? ResultMap).flatMap { PaymentGateway(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "paymentGateway")
            }
          }

          public var driver: Driver? {
            get {
              return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

          public struct PaymentGateway: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["PaymentGateway"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("title", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: String) {
              self.init(unsafeResultMap: ["__typename": "PaymentGateway", "title": title])
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
          }

          public struct Driver: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Driver"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
                GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(firstName: String, lastName: String) {
              self.init(unsafeResultMap: ["__typename": "Driver", "firstName": firstName, "lastName": lastName])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var firstName: String {
              get {
                return resultMap["firstName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "firstName")
              }
            }

            public var lastName: String {
              get {
                return resultMap["lastName"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "lastName")
              }
            }
          }

          public struct Service: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Service"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("media", type: .nonNull(.object(Medium.selections))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(media: Medium, name: String) {
              self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "name": name])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
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

            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
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

public final class GetCurrentOrderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetCurrentOrder {
      currentOrderWithLocation {
        __typename
        order {
          __typename
          ...CurrentOrder
        }
        driverLocation {
          __typename
          ...Point
        }
      }
    }
    """

  public let operationName: String = "GetCurrentOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
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
        GraphQLField("currentOrderWithLocation", type: .nonNull(.object(CurrentOrderWithLocation.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(currentOrderWithLocation: CurrentOrderWithLocation) {
      self.init(unsafeResultMap: ["__typename": "Query", "currentOrderWithLocation": currentOrderWithLocation.resultMap])
    }

    public var currentOrderWithLocation: CurrentOrderWithLocation {
      get {
        return CurrentOrderWithLocation(unsafeResultMap: resultMap["currentOrderWithLocation"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "currentOrderWithLocation")
      }
    }

    public struct CurrentOrderWithLocation: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CurrentOrder"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("order", type: .nonNull(.object(Order.selections))),
          GraphQLField("driverLocation", type: .object(DriverLocation.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(order: Order, driverLocation: DriverLocation? = nil) {
        self.init(unsafeResultMap: ["__typename": "CurrentOrder", "order": order.resultMap, "driverLocation": driverLocation.flatMap { (value: DriverLocation) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var order: Order {
        get {
          return Order(unsafeResultMap: resultMap["order"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "order")
        }
      }

      public var driverLocation: DriverLocation? {
        get {
          return (resultMap["driverLocation"] as? ResultMap).flatMap { DriverLocation(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driverLocation")
        }
      }

      public struct Order: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Order"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
            GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
            GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
            GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
            GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
            GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
            GraphQLField("driver", type: .object(Driver.selections)),
            GraphQLField("service", type: .nonNull(.object(Service.selections))),
            GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
            GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
            GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
            GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
            GraphQLField("currency", type: .nonNull(.scalar(String.self))),
            GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
          self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

        public var durationBest: Int {
          get {
            return resultMap["durationBest"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "durationBest")
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

        public var driver: Driver? {
          get {
            return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

        public var etaPickup: Timestamp? {
          get {
            return resultMap["etaPickup"] as? Timestamp
          }
          set {
            resultMap.updateValue(newValue, forKey: "etaPickup")
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

        public var costAfterCoupon: Double {
          get {
            return resultMap["costAfterCoupon"]! as! Double
          }
          set {
            resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

        public var currency: String {
          get {
            return resultMap["currency"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "currency")
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

        public struct Driver: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Driver"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
              GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
              GraphQLField("media", type: .object(Medium.selections)),
              GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
              GraphQLField("carPlate", type: .scalar(String.self)),
              GraphQLField("car", type: .object(Car.selections)),
              GraphQLField("carColor", type: .object(CarColor.selections)),
              GraphQLField("rating", type: .scalar(Int.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

          public var firstName: String {
            get {
              return resultMap["firstName"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "firstName")
            }
          }

          public var lastName: String {
            get {
              return resultMap["lastName"]! as! String
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

          public var mobileNumber: String {
            get {
              return resultMap["mobileNumber"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "mobileNumber")
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

          public var car: Car? {
            get {
              return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "car")
            }
          }

          public var carColor: CarColor? {
            get {
              return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
            }
          }

          public var rating: Int? {
            get {
              return resultMap["rating"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "rating")
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

          public struct Car: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CarModel"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
          }

          public struct CarColor: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["CarColor"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String) {
              self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
          }
        }

        public struct Service: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Service"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("media", type: .nonNull(.object(Medium.selections))),
              GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
            self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
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

          public var paymentMethod: ServicePaymentMethod {
            get {
              return resultMap["paymentMethod"]! as! ServicePaymentMethod
            }
            set {
              resultMap.updateValue(newValue, forKey: "paymentMethod")
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

      public struct DriverLocation: GraphQLSelectionSet {
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

public final class CalculateFareMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CalculateFare($points: [PointInput!]!) {
      calculateFare(input: {points: $points}) {
        __typename
        distance
        duration
        currency
        services {
          __typename
          id
          name
          services {
            __typename
            id
            name
            cancellationTotalFee
            media {
              __typename
              address
            }
            cost
          }
        }
        error
      }
    }
    """

  public let operationName: String = "CalculateFare"

  public var points: [PointInput]

  public init(points: [PointInput]) {
    self.points = points
  }

  public var variables: GraphQLMap? {
    return ["points": points]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("calculateFare", arguments: ["input": ["points": GraphQLVariable("points")]], type: .nonNull(.object(CalculateFare.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(calculateFare: CalculateFare) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "calculateFare": calculateFare.resultMap])
    }

    public var calculateFare: CalculateFare {
      get {
        return CalculateFare(unsafeResultMap: resultMap["calculateFare"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "calculateFare")
      }
    }

    public struct CalculateFare: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CalculateFareDTO"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("distance", type: .nonNull(.scalar(Double.self))),
          GraphQLField("duration", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("services", type: .nonNull(.list(.nonNull(.object(Service.selections))))),
          GraphQLField("error", type: .scalar(CalculateFareError.self)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(distance: Double, duration: Double, currency: String, services: [Service], error: CalculateFareError? = nil) {
        self.init(unsafeResultMap: ["__typename": "CalculateFareDTO", "distance": distance, "duration": duration, "currency": currency, "services": services.map { (value: Service) -> ResultMap in value.resultMap }, "error": error])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
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

      public var duration: Double {
        get {
          return resultMap["duration"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "duration")
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

      public var services: [Service] {
        get {
          return (resultMap["services"] as! [ResultMap]).map { (value: ResultMap) -> Service in Service(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Service) -> ResultMap in value.resultMap }, forKey: "services")
        }
      }

      public var error: CalculateFareError? {
        get {
          return resultMap["error"] as? CalculateFareError
        }
        set {
          resultMap.updateValue(newValue, forKey: "error")
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["ServiceCategory"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
            GraphQLField("services", type: .nonNull(.list(.nonNull(.object(Service.selections))))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String, services: [Service]) {
          self.init(unsafeResultMap: ["__typename": "ServiceCategory", "id": id, "name": name, "services": services.map { (value: Service) -> ResultMap in value.resultMap }])
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

        public var services: [Service] {
          get {
            return (resultMap["services"] as! [ResultMap]).map { (value: ResultMap) -> Service in Service(unsafeResultMap: value) }
          }
          set {
            resultMap.updateValue(newValue.map { (value: Service) -> ResultMap in value.resultMap }, forKey: "services")
          }
        }

        public struct Service: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Service"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("cancellationTotalFee", type: .nonNull(.scalar(Double.self))),
              GraphQLField("media", type: .nonNull(.object(Medium.selections))),
              GraphQLField("cost", type: .nonNull(.scalar(Double.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, name: String, cancellationTotalFee: Double, media: Medium, cost: Double) {
            self.init(unsafeResultMap: ["__typename": "Service", "id": id, "name": name, "cancellationTotalFee": cancellationTotalFee, "media": media.resultMap, "cost": cost])
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

          public var cancellationTotalFee: Double {
            get {
              return resultMap["cancellationTotalFee"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "cancellationTotalFee")
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

          public var cost: Double {
            get {
              return resultMap["cost"]! as! Double
            }
            set {
              resultMap.updateValue(newValue, forKey: "cost")
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

public final class CreateOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateOrder($input: CreateOrderInput!) {
      createOrder(input: $input) {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "CreateOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var input: CreateOrderInput

  public init(input: CreateOrderInput) {
    self.input = input
  }

  public var variables: GraphQLMap? {
    return ["input": input]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createOrder", arguments: ["input": GraphQLVariable("input")], type: .nonNull(.object(CreateOrder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createOrder: CreateOrder) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createOrder": createOrder.resultMap])
    }

    public var createOrder: CreateOrder {
      get {
        return CreateOrder(unsafeResultMap: resultMap["createOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createOrder")
      }
    }

    public struct CreateOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
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

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
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

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
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

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("carPlate", type: .scalar(String.self)),
            GraphQLField("car", type: .object(Car.selections)),
            GraphQLField("carColor", type: .object(CarColor.selections)),
            GraphQLField("rating", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
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

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
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

        public var car: Car? {
          get {
            return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "car")
          }
        }

        public var carColor: CarColor? {
          get {
            return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
          }
        }

        public var rating: Int? {
          get {
            return resultMap["rating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
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

        public struct Car: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarModel"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
        }

        public struct CarColor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarColor"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
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

public final class CancelOrderMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CancelOrder {
      cancelOrder {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "CancelOrder"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("cancelOrder", type: .nonNull(.object(CancelOrder.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(cancelOrder: CancelOrder) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "cancelOrder": cancelOrder.resultMap])
    }

    public var cancelOrder: CancelOrder {
      get {
        return CancelOrder(unsafeResultMap: resultMap["cancelOrder"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "cancelOrder")
      }
    }

    public struct CancelOrder: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
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

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
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

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
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

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("carPlate", type: .scalar(String.self)),
            GraphQLField("car", type: .object(Car.selections)),
            GraphQLField("carColor", type: .object(CarColor.selections)),
            GraphQLField("rating", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
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

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
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

        public var car: Car? {
          get {
            return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "car")
          }
        }

        public var carColor: CarColor? {
          get {
            return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
          }
        }

        public var rating: Int? {
          get {
            return resultMap["rating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
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

        public struct Car: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarModel"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
        }

        public struct CarColor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarColor"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
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

public final class UpdatedOrderSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription UpdatedOrder {
      orderUpdated {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "UpdatedOrder"

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
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
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

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
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

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
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

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("carPlate", type: .scalar(String.self)),
            GraphQLField("car", type: .object(Car.selections)),
            GraphQLField("carColor", type: .object(CarColor.selections)),
            GraphQLField("rating", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
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

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
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

        public var car: Car? {
          get {
            return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "car")
          }
        }

        public var carColor: CarColor? {
          get {
            return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
          }
        }

        public var rating: Int? {
          get {
            return resultMap["rating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
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

        public struct Car: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarModel"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
        }

        public struct CarColor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarColor"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
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

public final class DriverLocationUpdatedSubscription: GraphQLSubscription {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    subscription DriverLocationUpdated($driverId: ID!) {
      driverLocationUpdated(driverId: $driverId) {
        __typename
        ...Point
      }
    }
    """

  public let operationName: String = "DriverLocationUpdated"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var driverId: GraphQLID

  public init(driverId: GraphQLID) {
    self.driverId = driverId
  }

  public var variables: GraphQLMap? {
    return ["driverId": driverId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Subscription"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("driverLocationUpdated", arguments: ["driverId": GraphQLVariable("driverId")], type: .nonNull(.object(DriverLocationUpdated.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driverLocationUpdated: DriverLocationUpdated) {
      self.init(unsafeResultMap: ["__typename": "Subscription", "driverLocationUpdated": driverLocationUpdated.resultMap])
    }

    public var driverLocationUpdated: DriverLocationUpdated {
      get {
        return DriverLocationUpdated(unsafeResultMap: resultMap["driverLocationUpdated"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "driverLocationUpdated")
      }
    }

    public struct DriverLocationUpdated: GraphQLSelectionSet {
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

public final class SubmitFeedbackMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation SubmitFeedback($score: Int!, $description: String!, $orderId: ID!) {
      submitReview(
        review: {score: $score, description: $description, requestId: $orderId}
      ) {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "SubmitFeedback"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var score: Int
  public var description: String
  public var orderId: GraphQLID

  public init(score: Int, description: String, orderId: GraphQLID) {
    self.score = score
    self.description = description
    self.orderId = orderId
  }

  public var variables: GraphQLMap? {
    return ["score": score, "description": description, "orderId": orderId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("submitReview", arguments: ["review": ["score": GraphQLVariable("score"), "description": GraphQLVariable("description"), "requestId": GraphQLVariable("orderId")]], type: .nonNull(.object(SubmitReview.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(submitReview: SubmitReview) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "submitReview": submitReview.resultMap])
    }

    public var submitReview: SubmitReview {
      get {
        return SubmitReview(unsafeResultMap: resultMap["submitReview"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "submitReview")
      }
    }

    public struct SubmitReview: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
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

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
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

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
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

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("carPlate", type: .scalar(String.self)),
            GraphQLField("car", type: .object(Car.selections)),
            GraphQLField("carColor", type: .object(CarColor.selections)),
            GraphQLField("rating", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
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

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
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

        public var car: Car? {
          get {
            return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "car")
          }
        }

        public var carColor: CarColor? {
          get {
            return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
          }
        }

        public var rating: Int? {
          get {
            return resultMap["rating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
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

        public struct Car: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarModel"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
        }

        public struct CarColor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarColor"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
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

public final class GetDriversLocationQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetDriversLocation($point: PointInput) {
      getDriversLocation(center: $point) {
        __typename
        ...Point
      }
    }
    """

  public let operationName: String = "GetDriversLocation"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var point: PointInput?

  public init(point: PointInput? = nil) {
    self.point = point
  }

  public var variables: GraphQLMap? {
    return ["point": point]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("getDriversLocation", arguments: ["center": GraphQLVariable("point")], type: .nonNull(.list(.nonNull(.object(GetDriversLocation.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(getDriversLocation: [GetDriversLocation]) {
      self.init(unsafeResultMap: ["__typename": "Query", "getDriversLocation": getDriversLocation.map { (value: GetDriversLocation) -> ResultMap in value.resultMap }])
    }

    public var getDriversLocation: [GetDriversLocation] {
      get {
        return (resultMap["getDriversLocation"] as! [ResultMap]).map { (value: ResultMap) -> GetDriversLocation in GetDriversLocation(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: GetDriversLocation) -> ResultMap in value.resultMap }, forKey: "getDriversLocation")
      }
    }

    public struct GetDriversLocation: GraphQLSelectionSet {
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

public final class ApplyCouponMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation ApplyCoupon($code: String!) {
      applyCoupon(code: $code) {
        __typename
        ...CurrentOrder
      }
    }
    """

  public let operationName: String = "ApplyCoupon"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + CurrentOrder.fragmentDefinition)
    document.append("\n" + Point.fragmentDefinition)
    return document
  }

  public var code: String

  public init(code: String) {
    self.code = code
  }

  public var variables: GraphQLMap? {
    return ["code": code]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("applyCoupon", arguments: ["code": GraphQLVariable("code")], type: .nonNull(.object(ApplyCoupon.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(applyCoupon: ApplyCoupon) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "applyCoupon": applyCoupon.resultMap])
    }

    public var applyCoupon: ApplyCoupon {
      get {
        return ApplyCoupon(unsafeResultMap: resultMap["applyCoupon"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "applyCoupon")
      }
    }

    public struct ApplyCoupon: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Order"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
          GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
          GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
          GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
          GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
          GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
          GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
          GraphQLField("currency", type: .nonNull(.scalar(String.self))),
          GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

      public var durationBest: Int {
        get {
          return resultMap["durationBest"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "durationBest")
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

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public var etaPickup: Timestamp? {
        get {
          return resultMap["etaPickup"] as? Timestamp
        }
        set {
          resultMap.updateValue(newValue, forKey: "etaPickup")
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

      public var costAfterCoupon: Double {
        get {
          return resultMap["costAfterCoupon"]! as! Double
        }
        set {
          resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

      public var currency: String {
        get {
          return resultMap["currency"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "currency")
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

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
            GraphQLField("carPlate", type: .scalar(String.self)),
            GraphQLField("car", type: .object(Car.selections)),
            GraphQLField("carColor", type: .object(CarColor.selections)),
            GraphQLField("rating", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
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

        public var mobileNumber: String {
          get {
            return resultMap["mobileNumber"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mobileNumber")
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

        public var car: Car? {
          get {
            return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "car")
          }
        }

        public var carColor: CarColor? {
          get {
            return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
          }
        }

        public var rating: Int? {
          get {
            return resultMap["rating"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "rating")
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

        public struct Car: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarModel"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
        }

        public struct CarColor: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CarColor"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String) {
            self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var paymentMethod: ServicePaymentMethod {
          get {
            return resultMap["paymentMethod"]! as! ServicePaymentMethod
          }
          set {
            resultMap.updateValue(newValue, forKey: "paymentMethod")
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

public final class GetRiderQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetRider {
      rider(id: 1) {
        __typename
        ...BasicProfile
      }
    }
    """

  public let operationName: String = "GetRider"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + BasicProfile.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("rider", arguments: ["id": 1], type: .object(Rider.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(rider: Rider? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "rider": rider.flatMap { (value: Rider) -> ResultMap in value.resultMap }])
    }

    public var rider: Rider? {
      get {
        return (resultMap["rider"] as? ResultMap).flatMap { Rider(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "rider")
      }
    }

    public struct Rider: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rider"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
          GraphQLField("firstName", type: .scalar(String.self)),
          GraphQLField("lastName", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(Gender.self)),
          GraphQLField("email", type: .scalar(String.self)),
          GraphQLField("media", type: .object(Medium.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, gender: Gender? = nil, email: String? = nil, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "gender": gender, "email": email, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
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
    }
  }
}

public final class UpdateProfileMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateProfile($firstName: String!, $lastName: String!, $gender: Gender, $email: String) {
      updateOneRider(
        input: {id: "1", update: {firstName: $firstName, lastName: $lastName, gender: $gender, email: $email}}
      ) {
        __typename
        id
      }
    }
    """

  public let operationName: String = "UpdateProfile"

  public var firstName: String
  public var lastName: String
  public var gender: Gender?
  public var email: String?

  public init(firstName: String, lastName: String, gender: Gender? = nil, email: String? = nil) {
    self.firstName = firstName
    self.lastName = lastName
    self.gender = gender
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["firstName": firstName, "lastName": lastName, "gender": gender, "email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateOneRider", arguments: ["input": ["id": "1", "update": ["firstName": GraphQLVariable("firstName"), "lastName": GraphQLVariable("lastName"), "gender": GraphQLVariable("gender"), "email": GraphQLVariable("email")]]], type: .nonNull(.object(UpdateOneRider.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateOneRider: UpdateOneRider) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateOneRider": updateOneRider.resultMap])
    }

    public var updateOneRider: UpdateOneRider {
      get {
        return UpdateOneRider(unsafeResultMap: resultMap["updateOneRider"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "updateOneRider")
      }
    }

    public struct UpdateOneRider: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Rider"]

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
        self.init(unsafeResultMap: ["__typename": "Rider", "id": id])
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
      riderWallets {
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
        GraphQLField("riderWallets", type: .nonNull(.list(.nonNull(.object(RiderWallet.selections))))),
        GraphQLField("paymentGateways", type: .nonNull(.list(.nonNull(.object(PaymentGateway.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(riderWallets: [RiderWallet], paymentGateways: [PaymentGateway]) {
      self.init(unsafeResultMap: ["__typename": "Query", "riderWallets": riderWallets.map { (value: RiderWallet) -> ResultMap in value.resultMap }, "paymentGateways": paymentGateways.map { (value: PaymentGateway) -> ResultMap in value.resultMap }])
    }

    public var riderWallets: [RiderWallet] {
      get {
        return (resultMap["riderWallets"] as! [ResultMap]).map { (value: ResultMap) -> RiderWallet in RiderWallet(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: RiderWallet) -> ResultMap in value.resultMap }, forKey: "riderWallets")
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

    public struct RiderWallet: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderWallet"]

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
        self.init(unsafeResultMap: ["__typename": "RiderWallet", "id": id, "balance": balance, "currency": currency])
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
      riderTransacions {
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
        GraphQLField("riderTransacions", type: .nonNull(.object(RiderTransacion.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(riderTransacions: RiderTransacion) {
      self.init(unsafeResultMap: ["__typename": "Query", "riderTransacions": riderTransacions.resultMap])
    }

    public var riderTransacions: RiderTransacion {
      get {
        return RiderTransacion(unsafeResultMap: resultMap["riderTransacions"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "riderTransacions")
      }
    }

    public struct RiderTransacion: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RiderTransacionConnection"]

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
        self.init(unsafeResultMap: ["__typename": "RiderTransacionConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
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
        public static let possibleTypes: [String] = ["RiderTransacionEdge"]

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
          self.init(unsafeResultMap: ["__typename": "RiderTransacionEdge", "node": node.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The node containing the RiderTransacion
        public var node: Node {
          get {
            return Node(unsafeResultMap: resultMap["node"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["RiderTransacion"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("createdAt", type: .nonNull(.scalar(Timestamp.self))),
              GraphQLField("amount", type: .nonNull(.scalar(Double.self))),
              GraphQLField("currency", type: .nonNull(.scalar(String.self))),
              GraphQLField("refrenceNumber", type: .scalar(String.self)),
              GraphQLField("deductType", type: .scalar(RiderDeductTransactionType.self)),
              GraphQLField("action", type: .nonNull(.scalar(TransactionAction.self))),
              GraphQLField("rechargeType", type: .scalar(RiderRechargeTransactionType.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(createdAt: Timestamp, amount: Double, currency: String, refrenceNumber: String? = nil, deductType: RiderDeductTransactionType? = nil, action: TransactionAction, rechargeType: RiderRechargeTransactionType? = nil) {
            self.init(unsafeResultMap: ["__typename": "RiderTransacion", "createdAt": createdAt, "amount": amount, "currency": currency, "refrenceNumber": refrenceNumber, "deductType": deductType, "action": action, "rechargeType": rechargeType])
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

          public var deductType: RiderDeductTransactionType? {
            get {
              return resultMap["deductType"] as? RiderDeductTransactionType
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

          public var rechargeType: RiderRechargeTransactionType? {
            get {
              return resultMap["rechargeType"] as? RiderRechargeTransactionType
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

public struct CurrentOrder: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment CurrentOrder on Order {
      __typename
      id
      status
      startTimestamp
      finishTimestamp
      durationBest
      distanceBest
      points {
        __typename
        ...Point
      }
      driver {
        __typename
        id
        firstName
        lastName
        media {
          __typename
          address
        }
        mobileNumber
        carPlate
        car {
          __typename
          name
        }
        carColor {
          __typename
          name
        }
        rating
      }
      service {
        __typename
        media {
          __typename
          address
        }
        paymentMethod
        name
      }
      etaPickup
      paidAmount
      costAfterCoupon
      costBest
      currency
      addresses
    }
    """

  public static let possibleTypes: [String] = ["Order"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("status", type: .nonNull(.scalar(OrderStatus.self))),
      GraphQLField("startTimestamp", type: .scalar(Timestamp.self)),
      GraphQLField("finishTimestamp", type: .scalar(Timestamp.self)),
      GraphQLField("durationBest", type: .nonNull(.scalar(Int.self))),
      GraphQLField("distanceBest", type: .nonNull(.scalar(Int.self))),
      GraphQLField("points", type: .nonNull(.list(.nonNull(.object(Point.selections))))),
      GraphQLField("driver", type: .object(Driver.selections)),
      GraphQLField("service", type: .nonNull(.object(Service.selections))),
      GraphQLField("etaPickup", type: .scalar(Timestamp.self)),
      GraphQLField("paidAmount", type: .nonNull(.scalar(Double.self))),
      GraphQLField("costAfterCoupon", type: .nonNull(.scalar(Double.self))),
      GraphQLField("costBest", type: .nonNull(.scalar(Double.self))),
      GraphQLField("currency", type: .nonNull(.scalar(String.self))),
      GraphQLField("addresses", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, status: OrderStatus, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, durationBest: Int, distanceBest: Int, points: [Point], driver: Driver? = nil, service: Service, etaPickup: Timestamp? = nil, paidAmount: Double, costAfterCoupon: Double, costBest: Double, currency: String, addresses: [String]) {
    self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "durationBest": durationBest, "distanceBest": distanceBest, "points": points.map { (value: Point) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap, "etaPickup": etaPickup, "paidAmount": paidAmount, "costAfterCoupon": costAfterCoupon, "costBest": costBest, "currency": currency, "addresses": addresses])
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

  public var durationBest: Int {
    get {
      return resultMap["durationBest"]! as! Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "durationBest")
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

  public var driver: Driver? {
    get {
      return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

  public var etaPickup: Timestamp? {
    get {
      return resultMap["etaPickup"] as? Timestamp
    }
    set {
      resultMap.updateValue(newValue, forKey: "etaPickup")
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

  public var costAfterCoupon: Double {
    get {
      return resultMap["costAfterCoupon"]! as! Double
    }
    set {
      resultMap.updateValue(newValue, forKey: "costAfterCoupon")
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

  public var currency: String {
    get {
      return resultMap["currency"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "currency")
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

  public struct Driver: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Driver"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
        GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
        GraphQLField("media", type: .object(Medium.selections)),
        GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
        GraphQLField("carPlate", type: .scalar(String.self)),
        GraphQLField("car", type: .object(Car.selections)),
        GraphQLField("carColor", type: .object(CarColor.selections)),
        GraphQLField("rating", type: .scalar(Int.self)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil, mobileNumber: String, carPlate: String? = nil, car: Car? = nil, carColor: CarColor? = nil, rating: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "mobileNumber": mobileNumber, "carPlate": carPlate, "car": car.flatMap { (value: Car) -> ResultMap in value.resultMap }, "carColor": carColor.flatMap { (value: CarColor) -> ResultMap in value.resultMap }, "rating": rating])
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

    public var firstName: String {
      get {
        return resultMap["firstName"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "firstName")
      }
    }

    public var lastName: String {
      get {
        return resultMap["lastName"]! as! String
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

    public var mobileNumber: String {
      get {
        return resultMap["mobileNumber"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "mobileNumber")
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

    public var car: Car? {
      get {
        return (resultMap["car"] as? ResultMap).flatMap { Car(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "car")
      }
    }

    public var carColor: CarColor? {
      get {
        return (resultMap["carColor"] as? ResultMap).flatMap { CarColor(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "carColor")
      }
    }

    public var rating: Int? {
      get {
        return resultMap["rating"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "rating")
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

    public struct Car: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CarModel"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "CarModel", "name": name])
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
    }

    public struct CarColor: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CarColor"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String) {
        self.init(unsafeResultMap: ["__typename": "CarColor", "name": name])
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
    }
  }

  public struct Service: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Service"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("media", type: .nonNull(.object(Medium.selections))),
        GraphQLField("paymentMethod", type: .nonNull(.scalar(ServicePaymentMethod.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium, paymentMethod: ServicePaymentMethod, name: String) {
      self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "paymentMethod": paymentMethod, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
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

    public var paymentMethod: ServicePaymentMethod {
      get {
        return resultMap["paymentMethod"]! as! ServicePaymentMethod
      }
      set {
        resultMap.updateValue(newValue, forKey: "paymentMethod")
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
          paymentGateway {
            __typename
            title
          }
          driver {
            __typename
            firstName
            lastName
          }
          service {
            __typename
            media {
              __typename
              address
            }
            name
          }
        }
      }
    }
    """

  public static let possibleTypes: [String] = ["OrderConnection"]

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
    self.init(unsafeResultMap: ["__typename": "OrderConnection", "edges": edges.map { (value: Edge) -> ResultMap in value.resultMap }])
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
          GraphQLField("paymentGateway", type: .object(PaymentGateway.selections)),
          GraphQLField("driver", type: .object(Driver.selections)),
          GraphQLField("service", type: .nonNull(.object(Service.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, status: OrderStatus, createdOn: Timestamp, addresses: [String], currency: String, costAfterCoupon: Double, startTimestamp: Timestamp? = nil, finishTimestamp: Timestamp? = nil, distanceBest: Int, paymentGateway: PaymentGateway? = nil, driver: Driver? = nil, service: Service) {
        self.init(unsafeResultMap: ["__typename": "Order", "id": id, "status": status, "createdOn": createdOn, "addresses": addresses, "currency": currency, "costAfterCoupon": costAfterCoupon, "startTimestamp": startTimestamp, "finishTimestamp": finishTimestamp, "distanceBest": distanceBest, "paymentGateway": paymentGateway.flatMap { (value: PaymentGateway) -> ResultMap in value.resultMap }, "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "service": service.resultMap])
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

      public var paymentGateway: PaymentGateway? {
        get {
          return (resultMap["paymentGateway"] as? ResultMap).flatMap { PaymentGateway(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "paymentGateway")
        }
      }

      public var driver: Driver? {
        get {
          return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

      public struct PaymentGateway: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaymentGateway"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("title", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: String) {
          self.init(unsafeResultMap: ["__typename": "PaymentGateway", "title": title])
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
      }

      public struct Driver: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Driver"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
            GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(firstName: String, lastName: String) {
          self.init(unsafeResultMap: ["__typename": "Driver", "firstName": firstName, "lastName": lastName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var firstName: String {
          get {
            return resultMap["firstName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "firstName")
          }
        }

        public var lastName: String {
          get {
            return resultMap["lastName"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "lastName")
          }
        }
      }

      public struct Service: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Service"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .nonNull(.object(Medium.selections))),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(media: Medium, name: String) {
          self.init(unsafeResultMap: ["__typename": "Service", "media": media.resultMap, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
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

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
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
        driver {
          __typename
          id
          firstName
          lastName
          media {
            __typename
            address
          }
        }
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
        GraphQLField("driver", type: .object(Driver.selections)),
        GraphQLField("rider", type: .nonNull(.object(Rider.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(driver: Driver? = nil, rider: Rider) {
      self.init(unsafeResultMap: ["__typename": "Order", "driver": driver.flatMap { (value: Driver) -> ResultMap in value.resultMap }, "rider": rider.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var driver: Driver? {
      get {
        return (resultMap["driver"] as? ResultMap).flatMap { Driver(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "driver")
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

    public struct Driver: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Driver"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("firstName", type: .nonNull(.scalar(String.self))),
          GraphQLField("lastName", type: .nonNull(.scalar(String.self))),
          GraphQLField("media", type: .object(Medium.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, firstName: String, lastName: String, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "Driver", "id": id, "firstName": firstName, "lastName": lastName, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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

      public var firstName: String {
        get {
          return resultMap["firstName"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "firstName")
        }
      }

      public var lastName: String {
        get {
          return resultMap["lastName"]! as! String
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
    fragment BasicProfile on Rider {
      __typename
      id
      mobileNumber
      firstName
      lastName
      gender
      email
      media {
        __typename
        address
      }
    }
    """

  public static let possibleTypes: [String] = ["Rider"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("mobileNumber", type: .nonNull(.scalar(String.self))),
      GraphQLField("firstName", type: .scalar(String.self)),
      GraphQLField("lastName", type: .scalar(String.self)),
      GraphQLField("gender", type: .scalar(Gender.self)),
      GraphQLField("email", type: .scalar(String.self)),
      GraphQLField("media", type: .object(Medium.selections)),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, mobileNumber: String, firstName: String? = nil, lastName: String? = nil, gender: Gender? = nil, email: String? = nil, media: Medium? = nil) {
    self.init(unsafeResultMap: ["__typename": "Rider", "id": id, "mobileNumber": mobileNumber, "firstName": firstName, "lastName": lastName, "gender": gender, "email": email, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
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
