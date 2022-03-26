
import UIKit

class EarthquakeCell: UITableViewCell {

    //MARK: IBOutlet
    @IBOutlet weak var eqIDLabel: UILabel!
    @IBOutlet weak var magnitudeLabel: UILabel!
    @IBOutlet weak var depthLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!

    //MARK: Variables
    let dateFormatter = DateFormatter()
    
    var earthquakeData : EarthquakeModel? {
        didSet {
            setData()
        }
    }
    
    //MARK: override Methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    
    func getDateandTime(str: String) -> (String,String) {
        
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let d = dateFormatter.date(from: str) ?? Date()
        
        dateFormatter.dateFormat = "MMM-dd-yyyy"
        let dateString = dateFormatter.string(from: d)

        dateFormatter.dateFormat = "h:mma"
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        let timeString = dateFormatter.string(from: d)

        return (dateString,timeString)
    }
    
    func setData() {
        guard let data = earthquakeData else { return }

        eqIDLabel?.text = "ID: \(data.eqid)"
        magnitudeLabel?.text = "Magnitude: \(data.magnitude)"
        depthLabel?.text = "Depth: \(data.depth)"
        dateLabel?.text = "Date: \(getDateandTime(str: data.datetime).0)   Time: \(getDateandTime(str: data.datetime).1)"
        self.backgroundColor = data.magnitude >= 8.0 ? .lightGray.withAlphaComponent(0.5) : .white


        
    }

}
