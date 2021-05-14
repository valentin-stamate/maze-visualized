import processing.core.PApplet;

import java.util.ArrayList;
import java.util.List;

public class Main extends PApplet {

    GenerateMaze gm;
    AStar aStar;
    List<List<Cell>> array;

    public void settings() {
        size(600, 600);
    }

    public void setup() {
        surface.setTitle("Conquering The Maze");
        frameRate(60);

        array = new ArrayList<>();

        gm = new GenerateMaze(array, Config.rows, Config.columns, Config.sc, this);
        aStar = new AStar(array, Config.rows, Config.columns, Config.sc);
    }

    public void draw() {
        showArray();
        if( !gm.finished )
            gm.update();
        else if( !aStar.searchDone ){
            aStar.update();
            aStar.drawArray();
        } else {
            aStar.drawArray();
        }
    }

    void showArray(){
        for(int i = 0; i < Config.rows; i++){
            for(int j = 0; j < Config.columns; j ++){
                this.array.get(i).get(j).show(20, 20, 20);
            }
        }
    }

    public static void main(String... args) {
        PApplet.main("Main");
    }

}
