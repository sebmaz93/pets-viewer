//
//  DetailViewController.swift
//  pets-viewer
//
//  Created by Sebouh Mazloumian on 18.03.21.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    var totalImages: Int?
    var selectedImage: Dictionary<String,String>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Picture \(selectedImage?["pos"] ?? "0") of \(totalImages ?? 0)"
        navigationItem.largeTitleDisplayMode = .never

        if let imageToLoad = selectedImage!["file"] {
            imageView.image = UIImage(named: imageToLoad)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
