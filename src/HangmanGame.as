package {

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.MouseEvent;
    import flash.text.TextField;

    import org.osmf.layout.ScaleMode;

    [SWF(width="310", height="450")]
    public class HangmanGame extends Sprite {

        private var scaffold:Scaffold;

        public function HangmanGame() {
            init();
        }

        public function init():void {
            stage.scaleMode = StageScaleMode.NO_SCALE;
            stage.align = StageAlign.TOP;

            var background:Bitmap = new Assets.background;
            addChild(background);

            scaffold = new Scaffold();
            addChild(scaffold);

            var hangman:Bitmap = new Assets.hangman;
            addChild(hangman);

            var startButton:Button = new StartButton();
            startButton.x = 100;
            startButton.y = 310;
            startButton.addEventListener(MouseEvent.CLICK, onStart);
            addChild(startButton);
        }

        private var i:int = 1;

        private function onStart(event:MouseEvent):void {
            scaffold.state = i++;
        }
    }
}
