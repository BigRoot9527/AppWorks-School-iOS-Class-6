import PlaygroundSupport
import UIKit

class ViewController: UIViewController {
    
    let slider = UISlider()
    
    var value: Double = 0.0 {
        //Property Observer: allows us to observe and repond to changes in a "property's value".
        willSet {
            //willSet: called right before we change the underlying value.
            print("Old value: \(value)")
        }
        
        didSet {
            //didSet: called immediately after we assign a value to the stored property.
            view.alpha = CGFloat(value)
            print("New value: \(value)")
        }
        //willSet & didSet are NOT CALLED when setting properties during init. only after.
        //CANNOT add it to a lazy stored property, or computed property.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 30/255.0, green: 36/255.0, blue: 40/255.0, alpha: 1.0)
        
        // Add target-action pattern for value changed event
        slider.addTarget(self, action: #selector(viewController.slide(sender:)), for: .valueChanged)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Programmatically add constraints to setup layout
        view.addSubview(slider)
        slider.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            slider.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            slider.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            slider.heightAnchor.constraint(equalToConstant: 30),
            slider.widthAnchor.constraint(equalToConstant: 400)
            ])
        
    }
    
    // Method for target-action
    @objc func slide(sender: UISlider) {
        value = Double(sender.value)
    }
    
}


let viewController = ViewController()
PlaygroundPage.current.liveView = viewController.view


///
// Code Quiz

class TemperatureController: UIViewController {
    var temperature: Double {
        didSet {
            switch temperature {
            case 80... :
                view.backgroundColor = UIColor.red
            case ...40 :
                view.backgroundColor = UIColor.blue
            default :
                view.backgroundColor = UIColor.green
            }
        }
    }
    
    init(temperature: Double) {
        self.temperature = temperature
        super.init()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
}
