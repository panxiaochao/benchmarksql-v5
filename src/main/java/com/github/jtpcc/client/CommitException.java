/*
 * CommitException
 *
 * Copyright (C) 2003, Raul Barbosa
 * Copyright (C) 2004-2016, Denis Lussier
 * Copyright (C) 2016, Jan Wieck
 * Copyright (C) 2023, Sean He
 *
 */

package com.github.jtpcc.client;

public class CommitException extends RuntimeException {

	private static final long serialVersionUID = 2135244094396431474L;

	@Override
	public synchronized Throwable fillInStackTrace() {
		return this;
	}
}
