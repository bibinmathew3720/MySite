//
//  Utilities.swift
//  Mysite
//
//  Created by Bibin Mathew on 3/8/18.
//  Copyright © 2018 CodeDady. All rights reserved.
//

import UIKit

class Utilities: NSObject {
    func saveImageDocumentDirectory(image:UIImage,identifier:String){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent(identifier)
        print(paths)
        let imageData = UIImageJPEGRepresentation(image, 0.5)
        fileManager.createFile(atPath: paths as String, contents: imageData, attributes: nil)
    }
    
    func getImage(identifier:String)->UIImage{
        let fileManager = FileManager.default
        let imagePAth = (self.getDirectoryPath() as NSString).appendingPathComponent(identifier)
        if fileManager.fileExists(atPath: imagePAth){
            return UIImage(contentsOfFile: imagePAth)!
        }else{
            return UIImage.init(named: "architecture-modern-residence3-1000x450")!
        }
    }
    
    func getDirectoryPath() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func createDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if !fileManager.fileExists(atPath: paths){
            try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
        }else{
            print("Already dictionary created.")
        }
    }
    
    func deleteDirectory(){
        let fileManager = FileManager.default
        let paths = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
        if fileManager.fileExists(atPath: paths){
            try! fileManager.removeItem(atPath: paths)
        }else{
            print("Something wronge.")
        }
    }
}
