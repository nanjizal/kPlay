package kPlay;
import kScenes.*;
import kScenes.story.Director;
import kScenes.story.Scene;
import kScenes.actors.*;
import kScenes.actors.advanced.LabelGroup;
import kScenes.interaction.Compass;
import kha.*;
import kha.math.*;
import kPlay.*;
import kPlay.scenes.*;

class SceneBuilder { 
    var director: Director;
    public function new( director_: Director ){
        director = director_;
        new SceneProps(); // init SceneProps statics like font.
        director.enableKeyControl();
        director.enableMouseInteraction();
    }
    function add( scene: Scene ){
        director.add( scene );
    } 
    
    public function start(){
        var scene = Start.scene();
        addMenu( scene, 0, SceneProps.white, SceneProps.black, SceneProps.black );
        add( scene );
        return scene;
    }
    public function instructions(){
        var scene = Instructions.scene();
        addMenu( scene, 1, SceneProps.white, SceneProps.black, SceneProps.black );
        add( scene );
        return scene;
    }
    public function end(){
        var scene = End.scene();
        addMenu( scene, 2, SceneProps.white, SceneProps.black, SceneProps.black );
        add( scene );
        return scene;
    }
    
    function addMenu( scene: Scene, id: Int, colSelect: Int, col0: Int, col1: Int  ){
        var tx0: Label;
        var tx1: Label;
        var px0 = 1024 - 169 + 1 - 200;
        var px1 = px0 + 137 - 1 + 140;
        var py = 20;
        var dy = 42;
        var txArr = new Array<Label>();
        var rw: Rectangle;
        var buttonNames = [ 'start', 'info', 'end' ];
        var count: Int = 0;
        for( name in buttonNames ){
            if( count == id ){
                tx0 = new Label( name, SceneProps.regular, colSelect, 38, 2, px0, py, false );
                txArr[ txArr.length ] = tx0;
                rw = new Rectangle( tx0.width + 4, tx0.height + 4, Color.White, 0xFFff0000, 0., px0 - 2, py - 2 );
            } else {
                tx0 = new Label( name, SceneProps.regular, col0, 38, 2, px0, py, false );
                txArr[ txArr.length ] = tx0;
                tx1 = new Label( Std.string( count ), SceneProps.regular, col1, 40, null, px1, py, false );    
                txArr[ txArr.length ] = tx1;
                rw = new Rectangle( ( tx1.x + tx1.width ) - px0 + 4, tx0.height + 4, Color.White, 0xFfff0000, 0., px0 - 2, py - 2 );
            }
            count++;
            rw.hitable = true;
            scene.addHit( rw );
            py += dy;
        }
        var multiTx = new LabelGroup( txArr );
        multiTx.offSide = Compass.EAST;
        scene.addImage( multiTx );
    }

}