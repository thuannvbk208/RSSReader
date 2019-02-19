//
//  RSSFeed.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

public class RSSFeed {
    private var title: String?
    private var link: String?
    private var description: String?
    private var pubDate: String?
    private var generator: String?
    private var ttl: Int?
    private var items: [RSSFeedItem]?
    
    public func getTitleItem(_ index: Int) -> String? {
        return items?[index].title ?? nil
    }
    
    public func getLinkItem(_ index: Int) -> String? {
        return items?[index].link ?? nil
    }
    
    public func getDescriptionItem(_ index: Int) -> String? {
        return items?[index].description ?? nil
    }
    
    public func getPubDateItem(_ index: Int) -> String? {
        return items?[index].pubDate ?? nil
    }
    
    public func getAuthorItem(_ index: Int) -> String? {
        return items?[index].author ?? nil
    }
    
    public func getEnclosureItem(_ index: Int) -> String? {
        return items?[index].enclosure?.attributes?.url ?? nil
    }
    
    public func getItemCount() -> Int? {
        return items?.count ?? nil
    }
}

extension RSSFeed: Equatable {
    public static func == (lhs: RSSFeed, rhs: RSSFeed) -> Bool {
        return lhs.title! == rhs.title! &&
               lhs.link! == rhs.link! &&
               lhs.description! == rhs.description! &&
               lhs.pubDate! == rhs.pubDate! &&
               lhs.generator! == rhs.generator! &&
               lhs.ttl! == rhs.ttl! &&
               lhs.items! == rhs.items!
    }
}

extension RSSFeed {
    func map(_ string: String, for path: RSSPath) {
        switch path {
        case .rssChannelTitle: self.title = self.title?.appending(string) ?? string
        case .rssChannelDescription: self.description = self.description?.appending(string) ?? string
        case .rssChannelLink: self.link = self.link?.appending(string) ?? string
        case .rssChannelPubDate: self.pubDate = self.pubDate?.appending(string) ?? string
        case .rssChannelGenerator: self.generator = self.generator?.appending(string) ?? string
        case .rssChannelTTL: self.ttl = Int(string)
        case .rssChannelItemTitle:
            self.items?.last?.title = self.items?.last?.title?.appending(string) ?? string
        case .rssChannelItemLink:
            self.items?.last?.link = self.items?.last?.link?.appending(string) ?? string
        case .rssChannelItemDescription:
            self.items?.last?.description = self.items?.last?.description?.appending(string) ?? string
        case .rssChannelItemGUID:
            self.items?.last?.guid = self.items?.last?.guid?.appending(string) ?? string
        case .rssChannelItemAuthor:
            self.items?.last?.author = self.items?.last?.author?.appending(string) ?? string
        case .rssChannelItemPubDate:
            self.items?.last?.pubDate = self.items?.last?.pubDate?.appending(string) ?? string
        default:
            break
        }
    }
    func map(_ attributes: [String : String], for path: RSSPath) {
        switch path {
        case .rssChannelItem:
            if  self.items == nil {
                self.items = []
            }
            self.items?.append(RSSFeedItem())
        case .rssChannelItemEnclosure:
            if  self.items?.last?.enclosure == nil {
                self.items?.last?.enclosure = RSSFeedItemEnclosure(attributes: attributes)
            }
        default:
            break
        }
    }
}

