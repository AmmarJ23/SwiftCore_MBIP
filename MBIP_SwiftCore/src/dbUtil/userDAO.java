package dbUtil;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.datasource.DriverManagerDataSource;

import com.model.User;

public class userDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(getDataSource());
	
	public int addUser(User user) {
		String sql = "INSERT INTO `users` (`username`, `email`, `password`) VALUES (?,?,?)";
		Object args[] = { user.getUsername(), user.getEmail(), user.getPassword()};
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
