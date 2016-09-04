//
//  DataClass.swift
//  Wallpappos
//
//  Created by Trung Do on 9/3/16.
//  Copyright © 2016 Trung Do. All rights reserved.
//

import Foundation
import SwiftyJSON

class DataClass{
    struct imageStruct{
        var title = String()
        var imageURL = String()
        var author = String()
        init(){
            
        }
        init?(title: String, imgURL: String,author: String  ){
            if imgURL.isEmpty {
                //discard when there is no imgURL
                return nil
            }
            self.title = title
            self.imageURL = imgURL
            self.author = author
        }
    }
    var allImages = [imageStruct] ()
    init(){
        parseDataFromReddit()
    }
    
    func parseDataFromReddit(){
        guard let URL = NSURL(string: "https://www.reddit.com/r/wallpapers/.json"),
            let dataFromNetworking = NSData(contentsOfURL: URL) else { return }
        let json = JSON(data: dataFromNetworking)
       // print(json)
     //   let dict = json["data"]["children"].array
       // print(dict)
        for (index,subJson):(String, JSON) in json["data"]["children"] {
            //Do something you want
            print(subJson["data"]["author"])

        }
            }
}
