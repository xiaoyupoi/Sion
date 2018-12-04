///Users/leimo/Desktop/Sion/Sion
//  SionViewController.swift
//  Sion
//
//  Created by leimo on 2018/3/26.
//  Copyright © 2018年 leimo. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
//import RxDataSources

class SionViewController: RootViewController {
    
    let cellIdentifier = "SionCell"
    
    
    //歌曲列表数据源
    let musicListViewModel = MusicListViewModel()
    //负责对象销毁
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIButton()
        barButton.setTitle("跳过", for: UIControlState.normal)
        barButton.contentHorizontalAlignment = .right
        //    barButton.addTarget(self, action: #selector(passClick), for: UIControlEvents.touchUpInside)
        barButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)//kFont(font: 18)
        
        barButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15)
        
        let rightBarButton = UIBarButtonItem(customView: barButton)//(title: "跳过", target: self, action: #selector(passClick))//(title: "跳过", titleColor: UIColor.white, titleFont: kFont(font: 18), titleEdgeInsets: UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15), target: self, action: #selector(passClick))
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        print("笨蛋吗?")
        // Do any additional setup after loading the view.
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.grouped)
        //    tableView.dataSource = self
        //    tableView.delegate = self
        //去掉分割线
        //    tableView.separatorStyle = .none
        // 设置显示的内容顶点至UITableView边缘的偏移量，如下底部会留出15的空白间距
        //    tableView.contentInset = UIEdgeInsetsMake(0, 0, 15, 0)
        tableView.autoresizingMask = UIViewAutoresizing.flexibleHeight//(rawValue: UIViewAutoresizing.RawValue(1 | 4))
        //隐藏滚动条
        tableView.showsVerticalScrollIndicator = false  //纵向
        tableView.showsHorizontalScrollIndicator = false  //横向
        //背景色
        tableView.backgroundColor = UIColor.init(hexString: "#32df6d")
        //cell预估高度
        tableView.estimatedRowHeight = 70
        //cell高度自适应
        tableView.register(SionTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.view.addSubview(tableView)
        //将数据源数据绑定到tableView上
        
        musicListViewModel.data
            .bind(to: tableView.rx.items(cellIdentifier: cellIdentifier, cellType: SionTableViewCell.self)) { _, music, cell in
                cell.nameLabel.text = music.name
                cell.singerLabel.text = music.singer
            }.disposed(by: disposeBag)
        //tableView点击响应
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
            print("你选中的歌曲信息【\(music)】")
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: disposeBag)
        //通知写法
        NotificationCenter.default.rx
            .notification(.UIApplicationWillEnterForeground).subscribe(onNext: { (notification) in
                print("bakaNotific")
            },onCompleted: {
                
            },onDisposed: {
                
            }).disposed(by: disposeBag)
        RxEventHub.sharedHub.notify(ExampleIntEventProvider(), data: 2)
        
        
        
        //      .subscribe(onNext: { data in
        //        print(data)
        //    }).disposed(by: rx.disposeBag)
        //tableView滚动
        //    tableView.rx.contentOffset
        //      .subscribe(onNext: { contentOffset in
        //        print("contentOffset\(contentOffset)")
        //    }).disposed(by: disposeBag)
        
    }
    /*
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 3//musicListViewModel.data.count
     }
     
     func numberOfSections(in tableView: UITableView) -> Int {
     return 1
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
     let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SionTableViewCell
     //    let music = musicListViewModel.data[indexPath.row]
     //    cell.nameLabel.text = music.name
     //    cell.singerLabel.text = music.singer
     //    cell.textLabel?.text = music.name
     //    cell.detailTextLabel?.text = music.singer
     return cell
     }
     
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
     //    print("您选中的歌曲信息【\(musicListViewModel.data[indexPath.row])】")
     }
     */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        print("50")
    }
    override func viewDidAppear(_ animated: Bool) {
        print("60")
    }
    override func viewWillDisappear(_ animated: Bool) {
        print("70")
    }
    override func viewDidDisappear(_ animated: Bool) {
        print("80")
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
