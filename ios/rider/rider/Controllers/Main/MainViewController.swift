//
//  MainViewController.swift
//  Rider
//
//  Copyright © 2019 minimalistic apps. All rights reserved.
//

import UIKit
import MapKit
import Contacts

class MainViewController: UIViewController, CLLocationManagerDelegate, ServiceRequested {
    @IBOutlet weak var map: MKMapView!
    var pointsAnnotations: [MKPointAnnotation] = []
    var arrayDriversMarkers: [MKPointAnnotation] = []
    var locationManager = CLLocationManager()
    var servicesViewController: ServicesParentViewController?
    var pinAnnotation:MKPinAnnotationView = MKPinAnnotationView()
    var addresses: [GetAddressesQuery.Data.RiderAddress] = []
    
    private var searchController: UISearchController!
    @IBOutlet weak var buttonConfirmPickup: ColoredButton!
    @IBOutlet weak var buttonAddDestination: ColoredButton!
    @IBOutlet weak var buttonConfirmFinalDestination: ColoredButton!
    @IBOutlet weak var containerServices: UIView!
    @IBOutlet weak var leftBarButton: UIBarButtonItem!
    @IBOutlet weak var buttonFavorites: UIBarButtonItem!
    private var observer: NSObjectProtocol?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonAddDestination.isHidden = true
        buttonConfirmFinalDestination.isHidden = true
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        locationManager.requestWhenInUseAuthorization()
        map.delegate = self
        pinAnnotation.frame = CGRect(x: (self.view.frame.width / 2) - 8, y: self.view.frame.height / 2 - 8, width: 32, height: 39)
        pinAnnotation.pinTintColor = UIApplication.shared.keyWindow?.tintColor
        map.addSubview(pinAnnotation)
        let locationSearchTable = storyboard!.instantiateViewController(withIdentifier: "SuggestionsTableTableViewController") as! SuggestionsTableTableViewController
        locationSearchTable.callback = self
        searchController = UISearchController(searchResultsController: locationSearchTable)
        searchController?.searchResultsUpdater = locationSearchTable
        searchController?.hidesNavigationBarDuringPresentation = false
        definesPresentationContext = true
        self.navigationItem.searchController = searchController
        
    }
    
    func goBackFromServiceSelection() {
        LoadingOverlay.shared.hideOverlayView()
        leftBarButton.image = UIImage(named: "menu")
        map.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        map.removeAnnotations(pointsAnnotations)
        pointsAnnotations.removeAll()
        buttonAddDestination.isHidden = true
        buttonConfirmFinalDestination.isHidden = true
        buttonConfirmPickup.isHidden = false
        buttonFavorites.isEnabled = true
        self.containerServices.isHidden = true
        self.pinAnnotation.isHidden = false
        map.isUserInteractionEnabled = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        observer = NotificationCenter.default.addObserver(forName: UIApplication.willEnterForegroundNotification, object: nil, queue: .main) { [unowned self] notification in
            self.syncWithServer()
        }
        syncWithServer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        if let observer = observer {
            NotificationCenter.default.removeObserver(observer)
        }
    }
    
    func syncWithServer() {
        Network.shared.apollo.fetch(query: GetCurrentOrderQuery()) { result in
            switch result {
            case .success(let response):
                if let request = response.data?.currentOrderWithLocation.order {
                    switch request.status {
                    case .driverAccepted, .started, .arrived, .found:
                        self.performSegue(withIdentifier: "startTravel", sender: nil)
                        
                    case .requested, .notFound, .noCloseFound, .booked:
                        self.performSegue(withIdentifier: "startLooking", sender: nil)
                        
                    case .waitingForReview, .waitingForPostPay, .waitingForPrePay:
                        self.performSegue(withIdentifier: "showFinished", sender: nil)
                        
                    case .driverCanceled, .riderCanceled, .finished, .expired, .__unknown(_):
                        print("How did this happened? It shouldn't")
                    }
                }
                
            case .failure(_):
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? ServicesParentViewController,
            segue.identifier == "segueServices" {
            self.servicesViewController = vc
            vc.callback = self
        }
    }
        
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        locationManager.stopUpdatingLocation()
        guard let position = manager.location else {
            let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("Couldn't get current location. use search to find your current place on map.", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("Allright!", comment: ""), style: .default, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let region = MKCoordinateRegion(center: position.coordinate, latitudinalMeters: 1000, longitudinalMeters: 1000)
        map.setRegion(region, animated: true)
    }
    
    @IBAction func onMenuClicked(_ sender: UIBarButtonItem) {
        if(pointsAnnotations.count == 0) {
            NotificationCenter.default.post(name: .menuClicked, object: nil)
            return
        }
        if(!pinAnnotation.isHidden) {
            map.removeAnnotation(pointsAnnotations.last!)
            pointsAnnotations.removeLast()
            buttonConfirmPickup.isHidden = (pointsAnnotations.count != 0)
            buttonConfirmFinalDestination.isHidden = (pointsAnnotations.count == 0 || AppDelegate.singlePointMode)
            buttonAddDestination.isHidden = (pointsAnnotations.count > (AppDelegate.maximumDestinations - 1) || AppDelegate.singlePointMode || pointsAnnotations.count == 0)
            leftBarButton.image = (pointsAnnotations.count == 0 ? UIImage(named: "menu") : UIImage(named: "back"))
            return
        }
        goBackFromServiceSelection()
    }
    
    @IBAction func onFavoritesClicked(_ sender: UIBarButtonItem) {
        Network.shared.apollo.fetch(query: GetAddressesQuery()) { result in
            switch result {
            case .success(let response):
                guard let _addresses = response.data?.riderAddresses else {
                    return
                }
                self.addresses = _addresses
                if(_addresses.count < 1) {
                    let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("No Favorite Address found.", comment: ""), preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: NSLocalizedString("Allright!", comment: ""), style: .default) { action in
                        _ = self.navigationController?.popViewController(animated: true)
                    })
                    self.present(alert, animated: true)
                    return
                }
                let vc = UIViewController()
                vc.preferredContentSize = CGSize(width: 250,height: 150)
                let pickerView = UIPickerView(frame: CGRect(x: 0, y: 0, width: 250, height: 150))
                pickerView.delegate = self
                pickerView.dataSource = self
                vc.view.addSubview(pickerView)
                let dlg = UIAlertController(title: NSLocalizedString("Favorite Addresses", comment: "Favorites Picker Title"), message: NSLocalizedString("Chose the location from below picker", comment: "Favorites Picker Description"), preferredStyle: .alert)
                dlg.setValue(vc, forKey: "contentViewController")
                dlg.addAction(UIAlertAction(title: "Done", style: .default){ action in
                    self.map.setCenter(_addresses[pickerView.selectedRow(inComponent: 0)].location.fragments.point.toCoord(), animated: true)
                })
                dlg.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
                self.present(dlg, animated: true)
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
    
    func requestService(service: CalculateFareMutation.Data.CalculateFare.Service.Service, minutesFromNow: Int = 0, skipCancellationCheck: Bool = false) {
        if service.cancellationTotalFee > 0 && !skipCancellationCheck {
            let amount = MyLocale.formattedCurrency(amount: service.cancellationTotalFee, currency: self.servicesViewController!.calculateFareResult.currency)
            let message = String(format: NSLocalizedString("A cancellation fee of %@ applies if you cancel after a driver accepts your booking.", comment: ""), amount)
            let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default) {_ in
                self.requestService(service: service, minutesFromNow: minutesFromNow, skipCancellationCheck: true)
            })
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        let points = pointsAnnotations.map() { annotation in
            return PointInput(lat: annotation.coordinate.latitude, lng: annotation.coordinate.longitude)
        }
        let addresses = pointsAnnotations.map() { annotation in
            return annotation.title!
        }
        let feedbackGenerator = UISelectionFeedbackGenerator()
        feedbackGenerator.selectionChanged()
        Network.shared.apollo.perform(mutation: CreateOrderMutation(input: CreateOrderInput(serviceId: Int(service.id)!, intervalMinutes: minutesFromNow, points: points, addresses: addresses))) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(_):
                self.performSegue(withIdentifier: "startLooking", sender: nil)
                self.goBackFromServiceSelection()
                
            case .failure(let error):
                    //TODO: DO SOMETHING ABOUT CREDIT INSUFFICIENT
//                if error.status == .CreditInsufficient {
//                    self.openWallet(amount: service.cost!, currency: self.servicesViewController!.calculateFareResult.currency)
//                    return
//                }
                error.showAlert()
            }
        }
    }
    
    func RideNowSelected(service: CalculateFareMutation.Data.CalculateFare.Service.Service) {
        requestService(service: service)
    }
    
    func RideLaterSelected(service: CalculateFareMutation.Data.CalculateFare.Service.Service, minutesFromNow: Int) {
        requestService(service: service, minutesFromNow: minutesFromNow)
    }
    
    func openWallet(amount: Double, currency: String) {
        let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("Credit in wallet is not sufficient to do this. Please top up your wallet first.", comment: ""), preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Open Wallet", comment: ""), style: .default) {_ in
            if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "Wallet") as? WalletViewController {
                vc.amount = ceil(amount)
                vc.currency = currency
                self.navigationController?.pushViewController(vc, animated: true)
            }
        })
        alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
        self.present(alert, animated: true)
        return
    }
    
    @IBAction func onButtonConfirmPickupTouched(_ sender: ColoredButton) {
        leftBarButton.image = UIImage(named: "back")
        addDestination()
        if(AppDelegate.singlePointMode) {
            calculateFare()
        }
    }
    
    @IBAction func onButtonAddDestinationTouched(_ sender: Any) {
        addDestination()
    }
    
    @IBAction func onButtonFinalDestinationTouched(_ sender: Any) {
        addDestination(force: false, finalDestination: true)
    }
    
    func addDestination(force: Bool = false, finalDestination: Bool = false) {
        if !force && pointsAnnotations.count > 0 && CLLocation.distance(from: map.camera.centerCoordinate, to: pointsAnnotations.last!.coordinate).rounded() < 1000.0 {
            let alert = UIAlertController(title: NSLocalizedString("Message", comment: ""), message: NSLocalizedString("Distance from Pickup to Destination is less than 1km. Do you wish to proceed?", comment: ""), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: ""), style: .default, handler: { action in
                self.addDestination(force: true, finalDestination: finalDestination)
            }))
            alert.addAction(UIAlertAction(title: NSLocalizedString("Cancel", comment: ""), style: .cancel, handler: nil))
            self.present(alert, animated: true)
            return
        }
        let ann = MKPointAnnotation()
        ann.coordinate = map.camera.centerCoordinate
        ann.title = (self.navigationItem.searchController?.searchBar.text)!
        pointsAnnotations.append(ann)
        map.addAnnotation(ann)
        let cameraTarget = CLLocationCoordinate2D(latitude: map.camera.centerCoordinate.latitude + 0.0015, longitude: map.camera.centerCoordinate.longitude)
        map.setCenter(cameraTarget, animated: true)
        if(!AppDelegate.singlePointMode) {
            buttonConfirmPickup.isHidden = true
            buttonConfirmFinalDestination.isHidden = false
            buttonAddDestination.isHidden = (pointsAnnotations.count > (AppDelegate.maximumDestinations - 1))
        }
        if finalDestination {
            calculateFare()
        }
    }
    
    func calculateFare() {
        LoadingOverlay.shared.showOverlay(view: self.navigationController?.view)
        buttonFavorites.isEnabled = false
        self.pinAnnotation.isHidden = true
        map.layoutMargins = UIEdgeInsets(top: 0, left: 0, bottom: 305, right: 0)
        map.showAnnotations(pointsAnnotations, animated: true)
        map.isUserInteractionEnabled = false
        let locs = pointsAnnotations.map() { return $0.coordinate.toPointInput() }
        Network.shared.apollo.perform(mutation: CalculateFareMutation(points: locs)) { result in
            LoadingOverlay.shared.hideOverlayView()
            switch result {
            case .success(let response):
                self.servicesViewController?.calculateFareResult = response.data?.calculateFare
                self.containerServices.isHidden = false
                self.servicesViewController?.reload()
                
            case .failure(let error):
                self.goBackFromServiceSelection()
                error.showAlert()
            }
        }
    }
    
    func getAddressForLatLng(location: CLLocationCoordinate2D) {
        let geocoder = CLGeocoder()
        let loc = CLLocation(latitude: location.latitude, longitude: location.longitude)
        geocoder.reverseGeocodeLocation(loc) { (placemarks, error) in
            if error == nil {
                let firstLocation = placemarks?[0]
                let addressString = CNPostalAddressFormatter().string(from: firstLocation!.postalAddress!)
                self.navigationItem.searchController?.searchBar.text = addressString
                self.buttonConfirmPickup.isEnabled = true
                self.buttonAddDestination.isEnabled = true
                self.buttonConfirmFinalDestination.isEnabled = true
            }
        }
    }
}

