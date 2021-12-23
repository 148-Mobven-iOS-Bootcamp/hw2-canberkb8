//
//  ViewController.swift
//  Mobven-Bootcamp-HW2
//
//  Created by Canberk Bibican on 23.12.2021.
//

import UIKit

protocol FirstViewOutPutProtocol {
    func printText(text: String)
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSecondVC" {
            if let secondVC = segue.destination as? SecondViewController {
                // SecondVC callback closure trigger func
                secondVC.callback = { [weak self] closureCallBackText in
                    print(closureCallBackText)
                }
                //Delegate init
                secondVC.firstViewOutPutProtocol = self
            }
        }
    }

    @IBAction func goToSecondVC(_ sender: Any) {
        // Created new observer to trigger FirstVC when data comes from SecondVC
        NotificationCenter.default.addObserver(self, selector: #selector(self.notificationTriggerService(_:)), name: .notificationService, object: nil)
        performSegue(withIdentifier: "toSecondVC", sender: nil)
    }

    @objc func notificationTriggerService(_ notification: Notification) {
        guard let notificationText = notification.userInfo?["secondVCData"] as? String else { return }
        NotificationCenter.default.removeObserver(self, name: .notificationService, object: nil)
        print(notificationText)
    }

}

extension ViewController: FirstViewOutPutProtocol{
    func printText(text: String) {
        print(text)
    }
}

