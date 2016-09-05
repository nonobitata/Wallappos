//
//  DemoPic.swift
//  Wallpappos
//
//  Created by Trung Do on 9/4/16.
//  Copyright © 2016 Trung Do. All rights reserved.
//

import UIKit
import Kingfisher

class DemoPic: UIViewController,UIPopoverPresentationControllerDelegate {

    @IBOutlet weak var wallpaper: UIImageView!
    var picURL = String()
    var image = UIImage()
    override func viewDidLoad() {
        super.viewDidLoad()
        setPicture(picURL)
        // Do any additional setup after loading the view.
    }
    
    //To make sure user doesnt save the image by mistake, an alert is generated to ask if user intended to do so.
    @IBAction func downloadTap(sender: AnyObject) {
        
        //create an alert view with 2 buttons: Cancel and Yes.
        let alert = UIAlertController(title: "Save this image", message: "Do you want to save this wallpaper to your Photos?", preferredStyle: UIAlertControllerStyle.Alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
        //If user taps yes, it means they want to save the image.
        //Do so and also pop up an alert to notice successfully downloaded the image.
        alert.addAction(UIAlertAction(title: "YES", style: UIAlertActionStyle.Default, handler: { action in
            UIImageWriteToSavedPhotosAlbum(self.image,nil,nil,nil);
            let alert1 = UIAlertController(title: "Thank you", message: "Saving completed!", preferredStyle: UIAlertControllerStyle.Alert)
            self.presentViewController(alert1, animated: true, completion: nil)
            alert1.dismissViewControllerAnimated(true, completion: nil)
        }))
        self.presentViewController(alert, animated: true, completion: nil)

    }
    func setPicture(URL:String){
        //set image picture to review.
        //This image will be the full size image query from reddit, not the thumbnail one.
        let url = NSURL(string: URL)
        let data = NSData(contentsOfURL: url!)
        print (URL)
        image = UIImage(data: data!)!
        wallpaper.image = image
    }
    @IBAction func goBackTap(sender: AnyObject) {
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

   

}
