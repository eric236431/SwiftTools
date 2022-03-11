//
//  extensionString.swift
//  
//
//  Created by 葉書誠 on 2022/3/11.
//

import UIKit
import Foundation


extension String {
    ///regex 規則
    func matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map {
                result.range(at: $0).location != NSNotFound
                    ? nsString.substring(with: result.range(at: $0))
                    : ""
            }
        }
    }
    
    ///置換字元
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
    
    ///hex to ascii
    func hex2ascii() -> String{
        let example = self
        var chars = [Character]()

        for c in example
        {
            chars.append(c)
        }

        let numbers =  stride(from: 0, to: chars.count, by: 2).map{
                    strtoul(String(chars[$0 ..< $0+2]), nil, 16)
        }
        var final = ""
        var i = 0
        while i < numbers.count {
            final.append(Character(UnicodeScalar(Int(numbers[i]))!))
            i += 1
        }
        return final
    }
    
    ///string to hexString
    func stringValue2HexString(byte: Int) -> String{
        let str = self
        let data = Data(str.utf8)
        var hexString = data.map{ String(format:"%02x", $0) }.joined()
        while hexString.count < byte * 2{
            hexString = "0" + hexString
        }
        return hexString
    }
    
    ///切割字串
    func separatedData(step: Int) -> [String] {
        var myArray : [String] = []
        for i in stride(from: 0, to: self.count-1, by: step){
            let separated = (self as NSString).substring(with: NSMakeRange(i,step))
            myArray.append(separated)
        }
        return myArray
    }
    
    ///hex to int
    func strHex2Int() -> Int{
        let int = Int32(bitPattern: UInt32(self, radix: 16) ?? 0)
        return Int(int)
    }
    func strToUInt8() -> Data {
        var data = Data()
        data.append(Data(base64Encoded: self)!)
        return data
    }
    func str2Double() -> Double{
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        let date = dateFormat.date(from: self)
        let time = date?.timeIntervalSince1970
        return time!
    }
    func str2Date() -> Date{
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        let date = dateFormat.date(from: self)
        return date!
    }
    func index(from: Int) -> Index {
        return self.index(startIndex, offsetBy: from)
    }
    func substring(from: Int) -> String {
        let fromIndex = index(from: from)
        return String(self[fromIndex...])
    }
    func substring(to: Int) -> String {
        let toIndex = index(from: to)
        return String(self[..<toIndex])
    }
    func substring(with r: Range<Int>) -> String {
        let startIndex = index(from: r.lowerBound)
        let endIndex = index(from: r.upperBound)
        return String(self[startIndex..<endIndex])
    }
    func shiftUtc2LocalTZ() -> String{
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        dateFormat.timeZone = TimeZone(abbreviation: "UTC")
        let date = dateFormat.date(from: self)
        let dateStr = date?.convert2LocalTZUtcStr()
        return dateStr!
    }
    func shiftUtc2LocalTZ2() -> String{
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "yyyy/MM/dd HH:mm:ss"
        dateFormat.timeZone = TimeZone(abbreviation: "UTC")
        let date = dateFormat.date(from: self)
        let dateStr = date?.convert2LocalTZUtcStr()
        return dateStr!
    }
    func shiftLocalTZ2Utc() -> String{
        let dateFormat:DateFormatter = DateFormatter()
        dateFormat.dateFormat = "dd/MM/yyyy'T'HH:mm:ss"
        dateFormat.timeZone = TimeZone.autoupdatingCurrent
        let date = dateFormat.date(from: self)
        let dateStr = date?.convert2UtcStr()
        return dateStr!
    }
    
    ///将原始的url编码为合法的url
    func urlEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
        return encodeUrlString ?? ""
    }
    ///将原始的url编码为合法的url
    func urlQueryEncoded() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        return encodeUrlString ?? ""
    }
     
    ///将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
    
    ///轉換成 big5 格式
    var big5Data : NSData? {
        let big5 = CFStringConvertEncodingToNSStringEncoding(CFStringEncoding(CFStringEncodings.big5.rawValue))
        return self.data(using: String.Encoding(rawValue: big5), allowLossyConversion: false) as NSData?;
    }
}
