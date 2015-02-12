//
//  JSONParser.swift
//
//  Created by Victor Chan on 12/2/15.
//
//The MIT License (MIT)
//
//Copyright (c) 2015 Victor Chan
//
//Permission is hereby granted, free of charge, to any person obtaining a copy
//of this software and associated documentation files (the "Software"), to deal
//in the Software without restriction, including without limitation the rights
//to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//copies of the Software, and to permit persons to whom the Software is
//furnished to do so, subject to the following conditions:
//
//The above copyright notice and this permission notice shall be included in all
//copies or substantial portions of the Software.
//
//THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//SOFTWARE.



import Foundation
infix operator >>> {associativity left precedence 100}

func >>> (dictionary:AnyObject?, key:String) -> AnyObject?{
    if let dic:NSDictionary = dictionary as? NSDictionary{
        return dic.objectForKey(key)
    }else{
        println("JSONParser: dictionary >>> key did not detect dictionary.\nDictionary:\(dictionary)\nKey:\(key)\n")
        return nil
    }
}

func >>> (array:AnyObject?, index:Int) -> AnyObject?{
    if let arr:NSArray = array as? NSArray{
        if (index>arr.count-1 || index<0) {
            println("JSONParser: data >>> index exceeded maximun array index.\nIndex:\(index)\n")
            return nil
        }else{
            return arr.objectAtIndex(index)
        }
    }else{
        println("JSONParser: array >>> index did not detect array.\nArray:\(array)\nIndex:\(index)\n")
        return nil
    }
}

func >>> (data:NSData, key:String) -> AnyObject? {
    return getJsonData(data) >>> key
}

func >>> (data:NSData, index:Int) -> AnyObject?{
    return getJsonData(data) >>> index
}

func >>> (opData:NSData?, key:String) -> AnyObject? {
    if let data = opData{
        return data >>> key
    }else{
        return nil
    }
}

func >>> (opData:NSData?, index:Int) -> AnyObject?{
    if let data = opData{
        return data >>> index
    }else{
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