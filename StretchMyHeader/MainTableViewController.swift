//
//  ViewController.swift
//  StretchMyHeader
//
//  Created by Van Luu on 2019-02-20.
//  Copyright © 2019 Van Luu. All rights reserved.
//

import UIKit
//create a stuct for the news item that will be displayed
struct NewsItem {
    var category: String
    var headline: String
}

class MainTableViewController: UITableViewController {
    
    //tableviewcontroller as a built in scroll biew, function calls the header view function to control the stretch
    override func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    

    @IBOutlet weak var headerViewPicture: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    //setting the initial header height at 250
    private let kTableHeaderHeight:CGFloat = 250
    
    override var prefersStatusBarHidden: Bool {
        get {
            return true
        }
    }
    
    
    var news = [NewsItem]()
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hading the navigation bar
        self.navigationController?.isNavigationBarHidden = false
        
        //adding news objects to the news array we made of News strucs
        
        news.append(NewsItem(category: "World", headline: "Climate change protests, divestments meet fossil fuels realities"))
        news.append(NewsItem(category: "Europe", headline: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime'"))
        news.append(NewsItem(category: "Middle East", headline: "Airstrikes boost Islamic State, FBI director warns more hostages possible"))
        news.append(NewsItem(category: "Africa", headline: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim"))
        news.append(NewsItem(category: "Asia Pacific", headline: "Despite UN ruling, Japan seeks backing for whale hunting"))
        news.append(NewsItem(category: "Americas", headline: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria"))
        news.append(NewsItem(category: "World", headline: "South Africa in $40 billion deal for Russian nuclear reactors"))
        news.append(NewsItem(category: "Europe", headline: "'One million babies' created by EU student exchanges"))
        
        
        //setting the header view picture which is a UIview,
        headerViewPicture = tableView.tableHeaderView
        tableView.tableHeaderView = nil
        tableView.addSubview(headerViewPicture)
        
        
        tableView.contentInset = UIEdgeInsets(top: kTableHeaderHeight, left: 0, bottom: 0, right: 0)
        tableView.contentOffset = CGPoint(x: 0, y: -kTableHeaderHeight)
        updateHeaderView()
        
        
        //format the date label to display the date
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        
        let todaysDate = formatter.string(from: date)
        
        dateLabel.text = todaysDate
        
        
        
        
        
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    // This sets up the size for the headerview in the storyboard, it is a uiview we added to the top and has a uiImage on top of it, because the uiimage is contrant to the view it will move with it
    func updateHeaderView() {
        var headerRect = CGRect(x: 0, y: -kTableHeaderHeight, width: tableView.bounds.width, height: kTableHeaderHeight)
        if tableView.contentOffset.y < -kTableHeaderHeight {
            headerRect.origin.y = tableView.contentOffset.y
            headerRect.size.height = -tableView.contentOffset.y
        }
        headerViewPicture.frame = headerRect
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return news.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
        cell.categoryLabel.text = news[indexPath.row].category
        cell.headlineLabel.text = news[indexPath.row].headline
        
        switch cell.categoryLabel.text {
        case "World":
            cell.categoryLabel.textColor = .red
        case "Americas":
            cell.categoryLabel.textColor = .blue
        case "Europe":
            cell.categoryLabel.textColor = .green
        case "Middle East":
            cell.categoryLabel.textColor = .yellow
        case "Asia Pacific":
            cell.categoryLabel.textColor = .purple
        case "Africa":
            cell.categoryLabel.textColor = .orange
        default:
            break
        }
        
        
        return cell
    }
}
