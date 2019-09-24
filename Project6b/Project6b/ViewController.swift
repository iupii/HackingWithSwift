//
//  ViewController.swift
//  Project6b
//
//  Created by Iurii Pachin on 2019/09/24.
//  Copyright © 2019 Iurii Pachin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        func makeLabel(_ text: String, _ color: UIColor) -> UILabel {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.backgroundColor = color
            label.text = text
            label.sizeToFit()
            return label
        }

        let viewsDictionary = [
            "label1": makeLabel("THESE", .red),
            "label2": makeLabel("ARE", .cyan),
            "label3": makeLabel("SOME", .yellow),
            "label4": makeLabel("AWESOME", .green),
            "label5": makeLabel("LABELS", .orange),
        ]

        var previous: UILabel?

        for (k, v) in viewsDictionary.sorted(by: { $0.key < $1.key }) {
            view.addSubview(v)
            v.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
            v.heightAnchor.constraint(equalToConstant: 88).isActive = true
            if let previous = previous {
                v.topAnchor.constraint(equalTo: previous.bottomAnchor, constant: 10).isActive = true
            } else {
                v.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
            }
            previous = v
//            view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[\(k)]|", options: [], metrics: nil, views: viewsDictionary))
        }

//        let metrics = ["labelHeight": 88]

//        view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[label1(labelHeight@999)]-[label2(label1)]-[label3(label1)]-[label4(label1)]-[label5(label1)]-(>=10)-|", options: [], metrics: metrics, views: viewsDictionary))
    }


}

