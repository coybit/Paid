//
//  ImgesModel.swift
//  Paid
//
//  Created by Malij on 4/28/17.
//  Copyright © 2017 Marblzz. All rights reserved.
//

import Foundation
import UIKit

class ImagesModel {
    
    func save(Image img:UIImage) -> Bool {
        
        do {
            // Create path.
            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first;
            
            let formatter = DateFormatter();
            formatter.dateFormat = "yyyy-MM-dd hh-mm-ss"
            let fileName = formatter.string(from: Date()).appending(".png");
            
            let filePath = NSURL(fileURLWithPath: documentPath!).appendingPathComponent(fileName);
            
            // Save image.
            try UIImagePNGRepresentation(img)?.write(to: filePath!);
            return true;
            
        }
        catch {
            
            return false;
            
        }
    }
    
    func savedImages() -> [UIImage] {
        
        var images:[UIImage] = [];
        
        do
        {
            let documentPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first;
            
            let files = try FileManager.default.contentsOfDirectory(atPath: documentPath!);
            
            for file in files {
                
                let filePath = NSURL(fileURLWithPath: documentPath!).appendingPathComponent(file);
                
                let img = UIImage(contentsOfFile: (filePath?.path)!);
                
                if img != nil {
                    
                    images.append(img!);
                    
                }
                
            }
        }
        catch {
            
        }
        
        return images;
    }
    
}
