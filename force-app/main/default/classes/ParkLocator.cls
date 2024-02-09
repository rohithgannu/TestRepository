public class ParkLocator {
 
    public static List<string> country(String country){
        
        ParkService.ParksImplPort parkservice = new ParkService.ParksImplPort();
        System.debug('example'+ parkservice.byCountry(country));
        return  parkservice.byCountry(country);
    }
}