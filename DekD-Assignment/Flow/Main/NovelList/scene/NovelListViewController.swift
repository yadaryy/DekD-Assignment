

import UIKit

protocol NovelListDisplayLogic: AnyObject
{
    func setupDataOnComplete(viewModel: GetNovelList.ViewModel)
}

class NovelListViewController: UIViewController, NovelListDisplayLogic
{
    @IBOutlet weak var tableView: UITableView!
    
    var interactor: NovelListBusinessLogic?
    var viewModel: GetNovelList.ViewModel?

  override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
  {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    setup()
  }
  
  required init?(coder aDecoder: NSCoder)
  {
    super.init(coder: aDecoder)
    setup()
  }

  override func viewDidLoad()
    {
      super.viewDidLoad()
      registerTableViewCell()
      setupData()
    }
    
  
  private func setup()
  {
    let viewController = self
    let interactor = NovelListInteractor()
    let presenter = NovelListPresenter()
    viewController.interactor = interactor
    interactor.presenter = presenter
    presenter.viewController = viewController

  }
  
  
  func  setupData()
  {
      interactor?.setupData(page: 1)
  }
  
    func setupDataOnComplete(viewModel: GetNovelList.ViewModel){
        self.viewModel = viewModel
        tableView.reloadData()
  }
}




extension NovelListViewController : UITableViewDelegate,UITableViewDataSource{
    
    func registerTableViewCell() {
        
        let bundle = Bundle(for: NovelListTableViewCell.self)
        
        self.tableView.register(UINib(nibName: NovelListTableViewCell.identifier, bundle: bundle),forCellReuseIdentifier: NovelListTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  self.viewModel?.NovelList?.list.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: NovelListTableViewCell.identifier, for: indexPath) as! NovelListTableViewCell
       
        if let data = self.viewModel?.NovelList?.list[indexPath.row] {
            
            cell.title.text = data.novel?.title
            cell.category.text = data.novel?.category?.subTitle ?? ""

        }
        
        return cell
      
    }
}
