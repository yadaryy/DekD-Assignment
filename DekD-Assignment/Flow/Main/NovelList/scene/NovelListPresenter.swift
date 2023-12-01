

import UIKit

protocol NovelListPresentationLogic
{
    func setupDataOnComplete(response: NovelListModel )
}

class NovelListPresenter: NovelListPresentationLogic
{
  weak var viewController: NovelListDisplayLogic?
  
  
    func setupDataOnComplete(response: NovelListModel)
  {
      let viewModel = GetNovelList.ViewModel(NovelList: response)
      viewController?.setupDataOnComplete(viewModel: viewModel)
  }
}
