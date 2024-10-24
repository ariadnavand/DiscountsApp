import UIKit
struct RestaurantsListCellViewModell {
    let mainImage: UIImage?
    let logo: UIImage?
    let title: String
    let subTitle: String
    let description: String
    let discount: String
    let rating: String
}

class RestaurantsListCell: UITableViewCell {
    
    
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var titelLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var discountView: UIView!
    @IBOutlet weak var ratingView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shadowView: UIView!
    
    @IBAction func addToFavoritsButton(_ sender: Any) {
    }
    @IBAction func callButton(_ sender: Any) {
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ratingView.layer.cornerRadius = 10
        containerView.layer.cornerRadius = 20
        containerView.clipsToBounds = true
        
        shadowView.layer.cornerRadius = 20
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shadowRadius = 10
        shadowView.layer.shadowOpacity = 0.2
//        shadowView.layer.shadowOffset = CGSize(width: 3, height: 3)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let path = UIBezierPath(roundedRect:discountView.bounds,
                                byRoundingCorners:[.topLeft, .bottomLeft],
                                cornerRadii: CGSize(width: 10, height:  10))

        let maskLayer = CAShapeLayer()

        maskLayer.path = path.cgPath
        discountView.layer.mask = maskLayer
        
        let cgPath = UIBezierPath(roundedRect: shadowView.bounds, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 20, height: 20)).cgPath
        shadowView.layer.shadowPath = cgPath
    }
    
    func set(viewModel: RestaurantsListCellViewModell) {
        mainImageView.image = viewModel.mainImage
        logoImageView.image = viewModel.logo
        titelLabel.text = viewModel.title
        subTitleLabel.text = viewModel.subTitle
        descriptionLabel.text = viewModel.description
        ratingLabel.text = viewModel.rating
        
    }

}
