package kPlay;
import kha.Framebuffer;
import kha.Scheduler;
import kha.System;
import kha.Color;
import kha.Assets;
import kScenes.story.*;

import kha.Sound;
import kha.audio1.AudioChannel;
import kha.audio1.Audio;


class KPlay {
    var director:       Director;
    var sceneBuilder:   SceneBuilder;
    var start:          Scene;
    var instructions:   Scene;
    var end:            Scene;
    public function new() {
        Assets.loadEverything( loadAll );
    }
    function loadAll(){
        setupScenes();
        System.notifyOnRender( render );
        Scheduler.addTimeTask( update, 0, 1 / 60 );
        backgroundMusic();
    }
    public function setupScenes(){
        director   = new Director();
        sceneBuilder    = new SceneBuilder( director );
        start           = sceneBuilder.start();
        instructions    = sceneBuilder.instructions();
        end             = sceneBuilder.end();
        director.buttonPress = buttonPress;
        start.show();
    }
    public function backgroundMusic(){
        /*var sound = Assets.sounds.;
        var audioChannel = Audio.play( sound, true );
        audioChannel.volume = 0.5;*/
    }
    @:access( kScenes.story.Scene )
    function buttonPress( scene: Scene, id: Int ){
            switch( id ){
                case 0: 
                    director.gotoScene( start );
                case 1:
                    director.gotoScene( instructions );
                case 2:
                    director.gotoScene( end );
            }
    }
    function update(): Void {
        /*
        var scene: Scene = director.currentScene();
        switch( scene ){
            case scene1:
        }
        */
    }
    function render(framebuffer: Framebuffer): Void {
        var g2 = framebuffer.g2;
        g2.begin();
        g2.clear( Color.fromValue( 0xff000000 ) );
        director.render( framebuffer );
        g2.end();
    }
    
}