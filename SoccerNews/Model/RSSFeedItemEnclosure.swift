//
//  RSSFeedItemEnclosure.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

public class RSSFeedItemEnclosure {
    public class Attributes {
        public var url: String?
        public var length: Int64?
        public var type: String?
    }
    public var attributes: Attributes?
}

extension RSSFeedItemEnclosure {
    convenience init(attributes attributeDict: [String : String]) {
        self.init()
        self.attributes = RSSFeedItemEnclosure.Attributes(attributes: attributeDict)
    }
}

extension RSSFeedItemEnclosure.Attributes {
    convenience init?(attributes attributeDict: [String : String]) {
        if attributeDict.isEmpty {
            return nil
        }
        self.init()
        self.url     = attributeDict["url"]
        self.type    = attributeDict["type"]
        self.length  = Int64(attributeDict["length"] ?? "")
    }
}

extension RSSFeedItemEnclosure: Equatable {
    public static func ==(lhs: RSSFeedItemEnclosure, rhs: RSSFeedItemEnclosure) -> Bool {
        return lhs.attributes == rhs.attributes
    }
    
}

extension RSSFeedItemEnclosure.Attributes: Equatable {
    public static func ==(lhs: RSSFeedItemEnclosure.Attributes, rhs: RSSFeedItemEnclosure.Attributes) -> Bool {
        return
            lhs.url == rhs.url &&
            lhs.type == rhs.type &&
            lhs.length == rhs.length
    }
}
