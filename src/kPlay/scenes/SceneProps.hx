package kPlay.scenes;
import kha.Font;
import kha.Assets;
import kha.Image;
@:enum
abstract RainbowColors( Int ) to Int from Int { 
    var Violet = 0x9400D3;
    var Indigo = 0x4b0082;
    var Blue   = 0x0000FF;
    var Green  = 0x00ff00;
    var Yellow = 0xFFFF00;
    var Orange = 0xFF7F00;
    var Red    = 0xFF0000;
    var Black  = 0x000000;
}
class SceneProps {
    public static var regular:          Font;
    public static var bold:             Font;
    public static var headerSize  = 33;
    public static var bodySize    = 24;
    public static var py                = 500;
    public static var black             = 0xee000000;
    public static var white             = 0xFf0000ff;
    public static var sunsetBlur:       Image;
    public static var sunsetBW:         Image;
    public static var sunset:           Image;
    public static var rainbow = [ Black, Red, Orange, Yellow, Green, Blue, Indigo, Violet ];
    public function new(){
        regular             = Assets.fonts.Arimo_Bold;
        bold                = Assets.fonts.Arimo_Regular;  
        sunset              = Assets.images.sunset;
        sunsetBlur          = Assets.images.sunsetBlur;
        sunsetBW            = Assets.images.sunsetBW;
    }
}