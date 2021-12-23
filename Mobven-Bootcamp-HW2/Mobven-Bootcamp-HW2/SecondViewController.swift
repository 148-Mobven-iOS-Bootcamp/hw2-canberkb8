//
//  SecondViewController.swift
//  Mobven-Bootcamp-HW2
//
//  Created by Canberk Bibican on 23.12.2021.
//

import UIKit

class SecondViewController: UIViewController {

    var callback: ((String) -> Void)?
    var firstViewOutPutProtocol: FirstViewOutPutProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    ///FirstVC init delegete for output
    func setDelegate(output: FirstViewOutPutProtocol) {
        firstViewOutPutProtocol = output
    }

    @IBAction func dismissVC(_ sender: Any) {
        dismiss(animated: true) {
            NotificationCenter.default.post(name: .notificationService, object: nil, userInfo: ["secondVCData": "Notification Data Pass"])
            self.firstViewOutPutProtocol?.printText(text: "Delegate Data Pass")
            self.callback?("Closure Data Pass")
        }
    }
}
