//
//  Place.swift
//  iXplore
//
//  Created by Alexander Ge on 6/9/16.
//  Copyright © 2016 Alexander Ge. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    
    
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D()
    
    var title: String? = "Place"
    
    var imageURL: String? = ""
    
    var ratable: Bool = false
    
    var descriptionField: String? = ""
    
    var date: NSDate? = NSDate()

    
    
    
    
    class func placeList() -> [Place] {
        
//        let setDate = NSDateComponents()
//        setDate.year = 2016
//        setDate.day = 13
//        setDate.month = 6
//        setDate.hour = 10
//        setDate.minute = 15
//        setDate.timeZone = NSTimeZone(name: "Africa/Johannesburg")
//        let realDate = NSCalendar.currentCalendar().dateFromComponents(setDate)!
        
        
        
        let place = Place ()
        place.title = "Workshop 17"
        place.imageURL = "https://avatars1.githubusercontent.com/u/7220596?v=3&s=200"
        place.coordinate = CLLocationCoordinate2D(latitude: -33.906764,longitude: 18.4164983)
        
        let place2 = Place ()
        place2.title = "Truth Coffee"
        place2.ratable = true
        place2.imageURL = "https://robohash.org/123.png"
        place2.coordinate = CLLocationCoordinate2D(latitude: -33.9281976,longitude: 18.4227045)

        
        let place3 = Place ()
        place3.title = "Chop Chop Coffee"
        place3.ratable = true
        place3.imageURL = "http://cdn3.ixperience.co.za/assets/icons/interview-step-2-801f63110f89e85e38f27d39f5864a1399f256fe0684844caea2a18c4b6fbd33.svg"
        place3.coordinate = CLLocationCoordinate2D(latitude: -33.9271879,longitude: 18.4327055)

        
        return [place, place2, place3]
    }

    
    
    
    
    
    
    
}




extension UIImageView   {
    
    
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSURLRequest(URL: url)
            NSURLConnection.sendAsynchronousRequest(request, queue: NSOperationQueue.mainQueue()) {
                (response: NSURLResponse?, data: NSData?, error: NSError?) -> Void in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData)
                }
            }
        }
    }
    
}












