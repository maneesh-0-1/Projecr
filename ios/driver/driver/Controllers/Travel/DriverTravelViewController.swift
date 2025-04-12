//
//  DriverTravelViewController.swift
//  Driver
//
//  Copyright © 2018 minimalistic apps. All rights reserved.
//

import UIKit
import SPAlert
import MapKit
import Apollo

class DriverTravelViewController: UIViewController, CLLocationManagerDelegate, MKMapViewDelegate {
    @IBOutlet weak var labelCost: UILabel!
    @IBOutlet weak var labelTime: UILabel!
    @IBOutlet weak var map: MKMapView!
    @IBOutlet weak var buttonStart: UIButton!
    @IBOutlet weak var buttonFinish: UIButton!
    @IBOutlet weak var buttonMessage: UIButton!
    @IBOutlet weak var buttonCall: UIButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var buttonArrived: ColoredButton!
    
    var timer = Timer()
    var locationManager = CLLocationManager()
    var pointAnnotations: [MKPointAnnotation] = []
    var destinationMarker = MKPointAnnotation()
    var driverMarker = MKPointAnnotation()
    var route = [CLLocationCoordinate2D]()
    var distance: Double = 0.0
    var currentOrder: CurrentOrder!
    private var subscriptionOrderUpdate: Cancellable?
    private var observer: NSObjectProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoadedTravel")
        map.delegate = self
        map.layoutMargins = UIEdgeInsets(top: 50, left: 0, bottom: 300, right: 0)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.regular)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = backgroundView.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        backgroundView.addSubview(blurEffectView)
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: view.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 10, height: 10)).cgPath
        self.backgroundView.layer.mask = maskLayer
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
        locationManager.distanceFilter = 50
        locationManager.allowsBackgroundLocationUpdates = true
        locationManager.pausesLocationUpdatesAutomatically = false
        locationManager.activityType = .automotiveNavigation
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        self.navigationItem.hidesBackButton = true
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.requestRefresh()
        }
        subscriptionOrderUpdate = Network.shared.apollo.subscribe(subscription: OrderUpdatedSubscription()) { [weak self] result in
            guard let self = self else {
              return
            }
            switch result {
                      case .success(let graphQLResult):
                if let order = graphQLResult.data?.orderUpdated.fragments.currentOrder {
                    self.refreshScreen(travel: order)
                }
                
            case .failure(_):
                print("Failed to connect socket")
                //self.dismiss(animated: true, completion: nil)
            }
        }
        self.requestRefresh()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.subscriptionOrderUpdate?.cancel()
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    deinit {
        self.subscriptionOrderUpdate?.cancel()
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    @IBAction func onStartTapped(_ sender: UIButton) {
        updateOrderStatus(.started)
    }
    
    @IBAction func onFinishTapped(_ sender: UIButton) {
        updateOrderStatus(.finished)
    }
    
    @IBAction func onButtonArrivedTapped(_ sender: ColoredButton) {
        updateOrderStatus(.arrived)
    }
    
    @IBAction func onMessageTapped(_ sender: UIButton) {
        let vc = ChatViewController()
        self.navigationController!.pushViewController(vc, animated: true)
    }
    
    func updateOrderStatus(_ orderStatus: OrderStatus) {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        Network.shared.apollo.perform(mutation: UpdateOrderStatusMutation(orderId: currentOrder.id, status: orderStatus, cashPayment: 0)) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let response):
                if let order = response.data?.updateOneOrder.fragments.currentOrder {
                    self.refreshScreen(travel: order)
                }
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    @IBAction func onCancelTapped(_ sender: UIButton) {
        updateOrderStatus(.driverCanceled)
    }
    
    @objc private func requestRefresh() {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        Network.shared.apollo.fetch(query: MeQuery()) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let response):
                if let order = response.data?.driver?.orders.nodes.first?.fragments.currentOrder {
                    self.refreshScreen(travel: order)
                }
                
                
            case .failure(_):
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
    
    private func refreshScreen(travel: CurrentOrder) {
        self.currentOrder = travel
        timer.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.onEachSecond), userInfo: nil, repeats: true)
        labelCost.text = MyLocale.formattedCurrency(amount: travel.costAfterCoupon, currency: travel.currency)
        switch travel.status {
        case .riderCanceled, .driverCanceled:
            let alert = UIAlertController(title: "Success", message: "Service Has Been Canceled.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Allright!", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            })
            present(alert, animated: true)
            break;
            
        case .driverAccepted:
            buttonFinish.isHidden = true
            buttonStart.isHidden = true
            let ann = MKPointAnnotation()
            ann.coordinate = travel.points[0].toCoord()
            ann.title = travel.addresses[0]
            pointAnnotations.append(ann)
            map.addAnnotation(ann)
            if map.annotations.count > 1 {
                map.showAnnotations(map.annotations, animated: true)
            } else {
                map.setCenter(map.annotations[0].coordinate, animated: true)
            }
            
        case .arrived:
            buttonStart.isHidden = false
            buttonArrived.isHidden = true
            
        case .started:
            buttonMessage.isHidden = true
            buttonCall.isHidden = true
            buttonCancel.isHidden = true
            buttonStart.isHidden = true
            buttonFinish.isHidden = false
            buttonArrived.isHidden = true
            if pointAnnotations.count > 0 {
                for point in pointAnnotations {
                    map.removeAnnotation(point)
                }
            }
            for (index, point) in travel.points.dropFirst().enumerated() {
                let ann = MKPointAnnotation()
                ann.coordinate = point.fragments.point.toCoord()
                ann.title = travel.addresses[index + 1]
                pointAnnotations.append(ann)
                map.addAnnotation(ann)
            }
            if map.annotations.count > 1 {
                map.showAnnotations(map.annotations, animated: true)
            } else {
                map.setCenter(map.annotations[0].coordinate, animated: true)
            }
            
        case .waitingForPostPay:
            self.dismiss(animated: true, completion: nil)
            
        case .finished, .waitingForReview:
            SPAlert.present(title: "Paid!", preset: .card)
            self.navigationController?.popViewController(animated: true)
            
        default:
            let alert = UIAlertController(title: "Error", message: "Unkown Status: \(travel.status.rawValue)", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Allright!", style: .default) { action in
                self.navigationController?.popViewController(animated: true)
            })
            self.present(alert, animated: true)
        }
    }
        
    enum MarkerType: String {
        case pickup = "pickup"
        case dropoff = "dropOff"
        case driver = "driver"
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }
        let identifier = pointAnnotations.contains(annotation) ? MarkerType.dropoff : MarkerType.driver
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier.rawValue) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier.rawValue)
            switch(identifier) {
            case .pickup:
                view.glyphImage = UIImage(named: "annotation_glyph_home")
                view.markerTintColor = UIColor(hex: 0x009688)
                view.canShowCallout = true
                let button = UIButton(type: .detailDisclosure)
                button.addTarget(self, action: #selector(annotationTapped), for: UIControl.Event.touchUpInside)
                view.rightCalloutAccessoryView = button
                break;
                
            case .dropoff:
                view.markerTintColor = UIColor(hex: 0xFFA000)
                view.canShowCallout = true
                let button = UIButton(type: .detailDisclosure)
                button.addTarget(self, action: #selector(annotationTapped), for: UIControl.Event.touchUpInside)
                view.rightCalloutAccessoryView = button
                break;
                
            default:
                view.glyphImage = UIImage(named: "annotation_glyph_car")
            }
        }
        return view
    }
    
    @objc func annotationTapped() {
        openNavigationMenu(location: map.selectedAnnotations.last!.coordinate)
    }
    
    func openNavigationMenu(location: CLLocationCoordinate2D) {
        let alert = UIAlertController(title: "Navigation", message: "Select App to navigate with", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Apple Maps", style: .default, handler: { action in
            if let url = URL(string: "http://maps.apple.com/?q=\(location.latitude),\(location.longitude)&z=10&t=s"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Google Maps", style: .default, handler: { action in
            if let url = URL(string: "comgooglemaps://?daddr=\(location.latitude),\(location.longitude)&directionsmode=driving"),
                UIApplication.shared.canOpenURL(URL(string: "comgooglemaps://")!) {
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Waze", style: .default, handler: { action in
            if let url = URL(string: "https://www.waze.com/ul?ll=\(location.latitude),\(location.longitude)&navigate=yes"),
                UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }))
        alert.addAction(UIAlertAction(title: "Yandex.Maps", style: .default, handler: { action in
            if let url = URL(string: "yandexmaps://maps.yandex.com/?ll=\(location.latitude),\(location.longitude)&z=12"),
                UIApplication.shared.canOpenURL(URL(string: "yandexmaps://")!) {
                UIApplication.shared.open(url)
            }
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func onEachSecond() {
        let now = Date()
        let etaInterval = currentOrder.startTimestamp != nil ? (currentOrder.startTimestamp! / 1000) + Double(currentOrder.durationBest) : (currentOrder.etaPickup ?? 0) / 1000
        let etaTime = Date(timeIntervalSince1970: etaInterval)
        if etaTime <= now {
            labelTime.text = NSLocalizedString("Soon!", comment: "When driver is coming later than expected.")
        } else {
            let formatter = DateComponentsFormatter()
            formatter.allowedUnits = [.minute, .second]
            formatter.unitsStyle = .short
            labelTime.text = formatter.string(from: now, to: etaTime)
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        Network.shared.apollo.perform(mutation: UpdateDriverLocationMutation(point: userLocation.coordinate.toPointInput()))
        route.append(userLocation.coordinate)
        driverMarker.coordinate = userLocation.coordinate
        map.addAnnotation(driverMarker)
        map.showAnnotations(pointAnnotations, animated: true)
    }
        
    @IBAction func onCallTouched(_ sender: UIButton) {
        if let call = currentOrder?.rider.mobileNumber,
            let url = URL(string: "tel://+\(call)"),
            UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
        }
    }
}

public extension CurrentOrder.Point {
    func toCoord() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: lat, longitude: lng)
    }
}
