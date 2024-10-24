import Foundation

class RestaurantsListPresenter {
    
    weak var view: RestaurantsListViewController?
    var model: RestaurantsListModel?
    
    init(view: RestaurantsListViewController? = nil, model: RestaurantsListModel? = nil) {
        self.view = view
        self.model = model
    }
    
    func viewDidLoad() {
        var viewModel = RestaurantsListViewModel(cells: [
            RestaurantsListCellViewModell(
                mainImage: nil,
                logo: nil,
                title: "McDonald’s",
                subTitle: "с 18.09 до 25.09",
                description: "БигМак, средний картофель фри, кола и сырный соус по новой акции от МакФест!",
                discount: "-50%",
                rating: "4,5"
            )
        ])
        view?.set(viewModel: viewModel)
    }
}

