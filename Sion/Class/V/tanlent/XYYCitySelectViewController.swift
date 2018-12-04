//
//  XYYCitySelectViewController.swift
//  xiaoyingying
//
//  Created by leimo on 2018/8/7.
//  Copyright © 2018年 youke. All rights reserved.
//

import UIKit

class XYYCitySelectViewController: UIViewController {
    
    /// 表格
    lazy var tableView: UITableView = UITableView(frame: self.view.frame, style: .plain)
    
    /// 懒加载 城市数据
    lazy var cityDic: [String: [String]] = { () -> [String : [String]] in
        let path = Bundle.main.path(forResource: "cities.plist", ofType: nil)
        let dic = NSDictionary(contentsOfFile: path ?? "") as? [String: [String]]
        return dic ?? [:]
    }()
    /// 懒加载 热门城市
    lazy var hotCities: [String] = {
        let path = Bundle.main.path(forResource: "hotCities.plist", ofType: nil)
        let array = NSArray(contentsOfFile: path ?? "") as? [String]
        return array ?? []
    }()
    /// 懒加载 标题数组
    lazy var titleArray: [String] = { () -> [String] in
        var array = [String]()
        for str in self.cityDic.keys {
            array.append(str)
        }
        // 标题排序
        array.sort()
        array.insert("#", at: 0)
        return array
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupUI()
    }
    
    private func setupUI() {
        
        // 设置导航条
        self.title = "选择城市"
        
        // 设置tableView
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(cellType: XYYCityTableViewCell.self)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        // 右边索引
        tableView.sectionIndexColor = UIColor.orange
        self.view.addSubview(tableView)
    }
    
    deinit {
        print("销毁\(self)")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
// MARK: tableView 代理方法、数据源方法
extension XYYCitySelectViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        
        for view in tableView.subviews {
            if view.isKind(of: NSClassFromString("UITableViewIndex")!) {
                
                view.setValue(UIFont.systemFont(ofSize: 18), forKey: "_font")
                //设置view的大小
                view.bounds = CGRect(x: 0, y: 0, width: 15, height: UIScreen.main.bounds.height)
                view.backgroundColor = UIColor.white
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section > 0 {
            let key = titleArray[section]
            return cityDic[key]!.count
        }
        return 1
    }
    
    // MARK: 创建cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.backgroundColor = UIColor.white
            return cell
        }
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: XYYCityTableViewCell.self)
//        cell.backgroundColor = UIColor.background
        let key = titleArray[indexPath.section]
        cell.cityLabel.text = cityDic[key]![indexPath.row]
        /*
        if indexPath.row == 0 {
            cell.backView.corner(byRoundingCorners: [.topLeft, .topRight], cornerRadii: 5)
        }
        
        if indexPath.row == tableView.numberOfRows(inSection: indexPath.section) - 1{
            cell.backView.corner(byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: 5)
        }
        */
        return cell
    }
    // MARK: 点击cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
//        tableView.deselectRow(at: indexPath, animated: false)
//        let cell = tableView.cellForRow(at: indexPath)
//        print("点击了 \(cell?.textLabel?.text ?? "")")
    }
    
    // MARK: 右边索引
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return titleArray
    }
    
    // MARK: section头视图
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section > 0 {
            let titleSize = "A".size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
            let view = UIView(frame: CGRect(x: 0, y: 0, width: screenWidth, height: 20 + titleSize.height))
            let title = UILabel(frame: CGRect(x: 15, y: 0, width: screenWidth - 15, height: 20 + titleSize.height))
            view.backgroundColor = UIColor(hexString: "#e5e5e5")
            var titleArr = titleArray
            title.text = titleArr[section]
            title.textColor = UIColor.orange//hex(hexString: "#333333")
            title.font = UIFont.boldSystemFont(ofSize: 15)
            view.addSubview(title)
            return view
        }
        return UIView(frame: .zero)
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        let title: String = "A"
        let titleSize = title.size(withAttributes: [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)])
        
        return 20 + titleSize.height
    }
    
    // MARK: row高度
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0 {
            return 100
        }else{
            return 45
        }
    }
}
