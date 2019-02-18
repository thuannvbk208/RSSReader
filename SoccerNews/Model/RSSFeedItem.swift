//
//  RSSFeedItem.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

public class RSSFeedItem {
    public var title: String?
    public var link: String?
    public var description: String?
    public var author: String?
    public var pubDate: String?
    public var guid: String?
    public var enclosure: RSSFeedItemEnclosure?
}

extension RSSFeedItem: Equatable {
    public static func == (lhs: RSSFeedItem, rhs: RSSFeedItem) -> Bool {
        return lhs.author == rhs.author &&
               lhs.description == rhs.description &&
               lhs.enclosure == rhs.enclosure &&
               lhs.guid == rhs.guid &&
               lhs.pubDate == rhs.pubDate &&
               lhs.title == rhs.title &&
               lhs.link == lhs.link
    }
}
