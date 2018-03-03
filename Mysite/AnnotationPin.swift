//
//  AnnotationPin.swift
//  Mysite
//
//  Created by Ryan Saleh on 15/02/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import MapKit

class AnnotationPin: NSObject, MKAnnotation{
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, Subtitle:String, coordinate: CLLocationCoordinate2D){
        self.title = title
        self.subtitle = Subtitle
        self.coordinate = coordinate
        
        
    }
}
