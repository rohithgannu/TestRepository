public class distance {
    Integer Inches;
    Integer feet;
    
    public distance(Integer x,integer y){
     feet=x;
    inches=y;
    }
    public distance(distance d1,distance d2)
    {
        feet=d1.feet+d2.feet;
        inches=d1.inches+d2.inches;
        if(inches>=12)
        { 
            feet++;
            inches=inches-12;
            
            
        }
        system.debug('feets='+feet+'inches='+inches);
    }
   
    
    }