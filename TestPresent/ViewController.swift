//
//  ViewController.swift
//  TestPresent
//
//  Created by JunjieLu on 2022/9/21.
//

import UIKit
import SnapKit

class Navigator: UINavigationController {

}

extension UIViewController {
  func wrappedWithinNavigator() -> Navigator {
    Navigator(rootViewController: self)
  }
}

class FirstViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .white

    navigationItem.title = "First"

    let button = UIButton(type: .system)
    button.setTitle("Press", for: .normal)
    view.addSubview(button)
    button.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    button.addAction(.init(handler: { [weak self] _ in
      self?.navigationController?.pushViewController(SecondViewController(), animated: true)
    }), for: .touchUpInside)
  }
}

class SecondViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .blue
    navigationItem.title = "Second"

    let button = UIButton(type: .system)
    button.setTitle("Press", for: .normal)
    view.addSubview(button)
    button.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    button.addAction(.init(handler: { [weak self] _ in
      self?.present(ThirdViewController().wrappedWithinNavigator(), animated: true)
    }), for: .touchUpInside)
  }
}

class ThirdViewController: UIViewController {
  weak var navigator: Navigator?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .red
    navigationItem.title = "Third"

    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
      self.navigator = self.navigationController as? Navigator
    }
  }

//  deinit {
//    self.navigator?.dismiss(animated: true)
//  }
}
