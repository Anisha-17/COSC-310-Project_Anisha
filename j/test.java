

import java.io.FileReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.*;

// import apache.commons.lang3.Objects;

import com.opencsv.CSVReader;

public class test{

    public static void main (String [] args) {
        String url = "jdbc:mysql://localhost/ss";
        String user = "ss";
        String pass = "ssproj";

        String fp = "../database.csv";

        try  
        {
            CSVReader r = new CSVReader(new FileReader(fp));
            Connection con = DriverManager.getConnection(url, user, pass);

            String sql = "INSERT INTO data VALUES (?, ?, ?, ?)";
            PreparedStatement p = con.prepareStatement(sql);
            String [] rowData;
            r.readNext();
            while((rowData = r.readNext()) != null){
                for (String data : rowData){
                    p.setString(1, rowData[0]);
                    p.setString(2, rowData[1]);
                    p.setString(3, rowData[2]);
                    p.setString(4, rowData[3]);
                    System.out.println(data);
                    p.execute();
                        
                }
            }
            System.out.println("Loaded");

            String sq = "SELECT * FROM data";
            PreparedStatement ps = con.prepareStatement(sq);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                rs.getString("roleName");
            }

            
            

        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e);
        }

        


    }
    //testing
    
    
}
