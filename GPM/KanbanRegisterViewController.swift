//
//  KanbanRegisterViewController.swift
//  GPM
//
//  Created by mtgto on 2016/09/20.
//  Copyright © 2016 mtgto. All rights reserved.
//

import Cocoa

class KanbanRegisterViewController: NSViewController {
    @IBOutlet weak var textField: NSTextField!

    var bookmarkViewController: BookmarkViewController? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func addKanban(_ sender: AnyObject) {
        if let url = NSURL(string: textField.stringValue) {
            // TODO: validate url
            if let pathComponents = url.pathComponents {
                let count = pathComponents.count
                if count >= 4 && pathComponents[count - 2] == "projects" {
                    let owner = pathComponents[count - 4]
                    let repo = pathComponents[count - 3]
                    let number = Int(pathComponents[count - 1])!
                    let kanban = Kanban(owner: owner, repo: repo, number: number)
                    NotificationCenter.default.post(name: BookmarkViewController.AddKanbanNotificationName, object: kanban)
                }
            }

        }
    }
}
