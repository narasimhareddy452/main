public class RectangleWithParameterizedConstructor {
    Integer lenghth=5, breadth=10, area, perimeter;
    
    public void area(){
        area=lenghth*breadth;
        system.debug( 'Rectangle area =' +area);
        
    }
    public void perimeter(){
        perimeter=2*(lenghth+breadth);
        system.debug( 'Rectangle perimeter =' +perimeter);
    }
}