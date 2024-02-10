//
//  VideoViewController.swift
//  GoGreen
//
//  Created by Andria Inasaridze on 09.02.24.
//

import UIKit
import WebKit

final class VideoViewController: UIViewController {
    
    // MARK: - Class Properties
    let videoID: String
    
    // MARK: - UI Components
    private let webView = WKWebView()
    
    // MARK: - ViewLifeCycles
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(webView)
        
        guard let url = URL(string: "https://www.youtube.com/embed/\(videoID)") else {
            return
        }
        
        webView.load(URLRequest(url: url))
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    // MARK: - Initialization
    init(videoID: String) {
        self.videoID = videoID
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
