package dbUtil;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.Electricity;
import com.model.User;

public class electricityDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(dbDataSource.getDataSource());
	
	public void add(Electricity e) {
		String sql = "INSERT INTO `electricity_consumption` ( `no_invoice`, `consumption`, `month`, `carbon_footprint`, `username`, `status`) VALUES (?,?,?,?,?,?)";
		Object [] args = {e.getNoInvoice(), e.getConsumption(), e.getMonth(), e.getCarbonFootprint(), e.getUsername(), "submitted"};
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
	
	public double getCarbonEmission(String month, String username) {
		String sql = "SELECT carbon_footprint FROM electricity_consumption WHERE MONTH=? AND USERNAME=?";
		try {
			double e = jdbct.queryForObject(sql, Double.class, month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return 0.0;
		}
	}
	
	public int[] getCountOfEntries() {
		
		String submittedSql = "SELECT COUNT(*) FROM electricity_consumption WHERE status = 'submitted'";
		String validatedSql = "SELECT COUNT(*) FROM electricity_consumption WHERE status = 'validated'";
		String rejectedSql = "SELECT COUNT(*) FROM electricity_consumption WHERE status = 'rejected'";
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
	
	public List<Electricity> getAll() {
        String sql = "SELECT * FROM electricity_consumption";
        List<Electricity> electricityList = jdbct.query(sql, new BeanPropertyRowMapper<>(Electricity.class));
        return electricityList;
    }

}
