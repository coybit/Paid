//
//  ViewController.swift
//  Paid
//
//  Created by Malij on 4/25/17.
//  Copyright © 2017 Marblzz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionViewImages: UICollectionView!
    var imagePicker:UIImagePickerController?
    let viewModel = ImagesViewModel();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        collectionViewImages.register(UINib(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "cellImage");
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
        let img = info[UIImagePickerControllerOriginalImage] as? UIImage
       
        viewModel.add(Images: img!);
        
        collectionViewImages.reloadData();
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.getImages().count;
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellImage", for: indexPath) as! ImageCollectionViewCell;
        
        let img = viewModel.image(at:indexPath.row);
        cell.imgContent.image = img;
        
        return cell;
    }
    
}

