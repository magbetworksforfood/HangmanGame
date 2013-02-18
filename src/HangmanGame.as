package {

    import controllers.MainController;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;

    import models.MainModel;

    import views.MainView;

    [SWF(width="310", height="450")]
    public class HangmanGame extends Sprite {

        private var mainView:MainView
        private var model:MainModel;
        private var controller:MainController;

        public function HangmanGame() {
            init();
        }

        public function init():void {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;

            mainView= new MainView();
            addChild(mainView);

            model = new MainModel();
            controller = new MainController(mainView, model);
        }

    }
}
