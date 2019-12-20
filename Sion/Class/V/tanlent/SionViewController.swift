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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let barButton = UIButton()
        barButton.setTitle("跳过", for: UIControlState.normal)
        barButton.contentHorizontalAlignment = .right
        barButton.titleLabel?.font = UIFont.systemFont(ofSize: 18)//kFont(font: 18)
        barButton.titleEdgeInsets = UIEdgeInsets.init(top: 0, left: 0, bottom: 0, right: 15)
        let rightBarButton = UIBarButtonItem(customView: barButton)
        self.navigationItem.rightBarButtonItem = rightBarButton
        
        print("笨蛋吗?")
        // Do any additional setup after loading the view.
        let tableView = UITableView(frame: UIScreen.main.bounds, style: UITableViewStyle.grouped)
        
        tableView.autoresizingMask = UIViewAutoresizing.flexibleHeight//(rawValue: UIViewAutoresizing.RawValue(1 | 4))
        //隐藏滚动条
        tableView.showsVerticalScrollIndicator = false  //纵向
        tableView.showsHorizontalScrollIndicator = false  //横向
        //背景色
        tableView.backgroundColor = UIColor.white
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
            }.disposed(by: rx.disposeBag)
        //tableView点击响应
        tableView.rx.modelSelected(Music.self).subscribe(onNext: { music in
            print("你选中的歌曲信息【\(music)】")
            self.navigationController?.popViewController(animated: true)
        }).disposed(by: rx.disposeBag)
        //通知写法
        NotificationCenter.default.rx
            .notification(.UIApplicationWillEnterForeground).subscribe(onNext: { (notification) in
                print("bakaNotific")
            },onCompleted: {
                
            },onDisposed: {
                
            }).disposed(by: rx.disposeBag)
        RxEventHub.sharedHub.notify(ExampleIntEventProvider(), data: 1) //data 通知调用次数
        //Observable 序列
        var observable = Observable.just("Shion")               //通过传入一个默认值初始化
        observable = Observable.of("Shion", "Nana", "Kuro")     //接受同类型的可变量参数
        observable = Observable.from(["Shion", "Nana", "Kuro"]) //接受数组类型参数返回结果同上
        observable = Observable.empty()                         //创建一个空的序列
        observable = Observable.repeatElement("shion")          //永不终止的序列
        //这个block有一个回调参数observer就是订阅这个observable对象的订阅者
        //当一个订阅者订阅这个Observable对象的时候，就会将订阅者作为参数传入这个block来执行一些内容
        observable = Observable.create{ observer in
            observer.onNext("shion su")
            observer.onCompleted()
            return Disposables.create()
        }
        //订阅测试
        observable.subscribe {
            print("observable:\($0)")
        }.disposed(by: rx.disposeBag)
        
        var intObservable = Observable.range(start: 1, count: 3) //Observable.of(1, 2, 3)
        intObservable = Observable.generate(initialState: 0, condition: {
            $0 <= 10
        }, iterate: {
            $0 + 2
        }) //Observable.of(0, 2, 4, 6, 8, 10)
        intObservable.subscribe {
            print("intObservable:\($0)")
            }.disposed(by: rx.disposeBag)
        //用于标记是奇数、还是偶数
        var isOdd = true
        
        //使用deferred()方法延迟Observable序列的初始化，通过传入的block来实现Observable序列的初始化并且返回。
        let factory : Observable<Int> = Observable.deferred {
            
            //让每次执行这个block时候都会让奇、偶数进行交替
            isOdd = !isOdd
            
            //根据isOdd参数，决定创建并返回的是奇数Observable、还是偶数Observable
            if isOdd {
                return Observable.of(1, 3, 5 ,7)
            }else {
                return Observable.of(2, 4, 6, 8)
            }
        }
        /*
        //第1次订阅测试
        factory.subscribe { event in
            print("factory1:\(isOdd)", event)
        }.disposed(by: rx.disposeBag)
        
        //第2次订阅测试
        factory.subscribe { event in
            print("factory2:\(isOdd)", event)
        }.disposed(by: rx.disposeBag)
        
        //每#1秒发送1次event 在主线程
        let interval = Observable<Int>.interval(1, scheduler: MainScheduler.instance)
        
        interval.subscribe { event in
            print("interval:\(event)")
        }.disposed(by: rx.disposeBag)
        
        //5秒种后发出唯一的一个元素0####5, period: 1 延时5秒种后，每隔1秒钟发出一个元素
        let timer = Observable<Int>.timer(5, scheduler: MainScheduler.instance)
        timer.subscribe { event in
            print("timer:\(event)")
        }.disposed(by: rx.disposeBag)
        */
    }
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
