import UIKit

class NextViewController: UIViewController {
    
    // previewAction を設定する
    override func previewActionItems() -> [UIPreviewActionItem] {
        // "UIPreviewAction"で処理を登録
        let action1 = UIPreviewAction(title: "アクション1",
                                      style: .Default) { _ in
                                        print("Tapped Action1")
        }
        
        let action2 = UIPreviewAction(title: "アクション2",
                                      style: .Destructive) { _ in
                                        print("Tapped Action2")
        }
        
        // ボタンを押した後にさらに処理を分岐したい場合は"UIPreviewActionGroup"として登録
        let subAction1 = UIPreviewAction(title: "サブアクション1",
                                         style: .Default) { _ in
                                            print("Tapped Sub Action1")
        }
        
        let subAction2 = UIPreviewAction(title: "サブアクション2",
                                         style: .Destructive) { _ in
                                            print("Tapped Sub Action1")
        }
        
        let groupAction = UIPreviewActionGroup(title: "グループアクション",
                                               style: .Default,
                                               actions: [subAction1, subAction2])
        
        return [action1, action2, groupAction]
    }
}
