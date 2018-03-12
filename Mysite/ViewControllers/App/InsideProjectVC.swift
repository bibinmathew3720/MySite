//
//  InsideProjectVC.swift
//  Mysite
//
//  Created by Ryan Saleh on 15/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit
import MapKit

class InsideProjectVC: UIViewController, MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate  {
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
    

    
    @IBOutlet weak var changeSeg: UISegmentedControl!
    
    @IBOutlet weak var dadyStackView: UIStackView!
    
    
    
    @IBOutlet weak var threedotICN: UIBarButtonItem!
    
    @IBOutlet weak var phTF: UITextField!
    @IBOutlet weak var projectTF: UITextField!
    @IBOutlet weak var locationTF: UITextField!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var conNameTF: UITextField!
    @IBOutlet weak var conLocationTF: UITextField!
    @IBOutlet weak var conProjectTF: UITextField!
    @IBOutlet weak var conEmailTF: UITextField!
    @IBOutlet weak var conPhoneTF: UITextField!
    @IBOutlet weak var stagesTableView: UITableView!
    @IBOutlet weak var navDropfrom3dot: UIView!
    var selProject:Projects!
    var projectDict:[String:AnyObject] = [:]
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
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var engineerView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contractorView: UIScrollView!
    
    var stagesArray = [Stages]()
   // Map and Pin Function Start
    
    var pin:AnnotationPin!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        populatPrjectDetails()
        self.engineerView.isHidden = true;
        scrollView.isHidden = true
        self.tableView.delegate=self;
        self.tableView.dataSource=self;
        
        mapView.delegate = self
        
        let coordinate = CLLocationCoordinate2D(latitude: 24.466667, longitude: 54.366669)
        
        let region = MKCoordinateRegionMakeWithDistance(coordinate, 1000, 1000)
        
        mapView.setRegion(region, animated: true)
        
        pin = AnnotationPin(title: "Abudhabi", Subtitle: "", coordinate: coordinate)
        
        mapView.addAnnotation(pin)
//        if let pr = Float(selProject.progress!) {
//            self.progress1.progress = Float(pr/100)
//            self.progressperLabel.text = selProject.progress!+"%"
//        }
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
            

            tableView.isHidden = false
            engineerView.isHidden = true
            scrollView.isHidden = true
            
            contractorView.isHidden = true
            
            
        }else if changeSeg.selectedSegmentIndex == 1{
            

            tableView.isHidden = true
            engineerView.isHidden = false
            scrollView.isHidden = false
            contractorView.isHidden = true
           
            
        }else if changeSeg.selectedSegmentIndex == 2{
            tableView.isHidden = true
            engineerView.isHidden = true
            scrollView.isHidden = true
            contractorView.isHidden = false
            
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
        
       saveProjectDetails()
    }
    
    func populatPrjectDetails(){
        stagesArray = Stages.getStagesOfProject(projectId: selProject.projectId!)
        let project = Projects.getProjectData(projectId: selProject.projectId!)
        self.nameTF.text = project.engName
        self.locationTF.text = project.engLocation
        self.projectTF.text = project.engProject
        self.emailTF.text = project.engEmail
        self.phTF.text = project.engPhone
        self.conNameTF.text = project.conName
        self.conLocationTF.text = project.conLocation
        self.conProjectTF.text = project.conProject
        self.conEmailTF.text = project.conEmail
        self.conPhoneTF.text = project.conPhone
        self.title = project.name
    }
    
    
    @IBAction func submitButtonAction(_ sender: UIButton) {
      saveProjectDetails()
    }
    
    func saveProjectDetails(){
        //Engineer Details
        projectDict ["engName"] = self.nameTF.text as AnyObject
        projectDict ["engLocation"] = self.locationTF.text as AnyObject
        projectDict ["engProject"] = self.projectTF.text as AnyObject
        projectDict ["engEmail"] = self.emailTF.text as AnyObject
        projectDict ["engPhone"] = self.phTF.text as AnyObject
        
        //Contractor Details
        
        projectDict ["conName"] = self.conNameTF.text as AnyObject
        projectDict ["conLocation"] = self.conLocationTF.text as AnyObject
        projectDict ["conProject"] = self.conProjectTF.text as AnyObject
        projectDict ["conEmail"] = self.conEmailTF.text as AnyObject
        projectDict ["conPhone"] = self.conPhoneTF.text as AnyObject
        
        Projects.updateEngineerContractorDetails(engConDetails: projectDict as! Dictionary<String, String>, projectId: self.selProject.projectId!)
    }
    
    
    //------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
    //Update Code
    
    
    
    // MARK: Table View Datasources
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return stagesArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "projectDetailCell", for: indexPath) as! ProjectDetailTableViewCell
        cell.setStageDetails(stageDetail: stagesArray[indexPath.section])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView=UIView()
        headerView.backgroundColor=UIColor.clear
        return headerView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "projectDetailToDocumentSegue"){
            let documentDetail = segue.destination as! ShowDocumentViewController
            documentDetail.projectId = self.selProject.projectId
        }
    }
}



