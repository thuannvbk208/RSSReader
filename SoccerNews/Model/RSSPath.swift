//
//  RSSPath.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

enum RSSPath: String {
    case rss                                                    = "/rss"
    case rssChannel                                             = "/rss/channel"
    case rssChannelTitle                                        = "/rss/channel/title"
    case rssChannelLink                                         = "/rss/channel/link"
    case rssChannelDescription                                  = "/rss/channel/description"
    case rssChannelPubDate                                      = "/rss/channel/pubDate"
    case rssChannelGenerator                                    = "/rss/channel/generator"
    case rssChannelTTL                                          = "/rss/channel/ttl"
    case rssChannelItem                                         = "/rss/channel/item"
    case rssChannelItemTitle                                    = "/rss/channel/item/title"
    case rssChannelItemLink                                     = "/rss/channel/item/link"
    case rssChannelItemDescription                              = "/rss/channel/item/description"
    case rssChannelItemAuthor                                   = "/rss/channel/item/author"
    case rssChannelItemEnclosure                                = "/rss/channel/item/enclosure"
    case rssChannelItemGUID                                     = "/rss/channel/item/guid"
    case rssChannelItemPubDate                                  = "/rss/channel/item/pubDate"
}
