package views {
    import enums.ScaffoldStates;

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;

    import utils.Assets;

    public class ScaffoldView extends Sprite {

        private var _state:uint = 0;

        public var part1:Bitmap;
        public var part2:Bitmap;
        public var part3:Bitmap;
        public var part4:Bitmap;
        public var part5:Bitmap;
        public var part6:Bitmap;
        //hanged man
        public var part7:Bitmap;

        public function ScaffoldView() {
            addEventListener(Event.ADDED_TO_STAGE, init);
        }

        private function init(event:Event):void {
            removeEventListener(Event.ADDED_TO_STAGE, init);

            createChildren();

        }

        private function createChildren():void {
            part1 = new Assets.scaffold_1;
            part2 = new Assets.scaffold_2;
            part3 = new Assets.scaffold_3;
            part4 = new Assets.scaffold_4;
            part5 = new Assets.scaffold_5;
            part6 = new Assets.scaffold_6;
            part7 = new Assets.scaffold_7;



            addChild(part1);
            addChild(part2);
            addChild(part3);
            addChild(part4);
            addChild(part5);
            addChild(part6);
            addChild(part7);

            hideChildren();

        }

        public function set state(value:uint):void {
            if (_state != value) {
                _state = value;

                switch (_state) {
                    case ScaffoldStates.NONE:
                        hideChildren();
                        break;
                    case ScaffoldStates.FIRST_TRY:
                        part1.visible = true;
                        break;
                    case ScaffoldStates.SECONT_TRY:
                        part2.visible = true;
                        break;
                    case ScaffoldStates.THIRD_TRY:
                        part3.visible = true;
                        break;
                    case ScaffoldStates.FOURTH_TRY:
                        part4.visible = true;
                        break;
                    case ScaffoldStates.FIFTH_TRY:
                        part5.visible = true;
                        break;
                    case ScaffoldStates.SIXTH_TRY:
                        part6.visible = true;
                        break;
                    case ScaffoldStates.LOST:
                        part6.visible = false;
                        part7.visible = true;
                        break;
                }
            }
        }

        public function setStateAsInt(state:int):void {
            switch (state) {
                case 1:
                    this.state = ScaffoldStates.FIRST_TRY;
                    break;
                case 2:
                    this.state = ScaffoldStates.SECONT_TRY;
                    break;
                case 3:
                    this.state = ScaffoldStates.THIRD_TRY;
                    break;
                case 4:
                    this.state = ScaffoldStates.FOURTH_TRY;
                    break;
                case 5:
                    this.state = ScaffoldStates.FIFTH_TRY;
                    break;
                case 6:
                    this.state = ScaffoldStates.SIXTH_TRY;
                    break;
                default:
                    this.state = ScaffoldStates.NONE;
            }

        }

        private function hideChildren():void {
            for (var i:int = 0; i < numChildren; i++) {
                getChildAt(i).visible = false;
            }
        }
    }
}
