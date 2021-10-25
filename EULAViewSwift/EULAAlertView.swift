//
//  EULAAlertView.swift
//  EULAViewSwift
//
//  Created by jabraknight on 2021/10/25.
//

import Foundation
import UIKit
import SnapKitExtend

public class EULAView: UIView,UITextViewDelegate,UIGestureRecognizerDelegate{
    internal lazy var backgroundView: UIButton = {
        let backgroundView = UIButton()
        let color = UIColor(red: 18 / 255.0, green: 18 / 255.0, blue: 18 / 255.0, alpha: 1.0)
        backgroundView.backgroundColor = color.withAlphaComponent(1.0)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.isUserInteractionEnabled = true
        return backgroundView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setupView(){
        //背景
        addSubview(backgroundView)
        backgroundView.snp.makeConstraints {
            $0.left.right.top.bottom.equalToSuperview().inset(UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
        }
        
        let contentDView = UIView()
        contentDView.backgroundColor = UIColor.white
        contentDView.layer.cornerRadius = 16
        backgroundView.addSubview(contentDView)
        
        contentDView.snp.makeConstraints { make in
            make.left.equalTo(backgroundView).offset(47)
            make.right.equalTo(backgroundView).offset(-47)
            make.centerY.equalTo(backgroundView)
            make.height.equalTo(300)
        }
        //不同意按钮
        let disagree = UIButton()
        disagree.backgroundColor = UIColor.white
        disagree.setTitle("不同意并退出", for: UIControl.State.normal)
        disagree.layer.cornerRadius = 20
        disagree.setTitleColor(UIColor(red: 155 / 255.0, green: 153 / 255.0, blue: 169 / 255.0, alpha: 1.0), for: .normal)
        disagree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        backgroundView .addSubview(disagree)
        
        //同意按钮
        let agree = UIButton()
        agree.backgroundColor = UIColor(red: 255 / 255.0, green: 95 / 255.0, blue: 59 / 255.0, alpha: 1.0)
        agree.setTitle("同意", for: UIControl.State.normal)
        agree.setTitleColor(UIColor.white, for: .normal)
        agree.layer.cornerRadius = 20
        agree.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        backgroundView .addSubview(agree)
        
        agree.snp.makeConstraints { make in
            make.left.equalTo(disagree.snp.right).offset(11)
            make.right.equalTo(contentDView).offset(-16)
            make.bottom.equalTo(contentDView).offset(-14);
            make.width.equalTo(disagree);
            make.height.equalTo(38);
        }
        
        disagree.snp.makeConstraints { make in
            make.left.equalTo(contentDView).offset(15);
            make.right.equalTo(agree.snp.left).offset(-11);
            make.bottom.equalTo(contentDView).offset(-14);
            make.width.equalTo(agree);
            make.height.equalTo(38);
        }
        
        //标题
        let titleDLabel = UILabel()
        titleDLabel.text = "欢迎使用XXC"
        titleDLabel.textColor = UIColor.black
        titleDLabel.font = UIFont.systemFont(ofSize: 18)
        contentDView .addSubview(titleDLabel)
        
        titleDLabel.snp.makeConstraints { make in
            make.left.equalTo(contentDView).offset(16)
            make.top.equalTo(contentDView).offset(14)
            make.width.equalTo(20*9)
            make.height.equalTo(30)
        }
        
        let str1 = "在你使用XXXAPP前，请你认真阅读并了解"
        let str2 = "《1嘻嘻哈哈走你服务协议》"
        let str3 = "《2嘻嘻哈哈走你隐私政策》"
        let str4 = "《3嘻嘻哈哈走你服务协议》"
        let str5 = "《4嘻嘻哈哈走你67隐私协议》"
        let str6 = "点击“同意”即表示你已阅读并同意全部条款。"

        let string = "\(str1)\(str2)、\(str3)、\(str4)、\(str5)，\(str6)"
        let range1 = (string as NSString).range(of: str1)
        let range2 = (string as NSString).range(of: str2)
        let range3 = (string as NSString).range(of: str3)
        let range4 = (string as NSString).range(of: str4)
        let range5 = (string as NSString).range(of: str5)
        let range6 = (string as NSString).range(of: str6)
        
        let textView = UITextView()
        textView.isEditable = false
        textView.delegate = self
        //textView.gestureRecognizers ?? [] 快速对 nil 进行条件判断,可选值
        for recognizer in textView.gestureRecognizers ?? [] {
            if (NSStringFromClass(type(of: recognizer).self) == "UITextTapRecognizer") || (NSStringFromClass(type(of: recognizer).self) == "UITapAndAHalfRecognizer") {
                recognizer.isEnabled = false
            }
            if recognizer is UILongPressGestureRecognizer {
                recognizer.isEnabled = false
            }
        }
        
        let longRecognizer = UILongPressGestureRecognizer()
        longRecognizer.delegate = self
        textView .addGestureRecognizer(longRecognizer)
        
        contentDView .addSubview(textView)
        textView .snp.makeConstraints { make in
            make.left.equalTo(contentDView).offset(10)
            make.right.equalTo(contentDView).offset(-10)
            make.top.equalTo(titleDLabel.snp.bottom).offset(8)
            make.bottom.equalTo(contentDView).offset(-60)
        }
        
        //富文本
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 2 //行间距
        let mastring = NSMutableAttributedString(string: string, attributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16.0),
            NSAttributedString.Key.foregroundColor: UIColor.black,
            NSAttributedString.Key.paragraphStyle: paragraphStyle
        ])
                                
        mastring.beginEditing()
        mastring.addAttribute(.foregroundColor, value: UIColor(red: 255 / 255.0, green: 95 / 255.0, blue: 95 / 255.0, alpha: 1.0), range: range2)
        mastring.addAttribute(.foregroundColor, value: UIColor(red: 255 / 255.0, green: 95 / 255.0, blue: 95 / 255.0, alpha: 1.0), range: range3)
        mastring.addAttribute(.foregroundColor, value: UIColor(red: 255 / 255.0, green: 95 / 255.0, blue: 95 / 255.0, alpha: 1.0), range: range4)
        mastring.addAttribute(.foregroundColor, value: UIColor(red: 255 / 255.0, green: 95 / 255.0, blue: 95 / 255.0, alpha: 1.0), range: range5)

        
        let valueString2 = "https://www.baidu1.com".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        let valueString3 = "https://www.baidu2.com".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        let valueString4 = "https://www.baidu3.com".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        let valueString5 = "https://www.baidu4.fom".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlFragmentAllowed)
        //is、as来实现类型检查;Any可以表示任何类型的实例
        //如果数组中内容不确定，后面就加了Any:var arr = [Any]()
        mastring .addAttribute(.link, value: valueString2 as Any, range: range2)
        mastring .addAttribute(.link, value: valueString3 as Any, range: range3)
        mastring .addAttribute(.link, value: valueString4 as Any, range: range4)
        mastring .addAttribute(.link, value: valueString5 as Any, range: range5)
        mastring.endEditing()

        textView.attributedText = mastring
        textView .sizeToFit()
        textView.linkTextAttributes = [
            NSAttributedString.Key.foregroundColor: UIColor.orange
        ]

    }
    
    func removeAlertView(){
        backgroundView .removeFromSuperview()
        removeFromSuperview()
    }
    
    func longBangClick(){
        print("使用自定义长按代替禁止textView长按弹窗")
    }
    //本模块中使用
    public func textView(_ textView: UITextView, shouldInteractWith URL: URL, in characterRange: NSRange) -> Bool {
        //根据需求点击链接后跳转内部浏览器删除自身View
        //    [self.backgroundView removeFromSuperview];
        //    [self removeFromSuperview];
        print("点击链接：url:\(URL)")
        UserDefaults.standard.removeObject(forKey: "firstValue")
        //内部做app跳转 返回NO,跳转外部浏览器 返回YES
        return false
    }
    
    func clickRemove(){
        removeAlertView()
        UserDefaults.standard .set(true, forKey: "FirstValue")
    }
    
    func clickDisagree(){
        removeAlertView()
        UserDefaults.standard .removeObject(forKey: "FirstValue")
        print("退出程序")
//        abort()
    }

}
