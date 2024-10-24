import UIKit

struct RestaurantsListViewModel {
    var cells: [RestaurantsListCellViewModell]
}

class RestaurantsListViewController: UIViewController {
    
    var output: RestaurantsListPresenter?
    var viewModels: [RestaurantsListCellViewModell] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        let model = RestaurantsListModel()
        output = RestaurantsListPresenter(view: self, model: model)
        model.output = output
        output?.viewDidLoad()
    }
    func set(viewModel: RestaurantsListViewModel) {
        viewModels = viewModel.cells
        tableView.reloadData()
    }
}

extension RestaurantsListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "restaurantsListCell", for: indexPath)
        if let cell = cell as? RestaurantsListCell {
            cell.set(viewModel: viewModels[indexPath.row])
        }
            return cell
    }

}
