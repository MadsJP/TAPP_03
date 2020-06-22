import UIKit
import FirebaseUI

class FirebaseViewController: UIViewController {

    let loggedInKey = "loggedIn"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view. h@1.dk 123456
    }
    
    
    @IBAction func loginTapped(_ sender: Any) { // eller UIButton
        
        // Tjek om brugeren er logged ind én før
        
        if let loggedIn = UserDefaults.standard.object(forKey: loggedInKey) {
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let firstVC = storyboard.instantiateViewController(withIdentifier: "tabbar")
            firstVC.modalPresentationStyle = .fullScreen
            self.present(firstVC, animated: true, completion: nil)
            
            // Hvis ikke så skal brugeren logge ind med email og password
            
        } else {
            
            
            // get the default auth UI Object
            
            let authUI = FUIAuth.defaultAuthUI()
            
            // Tjek at det ikke er nil
            
            guard authUI != nil else {
                // Log the error
                return
            }
            
            // Set ourselves as the delegate
            
            authUI?.delegate = self
            authUI?.providers = [FUIEmailAuth()]
            
            
            // Get a reference to the auth UI viewcontroller
            let authViewController = authUI?.authViewController() //!
            
            // Show it
            
            present(authViewController!,animated: true,completion: nil)
            
        }
        
        
    }
    
    @IBAction func unwindToLogin(segue:UIStoryboardSegue){}
    
}


// Implementer protokollen

extension FirebaseViewController: FUIAuthDelegate {
    
    // Did sign in with:
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        
        
        // Check om der var en fejl
        
        guard error == nil else {
            
            print(error?.localizedDescription as Any)
            //Log error
            return
            
        }
        
        // Hvis der ikke er nogle fejl
        
        // Hvis vi vil have fat i brugerens uid, til at tjekke i databasen om informationer om brugeren benyttes:
        //authDataResult?.user.uid
        
        UserDefaults.standard.set(true, forKey: loggedInKey)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let firstVC = storyboard.instantiateViewController(withIdentifier: "tabbar")
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true, completion: nil)
        
    }
    
}
