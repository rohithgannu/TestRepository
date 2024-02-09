public class class2 {
    public void para1(Integer i){
        Integer inches=i;
        Integer feet=0;
        while(inches>=12)
        {  
            feet++;
            inches=inches-12;
        }
        System.debug('feet::'+feet+'inches::'+inches);
    }
    public void para2(Integer e){
        Integer Meters=e;
        Integer kms=0;
        while(Meters>=1000)
            {
                kms++;
                Meters=Meters-1000;
            }
        System.debug('kms::'+kms+'meters::'+Meters);
    }
    

}