//
//  ViewController.swift
//  forwardGeo
//
//  Created by Student 06 on 02/10/18.
//  Copyright © 2018 Student 06. All rights reserved.
//

import UIKit
import MapKit
class ViewController: UIViewController , UITextFieldDelegate{

    @IBAction func ChangeMaoType(_ sender: UISegmentedControl) {
        switch segment.selectedSegmentIndex {
        case 0:
            mapview.mapType = .standard
        case 1:
            mapview.mapType = .satellite
        case 2:
            mapview.mapType = .hybrid
        default:
            mapview.mapType = .standard
        }
    }
    @IBOutlet weak var segment: UISegmentedControl!
    @IBOutlet weak var mapview: MKMapView!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        textField.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let address = textField.text
        let geo = CLGeocoder()
        geo.geocodeAddressString(address!) { (placemarks, error) in
            let placeMark = placemarks?.first!
            let location = placeMark?.location
            let coordinate = location?.coordinate
            let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
            let region = MKCoordinateRegion(center: coordinate!, span: span)
           self.mapview.setRegion(region, animated: true)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate!
            self.mapview.addAnnotation(annotation)
            
        }
        return true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

