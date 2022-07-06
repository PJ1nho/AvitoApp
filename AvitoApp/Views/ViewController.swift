import UIKit

struct Company: Decodable {
    let name: String?
    var employees: [Participants]?
}

struct CompanyJson: Decodable {
    let company: Company?
}

struct Participants: Decodable {
    var name: String?
    var phone_number: String?
    var skills: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case skills
        case phone_number = "phone_number"
    }
}


class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    

    let idCell = "idcell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
        
        let urlString = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
        
        guard let url = URL (string: urlString) else {return}
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else {return}
            guard error == nil else {return}
            
            
            do {
                self.сompany = try JSONDecoder().decode(Company.self, from: data).company
                print (self?.сompany)
                
            } catch let error {
                print (error)
            }
        }.resume()
    }
}

//MARK: UITableViewDataSource&UITableViewDelegate

extension ViewController:  UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return company?.employees?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! CustomTableViewCell
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heighOfCell
    }
}
private let heighOfCell: CGFloat = 100
