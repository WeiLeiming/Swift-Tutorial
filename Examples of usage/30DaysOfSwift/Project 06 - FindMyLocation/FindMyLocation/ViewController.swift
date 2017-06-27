//
//  ViewController.swift
//  FindMyLocation
//
//  Created by willwei on 2017/6/23.
//  Copyright © 2017年 qj-vr. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: - IBOutlet
    
    @IBOutlet weak var locationLabel: UILabel!
    
    // MARK: - Properties
    
    var locationManager: CLLocationManager?
    
    // MARK: - Load View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: - Memory

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Status Bar
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    // MARK: - Button Action

    @IBAction func findMyLocationButtonDidTouch(_ sender: UIButton) {
        locationManager = CLLocationManager()
        locationManager?.delegate = self
        locationManager?.requestWhenInUseAuthorization()
        locationManager?.startUpdatingLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        CLGeocoder().reverseGeocodeLocation(manager.location!) { (placemarks, error) in
            guard error == nil else {
                self.locationLabel.text = "Reverse geocoder failed with error" + error!.localizedDescription
                return
            }
            
            if placemarks!.count > 0 {
                let placemark = placemarks?.first
                self.convertLocationInfo(placemark)
            } else {
                self.locationLabel.text = "Problem with the data received from geocoder"
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        self.locationLabel.text = "Error while updating location " + error.localizedDescription
    }
    
    // MARK: - Private Method
    
    private func convertLocationInfo(_ placemark: CLPlacemark?) {
        guard placemark != nil else {
            return
        }
        
        locationManager?.stopUpdatingLocation()
        
        let name = (placemark?.name != nil) ? placemark?.name : ""
        let subLocality = (placemark?.subLocality != nil) ? placemark?.subLocality : ""
        let locality = (placemark?.locality != nil) ? placemark?.locality : ""
        let administrativeArea = (placemark?.administrativeArea != nil) ? placemark?.administrativeArea : ""
        let country = (placemark?.country != nil) ? placemark?.country : ""
        
        self.locationLabel.text = name! + " " + subLocality!
        self.locationLabel.text?.append("\n" + locality! + ", " + administrativeArea! + ", " + country!)
    }

}

