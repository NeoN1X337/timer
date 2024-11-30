//
//  ViewController.swift
//  Timer
//
//  Created by Алдияр Женисулы on 20.11.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var startDatePicker: UIDatePicker!
    
    @IBOutlet weak var endDatePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SecondVC" {
            if let vc = segue.destination as? SecondViewController {    
                vc.startDate = startDatePicker.date
                vc.endDate = endDatePicker.date
            }
        }
    }
}

