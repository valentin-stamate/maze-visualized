import processing.core.PApplet;

import java.util.List;
import java.util.ArrayList;

class Cell{
    public int i, j;
    public boolean walls[] = {true, true};
    public boolean isVisited = false;

    public float f = Float.MAX_VALUE, g, h;
    public Cell parent;

    PApplet pApplet;

    Cell(int i, int j, PApplet pApplet){
        this.i = i;
        this.j = j;
        this.parent = null;
        this.pApplet = pApplet;
    }
    // SHOW A NORMAL PATH
    public void show(int r, int g, int b){
        pApplet.noStroke();

        pApplet.fill(r, g, b);
        pApplet.rect(this.j * Config.sc, this.i * Config.sc, Config.sc, Config.sc);

        pApplet.strokeWeight(1);
        pApplet.stroke(255);

        if( this.walls[0] )
            pApplet.line(j * Config.sc, i * Config.sc, (j + 1) * Config.sc, i * Config.sc);
        if( this.walls[1] )
            pApplet.line(j * Config.sc, i * Config.sc, j * Config.sc, (i + 1)* Config.sc);
    }
    // SHOW THE CIRCLES
    public void showPath(int r, int g, int b){
        pApplet.noStroke();

        pApplet.fill(r, g, b);
        pApplet.ellipse(this.j * Config.sc + Config.sc / 2, this.i * Config.sc + Config.sc / 2, 9, 9);
    }

}
