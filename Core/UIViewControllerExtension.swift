//
//  UIViewControllerExtension.swift
//  DuckDuckGo
//
//  Copyright © 2017 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import UIKit
import Core

extension UIViewController {

    public func presentShareSheet(withItems activityItems: [Any], fromButtonItem buttonItem: UIBarButtonItem) {
        let activities = [SaveBookmarkActivity()]
        let shareController = UIActivityViewController(activityItems: activityItems, applicationActivities: activities)
        present(controller: shareController, fromButtonItem: buttonItem)
    }

    public func presentShareSheet(withItems activityItems: [Any], fromView sourceView: UIView, withSourceRect rect: CGRect? = nil) {
        let activities = [SaveBookmarkActivity()]
        let shareController = UIActivityViewController(activityItems: activityItems, applicationActivities: activities)
        present(controller: shareController, fromView: sourceView, withSourceRect: rect)
    }

    public func present(controller: UIViewController, fromButtonItem buttonItem: UIBarButtonItem) {
        if let popover = controller.popoverPresentationController {
            popover.barButtonItem = buttonItem
        }
        present(controller, animated: true, completion: nil)
    }

    public func present(controller: UIViewController, fromView sourceView: UIView, withSourceRect rect: CGRect? = nil) {
        if let popover = controller.popoverPresentationController {
            popover.sourceView = sourceView
            popover.sourceRect = rect!
        }
        present(controller, animated: true, completion: nil)
    }
}
