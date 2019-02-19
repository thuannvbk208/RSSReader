//
//  ViewController.swift
//  SoccerNews
//
//  Created by Thuannv on 2/18/19.
//  Copyright © 2019 Thuannv. All rights reserved.
//

import UIKit

class RSSFeedTableViewController: UITableViewController {
    private let url = URL(string: "http://soha.vn/the-thao.rss")!
    lazy var parser = FeedParser(url)
    var feed: RSSFeed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 140
        tableView.dataSource = self
        parser.parseAsync { [weak self] (feed) in
            if let f = feed {
                self?.feed = f
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let name = segue.identifier, name == "DetailItem" {
            if let vc = segue.destination as? RSSFeedDetailViewController {
                let indexPath = self.tableView.indexPathForSelectedRow!
                vc.selectedUrl = self.feed?.getLinkItem(indexPath.row) ?? "No link"
            }
        }
    }
}
extension RSSFeedTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.feed?.getItemCount() ?? 0
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.backgroundColor = UIColor.clear
        cell.detailTextLabel?.backgroundColor = UIColor.clear
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = UIColor(white: 1, alpha: 0)
        } else {
            cell.backgroundColor = UIColor(white: 1, alpha: 1.0)
        }
        
        let img = resizeImage(image: UIImage(named: "icon")!, toTheSize: CGSize(width: 64.0, height: 64.0))
        let layer = cell.imageView?.layer
        layer?.cornerRadius = 35
        layer?.masksToBounds = true
        cell.imageView?.image = img
        
        cell.textLabel?.text = self.feed?.getTitleItem(indexPath.row) ?? "No title"
        cell.textLabel?.textColor = UIColor.black
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.lineBreakMode = .byWordWrapping
        cell.detailTextLabel?.text = self.feed?.getDescriptionItem(indexPath.row) ?? "No description"
        cell.detailTextLabel?.textColor = UIColor.black
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "DetailItem", sender: nil)
    }
    
    
    func resizeImage(image:UIImage, toTheSize size:CGSize)->UIImage? {
        
        let scale = CGFloat(max(size.width/image.size.width,
                                size.height/image.size.height))
        let width:CGFloat  = image.size.width * scale
        let height:CGFloat = image.size.height * scale;
        
        let rr:CGRect = CGRect(x: 0, y: 0, width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0);
        image.draw(in: rr)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext();
        return newImage
    }
}