extension MainViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(true, animated: true)
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.setShowsCancelButton(false, animated: true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        dismiss(animated: true, completion: nil)
        
        // The user tapped search on the `UISearchBar` or on the keyboard. Since they didn't
        // select a row with a suggested completion, run the search with the query text in the search field.
    }
}

extension MainViewController: MapSearchDelegate {
    func placeMarkSelected(placemark: MKPlacemark) {
        dismiss(animated: true, completion: {
            self.map.setCenter(placemark.coordinate, animated: true)
        })
    }
}

extension MainViewController: MKMapViewDelegate {
    enum MarkerType: String {
        case pickup = "pickup"
        case dropoff = "dropOff"
        case driver = "driver"
    }
    

    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        buttonConfirmPickup.isEnabled = false
        buttonAddDestination.isEnabled = false
        buttonConfirmFinalDestination.isEnabled = false
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let annotation = annotation as? MKPointAnnotation else { return nil }
        let identifier: MarkerType
        if(pointsAnnotations.contains(annotation)) {
            identifier = MarkerType.dropoff
        } else {
            identifier = MarkerType.driver
        }
        var view: MKMarkerAnnotationView
        if let dequeuedView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier.rawValue) as? MKMarkerAnnotationView {
            dequeuedView.annotation = annotation
            view = dequeuedView
        } else {
            view = MKMarkerAnnotationView(annotation: annotation, reuseIdentifier: identifier.rawValue)
        }
        switch(identifier) {
        case .pickup:
            view.glyphImage = UIImage(named: "annotation_glyph_home")
            view.markerTintColor = UIColor(hex: 0x009688)
            break;
            
        case .dropoff:
            view.markerTintColor = UIColor(hex: 0xFFA000)
            break;
            
        default:
            view.glyphImage = UIImage(named: "annotation_glyph_car")
        }
        return view
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }

    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        if containerServices.isHidden == false { return }
        getAddressForLatLng(location: mapView.camera.centerCoordinate)
        Network.shared.apollo.fetch(query: GetDriversLocationQuery()) { result in
            switch result {
            case .success(let response):
                for driverMarker in self.arrayDriversMarkers {
                    self.map.removeAnnotation(driverMarker)
                }
                self.arrayDriversMarkers.removeAll()
                guard let locations = response.data?.getDriversLocation else {
                    return
                }
                for location in locations {
                    let marker = MKPointAnnotation()
                    marker.coordinate = CLLocationCoordinate2D(latitude: location.lat, longitude: location.lng)
                    //marker.title = "Driver"
                    self.arrayDriversMarkers.append(marker)
                    self.map.addAnnotation(marker)
                }
                
            case .failure(let error):
                error.showAlert()
            }
        }
    }
}

extension MainViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return addresses.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return addresses[row].title;
    }
}

public extension Point {
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
