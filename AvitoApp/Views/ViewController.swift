import UIKit

struct EmployeesJson: Decodable {
    var employees: Participants?
}

struct Participants: Decodable {
    var name: String?
    var phone_number: String?
    var skills: Array <Any>?
}


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        guard let url = URL (string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            
            do {
                let employeesJson = try JSONDecoder().decode(EmployeesJson.self, from: data)
                print (employeesJson)
                
            } catch let error {
                print (error)
            }
        }.resume()
    }
}
