package dbUtil;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import com.model.Electricity;
import com.model.Recycle;
import com.model.Water;

public class recycleDAO {
	
	JdbcTemplate jdbct = new JdbcTemplate(dbDataSource.getDataSource());
	
	public void add(Recycle e) {
		String sql = "INSERT INTO `recycle_activity` ( `no_invoice`, `consumption`, `month`, `carbon_footprint`, `username`, `status`) VALUES (?,?,?,?,?,?)";
		Object [] args = {e.getNoInvoice(), e.getConsumption(), e.getMonth(), e.getCarbonFootprint(), e.getUsername(), "submitted"};
		jdbct.update(sql, args);
	}
	
	public void update(Recycle e) {
	    String sql = "UPDATE `recycle_activity` SET `no_invoice`=?, `consumption`=?, `carbon_footprint`=? WHERE `month`=? AND `username`=?";
	    Object[] args = {e.getNoInvoice(), e.getConsumption(), e.getCarbonFootprint(), e.getMonth(), e.getUsername()};
	    jdbct.update(sql, args);
	}

	
	public Recycle get(String month, String username) {
		String sql = "SELECT * FROM recycle_activity WHERE MONTH=? AND USERNAME=?";
		try {
			Recycle e = jdbct.queryForObject(sql, new BeanPropertyRowMapper<Recycle>(Recycle.class), month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return null;
		}
	}
	
	public double getCarbonEmission(String month, String username) {
		String sql = "SELECT carbon_footprint FROM recycle_activity WHERE MONTH=? AND USERNAME=?";
		try {
			double e = jdbct.queryForObject(sql, Double.class, month, username);
			return e;
		} catch (EmptyResultDataAccessException e)
		{
			return 0.0;
		}
	}
	
	public int[] getCountOfEntries() {
		
		String submittedSql = "SELECT COUNT(*) FROM recycle_activity WHERE status = 'submitted'";
		String validatedSql = "SELECT COUNT(*) FROM recycle_activity WHERE status = 'validated'";
		String rejectedSql = "SELECT COUNT(*) FROM recycle_activity WHERE status = 'rejected'";
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
	
	public List<Recycle> getAll() {
        String sql = "SELECT * FROM recycle_activity";
        List<Recycle> recycleList = jdbct.query(sql, new BeanPropertyRowMapper<>(Recycle.class));
        return recycleList;
    }
	
	public void approveForm(String username, String month) {
	    String sql = "UPDATE `recycle_activity` SET `status`='validated' WHERE `month`=? AND `username`=?";
	    Object[] args = {month, username};
	    jdbct.update(sql, args);
	}

	public void rejectForm(String username, String month) {
	    String sql = "UPDATE `recycle_activity` SET `status`='rejected' WHERE `month`=? AND `username`=?";
	    Object[] args = {month, username};
	    jdbct.update(sql, args);
	}


}
