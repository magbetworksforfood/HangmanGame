package views {
    import flash.display.GradientType;
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.filters.BevelFilter;
    import flash.filters.BitmapFilterType;
    import flash.geom.Matrix;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    import utils.SoundManager;

    public class KeyboardButton extends Button {
        
        private var textField:TextField = new TextField();
        private var background:Sprite = new Sprite();
        private var _charCode:uint;

        public static const WIDTH:Number = 20;
        public static const HEIGHT:Number = 20;

        private var bevel:BevelFilter = new BevelFilter(2, 30, 0xFFFFFF, 1, 0, 1, 1, 1, 1, 1, BitmapFilterType.OUTER);

        public function KeyboardButton(charCode:uint) {
            init(charCode);
            super();
        }

        private function init(charCode:uint):void {
            _charCode = charCode;

            createChildren();
        }

        private function createChildren():void {
            textField.autoSize = TextFieldAutoSize.LEFT;
            textField.embedFonts = true;
//            textField.border = true;
            textField.text = String.fromCharCode(_charCode).toUpperCase();
            textField.multiline = false;
            textField.maxChars = 1;
            var textFormat:TextFormat = new TextFormat();
            textFormat.color = 0x000000;
            textFormat.font = 'MyriadPro';
            textFormat.size = 20;
            textFormat.bold = true;
            textField.setTextFormat(textFormat);

            addChild(background);
            addChild(textField);
        }


        /**
         * @param state: Button state const
         */
        private function draw(state:String):void {
            var bgGraphics:Graphics = background.graphics
            bgGraphics.clear();

            switch (state) {
                case Button.NORMAL:
                    bgGraphics.beginGradientFill(GradientType.LINEAR,
                            [0xe7e7e7, 0xFFFFFF],
                            [1, 1], [0, 255],
                            new Matrix(0, -1, 1, 0));
                    bgGraphics.drawRoundRect(1, 0, WIDTH, HEIGHT, 5, 5);
                    background.filters = [bevel];
                    textField.x = (WIDTH - textField.width) >> 1;
                    textField.y = ((HEIGHT - textField.height) >> 1) - 2;
                    break;
                case Button.OVER:
                    bgGraphics.beginFill(0xFFFFFF);
                    bgGraphics.drawRoundRect(1, 0, WIDTH, HEIGHT, 5, 5);
                    textField.x = (WIDTH - textField.width) >> 1;
                    textField.y = ((HEIGHT - textField.height) >> 1) - 2;
                    background.filters = [bevel];
                    break;
                case Button.PRESSED:
                    bgGraphics.beginFill(0xFFFFFF);
                    bgGraphics.drawRoundRect(1, 0, WIDTH, HEIGHT, 5, 5);
                    textField.x = ((WIDTH - textField.width) >> 1) + 1;
                    textField.y = ((HEIGHT - textField.height) >> 1) - 1;
                    background.filters = [];
                    SoundManager.playSound(SoundManager.CLICK_SOUND);
                    break;
            }

        }

        override protected function setState(state:String):void {
            draw(state);
        }

        public function get charCode():uint {
            return _charCode;
        }
    }
}
