//
//  extensionDate.swift
//  
//
//  Created by 葉書誠 on 2022/3/11.
//

import Foundation
import UIKit


extension Date {
    func daysBetweenDate(Date: Date) -> Int {
        let components = Calendar.current.dateComponents([.day], from: Date, to: self)
        return components.day ?? 0
    }
    var millisecondsSince1970:Int64 {
        return Int64((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    func convert2UtcStr() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.timeZone = TimeZone(abbreviation: "UTC")
        dataFormatter.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        return dataFormatter.string(from: self)
    }
    func convert2LocalTZUtcStr() -> String{
        let autoUpdateTimezone = TimeZone.autoupdatingCurrent
        let dataFormatter = DateFormatter()
        dataFormatter.timeZone = autoUpdateTimezone
        dataFormatter.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        return dataFormatter.string(from: self)
    }
    func convert2LocalHex() -> String{
        let autoUpdateTimezone = TimeZone.autoupdatingCurrent
        let dataFormatter = DateFormatter()
        dataFormatter.timeZone = autoUpdateTimezone
        //dataFormatter.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        dataFormatter.dateFormat = "yyyy"
        let year = Int(dataFormatter.string(from: self))!.int2StrHex4()
        dataFormatter.dateFormat = "MM"
        let month = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "dd"
        let day = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "HH"
        let hour = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "mm"
        let min = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "ss"
        let sec = Int(dataFormatter.string(from: self))!.int2StrHex2()
        
        return year+month+day+hour+min+sec
    }
    
    func convert2UtcHex() -> String{
        let dataFormatter = DateFormatter()
        dataFormatter.timeZone = TimeZone(abbreviation: "UTC")
        //dataFormatter.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        dataFormatter.dateFormat = "yyyy"
        let year = Int(dataFormatter.string(from: self))!.int2StrHex4()
        dataFormatter.dateFormat = "MM"
        let month = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "dd"
        let day = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "HH"
        let hour = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "mm"
        let min = Int(dataFormatter.string(from: self))!.int2StrHex2()
        dataFormatter.dateFormat = "ss"
        let sec = Int(dataFormatter.string(from: self))!.int2StrHex2()
        
        return year+month+day+hour+min+sec
    }
}
