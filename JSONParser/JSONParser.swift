//
//  JSONParser.swift
//
//  Created by Victor Chan on 12/2/15.
//  Copyright (c) 2015 Spark Plug Studio. All rights reserved.
//

import Foundation
infix operator >>> {associativity left precedence 100}

func >>> (data:NSData, key:String) -> AnyObject? {
    if let jsonDict = getJsonData(data) as? NSDictionary{
        return jsonDict.objectForKey(key)
    }else{
        println("JSONParser: data >>> key did not detect dictionary.\nKey:\(key)\n")
        return nil
    }
}

func >>> (data:NSData, index:Int) -> AnyObject?{
    if let jsonArr = getJsonData(data) as? NSArray{
        return jsonArr.objectAtIndex(index)
    }else{
        println("JSONParser: data >>> index did not detect array.\nIndex:\(index)\n")
        return nil
    }
}

func >>> (dictionary:AnyObject?, key:String) -> AnyObject?{
    if let dic:NSDictionary = dictionary as? NSDictionary{
        return dic.objectForKey(key)
    }else{
        println("JSONParser: dictionary >>> key did not detect dictionary or key.\nDictionary:\(dictionary)\nKey:\(key)\n")
        return nil
    }
}

func >>> (array:AnyObject?, index:Int) -> AnyObject?{
    if let arr:NSArray = array as? NSArray{
        return arr.objectAtIndex(index)
    }else{
        println("JSONParser: array >>> index did not detect array or index.\nArray:\(array)\nIndex:\(index)\n")
        return nil
    }
}

func getJsonData(data:NSData) -> AnyObject?{
    var error:NSError?
    let jsonData:AnyObject? = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.allZeros, error: &error)
    if jsonData == nil{
        println("JSONParser: Did not detect JSON Data with error:\(error?.localizedDescription)")
    }
    return jsonData
}