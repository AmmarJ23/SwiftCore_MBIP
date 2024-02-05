package dbUtil;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.Water;

public class waterDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(dbDataSource.getDataSource());
	
	public void add(Water e) {
		String sql = "INSERT INTO `water_consumption` ( `no_invoice`, `consumption`, `month`, `carbon_footprint`, `username`, `status`) VALUES (?,?,?,?,?,?)";
		Object [] args = {e.getNoInvoice(), e.getConsumption(), e.getMonth(), e.getCarbonFootprint(), e.getUsername(), "submitted"};
		jdbct.update(sql, args);
	}
	
	public void update(Water e) {
	    String sql = "UPDATE `water_consumption` SET `no_invoice`=?, `consumption`=?, `carbon_footprint`=? WHERE `month`=? AND `username`=?";
	    Object[] args = {e.getNoInvoice(), e.getConsumption(), e.getCarbonFootprint(), e.getMonth(), e.getUsername()};
	    jdbct.update(sql, args);
	}
	
	public Water get(String month, String username) {
		String sql = "SELECT * FROM electricity_consumption WHERE MONTH=? AND USERNAME=?";
		try {
			Water e = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Water>(Water.class), month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return null;
		}
	}
	
	public double getCarbonEmission(String month, String username) {
		String sql = "SELECT carbon_footprint FROM water_consumption WHERE MONTH=? AND USERNAME=?";
		try {
			double e = jdbct.queryForObject(sql, Double.class, month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return 0.0;
		}
	}
	
	public int[] getCountOfEntries() {
		
		String submittedSql = "SELECT COUNT(*) FROM water_consumption WHERE status = 'submitted'";
		String validatedSql = "SELECT COUNT(*) FROM water_consumption WHERE status = 'validated'";
		String rejectedSql = "SELECT COUNT(*) FROM water_consumption WHERE status = 'rejected'";
        int submittedCount = 0;
        int validatedCount = 0;
        int rejectedCount = 0;
		
		try {
			submittedCount = jdbct.queryForObject(submittedSql, Integer.class);
		}catch (EmptyResultDataAccessException e) {
			submittedCount = 0;
		}
		
		try {
			rejectedCount = jdbct.queryForObject(rejectedSql, Integer.class);
		}catch (EmptyResultDataAccessException e) {
			rejectedCount = 0;
		}

		try {
			validatedCount = jdbct.queryForObject(validatedSql, Integer.class);
		}catch (EmptyResultDataAccessException e) {
			validatedCount = 0;
		}

        int[] counts = {submittedCount, validatedCount, rejectedCount};
        return counts;
    }

}
