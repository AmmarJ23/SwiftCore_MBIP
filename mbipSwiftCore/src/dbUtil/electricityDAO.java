package dbUtil;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.Electricity;
import com.model.User;

public class electricityDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(dbDataSource.getDataSource());
	
	public void add(Electricity e) {
		String sql = "INSERT INTO `electricity_consumption` ( `no_invoice`, `consumption`, `month`, `carbon_footprint`, `username`) VALUES (?,?,?,?,?)";
		Object [] args = {e.getNoInvoice(), e.getConsumption(), e.getMonth(), e.getCarbonFootprint(), e.getUsername()};
		jdbct.update(sql, args);
	}
	
	public void update(Electricity e) {
	    String sql = "UPDATE `electricity_consumption` SET `no_invoice`=?, `consumption`=?, `carbon_footprint`=? WHERE `month`=? AND `username`=?";
	    Object[] args = {e.getNoInvoice(), e.getConsumption(), e.getCarbonFootprint(), e.getMonth(), e.getUsername()};
	    jdbct.update(sql, args);
	}

	
	public Electricity get(String month, String username) {
		String sql = "SELECT * FROM electricity_consumption WHERE MONTH=? AND USERNAME=?";
		try {
			Electricity e = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Electricity>(Electricity.class), month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return null;
		}
	}

}
