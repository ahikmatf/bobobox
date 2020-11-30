//
//  MainViewController.swift
//  bobobox
//
//  Created by Fatah on 29/11/20.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var greetingLabel: UILabel!
    @IBOutlet weak var hotelNameLabel: UILabel!
    @IBOutlet weak var podCollectionView: UICollectionView!
    
    @IBAction func switchHotelDidTap(_ sender: UIButton) {
    }
    
    @IBAction func switchPodFilterDidTap(_ sender: UIButton) {
    }
    
    @IBAction func switchViewTypeDidTap(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            podViewType = .list
        case 1:
            podViewType = .grid
        default:
            break
        }
        
        handleViewTypeSwitch()
    }
    
    var podViewType: ViewType = .list
    var podFilter: PodStatus = .ALL
    let viewModel: MainViewModel
    let userName: String
    
    init(viewModel: MainViewModel, userName: String) {
        self.viewModel = viewModel
        self.userName = userName
        
        super.init(nibName: String(describing: MainViewController.self), bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        
        viewModel.viewDidLoad()
        setupViews()
        setupCollectionView()
    }
    
    private func setupViews() {
        greetingLabel.text = "Good Afternoon, \(userName)"
    }
    
    private func setupCollectionView() {
        podCollectionView.register(UINib(nibName: String(describing: ListCell.self), bundle: nil),
                                   forCellWithReuseIdentifier: ListCell.reuseIdentifier)
        podCollectionView.register(UINib(nibName: String(describing: GridCell.self), bundle: nil),
                                   forCellWithReuseIdentifier: GridCell.reuseIdentifier)
        
        handleViewTypeSwitch()
    }
    
    private func handleViewTypeSwitch() {
        if podViewType == .list {
            let layoutConfig = UICollectionLayoutListConfiguration(appearance: .plain)
            let listLayout = UICollectionViewCompositionalLayout.list(using: layoutConfig)
            
            podCollectionView.collectionViewLayout = listLayout
        } else if podViewType == .grid {
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5),
                                                  heightDimension: .fractionalHeight(1.0))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            item.contentInsets = NSDirectionalEdgeInsets(top: 8, leading: 8, bottom: 8, trailing: 8)

            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                                  heightDimension: .fractionalWidth(0.5))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

            let section = NSCollectionLayoutSection(group: group)
            let gridLayout = UICollectionViewCompositionalLayout(section: section)
            
            podCollectionView.collectionViewLayout = gridLayout
        }
        
        podCollectionView.reloadData()
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.getTotalDataCount(viewType: podViewType, filter: podFilter)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if podViewType == .list {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ListCell.reuseIdentifier,
                                                                for: indexPath) as? ListCell
            else { return UICollectionViewCell() }
            
            cell.fill(with: ListCellViewModel(pod: viewModel.getPod(for: indexPath.row)))
            return cell
        } else if podViewType == .grid {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.reuseIdentifier,
                                                                for: indexPath) as? GridCell
            else { return UICollectionViewCell() }
            
//            cell.fill(with: ListCellViewModel(pod: viewModel.getPod(for: indexPath.row)))
            return cell
        }
        
        return UICollectionViewCell()
    }
}

extension MainViewController: UICollectionViewDelegate {}
