//
//  MemeCollectionViewController.swift
//  Meme Me
//
//  Created by Edwin Rodriguez on 3/30/15.
//  Copyright (c) 2015 Edwin Rodriguez. All rights reserved.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController {
    
    var memes: [Meme]!

    override func viewWillAppear(animated: Bool) {
        
        //Populating the memes property with the current memes saved.
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        
        //When the collection view appears the data gets updated.
        collectionView?.reloadData()
    }

    //UICollectionViewDataSource

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MemeCollectionCell", forIndexPath: indexPath) as! MemeCollectionViewCell
    
        let meme = memes[indexPath.item]
        
        cell.memeImageView?.image = meme.memedImage
    
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let detailController = self.storyboard!.instantiateViewControllerWithIdentifier("MemeDetailViewController")! as! MemeDetailViewController
        detailController.selectedMeme = self.memes[indexPath.item]
        self.navigationController!.pushViewController(detailController, animated: true)
    }
    
    //Add button
    @IBAction func addMeme(sender: AnyObject) {
        var controller: MemeEditorViewController
        controller = self.storyboard?.instantiateViewControllerWithIdentifier("MemeEditorViewController") as! MemeEditorViewController
        
        self.presentViewController(controller, animated: true, completion: nil)
    }

}
