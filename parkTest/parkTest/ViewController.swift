//
//  ViewController.swift
//  parkTest
//
//  Created by Matt Policane on 30/10/2016.
//  Copyright © 2016 Policane. All rights reserved.
//

import UIKit
import GoogleMaps

class ViewController: UIViewController , UISearchBarDelegate {

    @IBOutlet weak var googleMapsContainer: UIView!
    
    var googleMapsView: GMSMapView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

  
        

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        self.googleMapsView = GMSMapView(frame: self.googleMapsContainer.frame)
        self.view.addSubview(self.googleMapsView)
        
        
        //let camera = GMSCameraPosition.camera(withLatitude: 42.6026, longitude: 20.9030, zoom: 12.0)
        //let mapView = GMSMapView.map(withFrame: .zero, camera: camera)

        //Add markers
        let position = CLLocationCoordinate2DMake(51.5074, 0.1278)
        let marker = GMSMarker(position: position)
        marker.title = "Hello World"
        marker.map = googleMapsView
        
        let testLat = [51.52391, 51.519581]
        let testLong = [-0.140725, -0.123028]
        
        showMarkers(lat: testLat, long: testLong)

    }
    @IBAction func searchWithAddress(_ sender: Any) {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        self.present(searchController, animated: true, completion: nil)
        
    }
    

   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var FinalPositions:[CLLocationCoordinate2D] = []
    var FinalMarkers = [GMSMarker]()
    
    func showMarkers(lat: Array<Double>,long:Array<Double>){
        let sizeOfArr = lat.count
        print(sizeOfArr)
        print(lat[0])
        print(long[0])
        for i in 0..<sizeOfArr {
            //FinalPositions[0] = CLLocationCoordinate2DMake(lat[0],long[0])
            //FinalMarkers[0] = GMSMarker(position: FinalPositions[0])
            //FinalMarkers[0].map = googleMapsView
            print(i)
            FinalMarkers.append(GMSMarker())
            FinalMarkers[i].position = CLLocationCoordinate2D(latitude: lat[i], longitude: long[i])
            FinalMarkers[i].map = googleMapsView
            
        }
    }
    
    /*func formatInput(input: String) -> String {
        return input.replacingOccurrences(of: " ", with: "+")
    }
    
    func getSpaces(lat: Any, lng: Any) {
        //let apiKey = "&key=AIzaSyCZ0NygtQoU4HkwmT0-UN9hzaYxOOJfseA"
        
        let scriptUrl = "http://ec2-35-162-57-215.us-west-2.compute.amazonaws.com/query/123"
        let myUrl = URL(string: scriptUrl)
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    print(convertedJsonIntoDict)
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        task.resume()
    }

    
    func getLatLng() {
        let apiKey = "&key=AIzaSyCZ0NygtQoU4HkwmT0-UN9hzaYxOOJfseA"
        
        let scriptUrl = "https://maps.googleapis.com/maps/api/geocode/json?address=" + address + apiKey
        
        let myUrl = URL(string: scriptUrl)
        
        var request = URLRequest(url:myUrl!)
        
        request.httpMethod = "GET"
        
        let task = URLSession.shared.dataTask(with: request) {
            data, response, error in
            
            // Check for error
            if error != nil
            {
                print("error=\(error)")
                return
            }
            
            // Convert server json response to NSDictionary
            do {
                if let convertedJsonIntoDict = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary {
                    
                    // Print out dictionary
                    var lat = convertedJsonIntoDict.value(forKeyPath: "results.geometry.location.lat") as! NSArray
                    var lng = convertedJsonIntoDict.value(forKeyPath: "results.geometry.location.lng") as! NSArray
                    self.getSpaces(lat: lat[0], lng: lng[0])
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
        task.resume()
        
    }*/


}

