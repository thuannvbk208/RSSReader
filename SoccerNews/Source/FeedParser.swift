//
//  FeedParser.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

class FeedParser {
    private var url: URL?
    private var parser: XmlFeedParser?
    public init(_ url: URL) {
        self.url = url
    }
    public func parse() {
        if let url = url {
            do {
                let data = try Data(contentsOf: url)
                parser = XmlFeedParser(data: data)
                parser?.parse()
            } catch {
                print(error)
            }
        }
    }
    
    public func parseAsync(result: @escaping (RSSFeed?)->Void) {
        let queue: DispatchQueue = DispatchQueue.global()
        queue.async {
            self.parse()
            result(self.parser?.rssFeed ?? nil)
        }
    }
}

extension Data {
    func toUtf8() -> Data? {
        var convertedString: NSString?
        let encoding = NSString.stringEncoding(for: self, encodingOptions: nil, convertedString: &convertedString, usedLossyConversion: nil)
        
        guard let str = NSString(data: self, encoding: encoding) as String? else { return nil }
        return str.data(using: .utf8)
    }
}
