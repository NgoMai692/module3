package model;

public class City {
    private int id;
    private String name;
    private Double acreage;
    private Double population;
    private Double gdp;
    private String country;

    public City() {
    }

    public City(int id, String name, Double acreage, Double population, Double gdp, String country) {
        this.id = id;
        this.name = name;
        this.acreage = acreage;
        this.population = population;
        this.gdp = gdp;
        this.country = country;
    }



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Double getAcreage() {
        return acreage;
    }

    public void setAcreage(Double acreage) {
        this.acreage = acreage;
    }

    public Double getPopulation() {
        return population;
    }

    public void setPopulation(Double population) {
        this.population = population;
    }

    public Double getGdp() {
        return gdp;
    }

    public void setGdp(Double gdp) {
        this.gdp = gdp;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "City{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", acreage=" + acreage +
                ", population=" + population +
                ", gdp=" + gdp +
                ", country='" + country + '\'' +
                '}';
    }
}
