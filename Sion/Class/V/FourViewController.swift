//
//  FourViewController.swift
//  swift
//
//  Created by leimo on 2018/3/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources
import Reusable
import AVFoundation
import Photos
import Kingfisher

enum Expression {
    case number(Double)
    case string(String)
}

class Pencil {
    var type: String
    var price: Double
    
    init(_ type: String, _ price: Double) {
        self.type = type
        self.price = price
    }
}

class FourViewController: RootViewController {

    var tableView: UITableView!
    var index : IndexPath?
    
    var array: [String] = ["http://www.w3school.com.cn/example/html5/mov_bbb.mp4", "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action:  #selector(tableViewRefresh), for: UIControlEvents.valueChanged)
        refreshControl.attributedTitle = NSAttributedString(string:"下拉刷新")
        refreshControl.backgroundColor = UIColor.green//设置背景色
        refreshControl.tintColor = UIColor.orange//菊花的颜色
        
//        self.tabBarController?.tabBar.isHidden = true
        tableView = UITableView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight), style: UITableViewStyle.plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.isPagingEnabled = true
        tableView.register(ViedoTableViewCell.self, forCellReuseIdentifier: FourViewController.cellID)
        self.view.addSubview(tableView)
//        self.tableView.refreshControl = refreshControl
        
        let btn = UIButton()
        
        btn.setImage(UIImage(named: "WX1"), for: UIControlState.normal)
        
        var a = 3
        var b = 4
        let c = a + b
        print(c)
        a = 5
        b = 7
        print(c)
        /*
        CFGetRetainCount(Pencil("2B", 1.0) as CFTypeRef)    
        // 1
        
        let pencil2B = Pencil("2B", 1.0)
        let pencilHB = Pencil("HB", 2.0)
        
        CFGetRetainCount(pencil2B as CFTypeRef)
        CFGetRetainCount(pencilHB as CFTypeRef)
        // 2 2
        
        let pencilBox = [pencil2B, pencilHB]    
        
        CFGetRetainCount(pencil2B as CFTypeRef)
        CFGetRetainCount(pencilHB as CFTypeRef)
        // 3 3
        print(CFGetRetainCount(pencilHB as CFTypeRef))
        */
    }
    @objc func tableViewRefresh() {
        print("下拉")
//        self.tableView.refreshControl?.endRefreshing()
    }

    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(true)
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated. 韵达 3977981977837
    }
}

extension FourViewController: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    static let cellID = "cc"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(self.array.count)
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: ViedoTableViewCell = tableView.dequeueReusableCell(withIdentifier: FourViewController.cellID) as! ViedoTableViewCell
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        
        self.index = indexPath
        cell.textLabel?.text = "skin\(indexPath.row)"
        /*
        if MediaManager.sharedInstance.player != nil {
            MediaManager.sharedInstance.player?.toEmbedded()
            
        }else{
            MediaManager.sharedInstance.playEmbeddedVideo(url: URL(string: array[indexPath.row])!, embeddedContentView: cell.contentView, userinfo: ["autoPlay": true])//["skin" : UIView()]
            MediaManager.sharedInstance.player?.indexPath = indexPath
            MediaManager.sharedInstance.player?.scrollView = tableView
        }
        */
        return cell
        
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.index?.row == array.count - 2 {
            print("加载更多数据")
            self.array.append("http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
            print(self.array.count)
            self.tableView.reloadData()
        }else{
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let player = MediaManager.sharedInstance.player  ,let index = player.indexPath , index == indexPath{
            return
        }
        let cell = tableView.cellForRow(at: indexPath)
        self.index = indexPath
        MediaManager.sharedInstance.playEmbeddedVideo(url: URL(string: array[indexPath.row])!, embeddedContentView: cell?.contentView)
        MediaManager.sharedInstance.player?.indexPath = indexPath
        MediaManager.sharedInstance.player?.scrollView = tableView
    }
}
