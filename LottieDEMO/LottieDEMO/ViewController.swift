//
//  ViewController.swift
//  LottieDEMO
//
//  Created by EddieCheng on 2019/7/16.
//  Copyright © 2019 EddieCheng. All rights reserved.
//

import UIKit
import Lottie

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let cellTitle: [String] = ["Origin", "Speed", "Progress", "Color"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellTitle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cellTitle[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row {
        case 0:
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: OriginViewController.self))
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: SpeedViewController.self))
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ProgressViewController.self))
            navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = storyboard.instantiateViewController(withIdentifier: String(describing: ColorViewController.self))
            navigationController?.pushViewController(vc, animated: true)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
