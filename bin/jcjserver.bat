@REM ----------------------------------------------------------------------------
@REM  Copyright 2001-2006 The Apache Software Foundation.
@REM
@REM  Licensed under the Apache License, Version 2.0 (the "License");
@REM  you may not use this file except in compliance with the License.
@REM  You may obtain a copy of the License at
@REM
@REM       http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM  Unless required by applicable law or agreed to in writing, software
@REM  distributed under the License is distributed on an "AS IS" BASIS,
@REM  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM  See the License for the specific language governing permissions and
@REM  limitations under the License.
@REM ----------------------------------------------------------------------------
@REM
@REM   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
@REM   reserved.

@echo off

set ERROR_CODE=0

:init
@REM Decide how to startup depending on the version of windows

@REM -- Win98ME
if NOT "%OS%"=="Windows_NT" goto Win9xArg

@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" @setlocal

@REM -- 4NT shell
if "%eval[2+2]" == "4" goto 4NTArgs

@REM -- Regular WinNT shell
set CMD_LINE_ARGS=%*
goto WinNTGetScriptDir

@REM The 4NT Shell from jp software
:4NTArgs
set CMD_LINE_ARGS=%$
goto WinNTGetScriptDir

:Win9xArg
@REM Slurp the command line arguments.  This loop allows for an unlimited number
@REM of arguments (up to the command line limit, anyway).
set CMD_LINE_ARGS=
:Win9xApp
if %1a==a goto Win9xGetScriptDir
set CMD_LINE_ARGS=%CMD_LINE_ARGS% %1
shift
goto Win9xApp

:Win9xGetScriptDir
set SAVEDIR=%CD%
%0\
cd %0\..\.. 
set BASEDIR=%CD%
cd %SAVEDIR%
set SAVE_DIR=
goto repoSetup

:WinNTGetScriptDir
set BASEDIR=%~dp0\..

:repoSetup


if "%JAVACMD%"=="" set JAVACMD=java

if "%REPO%"=="" set REPO=%BASEDIR%\lib

