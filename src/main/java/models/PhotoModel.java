package models;

import java.sql.Blob;

public class PhotoModel {
    int pic_id;
    String caption;
    Blob photo;

    public PhotoModel(int pic_id, String caption, Blob photo) {
        this.pic_id = pic_id;
        this.caption = caption;
        this.photo = photo;
    }

    public int getPic_id() {
        return pic_id;
    }

    public void setPic_id(int pic_id) {
        this.pic_id = pic_id;
    }

    public String getCaption() {
        return caption;
    }

    public void setCaption(String caption) {
        this.caption = caption;
    }

    public Blob getPhoto() {
        return photo;
    }

    public void setPhoto(Blob photo) {
        this.photo = photo;
    }
}
