//
//  DetailsProjectViewController.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

class DetailsProjectViewController: UIViewController {
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    var viewModel: DetailsProjectViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
    }
    
    func setupUi(){
        self.title = viewModel?.pageTitle
        self.fullNameLabel.text = viewModel?.pageTitle
        self.descriptionLabel.text = viewModel?.getProjecrDescription()
    }
    
}
