//
//  ViewController.swift
//  parkIT
//
//  Created by Matt Policane on 29/10/2016.
//  Copyright © 2016 Policane. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController, UITextFieldDelegate {

    //Properties
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var mapView: GMSMapView!
    
    @IBOutlet weak var latText: UITextField!
    // You don't need to modify the default init(nibName:bundle:) method.
    
    override func loadView() {
        // Create a GMSCameraPosition that tells the map to display the
        // coordinate -33.86,151.20 at zoom level 6.
        let camera = GMSCameraPosition.camera(withLatitude: 51.519, longitude: -0.124, zoom: 12.0)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        mapView.isMyLocationEnabled = true
        view = mapView

        view.insertSubview(mapView, at:0)

        // Creates a marker in the center of the map.
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 51.519, longitude: -0.124)
        //marker.title = "Sydney"
        //marker.snippet = "Australia"
        marker.map = mapView
        
     

     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //locationText.delegate = self
        //latText.delegate = self
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITextFieldDelegate
   /* func textFieldShouldReturn(textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }*/
    
    func next() {
        let nextLocation = CLLocationCoordinate2DMake(37.792871, -122.397055)
        mapView?.camera = GMSCameraPosition.camera(withLatitude: nextLocation.latitude, longitude: nextLocation.longitude, zoom: 15)
        
        let marker = GMSMarker(position: nextLocation)
        marker.title = "Station"
        marker.snippet = ""
        marker.map = mapView
    }
 
    
    //Actions
    
    @IBAction func buttonPress(_ sender: Any) {
        
        
    }
    

}

