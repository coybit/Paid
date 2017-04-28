//
//  ImagesViewModel.swift
//  Paid
//
//  Created by Malij on 4/28/17.
//  Copyright © 2017 Marblzz. All rights reserved.
//

import UIKit

class ImagesViewModel: NSObject {

    private let model = ImagesModel();
    private var imagesList:[UIImage] = [];
    
    override init() {
        super.init();
        
        loadImages();
    }
    
    private func loadImages() {
        
        imagesList = model.savedImages()
        
    }
    
    func add(Images img:UIImage) -> Bool {
        
        let ret = model.save(Image: img);
        
        if ret {
            imagesList.append(img);
        }
        
        return ret;
    }
    
    func image(at idx:Int) -> UIImage {
        return imagesList[idx];
    }
    
    func getImages() -> [UIImage] {
        return imagesList;
    }
    
}
