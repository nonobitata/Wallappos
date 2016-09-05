//
//  FirstViewController.swift
//  Wallpappos
//
//  Created by Trung Do on 9/3/16.
//  Copyright © 2016 Trung Do. All rights reserved.
//

import UIKit
import AVFoundation
import Kingfisher

class FirstViewController: UICollectionViewController {
    let dataSource = DataClass()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        collectionView?.delegate = self
        collectionView?.dataSource = self

        
    }
    
    //POP UP A PREVIEW WITH APP ICONS SO USER CAN SEE HOW IT LOOKS LIKE
    func createADemoView(URL: String){
        let storyboard : UIStoryboard = UIStoryboard(
            name: "Main",
            bundle: nil)
        let previewVC = storyboard.instantiateViewControllerWithIdentifier("DemoPiccc") as! DemoPic
        previewVC.modalPresentationStyle = .Popover
        previewVC.picURL = URL
        previewVC.preferredContentSize = CGSizeMake(view.frame.width, view.frame.height)


        //re
        presentViewController(previewVC,animated: true,completion: nil)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.allImages.count
    }
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            createADemoView(dataSource.allImages[indexPath.item].imageURL)

    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CellWithInfo", forIndexPath: indexPath) as! CellWithInfo
        //Utilizes Kingfisher CocoaPods library to do query image for fastest performance.
        cell.photo.kf_setImageWithURL(NSURL(string: dataSource.allImages[indexPath.item].thumbnailURL )!, placeholderImage: nil,optionsInfo: [.ForceRefresh])
        cell.title.text = dataSource.allImages[indexPath.item].title
        cell.author.text = "by: " + dataSource.allImages[indexPath.item].author
        cell.layer.borderWidth = 0.5
        cell.layer.cornerRadius = 15

        cell.layer.borderColor = UIColor.darkGrayColor().CGColor
        return cell
    }
        

}

