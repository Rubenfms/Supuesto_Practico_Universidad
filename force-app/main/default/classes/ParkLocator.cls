/**
 * @description       : 
 * @author            : Rubén Fortes-Marques Sánchez
 * @group             : 
 * @last modified on  : 10-10-2022
 * @last modified by  : Rubén Fortes-Marques Sánchez
**/
public with sharing class ParkLocator {
    public static String[] country (String country) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        String[] parksname = parks.byCountry(country);
        return parksname;
    }
}
