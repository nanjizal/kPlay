package kPlay.scenes;
import kPlay.scenes.SceneProps;
import kScenes.story.Scene;
import kScenes.actors.*;
import kScenes.actors.advanced.LabelGroup;
import kScenes.interaction.Compass;
class Start {
    public inline static function scene(){
        var scene = new Scene( 'start' );
        scene.addImage( new Picture( SceneProps.sunsetBlur ));
        var py = SceneProps.py;
        var dy = 33;
        var px = 27;
        var tx = new Label( "kPlay - experimenting with Kha"
                        ,   SceneProps.regular
                        ,   SceneProps.black
                        ,   SceneProps.headerSize - 4, 2
                        ,   px, py + 2 );
        tx.offSide = Compass.WEST_SMALL;
        scene.addText( tx );
        var rect         = new Rectangle( tx.width + 33, tx.height + 3, null, 0xa0ffffff, 0., 0, py + 2 );
        rect.offSide     = Compass.WEST_SMALL;
        scene.addFrontRectangle( rect );
        py += dy + 15;
        var txArr = new Array<Label>();
        var info = [     "Nanjizal" ];
        for( i in 0...info.length ){
            tx = new Label( info[ i ]
                        ,   SceneProps.regular
                        ,   SceneProps.black
                        ,   SceneProps.bodySize
                        ,   2, px, py, false );
            txArr[ txArr.length ] = tx;
            py += dy;
        }
        var multiTx = new LabelGroup( txArr );
        multiTx.offSide = Compass.WEST_SMALL;
        scene.addImage( multiTx );
        return scene;
    }
}