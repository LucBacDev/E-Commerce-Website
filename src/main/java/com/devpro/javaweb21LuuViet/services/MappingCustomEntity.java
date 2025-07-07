package com.devpro.javaweb21LuuViet.services;

import com.devpro.javaweb21LuuViet.model.BaseEntity;

public interface MappingCustomEntity<E extends BaseEntity> {
	public E convert(Object[] data);
}
