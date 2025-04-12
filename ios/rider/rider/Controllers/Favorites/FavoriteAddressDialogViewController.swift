//
//  FavoriteAddressDialogViewController.swift
//  rider
//
//  Copyright © 1397 Minimalistic Apps. All rights reserved.
//

import UIKit
import MapKit

class FavoriteAddressDialogViewController: UIViewController {
    @IBOutlet weak var textTitle: UITextField!
    @IBOutlet weak var textAddress: UITextField!
    var address: GetAddressesQuery.Data.RiderAddress?
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let _address = address {
            textTitle.text = _address.title
            textAddress.text = _address.details
            map.setCenter(_address.location.fragments.point.toCoord(), animated: true)
        } else {
            let locationManager = CLLocationManager()
            if let location = locationManager.location {
                map.setCenter(location.coordinate, animated: true)
            }
        }
    }

    
    

}
