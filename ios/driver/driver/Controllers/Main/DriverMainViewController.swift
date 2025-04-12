//
//  DriverMainViewController.swift
//  Driver
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit
import MapKit
import iCarousel
import Apollo

class DriverMainViewController: UIViewController, CLLocationManagerDelegate {
    @IBOutlet weak var buttonStatus: UISwitch!
    @IBOutlet weak var requestsList: iCarousel!
    @IBOutlet weak var map: MKMapView!
    var requests : [AvailableOrder] = []
    var locationManager = CLLocationManager()
    private var observer: NSObjectProtocol?
    private var orderCreatedSubscription: Cancellable?
    private var orderRemovedSubscription: Cancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation
        requestsList.dataSource = self
        requestsList.delegate = self
        requestsList.type = .rotary
    }
    
    deinit {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        orderRemovedSubscription?.cancel()
        orderCreatedSubscription?.cancel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.refreshRequests()
            subscribeRequests()
        }
        locationManager.startUpdatingLocation()
        subscribeRequests()
    }
    
    func subscribeRequests() {
        orderRemovedSubscription?.cancel()
        orderCreatedSubscription?.cancel()
        orderCreatedSubscription = Network.shared.apollo.subscribe(subscription: OrderCreatedSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let graphQLResult):
                if let order = graphQLResult.data?.orderCreated.fragments.availableOrder {
                    self.requests.append(order)
                    self.requestsList.reloadData()
                }
                
            case .failure(let error):
                print(error)
                //self.dismiss(animated: true, completion: nil)
            }
        }
        orderRemovedSubscription = Network.shared.apollo.subscribe(subscription: OrderRemovedSubscription()) { [weak self] result in
            guard let self = self else {
                return
            }
            switch result {
            case .success(let graphQLResult):
                if let orderId = graphQLResult.data?.orderRemoved.id {
                    if let index = self.requests.firstIndex(where: { request in request.id == orderId }) {
                        self.requests.remove(at: index)
                        self.requestsList.reloadData()
                    }
                }
                
            case .failure(let error):
                print(error)
            }
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
        orderCreatedSubscription?.cancel()
        orderRemovedSubscription?.cancel()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        locationManager.stopUpdatingLocation()
    }
    
    @objc func refreshRequests() {
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            switch result {
            case .success(let data):
                guard let _driver = data.data?.driver else {
                    return
                }
                
                if _driver.orders.nodes.isEmpty {
                    if _driver.status == .online {
                        self.buttonStatus.isOn = true
                        Network.shared.apollo.fetch(query: AvailableOrdersQuery(), cachePolicy: .fetchIgnoringCacheCompletely) { result in
                            switch result {
                            case .success(let response):
                                guard let _response = response.data?.availableOrders else {
                                    return
                                }
                                self.buttonStatus.isOn = true
                                self.locationManager.requestAlwaysAuthorization()
                                self.locationManager.startUpdatingLocation()
                                self.requests = _response.map { request in AvailableOrder(id: request.id, status: request.status, currency: request.currency, costBest: request.costBest, distanceBest: request.distanceBest, durationBest: request.durationBest, addresses: request.addresses, points: request.points.map { point in AvailableOrder.Point(lat: point.lat, lng: point.lng)}) }
                                self.requestsList.reloadData()
                                
                            case .failure(_):
                                self.buttonStatus.isOn = false
                            }
                        }
                    }
                    return
                }
                switch _driver.orders.nodes.first!.status {
                case .waitingForPostPay:
                    let vc = Bundle.main.loadNibNamed("WaitingForPayment", owner: self, options: nil)?.first as! WaitingForPaymentViewController
                    self.present(vc, animated: true)

                default:
                    self.performSegue(withIdentifier: "startTravel", sender: nil)
                }
                
                
            case .failure(let error):
                print(error)
                //self.refreshRequests()
            }
        }
        
    }
    
    @IBAction func onDriverStatusClicked(_ sender: UISwitch) {
        buttonStatus.isEnabled = false
        if !sender.isOn {
            self.locationManager.stopUpdatingLocation()
        }
        Network.shared.apollo.perform(mutation: UpdateDriverStatusMutation(status: sender.isOn ? .online : .offline)) { result in
            self.buttonStatus.isEnabled = true
            switch result {
            case .success(_):
                print("Driver Status updated")
                
            case .failure(let error):
                self.buttonStatus.isOn = !self.buttonStatus.isOn
                error.showAlert()
            }
            if sender.isOn {
                self.locationManager.requestAlwaysAuthorization()
                self.locationManager.startUpdatingLocation()
            } else {
                self.requests = []
                self.requestsList.reloadData()
            }
        }
        
    }
    
    @IBAction func onMenuClicked(_ sender: Any) {
        NotificationCenter.default.post(name: .menuClicked, object: nil)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        Network.shared.apollo.perform(mutation: UpdateDriverLocationMutation(point: userLocation.coordinate.toPointInput())) { _ in
            self.refreshRequests()
        }
        let region = MKCoordinateRegion(center: userLocation.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(region, animated: true)
    }
    
}

