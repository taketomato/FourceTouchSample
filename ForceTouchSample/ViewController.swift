import UIKit

class ViewController: UIViewController, UIViewControllerPreviewingDelegate {
    @IBOutlet var touchMeButton: UIButton!
    var nvc: NextViewController = NextViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // view に peek / pop を設定
        if traitCollection.forceTouchCapability == .Available {
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
    
    func previewingContext(previewingContext: UIViewControllerPreviewing, viewControllerForLocation location: CGPoint) -> UIViewController? {
        print("peek")
        
        // ぼかす領域を指定
        let size = previewingContext.sourceView.frame.size
        previewingContext.sourceRect = CGRect(x: 0, y: 0, width:size.width, height: size.height)
        
        return nvc
    }

    func previewingContext(previewingContext: UIViewControllerPreviewing, commitViewController viewControllerToCommit: UIViewController) {
        print("pop")
        navigationController?.pushViewController(nvc, animated: true)
    }

    @IBAction func tappedButton(sender: AnyObject) {
        navigationController?.pushViewController(nvc, animated: true)
    }
}

