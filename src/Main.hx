package;
#if js
import js.Browser;
import js.html.CanvasElement;
#end
import kha.System;
import kPlay.KPlay;

class Main {
    
    public static function main() {
        #if js
        /*
        var document = Browser.window.document;
        var window = Browser.window;
        document.documentElement.style.padding = "0";
        document.documentElement.style.margin = "0";
        document.body.style.padding = "0";
        document.body.style.margin = "0";
        var canvas = cast(document.getElementById("khanvas"), CanvasElement);
        canvas.style.display = "block";
        
        var resize = function() {
            canvas.width = Std.int(window.innerWidth * window.devicePixelRatio);
            canvas.height = Std.int(window.innerHeight * window.devicePixelRatio);
            canvas.style.width = document.documentElement.clientWidth + "px";
            canvas.style.height = document.documentElement.clientHeight + "px";
        }
        window.onresize = resize;
        resize();
        */
    #end

        System.init({title: "kPlay", width: 1024, height: 768, samplesPerPixel: 4}
            , function() {
                new KPlay();
            });
    }
}