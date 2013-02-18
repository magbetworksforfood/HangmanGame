package views {
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    public class LetterBox extends Sprite {

        private var _opened:Boolean;
        private var textField:TextField;
        private var background:Sprite;
        private var charCode:uint;

        public static const WIDTH:Number = 20;
        public static const HEIGHT:Number = 30;

        public function LetterBox(charCode:uint) {
            init(charCode);
        }

        private function init(charCode:uint):void {
            this.charCode = charCode;

            createChildren();
        }

        private function createChildren():void {
            textField = new TextField();
            textField.text = String.fromCharCode(charCode).toUpperCase();
            textField.autoSize = TextFieldAutoSize.LEFT;
            textField.selectable = false;
            textField.multiline = false;
            var textFormat:TextFormat = new TextFormat();
            textFormat.font = 'Arial';
            textFormat.size = 16;
            textFormat.bold = true;
            textFormat.color = 0xFFFFFF;
            textField.setTextFormat(textFormat);
            textField.visible = _opened;
            textField.x = ((WIDTH - textField.width) >> 1) + 1;
            textField.y = ((HEIGHT - textField.height) >> 1) + 1;
            addChild(textField);

            background = new Sprite();
            var bgGraphics:Graphics = background.graphics;
            bgGraphics.beginFill(0xFFFFFF, .5);
            bgGraphics.lineStyle(1, 0xFFFFFF);
            bgGraphics.drawRect(0, 0, WIDTH, HEIGHT);
            addChild(background);
        }


        public function get opened():Boolean {
            return _opened;
        }

        public function set opened(value:Boolean):void {
            if (_opened != value) {
                _opened = value;

                textField.visible = _opened;
            }
        }
    }
}
