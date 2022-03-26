

import UIKit

class ViewController: UIViewController {
    
    //MARK: IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    
    //MARK: Variables
    var viewModel = EarthquakeViewModel()
    var earthquakeDataModel : [EarthquakeModel]?
    
    
    //MARK: View Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()

        self.fetchData()
    }
    
    //MARK: Private Methods
    private func fetchData() {
        viewModel.apiToGetEarthquakeData { [weak self] in
            self?.earthquakeDataModel = self?.viewModel.earthquakeData
            DispatchQueue.main.async { self?.tableView.reloadData() }
        }
    }
    
    //MARK: IBActions

}


//MARK: UITableViewDelegate, UITableViewDataSource
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return earthquakeDataModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "EarthquakeCell", for: indexPath) as! EarthquakeCell
        cell.earthquakeData = self.earthquakeDataModel?[indexPath.row]
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "MapVC") as? MapVC {
            vc.lat = self.earthquakeDataModel?[indexPath.row].lat
            vc.lng = self.earthquakeDataModel?[indexPath.row].lng
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
