//
//  InsideProjectVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 15/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import MapKit

class InsideProjectVC: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var progressperLabel: UILabel!
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var LocImageView: UIImageView!
    
    @IBOutlet weak var MaptoPicICN: UIButton!
    
    @IBOutlet weak var PictoMapICN: UIButton!
    
    @IBOutlet var detailsSec: [UIView]!
    
    @IBOutlet var detailsSec2: [UIView]!
    
    @IBOutlet var detailsSec3: [UIView]!
    
    @IBOutlet var detailsSec4: [UIView]!
    
    @IBOutlet var detailsSec5: [UIView]!
    
    @IBOutlet weak var engineerView: UIView!
    
    @IBOutlet weak var ownerView: UIView!
    
    @IBOutlet weak var changeSeg: UISegmentedControl!
    
    @IBOutlet weak var dadyStackView: UIStackView!
    
    @IBOutlet weak var scroolView: UIScrollView!
    
    @IBOutlet weak var threedotICN: UIBarButtonItem!
    
    @IBOutlet weak var navDropfrom3dot: UIView!
    var selProject:Projects!
    @IBAction func DotBTN(_ sender: UIBarButtonItem) {
        
        if navDropfrom3dot.isHidden == true{
            navDropfrom3dot.isHidden = false
        }else if navDropfrom3dot.isHidden == false{
            navDropfrom3dot.isHidden = true
        }
        
    }
    
    
    
    
    // Second outlet view part
   // frist stack view outlets
    @IBOutlet weak var estage1: UITextField!
    @IBOutlet weak var eSection1: UITextField!
    @IBOutlet weak var eprogress1: UITextField!
    @IBOutlet weak var stage1: UILabel!
    @IBOutlet weak var section1: UILabel!
    @IBOutlet weak var progress1: UIProgressView!
    
    
    
    
    
   // Map and Pin Function Start
    
    var pin:AnnotationPin!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        
        let coordinate = CLLocationCoordinate2D(latitude: 24.466667, longitude: 54.366669)
        
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Abudhabi", Subtitle: "", coordinate: coordinate)
        
        mapView.addAnnotation(pin)
        if let pr = Float(selProject.progress!) {
            self.progress1.progress = Float(pr/100)
            self.progressperLabel.text = selProject.progress!+"%"
        }
    }
    
// Map and Pin Function Close
    
// Map Hidden Area Start
    @IBAction func MaptoPicBTn(_ sender: Any) {
        LocImageView.isHidden = true
        if LocImageView.isHidden == true{
            PictoMapICN.isHidden = false
            mapView.isHidden = true
            LocImageView.isHidden = false
            MaptoPicICN.isHidden = true
            
            
        }
        
        
    }
    
    @IBAction func PictoMapBTN(_ sender: Any) {
        mapView.isHidden = true
        if mapView.isHidden == true{
            PictoMapICN.isHidden = true
            MaptoPicICN.isHidden = false
            LocImageView.isHidden = true
            mapView.isHidden = false
            
            
        }
        
    }
    
    
//    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
//        let annotationView = MKAnnotationView(annotation: pin, reuseIdentifier: "dubaiPin")
//        annotationView.image = UIImage(named: "maps-and-flags")
//        let transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
//        annotationView.transform = transform
//        return annotationView
//    }

    // Map Hidden Area Close
    
// DropDown Menu Start
    
  
    @IBAction func dropDownBTN(_ sender: UIButton) {
        detailsSec.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
        
    }
    
    @IBAction func dropDownBTN2(_ sender: UIButton) {
        detailsSec2.forEach { (Button2) in
            UIView.animate(withDuration: 0.3, animations: {
                Button2.isHidden = !Button2.isHidden
                self.view.layoutIfNeeded()
            })
        }
        
    }
    
    @IBAction func dropDownBTN3(_ sender: UIButton) {
        detailsSec3.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func dropDownBTN4(_ sender: UIButton) {
        detailsSec4.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    @IBAction func dropDownBTN5(_ sender: UIButton) {
        detailsSec5.forEach { (Button) in
            UIView.animate(withDuration: 0.3, animations: {
                Button.isHidden = !Button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
   
    @IBAction func ValueChangedSeg(_ sender: UISegmentedControl) {
        if changeSeg.selectedSegmentIndex == 0{
            
            scroolView.isScrollEnabled = true
            dadyStackView.isHidden = false
            ownerView.isHidden = true
            engineerView.isHidden = true
            
            
        }else if changeSeg.selectedSegmentIndex == 1{
            
            scroolView.isScrollEnabled = false
            let desiredOffset = CGPoint(x: 0, y: -self.scroolView.contentInset.top)
            self.scroolView.setContentOffset(desiredOffset, animated: false)
            dadyStackView.isHidden = true
            ownerView.isHidden = true
            engineerView.isHidden = false
            
           
            
        }else if changeSeg.selectedSegmentIndex == 2{
            
            scroolView.isScrollEnabled = false
            let desiredOffset = CGPoint(x: 0, y: -self.scroolView.contentInset.top)
            self.scroolView.setContentOffset(desiredOffset, animated: false)
            dadyStackView.isHidden = true
            ownerView.isHidden = false
            engineerView.isHidden = true
            
        }
        
        
    }
    
    @IBAction func navEditBTN(_ sender: UIBarButtonItem) {
        
        // first view hiding and viewing
        stage1.isHidden = true
        section1.isHidden = true
        progress1.isHidden = true
        // hiding section completed
        estage1.isHidden = false
        eSection1.isHidden = false
        eprogress1.isHidden = false
        //view section completed
        
        
        
    }
    
    @IBAction func navDoneBTN(_ sender: UIBarButtonItem) {
       
        // first view hiding and viewing
        stage1.isHidden = false
        section1.isHidden = false
        progress1.isHidden = false
        // hiding section completed
        estage1.isHidden = true
        eSection1.isHidden = true
        eprogress1.isHidden = true
        //view section completed
        
        stage1.text = estage1.text
        section1.text = eSection1.text
        progress1.progress = (eprogress1.text! as NSString).floatValue
        
        
        
        
        
    }
    
    
    
    
}



