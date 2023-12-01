
import UIKit

class NovelListTableViewCell: UITableViewCell {
    
    public static let identifier : String  = "NovelListTableViewCell"
    

    @IBOutlet weak var chapter: UILabel!
    @IBOutlet weak var view: UILabel!
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var thumbnail: UIImageView!
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var category: UILabel!
    @IBOutlet weak var alias: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
