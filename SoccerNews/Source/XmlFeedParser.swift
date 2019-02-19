//
//  XmlFeedParser.swift
//  SoccerNews
//
//  Created by NGUYEN VAN THUAN on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import Foundation

public class XmlFeedParser: NSObject, XMLParserDelegate {
    let xmlParser: XMLParser
    var rssFeed: RSSFeed?
    fileprivate var currentXMLDOMPath: URL = URL(string: "/")!
    var parseComplete = false
    public required init(data: Data) {
        self.xmlParser = XMLParser(data: data)
        super.init()
        self.xmlParser.delegate = self
    }
    func parse() {
        let _ = xmlParser.parse()
    }
    fileprivate func map(_ string: String) {
        if let path = RSSPath(rawValue: self.currentXMLDOMPath.absoluteString) {
            self.rssFeed?.map(string, for: path)
        }
    }
}
extension XmlFeedParser {
    public func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        self.currentXMLDOMPath = self.currentXMLDOMPath.appendingPathComponent(elementName)
        if  self.rssFeed == nil {
            self.rssFeed = RSSFeed()
        }
        if let path = RSSPath(rawValue: self.currentXMLDOMPath.absoluteString) {
            self.rssFeed?.map(attributeDict, for: path)
        }
    }
    public func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.currentXMLDOMPath = self.currentXMLDOMPath.deletingLastPathComponent()
        if currentXMLDOMPath.absoluteString == "/" {
            parseComplete = true
        }
    }
    public func parser(_ parser: XMLParser, foundCDATA CDATABlock: Data) {
        guard let string = String(data: CDATABlock, encoding: .utf8) else {
            return
        }
        self.map(string)
    }
    public func parser(_ parser: XMLParser, parseErrorOccurred parseError: Error) {
        print(parseError)
    }
    public func parser(_ parser: XMLParser, foundCharacters string: String) {
        self.map(string)
    }
}
