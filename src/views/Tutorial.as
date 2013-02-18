package views {
    import flash.display.Graphics;
    import flash.display.Sprite;
    import flash.text.TextField;
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    public class Tutorial extends Sprite {

        private var textField:TextField;
        private var background:Sprite;

        public static const WIDTH:Number = 250;
        public static const HEIGHT:Number = 180;

        public function Tutorial() {
            init();
        }

        private function init():void {
            createChildren();
        }

        private function createChildren():void {
            background = new Sprite();
            var bgGraphics:Graphics = background.graphics;
            bgGraphics.clear();
            bgGraphics.beginFill(0xFFFFFF, .8);
            bgGraphics.lineStyle(2, 0xFFFFFF);
            bgGraphics.drawRoundRect(0, 0, WIDTH, HEIGHT, 20, 20);
            bgGraphics.endFill();
            addChild(background);

            textField = new TextField();
            textField.text = 'После начала игры, выбирайте по одной букве из алфавита. Ваша цель - угадать слово. \n' +
                    'С каждой не правильной буквой на экране будет появляться элемент виселицы. Когда виселица целиком появится на экране - вы проиграли.\n' +
                    'Если вы угадаете какую-то букву из слова, то эта буква будет открыта.';
            textField.autoSize = TextFieldAutoSize.LEFT;
            textField.wordWrap = true;
            textField.selectable = false;
            var textFormat:TextFormat = new TextFormat();
            textFormat.font = 'Arial';
            textFormat.size = 11;
            textFormat.leading = 5;
            textFormat.align = TextFormatAlign.JUSTIFY;
            textFormat.color = 0x010101;
            textField.setTextFormat(textFormat);
            var padding:Number = 10;
            textField.width = WIDTH - padding * 2;
            textField.height = HEIGHT - padding * 2;
            textField.x = padding;
            textField.y = padding;
            addChild(textField);
        }
    }
}
