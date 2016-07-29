//
//  AvatarView.swift
//  GenaricReusableCell
//
//  Created by P D Leonard on 7/29/16.
//  Copyright © 2016 MacMeDan. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import Material

class AvatarView: FabButton, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPopoverControllerDelegate {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup(image: UIImage) {
        self.setImage(image, forState: .Normal)
        
        reLayout()
    }
    
    func reLayout() {
        self.roundCorners()
    }
    
    func roundCorners() {
        self.layer.cornerRadius = self.frame.size.height/2
        self.clipsToBounds = true
    }
}


// MARK: - UIImagePickerControllerDelegate Methods
extension UIViewController:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func pickPhoto() {
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            showPhotoMenu()
        } else {
            choosePhotoFromLibrary()
        }
    }
    
    func showPhotoMenu() {
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        let takePhotoAction = UIAlertAction(title: "Take Photo", style: .Default, handler: { _ in
            self.takePhotoWithCamera()
        })
        let chooseFromLibraryAction = UIAlertAction(title: "Choose From Library", style: .Default, handler: { _ in
            self.choosePhotoFromLibrary()
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(takePhotoAction)
        alertController.addAction(chooseFromLibraryAction)
        presentViewController(alertController, animated: true, completion: nil)
    }
    
    func takePhotoWithCamera() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .Camera
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func choosePhotoFromLibrary() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .PhotoLibrary
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func newImgTapped(sender: UIButton) {
        let imgPicker = UIImagePickerController()
        imgPicker.delegate = self
        let status = AVCaptureDevice.authorizationStatusForMediaType(AVMediaTypeVideo)
        if status == AVAuthorizationStatus.Denied {
            
            let changeYourSettingsAlert = UIAlertController(title: "You do not have permissions enabled for this.", message: "Would you like to change them in settings?", preferredStyle: .Alert)
            let okAction = UIAlertAction(title: "OK", style: .Default, handler: { (UIAlertAction) -> Void in
                guard let url = NSURL(string: UIApplicationOpenSettingsURLString) else {return}
                UIApplication.sharedApplication().openURL(url)
            })
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            changeYourSettingsAlert.addAction(okAction)
            changeYourSettingsAlert.addAction(cancelAction)
            presentAlert(changeYourSettingsAlert)
            
        } else {
            let Alert = UIAlertController(title: "Where would you like to get photos from?", message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
            Alert.popoverPresentationController?.sourceRect = sender.bounds
            Alert.popoverPresentationController?.sourceView = sender
            let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
            
            imgPicker.allowsEditing = true
            imgPicker.modalPresentationStyle = UIModalPresentationStyle.Popover
            imgPicker.popoverPresentationController?.sourceView = sender
            imgPicker.popoverPresentationController?.sourceRect = sender.bounds
            
            presentAlert(Alert)
            
            let camera = UIAlertAction(title: "Take a Photo", style: .Default) { (camera) -> Void in
                imgPicker.sourceType = .Camera
                self.presentViewController(imgPicker, animated: true, completion: nil)
            }
            
            let photoLibrary = UIAlertAction(title: "Choose from Library", style: .Default) { (Photolibrary) -> Void in
                imgPicker.sourceType = .PhotoLibrary
                self.presentViewController(imgPicker, animated: true, completion: nil)
            }
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera) {
                Alert.addAction(camera)
            }
            
            if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
                Alert.addAction(photoLibrary)
            }
            
            Alert.addAction(cancelAction)
        }
    }
    
    func presentAlert(sender: UIAlertController) {
        presentViewController(sender, animated: false, completion: nil)
    }
    
    public func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
