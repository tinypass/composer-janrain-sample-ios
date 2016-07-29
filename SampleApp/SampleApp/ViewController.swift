import UIKit
import PianoComposer

class ViewController: UIViewController {
    
    let janrainUserProvider = "janrain"
    
    var composer: PianoComposer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        composer = createComposer()
        composer?.execute()
    }
    
    func createComposer() -> PianoComposer {
        let newComposer = PianoComposer(aid: PianoSettings.aid, sandbox: true)
            .delegate(self)
            .tag("tag1")
            .url("http://news.pubsite.com/news1")
        
        return newComposer
    }

    func showJanrainLoginForm(composer: PianoComposer) {
        let config = JRCaptureConfig.emptyCaptureConfig()
        config.engageAppId = JanrainSettings.engageAppId
        config.captureAppId = JanrainSettings.captureAppId
        config.captureDomain = JanrainSettings.captureDomain
        config.captureClientId = JanrainSettings.captureClientId
        config.captureLocale = JanrainSettings.captureLocale
        config.captureFlowName = JanrainSettings.captureFlowName
        config.captureSignInFormName = JanrainSettings.captureTraditionalSignInFormName
        config.captureTraditionalSignInType = JanrainSettings.traditionalSignInType;
        
        JRCapture.setCaptureConfig(config)
        JRCapture.startEngageSignInDialogWithTraditionalSignIn(JRTraditionalSignInEmailPassword, forDelegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: PianoComposerDelegate {
    
    func composerExecutionCompleted(composer: PianoComposer) {
        print("Composer execution completed")
    }
    
    func showLogin(composer: PianoComposer, event: XpEvent, params: ShowLoginEventParams?) {
        if params?.userProvider == janrainUserProvider {
            showJanrainLoginForm(composer)
        }
    }
}

extension ViewController: JRCaptureDelegate {
    
    func captureDidSucceedWithCode(code: String!) {
        print("Login succeeded: accessToken: \(JRCapture.getAccessToken())");
        composer?.userToken(JRCapture.getAccessToken())
            .userProvider(janrainUserProvider)
            .execute()
    }
}


