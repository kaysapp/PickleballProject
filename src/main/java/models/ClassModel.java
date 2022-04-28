package models;

import java.util.Date;

public class ClassModel {

    String class_date, class_time, instructor, level;

    public ClassModel(String class_date, String class_time, String instructor, String level) {
        this.class_date = class_date;
        this.class_time = class_time;
        this.instructor = instructor;
        this.level = level;
    }

    public String getClass_date() {
        return class_date;
    }

    public void setClass_date(String class_date) {
        this.class_date = class_date;
    }

    public String getClass_time() {
        return class_time;
    }

    public void setClass_time(String class_time) {
        this.class_time = class_time;
    }

    public String getInstructor() {
        return instructor;
    }

    public void setInstructor(String instructor) {
        this.instructor = instructor;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }
}
