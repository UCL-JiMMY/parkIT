//
//  ViewController.swift
//  TestRequest
//
//  Created by Yll on 30/10/2016.
//  Copyright © 2016 Yll. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    var address = "default"
    
    // MARK: Properties
    @IBOutlet weak var setAddress: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setAddress.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func formatInput(input: String) -> String {
        return input.replacingOccurrences(of: " ", with: "+")
    }
    
    // MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) {
        address = formatInput(input: setAddress.text!)
        getLatLng()
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

    }
    
    func parseSpaces(spaces: NSDictionary) {
        
    }

}

