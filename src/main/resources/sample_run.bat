:: this is only the demo for who want to run on windows platform,  
:: here is just a sample of ase dbtype.

time /T

java -cp .\;..\BenchmarkSQL-v5.jar;..\lib\* -Dprop=ase3.props -DcommandFile=.\sql.ase\tableCreates.sql -Djava.security.egd=file;\dev\.\urandom com.github.jtpcc.jdbc.ExecJDBC

java -cp .\;..\BenchmarkSQL-v5.jar;..\lib\* -Dprop=ase3.props -DcommandFile=.\sql.ase\tableCreates.sql -Djava.security.egd=file;\dev\.\urandom com.github.jtpcc.loader.LoadData

time /T

java -cp .\;..\BenchmarkSQL-v5.jar;..\lib\* -Dprop=ase3.props -DcommandFile=.\sql.common\indexCreates.sql -Djava.security.egd=file;\dev\.\urandom com.github.jtpcc.jdbc.ExecJDBC

java -cp .\;..\BenchmarkSQL-v5.jar;..\lib\* -Dprop=ase3.props -DcommandFile=.\sql.common\foreignKeys.sql -Djava.security.egd=file;\dev\.\urandom com.github.jtpcc.jdbc.ExecJDBC

java -cp ./;../BenchmarkSQL-v5.jar;../lib/* -Dprop=ase3.props -DrunID=2 -Djava.security.egd=file;/dev/./urandom com.github.jtpcc.client.jTPCC


java -cp ./;../BenchmarkSQL-v5.jar;../lib/* -Dprop=ase3.props -DcommandFile=./sql.common/tableDrops.sql -Djava.security.egd=file;/dev/./urandom com.github.jtpcc.jdbc.ExecJDBC


java -cp ./;../BenchmarkSQL-v5.jar;../lib/* -Dprop=ase3.props -DcommandFile=./sql.common/storedProcedureDrops.sql -Djava.security.egd=file;/dev/./urandom com.github.jtpcc.jdbc.ExecJDBC