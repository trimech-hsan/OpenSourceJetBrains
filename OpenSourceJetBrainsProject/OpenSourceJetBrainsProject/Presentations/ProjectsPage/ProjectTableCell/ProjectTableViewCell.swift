//
//  ProjectTableViewCell.swift
//  OpenSourceJetBrainsProject
//
//  Created by Trimeche Hassen on 26/11/2022.
//

import UIKit

final class ProjectTableViewCell: UITableViewCell,Nibable {
    
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var openIssuesLabel: UILabel!
    @IBOutlet weak var fullNameLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupUI(project: ProjectObject) {
        self.fullNameLabel.text = "\( project.fullName ?? "No Name" )"
        self.forksLabel.text = "\(project.forks ?? 0)"
        self.openIssuesLabel.text = "\(project.openIssues ?? 0)"
        self.watchersLabel.text = "\(project.watchers ?? 0)"
    }
    
}
