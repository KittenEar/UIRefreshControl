//
//  ViewController.swift
//  SampleUIRefreshControl
//
//  Created by cat-07 on 2016/03/19.
//  Copyright © 2016年 cat-07. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    private var refreshControl: UIRefreshControl! = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
        
        self.refreshControl = UIRefreshControl.init()
        self.refreshControl.addTarget(self, action: "onRefresh:", forControlEvents: .ValueChanged)
        self.refreshControl.attributedTitle = NSAttributedString.init(string: "Refresh")
        self.tableView.addSubview(self.refreshControl)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    internal func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }

    internal func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier("cell")
        
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier: "cell")
        }
        
        cell?.textLabel?.text = String(indexPath.row)

        return cell!
    }

    func onRefresh(obj: UIRefreshControl) {
        print(obj)
    
        self.tableView.reloadData()
        
        self.refreshControl.endRefreshing()
    }
    
}

