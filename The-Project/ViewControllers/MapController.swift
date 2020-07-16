//
//  MapController.swift
//  The-Project
//
//  Created by user171840 on 7/16/20.
//  Copyright © 2020 Student. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapController: UIViewController, CLLocationManagerDelegate {
    static let id = "MapController"
    
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var imageView: UIImageView!
    
    //var buildings: [Response?] = []
    var tour: Response?
    
    let locationManager = CLLocationManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UITapGestureRecognizer(target: self, action: #selector(self.toPreviousPage(_:)))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(gesture)
        
        addAnnotation(building: tour)
        checkLocationServiceEnabled()
        
       /* let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: 41.7151 , longitude: 44.8271)
        annotation.title = "Tbilisi"
        annotation.subtitle = "capital of Georgia"
        mapView.addAnnotation(annotation)
        
        let region = MKCoordinateRegion(center: annotation.coordinate, latitudinalMeters: 3000, longitudinalMeters: 3000)
        mapView.setRegion(region,animated: true)*/
        
        let annotation = MKPointAnnotation()
        let lat = Double(tour!.lat)!
        let lng = Double(tour!.lng)
        print("\(lat) and \(lng)")
        
        //mapView.addAnnotation(annotation)
        //annotation.coordinate = CLLocationCoordinate2D(latitude: Double(building!.lat), longitude: Double(building!.lng))
        //let region = MKCoordinateRegion(center: annotation, latitudinalMeters: 3000, longitudinalMeters: 3000)
       
        //mapView.setRegion(region, animated: true)
    }
    
    @objc func toPreviousPage(_ sender: UITapGestureRecognizer? = nil) {
        print("did tap on map")
        dismiss(animated: true, completion: nil)
    }
    
    private func checkLocationServiceEnabled() {
          if CLLocationManager.locationServicesEnabled() {
              setupLocationManager()
              checkAuthorizationStatus()
              print("ON")
          } else {
              print("OFF")
          }
      }
    
    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkAuthorizationStatus() {
        switch CLLocationManager.authorizationStatus() {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            mapView.showsUserLocation = false
        case .authorizedAlways:
            break
        case .denied:
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            break
        @unknown default:
            return
        }
    }
    
    private func addAnnotation(building: Response? = nil) {
        guard let building = building else {return}
        let lat = Double(building.lat)!
        let lng = Double(building.lng)!
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: lat)!, longitude: CLLocationDegrees(exactly: lng)!)
        annotation.title = building.tourName
        self.mapView.addAnnotation(annotation)
    }
    
    private func addAllAnnotations(tours: [Response?]){
      for tour in tours{
        let lat = Double(tour!.lat)!
        let lng = Double(tour!.lng)!
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: CLLocationDegrees(exactly: lat)!, longitude: CLLocationDegrees(exactly: lng)!)
        self.mapView.addAnnotation(annotation)
      }
    }
   

}

