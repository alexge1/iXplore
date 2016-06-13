//
//  SpotsViewController.swift
//  iXplore
//
//  Created by Alexander Ge on 6/9/16.
//  Copyright © 2016 Alexander Ge. All rights reserved.
//

import UIKit
import MapKit


class PlacesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var tableView: UITableView!
    
    var places: [Place] = Place.placeList()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        setupMapView()
        
        setupTableView()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func setupMapView()
    {
        self.mapView.mapType = .Hybrid
        self.mapView.showsBuildings = true
        self.mapView.addAnnotations(self.places)
        
    }
    
    func setupTableView()
    {
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        tableView.registerNib(UINib(nibName: "PlaceTableViewCell", bundle: nil), forCellReuseIdentifier: "places")
        
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        print (places.count)
        return places.count
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return "Places"
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        
        
        let cell: PlaceTableViewCell! = tableView.dequeueReusableCellWithIdentifier("places") as? PlaceTableViewCell
        
        if let _ = places[indexPath.row].title
        {
            cell.titleLabel.text = places[indexPath.row].title!
        }
        print(indexPath.row)
        print(places[indexPath.row].title!)
        
        if let image = places[indexPath.row].imageURL
        {
            
            
            cell.titleImage.imageFromUrl(image)

            // wont work because the webrequest isn't getting back in time for cell.titleImage = logoImage
            //let logoImage = UIImageView()
            //logoImage.imageFromUrl(image)
            //cell.titleImage = logoImage
        }
        
        if let date = places[indexPath.row].date
        {
            
//            let africaCalendar = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)!
//            africaCalendar.timeZone = NSTimeZone(name: "Africa/Johannesburg")!
//            
//            let requestedDateComponents: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute]
//            
//            let visitDate = africaCalendar.components(requestedDateComponents,fromDate: date)
//            
//            let dateString = visitDate.month + "/" + visitDate.day + "/" + visitDate.year + " " + visitDate.hour + ":" + visitDate.minute
//            
//            if (visitDate.hour < 12)
//            {
//                cell.dateLabel.text = dateString + "am"
//            }
//            else
//            {
//                cell.dateLabel.text = dateString + "pm"
//            }
            
            //cell.dateLabel.text = date.getStringFromDate
            
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.locale = NSLocale.currentLocale()
            dateFormatter.dateFormat = "MM/dd/yyyy HH:mma"
            cell.dateLabel.text = dateFormatter.stringFromDate(date)
            
            
            
            
        }
            
        
        
        
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath)
    {
        
        let place = places[indexPath.row]
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let mapCenterCoordinateAfterMove = place.coordinate
        
        mapView.setCenterCoordinate(mapCenterCoordinateAfterMove, animated: true)
        
        let adjustedRegion = mapView.regionThatFits(MKCoordinateRegionMake(mapCenterCoordinateAfterMove,MKCoordinateSpanMake(0.01, 0.01)))
        
        mapView.setRegion(adjustedRegion, animated: true)
        
    }
    
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        
        if editingStyle == UITableViewCellEditingStyle.Delete
        {
            places.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
        
    }
    
    
    
    
    
    
}

















