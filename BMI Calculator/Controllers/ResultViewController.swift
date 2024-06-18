//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by Tomas Sanni on 6/18/24.
//

import UIKit

class ResultViewController: UIViewController {
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    let vStack = UIStackView()
    
    let yourResultLabel = UILabel()
    let bmiLabel = UILabel()
    let adviceLabel = UILabel()
    
    let recalculateButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = color ?? #colorLiteral(red: 0.1998037994, green: 0.4816964269, blue: 0.7731367946, alpha: 1)
        let background = UIImageView(frame: view.bounds)
        background.image = .resultBackground
        view.addSubview(background)
        
        configureVStack()
        configureRecalculateButton()
    }
    
    func configureVStack() {
        view.addSubview(vStack)
        
        vStack.translatesAutoresizingMaskIntoConstraints = false
        vStack.addArrangedSubview(yourResultLabel)
        vStack.addArrangedSubview(bmiLabel)
        vStack.addArrangedSubview(adviceLabel)
        vStack.axis = .vertical
        vStack.distribution = .equalSpacing
        vStack.alignment = .center
        
        yourResultLabel.text = "YOUR RESULT"
        yourResultLabel.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        yourResultLabel.textColor = .white
        
        bmiLabel.text = bmiValue ?? "19.5"
        bmiLabel.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        bmiLabel.textColor = .white

        adviceLabel.text = advice ?? "EAT SOME MORE SNACKS!"
        adviceLabel.font = UIFont.systemFont(ofSize: 20, weight: .light)
        adviceLabel.textColor = .white

        NSLayoutConstraint.activate([
            vStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            vStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
    
    func configureRecalculateButton() {
        view.addSubview(recalculateButton)
        let color = #colorLiteral(red: 0.4549019608, green: 0.4470588235, blue: 0.8235294118, alpha: 1)
        recalculateButton.translatesAutoresizingMaskIntoConstraints = false
        recalculateButton.setTitle("RECALCULATE", for: .normal)
        recalculateButton.backgroundColor = .white
        recalculateButton.setTitleColor(color, for: .normal)
        recalculateButton.layer.cornerRadius = 25
        
        NSLayoutConstraint.activate([
            recalculateButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            recalculateButton.heightAnchor.constraint(equalToConstant: 50),
            recalculateButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            recalculateButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
        
        recalculateButton.addTarget(self, action: #selector(goToPreviousScreen), for: .touchUpInside)
    }
    
    @objc func goToPreviousScreen() {
        navigationController?.popViewController(animated: true)
    }
 
}


#Preview {
    ResultViewController()
}
