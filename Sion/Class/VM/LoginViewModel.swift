//
//  LoginViewModel.swift
//  Sion
//
//  Created by leimo on 2018/3/29.
//  Copyright © 2018年 leimo. All rights reserved.
//

import RxSwift
import RxCocoa
import SwiftyJSON
import HandyJSON

class LoginViewModel {
    let disposeBag = DisposeBag()
    //output:
    //  let validatedPassword: Driver<Bool>
    let signedIn:Driver<Bool>
    
    init(input: (username: Driver<String>, password: Driver<String>, loginTaps: Driver<Void>))
    {
        //合并
        let usernameAndPassword = Driver.combineLatest(input.username, input.password) { ($0,$1)}
        
        signedIn = input.loginTaps.withLatestFrom(usernameAndPassword).flatMapLatest({ (event) in
            print(event)
            return sionProvider.rx.request(.login(phone: event.0, pwd: event.1, type: "1", mobiletype: "2"))
                .asObservable()
                .mapJSON()
                //        .trackActivity(signInIndicator)
                .map({model in
                    let json = JSON(model)
                    print(json["data"])
                    let homeData = JSONDeserializer<HomeNewData>.deserializeFrom(json: json["data"].description)
                    defaultStand.set(homeData?.token, forKey: "token")
                    return true
                }).asDriver(onErrorJustReturn: false)
            
        })
        
    }
}
