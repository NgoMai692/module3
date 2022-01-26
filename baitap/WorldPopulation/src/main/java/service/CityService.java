package service;

import model.City;

import java.util.ArrayList;

public class CityService {
    private static final  ArrayList<City> cityList ;
    private static final  ArrayList<City> countryList ;

    static {
        cityList = new ArrayList<>();
        countryList = new ArrayList<>();
        cityList.add(new City(1,"Ha Noi",3358.6,8000000.4,170000.5,"Viet Nam"));
        cityList.add(new City(2,"Hai Phong",3358.6,8.25,5000.6,"Viet Nam"));
        cityList.add(new City(3,"Hue",3358.6,8.25,10000.1,"Viet Nam"));

    }

//    public ArrayList<String> getListCountry(){
//        ArrayList<String> countryList = new ArrayList<>();
//        int count = 0;
//        countryList.add(cityList.get(0).getCountry());
//        for (int i = 1; i < cityList.size()-1; i++) {
//            if ()
//        }
//    }
    public ArrayList<City> getAllCity(){
        return cityList;
    }

    public City getCity(int id){
        for (City city: cityList) {
            if(city.getId() == id){
                return city;
            }
        }
        return null;
    }

    public void creatCity(City city){
        cityList.add(city);
    }

    public void deleteCity(City city){
        cityList.remove(city);
    }

    public void editCity(int index, City city){
        cityList.set(index,city);
    }

    public ArrayList<City> sortCityByPopulation(){
        cityList.sort(((o1, o2) -> (int) (o1.getPopulation() - o2.getPopulation())));
        return cityList;
    }

    public ArrayList<City> searchCityByName(String name){
        ArrayList<City> searchList = new ArrayList<>();
        for (City city: cityList) {
            if(city.getName().equals(name)){
                searchList.add(city);
            }
        }
        return searchList;
    }
}
