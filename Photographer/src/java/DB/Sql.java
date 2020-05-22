/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DB;
import Model.Contact;
import Model.DetailGallery;
import Model.Gallery;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author thang
 */
public class Sql extends DBContext {

    public Sql() {
    
    }
    
    // Take information page
    public Contact getContact() throws Exception {
        Contact contact = new Contact();
        String sql = "SELECT [name]\n"
                + "      ,[address]\n"
                + "      ,[city]\n"
                + "      ,[country]\n"
                + "      ,[telephone]\n"
                + "      ,[email]\n"
                + "      ,[photo]\n"
                + "      ,[titlePhoto]\n"
                + "      ,[about]\n"
                + "  FROM [dbo].[Contact]";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                contact.setName(rs.getString("name"));
                contact.setAddress(rs.getString("address"));
                contact.setCity(rs.getString("city"));
                contact.setCountry(rs.getString("country"));
                contact.setTelephone(rs.getString("telephone"));
                contact.setEmail(rs.getString("email"));
                contact.setPhoto(DBContext.IMAGE + "/" + rs.getString("photo"));
                contact.setTitlePhoto(rs.getString("titlePhoto"));
                contact.setAbout(rs.getString("about"));
            }
        } catch (Exception e) {

            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return contact;
    }

    //take top3 gallery to show menu
    public ArrayList<Gallery> getTop3Gallery() throws Exception {
        ArrayList<Gallery> galleryList = new ArrayList<>();
        String sql = "SELECT TOP (3) [idGallery]\n"
                + "      ,[nameGallery]\n"
                + "      ,[shortDes]\n"
                + "      ,[imageDescript]\n"
                + "  FROM [Photographer].[dbo].[Gallery]";
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setIdGallery(rs.getInt("idGallery"));
                gallery.setNameGallery(rs.getString("nameGallery"));
                
                gallery.setImagesDescript(DBContext.IMAGE + "/" + rs.getString("imageDescript"));
                gallery.setShortDes(rs.getString("shortDes"));
                galleryList.add(gallery);
            }
        } catch (Exception e) {
            System.out.println("loiiiiiiiiiiiiiiiii");
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }

        return galleryList;
    }

    //take gallery and paging 
    public ArrayList<Gallery> getAllGallery(int pageindex, int pagesize) throws Exception {
        ArrayList<Gallery> galleryList = new ArrayList<>();
        Connection cnn = null;
        PreparedStatement statement = null;
        ResultSet rs = null;
        String sqlF = " Select *,ROW_NUMBER() over (ORDER BY idGallery ASC) as row_num from Gallery ";
        String sql = "select * from ( " + sqlF + ") galler where row_num >= (?-1)*?+1 and row_num <= ? * ?  ";
        try {
            cnn = getConnection();
            statement = cnn.prepareStatement(sql);
            statement.setInt(1, pageindex);
            statement.setInt(2, pagesize);
            statement.setInt(3, pageindex);
            statement.setInt(4, pagesize);
            rs = statement.executeQuery();
            while (rs.next()) {
                Gallery gallery = new Gallery();
                gallery.setIdGallery(rs.getInt("idGallery"));
                gallery.setNameGallery(rs.getString("nameGallery"));
                gallery.setImagesDescript(DBContext.IMAGE + "/" + rs.getString("imageDescript"));
                gallery.setShortDes(rs.getString("shortDes"));
                galleryList.add(gallery);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, statement, cnn);
        }
        return galleryList;
    }

    //count gallery in database
    public int countGallery() throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select count(*) as rownum from Gallery";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("rownum");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return -1;
    }

    //get Gallery by id 
    public Gallery getGalleryById(int id) throws Exception {
        Gallery gallery = new Gallery();
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "SELECT [idGallery]\n"
                + "      ,[nameGallery]\n"
                + "      ,[shortDes]\n"
                + "      ,[imageDescript]\n"
                + "  FROM [dbo].[Gallery]\n"
                + "  where idGallery = ?";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                gallery.setIdGallery(rs.getInt("idGallery"));
                gallery.setNameGallery(rs.getString("nameGallery"));
                gallery.setImagesDescript(DBContext.IMAGE + "/" + rs.getString("imageDescript"));
                gallery.setShortDes(rs.getString("shortDes"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return gallery;
    }

    // count gallery by id to calcuate pagecount
    public int countGalleryById(int id) throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select Count (*) as num  FROM [dbo].[Gallery] \n"
                + "                  where idGallery = ? ";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("num");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return -1;
    }

    // count detailGallery to calcuate pagecount
    public int countDetailGallery(int id) throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        String sql = "select count (*) as num from DeltailGallery where idGallery = ? ";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt("num");
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return -1;
    }

    // get detail gallery for paging
    public ArrayList<DetailGallery> getDeailGalleryPaging(int id, int pageindex, int pagesize) throws Exception {
        Connection connection = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        ArrayList<DetailGallery> detailGalleryList = new ArrayList<>();
        String sqlF = " select * ,ROW_NUMBER() over (Order By id ASC) as row_num from DeltailGallery where idGallery = ? ";
        String sql = "Select * from ( " + sqlF + " ) img where row_num >= (?-1)*?+1 and row_num <= ? * ? ";
        try {
            connection = getConnection();
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setInt(2, pageindex);
            ps.setInt(3, pagesize);
            ps.setInt(4, pageindex);
            ps.setInt(5, pagesize);
            rs = ps.executeQuery();
            while (rs.next()) {
                DetailGallery detailGallery = new DetailGallery();
                detailGallery.setId(rs.getInt("id"));
                detailGallery.setIdGallery(rs.getInt("idGallery"));
                detailGallery.setImageDetail(DBContext.IMAGE + "/" + rs.getString("imageDetail"));
                detailGalleryList.add(detailGallery);
            }
        } catch (Exception e) {
            throw e;
        } finally {
            closeConnection(rs, ps, connection);
        }
        return detailGalleryList;
    }
}
