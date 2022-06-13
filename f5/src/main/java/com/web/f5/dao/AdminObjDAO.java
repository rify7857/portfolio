package com.web.f5.dao;

import java.util.List;

public interface AdminObjDAO {

	List<Object> select ( int startCount, int endCount );
	int execTotalCount();
	int insert(Object obj);
	Object select(String id);
	int update(Object obj);
	int delete(String id);
}
