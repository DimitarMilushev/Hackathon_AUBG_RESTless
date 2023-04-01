package com.restless_hackaubg.models.dtos;


import javax.validation.constraints.NotEmpty;

//@Getter @Setter
//@NoArgsConstructor
public class RequestMatchDto {

    private String country;
    private String city;
    @NotEmpty(message = "You must provide gender")
    private String gender;

    public RequestMatchDto() {
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }
}
