//
//  ViewController.swift
//  TestPresent
//
//  Created by JunjieLu on 2022/9/21.
//

import UIKit
import SnapKit

extension UIViewController {
  func wrappedWithinNavigationController() -> UINavigationController {
    UINavigationController(rootViewController: self)
  }
}

class FirstViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .black

    navigationItem.title = "First"
    navigationItem.largeTitleDisplayMode = .always

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
      self?.navigationController?.present(ThirdViewController().wrappedWithinNavigationController(), animated: true)
    }), for: .touchUpInside)
  }
}

class ThirdViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    view.backgroundColor = .red
    navigationItem.title = "Third"
  }
}
