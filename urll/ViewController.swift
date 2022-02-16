//
//  ViewController.swift
//  urll
//
//  Created by Ritesh Harihar on 14/02/22.
//


import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    private let table : UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    var urlArray = [String]()
    var titleArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib (nibName: "DemoTableViewCell", bundle: nil)
        table.register(nib, forCellReuseIdentifier: "DemoTableViewCell")
        table.delegate = self
        table.dataSource = self
        title = "WishList"
        view.addSubview(table)
        table.dataSource = self
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        table.frame = view.bounds
    }
    @objc private func didTapAdd() {
        let alert = UIAlertController(title: "New Item", message: "Enter new to do list item!", preferredStyle: .alert)
        alert.addTextField {field in field.placeholder = "Enter Url.."}
        alert.addTextField {field2 in field2.placeholder = "Enter Product name.."}
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Done", style: .default, handler: { [weak self]
            (_) in
            if let field = alert.textFields?[0] {
                if let text = field.text, !text.isEmpty {
                    print(text)
                    DispatchQueue.main.async {
                        self?.urlArray.append(text)
                        self?.table.reloadData()
                    }
                }
            }
            if let field2 = alert.textFields?[1]{
                if let text = field2.text, !text.isEmpty {
                    print(text)
                    DispatchQueue.main.async {
                        self?.titleArray.append(text)
                        self?.table.reloadData()
                    }
                }
            }
        }))
            present(alert, animated: true)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DemoTableViewCell", for: indexPath) as! DemoTableViewCell
        cell.myLabel.text = titleArray[indexPath.row]
       // print("\(cell.myLabel.text!) sssssssssssss ssssss ssss ss")
        cell.myImageView.backgroundColor = .red
//        let cell2 = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell2.textLabel?.text = titleArray[indexPath.row]
        return cell
    }


}
    




