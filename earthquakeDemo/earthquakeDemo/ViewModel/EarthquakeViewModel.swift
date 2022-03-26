
import Foundation

class EarthquakeViewModel {
    
    //MARK: Variables
    var earthquakeData : [EarthquakeModel]?
    private let sourcesURL = URL(string: "http://api.geonames.org/earthquakesJSON?formatted=true&north=44.1&south=-9.9&east=-22.4&west=55.2&username=mkoppelman")!
    
    //MARK: Method to Fetch Data
    func apiToGetEarthquakeData(completion : @escaping () -> ()) {
        if let reachability = Reachability(), reachability.isReachable {
            URLSession.shared.dataTask(with: sourcesURL) { [weak self] (data, urlResponse, error) in
                if let data = data {
                    let empData = try! JSONDecoder().decode(DataModel.self, from: data)
                    self?.earthquakeData = empData.earthquakes
                    completion()
                }
            }.resume()
        }
    }
    
}
