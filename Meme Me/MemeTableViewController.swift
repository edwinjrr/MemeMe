//
//  MemeTableViewController.swift
//  Meme Me
//
//  Created by Edwin Rodriguez on 3/28/15.
//  Copyright (c) 2015 Edwin Rodriguez. All rights reserved.
//

import UIKit

class MemeTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var memes: [Meme]!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        //This makes the tint of the custom icons in the tab bar yellow.
        tabBarController?.tabBar.tintColor = UIColor.yellowColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        //Populating the memes property with the current memes saved.
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        
        tableView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        
        //If at launch the app has no memes, the editor will be called.
        if memes.isEmpty {
            memeEditor()
        }
    }
    
    //UITableViewDataSource:
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.memes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MemeTableCell") as! MemeTableViewCell
        let meme = self.memes[indexPath.row]
        
        cell.memeImageView.image = meme.memedImage
        cell.memeTopText.text = meme.topText
        cell.memeBottomText.text = meme.bottomText
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController")! as! MemeDetailViewController
        detailController.selectedMeme = self.memes[indexPath.row]
        self.navigationController!.pushViewController(detailController, animated: true)
        
        //This prevents that the row selected doesn't stay selected.
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    //When the user swipes left to a row in the table, the delete button appears.
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle,forRowAtIndexPath indexPath: NSIndexPath) {
        self.memes.removeAtIndex(indexPath.row)
        (UIApplication.sharedApplication().delegate as! AppDelegate).memes.removeAtIndex(indexPath.row)
        
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    //Method for calling the editor view.
    func memeEditor() {
        var controller: MemeEditorViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    @IBAction func addMeme(sender: AnyObject) {
        memeEditor()
    }

}
