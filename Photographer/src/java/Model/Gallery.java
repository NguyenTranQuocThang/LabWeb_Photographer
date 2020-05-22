/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

/**
 *
 * @author thang
 */
public class Gallery {
    int idGallery;
    String nameGallery;
    String shortDes;
    String imagesDescript;

    public Gallery() {
    }

    public Gallery(int idGallery, String nameGallery, String shortDes, String imagesDescript) {
        this.idGallery = idGallery;
        this.nameGallery = nameGallery;
        this.shortDes = shortDes;
        this.imagesDescript = imagesDescript;
    }

    public int getIdGallery() {
        return idGallery;
    }

    public void setIdGallery(int idGallery) {
        this.idGallery = idGallery;
    }

    public String getNameGallery() {
        return nameGallery;
    }

    public void setNameGallery(String nameGallery) {
        this.nameGallery = nameGallery;
    }

    public String getShortDes() {
        return shortDes;
    }

    public void setShortDes(String shortDes) {
        this.shortDes = shortDes;
    }

    public String getImagesDescript() {
        return imagesDescript;
    }

    public void setImagesDescript(String imagesDescript) {
        this.imagesDescript = imagesDescript;
    }
    
}
