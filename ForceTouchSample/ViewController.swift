import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    @IBOutlet var touchMeButton: UIButton!
    var nvc: NextViewController = NextViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // fourchTouch が使えるか確認
        if traitCollection.forceTouchCapability == .Available {
            // view に peek / pop を設定
            registerForPreviewingWithDelegate(self, sourceView: touchMeButton)
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        // 遷移先の画面を用意
        let sb = UIStoryboard(name: "Main", bundle: nil)
        guard let vc = sb.instantiateViewControllerWithIdentifier("NextViewControllerID") as? NextViewController else { return }
        nvc = vc
        
        // peek した時に表示する view の大きさを指定
        nvc.preferredContentSize = CGSize(width: 0.0, height: UIScreen.mainScreen().bounds.height * 0.5)

        super.viewDidAppear(animated)
    }
    
    // peek で表示する ViewController を返す delegate
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("peek")
        
        // 軽く押した際にぼかさない領域を指定
        let size = previewingContext.sourceView.frame.size
        previewingContext.sourceRect = CGRect(x: 0, y: 0, width:size.width, height: size.height)
        
        return nvc
    }

    // pop 直前に呼び出される delegate
    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        print("pop")
        navigationController?.pushViewController(nvc, animated: true)
    }

    @IBAction func tappedButton(sender: AnyObject) {
        navigationController?.pushViewController(nvc, animated: true)
    }
}

