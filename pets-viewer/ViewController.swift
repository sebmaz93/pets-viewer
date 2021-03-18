//
//  ViewController.swift
//  pets-viewer
//
//  Created by Sebouh Mazloumian on 18.03.21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [Dictionary<String, String>]()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Pet Viewer"
        navigationController?.navigationBar.prefersLargeTitles = true

        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        var items = try! fm.contentsOfDirectory(atPath: path)
        items.sort { $0.localizedStandardCompare($1) == .orderedAscending }

        var idx = 1
        for item in items {
            print(idx)
            if item.hasPrefix("pic") {
                pictures.append(["name": item.replacingOccurrences(of: ".webp", with: ""), "file": item, "pos": String(idx)])
                idx += 1
            }
        }
//        pictures.sort { ($0["name"])!.localizedStandardCompare($1["name"]!) == .orderedAscending }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]["name"]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.totalImages = pictures.count
            vc.selectedImage = pictures[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
