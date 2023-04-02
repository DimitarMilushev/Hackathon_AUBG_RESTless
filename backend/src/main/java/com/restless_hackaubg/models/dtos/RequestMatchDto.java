package com.restless_hackaubg.models.dtos;


import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import java.util.List;

//@Getter @Setter
//@NoArgsConstructor
public class RequestMatchDto {

    private Integer cityId;
    @NotNull(message = "You must provide gender")
    private Integer genderId;

    @NotNull
    private List<Integer> interests;



    public RequestMatchDto() {
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getGenderId() {
        return genderId;
    }

    public void setGenderId(Integer genderId) {
        this.genderId = genderId;
    }

    public List<Integer> getInterests() {
        return interests;
    }

    public void setInterests(List<Integer> interests) {
        this.interests = interests;
    }
}
