//
//  XYYPracticeViewController.swift
//  xiaoyingying
//
//  Created by shutup on 2018/7/2.
//  Copyright © 2018年 youke. All rights reserved.
//

import UIKit
import HandyJSON

class XYYPracticeViewController: RootViewController {
    /*
    lazy var cycleScrollView: CycleScrollView = { //轮播图
        let cycleScrollView = CycleScrollView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth/2))
        cycleScrollView.images = []
        cycleScrollView.addTimer()
        return cycleScrollView nana_kagur
    }()
 */
    lazy var tableView: UITableView = { //数据列表
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.delegate = self
        tableView.dataSource = self
        self.view.addSubview(tableView)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.register(cellType: SionTableViewCell.self)
//        self.tableView.tableHeaderView = self.cycleScrollView
        self.tableView.separatorStyle = .singleLine //.none
        self.tableView.backgroundColor = UIColor.white
        self.tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(UIEdgeInsets.zero)
        }

    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //展示本缓存
    func showCache() {
        //从本地读取缓存
        let pathDocuments = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let createMovFile = pathDocuments + "/practice"//创建目录
        let bannerPath = createMovFile + "/banner.txt"
        do {
            _ = try NSString(contentsOfFile: bannerPath, encoding: String.Encoding.utf8.rawValue)
//            guard let bannerModel = JSONDeserializer<ReturnData<XYYBannerModel>>.deserializeFrom(json: banner as String) else { return }
        } catch{
            //读取本地文件失败
            
            return  
        }

    }
    //将banner图信息存储本地
    func saveBanner(data: String) {
        let fileManager =  FileManager.default
        let pathDocuments = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
        let createMovFile = pathDocuments + "/practice"//创建目录
        if !FileManager.default.fileExists(atPath: createMovFile) {
            do {
                try fileManager.createDirectory(atPath: createMovFile, withIntermediateDirectories: true, attributes: nil)
            } catch{
                
            }
        }

        let array = NSString(string: data)
        let path =  createMovFile + "/banner.txt"
        do {
            try array.write(toFile: path, atomically: true, encoding: String.Encoding.utf8.rawValue)
        } catch{
            
        }
        print(path)
        
    }
    //存储头报列表
        func saveMessage(data: [String: Any]) {
            let fileManager =  FileManager.default
            let pathDocuments = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0]
            let createMovFile = pathDocuments + "/practice"//创建目录
            if !FileManager.default.fileExists(atPath: createMovFile) {
                do {
                    try fileManager.createDirectory(atPath: createMovFile, withIntermediateDirectories: true, attributes: nil)
                } catch{
                    
                }
            }
             
            let array = NSDictionary(dictionary: data)
            let path =  createMovFile + "/recommend.plist"
            array.write(toFile: path, atomically: true)
            print(path)
            
        }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController. 
        // Pass the selected object to the new view controller.
    }
    */

}
extension XYYPracticeViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: SionTableViewCell.self)
        cell.textLabel?.text = "shion"
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        //自定义分区header，
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 0.01))
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 0.01))
        view.backgroundColor = UIColor.white
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
