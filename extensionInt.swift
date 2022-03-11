//
//  extensionInt.swift
//  
//
//  Created by 葉書誠 on 2022/3/11.
//

import UIKit
import Foundation


extension Int {
    /// 10進 轉 2字元(1byte) 16進
    func int2StrHex2()->String{
        let str = String(format:"%02X", self)
        return str
    }
    /// 10進 轉 4字元(2byte) 16進
    func int2StrHex4()->String{
        let str = String(format:"%04X", self)
        return str
    }
    /// 10進 轉 8字元(4byte) 16進
    func int2StrHex8()->String{
        let str = String(format:"%08X", self)
        return str
    }
    /// 10進 轉 14字元(7byte) 16進
    func int2StrHex14()->String{
        let str = String(format:"%14X", self)
        return str
    }
    /// 10進 轉 2進
    func int2StrBinary()->String{
        let str = String(self, radix: 2)
        return str
    }
}
