//
//  ViewController.swift
//  Paid
//
//  Created by Malij on 4/25/17.
//  Copyright © 2017 Marblzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var imagePicker:UIImagePickerController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func scanDidTouch(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker?.delegate = self
        imagePicker?.sourceType = .camera
        
        present(imagePicker!, animated: true, completion: nil)
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        imagePicker?.dismiss(animated: true, completion: nil)
        var img = info[UIImagePickerControllerOriginalImage] as? UIImage
        
    }
}