set CLASSPATH="%BASEDIR%"\conf;"%REPO%"\spring-boot-starter-1.5.9.RELEASE.jar;"%REPO%"\spring-boot-1.5.9.RELEASE.jar;"%REPO%"\spring-boot-autoconfigure-1.5.9.RELEASE.jar;"%REPO%"\spring-boot-starter-logging-1.5.9.RELEASE.jar;"%REPO%"\logback-classic-1.1.11.jar;"%REPO%"\logback-core-1.1.11.jar;"%REPO%"\jcl-over-slf4j-1.7.25.jar;"%REPO%"\jul-to-slf4j-1.7.25.jar;"%REPO%"\log4j-over-slf4j-1.7.25.jar;"%REPO%"\spring-core-4.3.13.RELEASE.jar;"%REPO%"\snakeyaml-1.17.jar;"%REPO%"\spring-context-support-4.3.13.RELEASE.jar;"%REPO%"\spring-beans-4.3.13.RELEASE.jar;"%REPO%"\spring-context-4.3.13.RELEASE.jar;"%REPO%"\spring-expression-4.3.13.RELEASE.jar;"%REPO%"\spring-boot-starter-aop-1.5.9.RELEASE.jar;"%REPO%"\spring-aop-4.3.13.RELEASE.jar;"%REPO%"\aspectjweaver-1.8.13.jar;"%REPO%"\hamcrest-core-1.3.jar;"%REPO%"\quartz-2.3.0.jar;"%REPO%"\c3p0-0.9.5.2.jar;"%REPO%"\mchange-commons-java-0.2.11.jar;"%REPO%"\HikariCP-java6-2.3.13.jar;"%REPO%"\slf4j-api-1.7.25.jar;"%REPO%"\httpcore-4.4.10.jar;"%REPO%"\httpclient-4.5.6.jar;"%REPO%"\commons-io-2.6.jar;"%REPO%"\spring-boot-starter-web-1.5.9.RELEASE.jar;"%REPO%"\spring-boot-starter-tomcat-1.5.9.RELEASE.jar;"%REPO%"\tomcat-embed-core-8.5.23.jar;"%REPO%"\tomcat-annotations-api-8.5.23.jar;"%REPO%"\tomcat-embed-el-8.5.23.jar;"%REPO%"\tomcat-embed-websocket-8.5.23.jar;"%REPO%"\hibernate-validator-5.3.6.Final.jar;"%REPO%"\jboss-logging-3.3.1.Final.jar;"%REPO%"\classmate-1.3.4.jar;"%REPO%"\jackson-databind-2.8.10.jar;"%REPO%"\spring-web-4.3.13.RELEASE.jar;"%REPO%"\spring-webmvc-4.3.13.RELEASE.jar;"%REPO%"\junit-4.12.jar;"%REPO%"\cxf-spring-boot-starter-jaxws-3.2.4.jar;"%REPO%"\cxf-spring-boot-autoconfigure-3.2.4.jar;"%REPO%"\cxf-rt-transports-http-3.2.4.jar;"%REPO%"\cxf-core-3.2.4.jar;"%REPO%"\woodstox-core-5.0.3.jar;"%REPO%"\stax2-api-3.1.4.jar;"%REPO%"\xmlschema-core-2.2.3.jar;"%REPO%"\cxf-rt-frontend-jaxws-3.2.4.jar;"%REPO%"\xml-resolver-1.2.jar;"%REPO%"\asm-5.2.jar;"%REPO%"\cxf-rt-bindings-soap-3.2.4.jar;"%REPO%"\cxf-rt-wsdl-3.2.4.jar;"%REPO%"\wsdl4j-1.6.3.jar;"%REPO%"\cxf-rt-databinding-jaxb-3.2.4.jar;"%REPO%"\cxf-rt-bindings-xml-3.2.4.jar;"%REPO%"\cxf-rt-frontend-simple-3.2.4.jar;"%REPO%"\cxf-rt-ws-addr-3.2.4.jar;"%REPO%"\cxf-rt-ws-policy-3.2.4.jar;"%REPO%"\neethi-3.1.1.jar;"%REPO%"\validation-api-1.1.0.Final.jar;"%REPO%"\mybatis-spring-boot-starter-1.1.1.jar;"%REPO%"\mybatis-spring-boot-autoconfigure-1.1.1.jar;"%REPO%"\mybatis-3.4.0.jar;"%REPO%"\mybatis-spring-1.3.0.jar;"%REPO%"\spring-boot-starter-jdbc-1.5.9.RELEASE.jar;"%REPO%"\tomcat-jdbc-8.5.23.jar;"%REPO%"\tomcat-juli-8.5.23.jar;"%REPO%"\spring-jdbc-4.3.13.RELEASE.jar;"%REPO%"\commons-codec-1.10.jar;"%REPO%"\jstl-1.2.jar;"%REPO%"\mysql-connector-java-8.0.12.jar;"%REPO%"\protobuf-java-2.6.0.jar;"%REPO%"\commons-lang3-3.7.jar;"%REPO%"\mssql-jdbc-6.3.6.jre8-preview.jar;"%REPO%"\dom4j-1.6.1.jar;"%REPO%"\xml-apis-1.4.01.jar;"%REPO%"\spring-boot-devtools-1.5.9.RELEASE.jar;"%REPO%"\commons-lang-2.6.jar;"%REPO%"\fastjson-1.2.45.jar;"%REPO%"\netty-all-4.1.17.Final.jar;"%REPO%"\jna-4.2.2.jar;"%REPO%"\spring-boot-starter-activemq-1.5.9.RELEASE.jar;"%REPO%"\spring-jms-4.3.13.RELEASE.jar;"%REPO%"\spring-messaging-4.3.13.RELEASE.jar;"%REPO%"\spring-tx-4.3.13.RELEASE.jar;"%REPO%"\activemq-broker-5.14.5.jar;"%REPO%"\activemq-client-5.14.5.jar;"%REPO%"\geronimo-jms_1.1_spec-1.1.1.jar;"%REPO%"\hawtbuf-1.11.jar;"%REPO%"\geronimo-j2ee-management_1.1_spec-1.0.1.jar;"%REPO%"\activemq-openwire-legacy-5.14.5.jar;"%REPO%"\jackson-module-parameter-names-2.8.10.jar;"%REPO%"\jackson-core-2.8.10.jar;"%REPO%"\jackson-datatype-jdk8-2.8.10.jar;"%REPO%"\jackson-datatype-jsr310-2.8.10.jar;"%REPO%"\jackson-annotations-2.8.0.jar;"%REPO%"\commons-fileupload-1.3.jar;"%REPO%"\commons-net-2.2.jar;"%REPO%"\jcjserver-0.0.1-SNAPSHOT.jar
set EXTRA_JVM_ARGUMENTS=-Xms128m
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="jcjserver" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" com.jiancangji.Application %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=%ERRORLEVEL%

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@REM If error code is set to 1 then the endlocal was done already in :error.
if %ERROR_CODE% EQU 0 @endlocal


:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
