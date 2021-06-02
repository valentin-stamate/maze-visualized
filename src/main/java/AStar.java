import java.util.List;
import java.util.ArrayList;

import static processing.core.PApplet.dist;

class AStar {
    private int scale = 20, rows, cols;
    private List< List< Cell > > array;
    private List< Cell > openList, closedList, path;
    private Cell startNode, endNode, q;
    private int dist = 1;
    private boolean searchDone = false;

    AStar(List< List<Cell> > ar, int rows, int cols, int sc){
        // PART 1 & 2
        this.array = ar;
        this.openList = new ArrayList< Cell >();
        this.closedList = new ArrayList< Cell >();
        this.path = new ArrayList< Cell >();

        this.rows = rows;
        this.cols = cols;


        this.startNode = this.array.get( 0 ).get( 0 );
        this.endNode = this.array.get( rows - 1 ).get( cols - 1 );

        this.startNode.setF(0);
        this.startNode.setG(0);

        this.openList.add( this.startNode );
    }

    void update(){

        // PART 3 .
        if( !this.openList.isEmpty() ){

            // PART 3.a .
            this.q = this.openList.get(0);

            for(Cell c : openList){
                if( c.getF() < this.q.getF() ){
                    this.q = c;
                }
            }
            // PART 3.b .
            this.openList.remove( this.q );

            // PART 3.c .
            List< Cell> successors = this.getSuccessors( this.q );

            // PART 3.d
            float gNew, hNew, fNew;
            for(Cell s : successors){
                // i
                if( !this.closedList.contains( s ) ){

                    if(s == endNode ){
                        s.setParent(this.q);
                        System.out.println("Done");
                        this.searchDone = true;
                    }
                    if( !this.closedList.contains( s ) ){

                        gNew = this.q.getG() + 1;// sqrt(2) if there a succesor is in the corner
                        hNew = this.heuristic(s, this.endNode);
                        fNew = gNew + hNew;

                        if( s.getF() == Float.MAX_VALUE || s.getF() > fNew ){
                            this.openList.add( s );

                            s.setF(fNew);
                            s.setG(gNew);
                            s.setH(hNew);

                            s.setParent(this.q);
                        }
                    }
                }
            }

            this.closedList.add(q);

        } else {
            System.out.println("Done");
            this.searchDone = true;
        }

    }


    public List< Cell > getSuccessors(Cell cell){
        List< Cell > s = new ArrayList< Cell >();
        // GET THE NEIGHBORS/SUCCESSORS WHEN POSSIBLE
        Cell up = null, left = null, down = null, right = null;
        try{
            up = this.array.get(cell.getI() - 1).get(cell.getJ());
        } catch (Exception e) {}
        try{
            left = this.array.get(cell.getI()).get(cell.getJ() - 1);
        } catch (Exception e){}
        try{
            down = this.array.get(cell.getI() + 1).get(cell.getJ());
        } catch (Exception e) {}
        try{
            right = this.array.get(cell.getI()).get(cell.getJ() + 1);
        } catch (Exception e){}

        if( up != null && !cell.getWalls()[0] )
            s.add(up);
        if( left != null && !cell.getWalls()[1] )
            s.add(left);
        if( down != null && !down.getWalls()[0] )
            s.add(down);
        if( right != null && !right.getWalls()[1] )
            s.add(right);

        return s;
    }

    private float heuristic(Cell a, Cell b){
        return dist( a.getJ(), a.getI(), b.getJ(), b.getI() );
        //return abs( a.i - b.i ) + abs( a.j - b.j );
    }

    void drawArray(){

        if( !this.searchDone ){
            for(Cell c : this.closedList)
                c.showPath(110, 50, 70);

            for(Cell c : this.openList)
                c.showPath(249, 85, 85);
        }
        // GET THE PATH AND SHOW IT
        this.path.clear();

        Cell temp = q;
        this.path.add(temp);

        while( temp.getParent() != null ){
            this.path.add( temp.getParent() );
            temp = temp.getParent();
        }

        for(Cell c : path)
            c.showPath(43, 239, 127);

        this.endNode.show(249, 85, 85);
        this.startNode.show(62, 229, 205);

    }

    public boolean isSearchDone() {
        return searchDone;
    }

}
