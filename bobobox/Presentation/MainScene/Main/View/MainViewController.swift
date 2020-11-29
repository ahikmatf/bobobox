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
    
    @IBAction func switchHotelDidTap(_ sender: UIButton) {
    }
    
    @IBAction func switchPodFilterDidTap(_ sender: UIButton) {
    }
    
    @IBAction func switchViewTypeDidTap(_ sender: UISegmentedControl) {
    }
    
    
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
    }
    
    private func setupViews() {
        greetingLabel.text = "Good Afternoon, \(userName)"
    }
}
