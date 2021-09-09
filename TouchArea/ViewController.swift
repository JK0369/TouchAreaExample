//
//  ViewController.swift
//  TouchArea
//
//  Created by 김종권 on 2021/09/09.
//

import UIKit

class ViewController: UIViewController {

    lazy var flexibleView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray

        return view
    }()

    lazy var normalButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)
        button.backgroundColor = .red.withAlphaComponent(0.5)
        button.addTarget(self, action: #selector(didTapNormalButton(_:)), for: .touchUpInside)

        return button
    }()

lazy var extendedTouchAreaButton: BaseButton = {
    let button = BaseButton()
    button.setImage(#imageLiteral(resourceName: "addButton"), for: .normal)
    button.backgroundColor = .green.withAlphaComponent(0.5)
    button.addTarget(self, action: #selector(didTapExtendedButton(_:)), for: .touchUpInside)

    return button
}()

    lazy var resultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black

        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(flexibleView)
        flexibleView.frame = CGRect(x: 120, y: 120, width: 100, height: 100)

        view.addSubview(normalButton)
        view.addSubview(extendedTouchAreaButton)
        view.addSubview(resultLabel)

        normalButton.translatesAutoresizingMaskIntoConstraints = false
        extendedTouchAreaButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            normalButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            normalButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            extendedTouchAreaButton.topAnchor.constraint(equalTo: normalButton.bottomAnchor, constant: 32),
            extendedTouchAreaButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            resultLabel.topAnchor.constraint(equalTo: extendedTouchAreaButton.bottomAnchor, constant: 100),
            resultLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        UIView.animate(withDuration: 2) {
            print("before rect = \(self.flexibleView.bounds)")
            self.flexibleView.bounds = self.flexibleView.bounds.insetBy(dx: -20, dy: -20)
            print("after rect = \(self.flexibleView.bounds)")
        }
    }

    var normalCount = 0
    var extendedCount = 0
    @objc
    private func didTapNormalButton(_ sender: Any) {
        normalCount += 1
        resultLabel.text = "보통 버튼 TAP! (\(normalCount))"
    }

    @objc
    private func didTapExtendedButton(_ sender: Any) {
        extendedCount += 1
        resultLabel.text = "확장 버튼 TAP! (\(extendedCount))"
    }
    
}