extension DriverMainViewController: iCarouselDataSource, iCarouselDelegate {
    func numberOfItems(in carousel: iCarousel) -> Int {
        return requests.count
    }
    
    func carousel(_ carousel: iCarousel, viewForItemAt index: Int, reusing view: UIView?) -> UIView {
        let vc = Bundle.main.loadNibNamed("RequestCard", owner: self, options: nil)?[0] as! RequestCard
        
        let travel = requests[requests.index(requests.startIndex, offsetBy: index)]
        vc.request = travel
        vc.labelPickupLocation.text = travel.addresses[0]
        let distanceDriver = CLLocation.distance(from: map.userLocation.coordinate, to: travel.points[0].toCoord())
        vc.labelFromYou.text = MKDistanceFormatter().string(fromDistance: distanceDriver)
        vc.labelDistance.text = MKDistanceFormatter().string(fromDistance: Double(travel.distanceBest))
        vc.labelCost.text = MyLocale.formattedCurrency(amount: travel.costBest, currency: travel.currency)
        vc.delegate = self
        vc.layer.cornerRadius = 8
        vc.layer.shadowOpacity = 0.2
        vc.layer.shadowOffset = CGSize(width: 0, height: 0)
        vc.layer.shadowRadius = 4.0
        let shadowRect: CGRect = vc.bounds
        let _ = vc.constraintUser.setConstant(constant: CGFloat((distanceDriver.binade - Double(travel.distanceBest)) / (distanceDriver + 1 + Double(travel.distanceBest)) * 100))
        vc.layer.shadowPath = UIBezierPath(rect: shadowRect).cgPath
        return vc
    }
    
    func carousel(_ carousel: iCarousel, valueFor option: iCarouselOption, withDefault value: CGFloat) -> CGFloat {
        if (option == .spacing) {
            return value * 1.1
        }
        return value
    }
}
extension DriverMainViewController: DriverRequestCardDelegate {
    func accept(request: AvailableOrder) {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        Network.shared.apollo.perform(mutation: UpdateOrderStatusMutation(orderId: String(request.id), status: .driverAccepted)) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(_):
                self.requests.removeAll()
                self.requestsList.reloadData()
                self.locationManager.stopUpdatingLocation()
                self.performSegue(withIdentifier: "startTravel", sender: nil)
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    func reject(request: AvailableOrder) {
        requests.removeAll() {req in return req.id == request.id }
        requestsList.reloadData()
    }
}

extension NSLayoutConstraint {
    /**
     Change multiplier constraint
     
     - parameter multiplier: CGFloat
     - returns: NSLayoutConstraint
     */
    func setMultiplier(multiplier:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    
    func setConstant(constant:CGFloat) -> NSLayoutConstraint {
        
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint(
            item: firstItem!,
            attribute: firstAttribute,
            relatedBy: relation,
            toItem: secondItem,
            attribute: secondAttribute,
            multiplier: multiplier,
            constant: constant)
        
        newConstraint.priority = priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
}
public extension Point {
    func toCoord() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}

public extension AvailableOrder.Point {
    func toCoord() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}

public extension CLLocationCoordinate2D {
    func toPointInput() -> PointInput {
        return PointInput(lat: latitude, lng: longitude)
    }
    func toPoint() -> Point {
        return Point(lat: latitude, lng: longitude)
    }
}
