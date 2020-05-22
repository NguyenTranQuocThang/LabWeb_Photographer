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
public class DetailGallery {
    int id ;
    String imageDetail;
    int idGallery;

    public DetailGallery() {
    }

    public DetailGallery(int id, String imageDetail, int idGallery) {
        this.id = id;
        this.imageDetail = imageDetail;
        this.idGallery = idGallery;
    }
    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getImageDetail() {
        return imageDetail;
    }

    public void setImageDetail(String imageDetail) {
        this.imageDetail = imageDetail;
    }

    public int getIdGallery() {
        return idGallery;
    }

    public void setIdGallery(int idGallery) {
        this.idGallery = idGallery;
    }
    
}
