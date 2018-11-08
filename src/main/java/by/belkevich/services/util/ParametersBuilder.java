package by.belkevich.services.util;

import java.util.Calendar;
import java.util.Dictionary;
import java.util.HashMap;

import java.util.Map;

public class ParametersBuilder {


    private Map<String,Object> stringObjectMap;

    public static ParametersBuilder newBuilder(){
        return new ParametersBuilder();
    }

    private ParametersBuilder(){
        stringObjectMap = new HashMap<String, Object>();
    }

    public ParametersBuilder addParam(String key,Object value){
        this.stringObjectMap.put(key,value);
        return this;
    }


    public Map<String,Object> build(){
       return stringObjectMap;
    }

}
