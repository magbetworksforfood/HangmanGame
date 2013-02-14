/**
 * Created with IntelliJ IDEA.
 * User: magbetjke
 * Date: 2/14/13
 * Time: 1:22 AM
 * To change this template use File | Settings | File Templates.
 */
package {
    import flash.display.Bitmap;

    public class StartButton extends Button {

        private var overState:Bitmap = new Assets.buttonOver;
        private var normalState:Bitmap = new Assets.buttonNormal;
        private var pressedState:Bitmap = new Assets.buttonPressed;

        public function StartButton() {
            addChild(overState);
            addChild(normalState);
            addChild(pressedState);
        }


        override protected function setState(state:String):void {
            switch (state) {
                case Button.OVER:
                    overState.visible = true;
                    normalState.visible = false;
                    pressedState.visible = false;
                    break;
                case Button.NORMAL:
                    overState.visible = false;
                    normalState.visible = true;
                    pressedState.visible = false;
                    break;
                case Button.PRESSED:
                    overState.visible = false;
                    normalState.visible = false;
                    pressedState.visible = true;
                    break;
            }
        }
    }
}
