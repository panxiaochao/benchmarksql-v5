/*
 * jTPCCConfig - Basic configuration parameters for jTPCC
 *
 * Copyright (C) 2003, Raul Barbosa Copyright (C) 2004-2016, Denis Lussier Copyright (C) 2016, Jan
 * Wieck Copyright (C) 2023, Sean He
 */

package com.github.jtpcc.client;

import java.text.SimpleDateFormat;

public interface jTPCCConfig {
    String JTPCCVERSION = "5.0";

    int DB_UNKNOWN = 0, //
            DB_FIREBIRD = 1, //
            DB_ORACLE = 2, //
            DB_POSTGRES = 3, //
            DB_MYSQL = 4, //
            DB_TSQL = 5, //
            DB_BABELFISH = 6, //
            DB_ASE = 7, //
            DB_HANA = 8, //
            DB_HANA_COL = 9, //
            DB_MARIADB = 10, //
            DB_DB2 = 11;//

    int NEW_ORDER = 1, PAYMENT = 2, ORDER_STATUS = 3, DELIVERY = 4, STOCK_LEVEL = 5;

    String[] nameTokens = {"BAR", "OUGHT", "ABLE", "PRI", "PRES", "ESE", "ANTI", "CALLY", "ATION", "EING"};

    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    int configCommitCount = 10000; // commit every n records
    // in LoadData

    int configWhseCount = 10;
    int configItemCount = 100000; // tpc-c std = 100,000
    int configDistPerWhse = 10; // tpc-c std = 10
    int configCustPerDist = 3000; // tpc-c std = 3,000
}
