//
//  MapVC.swift
//  earthquakeDemo
//
//  Created by Ayushi on 2022-03-26.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet private var mapView: MKMapView!


    //MARK: Variables
    var lat : Double?
    var lng : Double?
    
    //MARK: View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.setMapViewData()
    }
    
    //MARK: Private Methods
    private func setMapViewData() {
        
        let location = CLLocationCoordinate2D(latitude: lat ?? 0.0, longitude: lng ?? 0.0)
        print(location)
        
        DispatchQueue.main.async {
            self.mapView.setCenter(location, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = location
            self.mapView.addAnnotation(annotation)
        }
        
    }
    
    //MARK: IBActions
    
}
