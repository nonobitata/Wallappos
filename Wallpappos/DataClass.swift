//
//  DataClass.swift
//  Wallpappos
//
//  Created by Trung Do on 9/3/16.
//  Copyright © 2016 Trung Do. All rights reserved.
//

import Foundation
import SwiftyJSON

//DataClass contains information about all images it queries from Reddit as an array of struct imageStruct
class DataClass{
    //There is a struct called imageStruct for storing information about each wallpaper.
    
    struct imageStruct{
        var title = String()
        var imageURL = String()
        var thumbnailURL = String()
        var author = String()
        
        init(){
            
        }
        init?(title: String, imgURL: String,thumnail: String, author: String  ){
            if imgURL.isEmpty {
                //discard when there is no imgURL
                return nil
            }
            self.title = title
            self.imageURL = imgURL
            self.thumbnailURL = thumnail

            self.author = author
        }
    }
    var allImages = [imageStruct] ()
    init(){
        parseDataFromReddit()
    }
    
    //This function is used to query data from reddit. It utilizes SwiftyJSON CocoaPods library.
    //Check Podfile for more info.
    func parseDataFromReddit(){
        guard let URL = NSURL(string: "https://www.reddit.com/r/wallpapers/.json"),
            let dataFromNetworking = NSData(contentsOfURL: URL) else { return }
        let json = JSON(data: dataFromNetworking)
       
        for (index,subJson):(String, JSON) in json["data"]["children"] {

            let titleName = subJson["data"]["title"].stringValue
            let thumbnailLink = subJson["data"]["thumbnail"].stringValue

            let authorName = subJson["data"]["author"].stringValue
            let imageLink = subJson["data"]["preview"]["images"][0]["source"]["url"].stringValue
            let newImage = imageStruct(title: titleName, imgURL: imageLink,thumnail: thumbnailLink, author: authorName)
            //Add the image + info to the array that we store all data sources.
            self.allImages.append(newImage!)
            
            //DEBUGGING
            print("Image #" ,index , ": \n Title: ", titleName, "\n Author: " ,authorName, "\n URL: ",thumbnailLink, "\n")
            
        }
            }
}
