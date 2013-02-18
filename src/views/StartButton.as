package views {
    import flash.display.Bitmap;

    import utils.Assets;

    public class StartButton extends Button {

        private var overState:Bitmap = new Assets.buttonOver;
        private var normalState:Bitmap = new Assets.buttonNormal;
        private var pressedState:Bitmap = new Assets.buttonPressed;

        public function StartButton() {
            super();

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
