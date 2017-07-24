//
//  StringExt.swift
//  DGFramwork
//
//  Created by Kevin B. Adesara on 24/07/17.
//  Copyright © 2017 Digicorp. All rights reserved.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
    // MARK:- Capitalization
    func capitalizingFirstLetter() -> String {
        let sentences = self.components(separatedBy: ".")
        var convertedSentences: [String] = []
        for sentence in sentences {
            let s = sentence.lowercased()
            let first = String(s.characters.prefix(1)).capitalized
            let other = String(s.characters.dropFirst())
            convertedSentences.append(first + other)
        }
        return convertedSentences.joined(separator: ".")
    }
    
    mutating func capitalizeFirstLetter() {
        self = self.capitalizingFirstLetter()
    }
    
    // MARK:- Convert to attributed string
    func toAttributed(highlight: String, with attributes: [String: Any]) -> NSAttributedString {
        let ranges = rangesOfString(s: highlight)
        let attributedString = NSMutableAttributedString(string:self)
        for range in ranges {
            attributedString.addAttributes(attributes, range: range)
        }
        
        return attributedString
    }
    
    func toAttributed(highlight: [String], with attributes: [String: Any]) -> NSAttributedString {
        let mutableAttributedString = NSMutableAttributedString(string:self)
        
        for s in highlight {
            let ranges = rangesOfString(s: s)
            for range in ranges {
                mutableAttributedString.addAttributes(attributes, range: range)
            }
        }
        
        return mutableAttributedString
    }
    
    // MARK:- Find Range
    
    func rangesOfString(s: String) -> [NSRange] {
        let ranges: [NSRange]
        
        do {
            // Create the regular expression.
            let regex = try NSRegularExpression(pattern: s, options: [])
            
            // Use the regular expression to get an array of NSTextCheckingResult.
            // Use map to extract the range from each result.
            ranges = regex.matches(in: self, options: [], range: NSMakeRange(0, self.characters.count)).map {$0.range}
        }
        catch {
            // There was a problem creating the regular expression
            ranges = []
        }
        return ranges
    }
    
    // MARK:- Find height
    
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        
        return boundingBox.height
    }
    
    /*func md5() -> String {
     let messageData = self.data(using:.utf8)!
     var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
     
     _ = digestData.withUnsafeMutableBytes { digestBytes in
     messageData.withUnsafeBytes { messageBytes in
     CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
     }
     }
     
     return digestData.map { String(format: "%02hhx", $0) }.joined()
     }*/
}
