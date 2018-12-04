//
//  UIImagePickerController+Rx.swift
//  LieLieSwift
//
//  Created by leimo on 2018/5/23.
//  Copyright © 2018年 leimo. All rights reserved.
//

#if os(iOS)
  
  import RxSwift
  import RxCocoa
  import UIKit
  
  extension Reactive where Base: UIImagePickerController {
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didFinishPickingMediaWithInfo: Observable<[String : AnyObject]> {
      return delegate
        .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerController(_:didFinishPickingMediaWithInfo:)))
        .map({ (a) in
          print("确定")
          return try castOrThrow(Dictionary<String, AnyObject>.self, a[1])
        })
    }
    
    /**
     Reactive wrapper for `delegate` message.
     */
    public var didCancel: Observable<()> {
      return delegate
        .methodInvoked(#selector(UIImagePickerControllerDelegate.imagePickerControllerDidCancel(_:)))
        .map {_ in ()
          print("取消")
      }
    }
    
  }
  
#endif

fileprivate func castOrThrow<T>(_ resultType: T.Type, _ object: Any) throws -> T {
  guard let returnValue = object as? T else {
    throw RxCocoaError.castingError(object: object, targetType: resultType)
  }
  
  return returnValue
}
