//
//  MemeDetailViewController.swift
//  Meme Me
//
//  Created by Edwin Rodriguez on 3/28/15.
//  Copyright (c) 2015 Edwin Rodriguez. All rights reserved.
//

import UIKit
import Foundation

class MemeDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!

    var selectedMeme: Meme!
    
    let memeArray = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
    
    override func viewDidLoad() {
        
        //Setting up the delete button and title of the navigation bar.
        navigationController?.setNavigationBarHidden(false, animated: true)
        let deleteButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Trash, target: self, action: nil)
        self.navigationItem.rightBarButtonItem = deleteButton
        self.navigationItem.title = "Meme Detail"
    }
    
    //Calling the image of the selected meme.
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.imageView!.image = selectedMeme.memedImage
    }
    
    //In construction...
    func deleteMeme() {
        let objectIndex = 0 //Didn't know how to find it...
        let memeArray = (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(objectIndex)
    }

}
