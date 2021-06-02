import processing.core.PApplet;

import java.util.List;
import java.util.ArrayList;

class Cell{
    private int i, j;
    private boolean walls[] = {true, true};
    private boolean isVisited = false;

    private float f = Float.MAX_VALUE, g, h;
    private Cell parent;

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

    public int getI() {
        return i;
    }

    public void setI(int i) {
        this.i = i;
    }

    public int getJ() {
        return j;
    }

    public void setJ(int j) {
        this.j = j;
    }

    public boolean[] getWalls() {
        return walls;
    }

    public void setWalls(boolean[] walls) {
        this.walls = walls;
    }

    public boolean isVisited() {
        return isVisited;
    }

    public void setVisited(boolean visited) {
        isVisited = visited;
    }

    public float getF() {
        return f;
    }

    public void setF(float f) {
        this.f = f;
    }

    public float getG() {
        return g;
    }

    public void setG(float g) {
        this.g = g;
    }

    public float getH() {
        return h;
    }

    public void setH(float h) {
        this.h = h;
    }

    public Cell getParent() {
        return parent;
    }

    public void setParent(Cell parent) {
        this.parent = parent;
    }

    public PApplet getpApplet() {
        return pApplet;
    }

    public void setpApplet(PApplet pApplet) {
        this.pApplet = pApplet;
    }
}
