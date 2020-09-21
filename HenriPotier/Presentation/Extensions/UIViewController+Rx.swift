//
//  UIViewController+Rx.swift
//  HenriPotier
//
//  Created by Thomas Lupo on 21/09/2020.
//  Copyright © 2020 Idally. All rights reserved.
//

import Foundation
import UIKit
import RxCocoa
import RxSwift

public extension Reactive where Base: UIViewController {

    var viewWillAppear: ControlEvent<Void> {
      let source = self.methodInvoked(#selector(Base.viewWillAppear)).map { _ in }
      return ControlEvent(events: source)
    }

    var viewWillDisappear: ControlEvent<Void> {
      let source = self.methodInvoked(#selector(Base.viewWillDisappear)).map { _ in }
      return ControlEvent(events: source)
    }

    var viewDidAppear: ControlEvent<Void> {
      let source = self.methodInvoked(#selector(Base.viewDidAppear)).map { _ in }
      return ControlEvent(events: source)
    }

    var viewDidDisappear: ControlEvent<Void> {
      let source = self.methodInvoked(#selector(Base.viewDidDisappear)).map { _ in }
      return ControlEvent(events: source)
    }
}
