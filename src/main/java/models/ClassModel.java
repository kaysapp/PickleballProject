package models;

public class ClassModel {
    int class_id;
    String class_date, class_time, class_instructor, class_level;

    public ClassModel(int class_id, String class_date, String class_time, String class_instructor, String class_level) {
        this.class_id = class_id;
        this.class_date = class_date;
        this.class_time = class_time;
        this.class_instructor = class_instructor;
        this.class_level = class_level;
    }

    public int getClass_id() {
        return class_id;
    }

    public void setClass_id(int class_id) {
        this.class_id = class_id;
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

    public String getClass_instructor() {
        return class_instructor;
    }

    public void setClass_instructor(String class_instructor) {
        this.class_instructor = class_instructor;
    }

    public String getClass_level() {
        return class_level;
    }

    public void setClass_level(String class_level) {
        this.class_level = class_level;
    }
}
