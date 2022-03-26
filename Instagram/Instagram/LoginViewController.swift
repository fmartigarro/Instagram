//
//  LoginViewController.swift
//  Instagram
//
//  Created by Federico Marti Garro on 3/25/22.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    @IBAction func onSignIn(_ sender: Any) {
        let username = usernameField.text!
        let password = passwordField.text!
        
        PFUser.logInWithUsername(inBackground: username, password: password) { (user, error) in
            if user != nil {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
        }
    }
    
    // Copy/pasted most of code in function from Parse Docs, User API, Signing Up (Swift)
    @IBAction func onSignUp(_ sender: Any) {

        let user = PFUser()
        user.username = usernameField.text
        user.password = passwordField.text

        // Other fields can be set just like any other PFObject,
        // like this: user["attribute"] = "its value"
        // If this field does not exists, it will be automatically created

        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "loginSegue", sender: nil)
            }
            else {
                print("Error: \(error?.localizedDescription)")
            }
            
            
        }
//        user.signUpInBackgroundWithBlock {
//          (succeeded: Bool, error: NSError?) -> Void in
//          if let error = error {
//            let errorString = error.userInfo["error"] as? NSString
//            // Show the errorString somewhere and let the user try again.
//          } else {
//            // Hooray! Let them use the app now.
//          }
//        }
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
