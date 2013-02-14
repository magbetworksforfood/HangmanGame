/**
 * Created with IntelliJ IDEA.
 * User: magbetjke
 * Date: 2/13/13
 * Time: 11:55 PM
 * To change this template use File | Settings | File Templates.
 */
package {
    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;

    public class Scaffold extends Sprite {

        private var _state:uint = 0;

        public var part1:Bitmap;
        public var part2:Bitmap;
        public var part3:Bitmap;
        public var part4:Bitmap;
        public var part5:Bitmap;
        public var part6:Bitmap;
        //hanged man
        public var part7:Bitmap;

        public function Scaffold() {
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
                    case ScaffoldStates.FOUTH_TRY:
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

        private function hideChildren():void {
            for (var i:int = 0; i < numChildren; i++) {
                getChildAt(i).visible = false;
            }
        }
    }
}
