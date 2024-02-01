package dbUtil;

import javax.sql.DataSource;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.User;

public class userDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public boolean loginVerification(User user) {
		String sql = "select * from users where username = ? AND password = ?";
		
		
		try {
			User userDB = jdbct.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), user.getUsername(), user.getPassword());
			return true;
		} catch (EmptyResultDataAccessException e)
		{
			return false;
		}
	}
	
	public int addUser(User user) {
		String sql = "INSERT INTO `users` (`username`, `email`, `password`) VALUES (?,?,?)";
		Object args[] = { user.getUsername(), user.getEmail(), user.getPassword()};
        int rowAffected = jdbct.update(sql, args);
        return rowAffected;
	}
	
	public int updateUserInformation(User user) {
	    String sql = "UPDATE `users` SET `address`=?, `state`=?, `postcode`=?, `noResidents`=?, `buildingType`=?, `userType`=?, `phoneNumber`=? WHERE `username`=?";
	    Object args[] = {user.getAddress(), user.getState(), user.getPostcode(), user.getNoResidents(), user.getBuildingType(), user.getUserType(), user.getPhoneNumber(), user.getUsername()};
	    int rowAffected = jdbct.update(sql, args);
	    return rowAffected;
	}
	
	
	public DataSource getDataSource() {
		DataSource ds = null;
		String dbURL = "jdbc:mysql://localhost:3306/mbip";
		String username = "root";
		String password = "";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ds = new DriverManagerDataSource(dbURL, username, password);
		return ds;
	}

}
