@REM ----------------------------------------------------------------------------
@REM Copyright 2001-2004 The Apache Software Foundation.
@REM
@REM Licensed under the Apache License, Version 2.0 (the "License");
@REM you may not use this file except in compliance with the License.
@REM You may obtain a copy of the License at
@REM
@REM      http://www.apache.org/licenses/LICENSE-2.0
@REM
@REM Unless required by applicable law or agreed to in writing, software
@REM distributed under the License is distributed on an "AS IS" BASIS,
@REM WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
@REM See the License for the specific language governing permissions and
@REM limitations under the License.
@REM ----------------------------------------------------------------------------
@REM

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

if "%REPO%"=="" set REPO=%BASEDIR%\repo

set CLASSPATH="%BASEDIR%"\etc;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-core\8.0.28\tomcat-embed-core-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-logging-juli\8.0.28\tomcat-embed-logging-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-jasper\8.0.28\tomcat-embed-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\embed\tomcat-embed-el\8.0.28\tomcat-embed-el-8.0.28.jar;"%REPO%"\org\eclipse\jdt\core\compiler\ecj\4.4.2\ecj-4.4.2.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper\8.0.28\tomcat-jasper-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-servlet-api\8.0.28\tomcat-servlet-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-juli\8.0.28\tomcat-juli-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-el-api\8.0.28\tomcat-el-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-api\8.0.28\tomcat-api-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util-scan\8.0.28\tomcat-util-scan-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-util\8.0.28\tomcat-util-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jasper-el\8.0.28\tomcat-jasper-el-8.0.28.jar;"%REPO%"\org\apache\tomcat\tomcat-jsp-api\8.0.28\tomcat-jsp-api-8.0.28.jar;"%REPO%"\com\google\guava\guava\19.0\guava-19.0.jar;"%REPO%"\com\google\gdata\core\1.47.1\core-1.47.1.jar;"%REPO%"\com\google\oauth-client\google-oauth-client-jetty\1.11.0-beta\google-oauth-client-jetty-1.11.0-beta.jar;"%REPO%"\com\google\oauth-client\google-oauth-client-java6\1.11.0-beta\google-oauth-client-java6-1.11.0-beta.jar;"%REPO%"\com\google\oauth-client\google-oauth-client\1.11.0-beta\google-oauth-client-1.11.0-beta.jar;"%REPO%"\com\google\http-client\google-http-client\1.11.0-beta\google-http-client-1.11.0-beta.jar;"%REPO%"\org\apache\httpcomponents\httpclient\4.0.3\httpclient-4.0.3.jar;"%REPO%"\commons-logging\commons-logging\1.1.1\commons-logging-1.1.1.jar;"%REPO%"\xpp3\xpp3\1.1.4c\xpp3-1.1.4c.jar;"%REPO%"\org\mortbay\jetty\jetty\6.1.26\jetty-6.1.26.jar;"%REPO%"\org\mortbay\jetty\jetty-util\6.1.26\jetty-util-6.1.26.jar;"%REPO%"\org\mortbay\jetty\servlet-api\2.5-20081211\servlet-api-2.5-20081211.jar;"%REPO%"\com\google\code\findbugs\jsr305\1.3.7\jsr305-1.3.7.jar;"%REPO%"\javax\mail\mail\1.4\mail-1.4.jar;"%REPO%"\javax\activation\activation\1.1\activation-1.1.jar;"%REPO%"\com\github\jsimone\webapp-runner\8.0.30.1\webapp-runner-8.0.30.1.jar;"%REPO%"\com\github\jkutner\tomcat-redis-session\8.0.18.0\tomcat-redis-session-8.0.18.0.jar;"%REPO%"\redis\clients\jedis\2.6.2\jedis-2.6.2.jar;"%REPO%"\org\apache\commons\commons-pool2\2.3\commons-pool2-2.3.jar;"%REPO%"\com\beust\jcommander\1.27\jcommander-1.27.jar;"%REPO%"\commons-io\commons-io\2.3\commons-io-2.3.jar;"%REPO%"\de\javakaffee\msm\memcached-session-manager-tc8\1.8.3\memcached-session-manager-tc8-1.8.3.jar;"%REPO%"\de\javakaffee\msm\memcached-session-manager\1.8.3\memcached-session-manager-1.8.3.jar;"%REPO%"\net\spy\spymemcached\2.11.1\spymemcached-2.11.1.jar;"%REPO%"\com\couchbase\client\couchbase-client\1.4.0\couchbase-client-1.4.0.jar;"%REPO%"\io\netty\netty\3.5.5.Final\netty-3.5.5.Final.jar;"%REPO%"\org\codehaus\jettison\jettison\1.1\jettison-1.1.jar;"%REPO%"\stax\stax-api\1.0.1\stax-api-1.0.1.jar;"%REPO%"\commons-codec\commons-codec\1.5\commons-codec-1.5.jar;"%REPO%"\org\apache\httpcomponents\httpcore\4.3\httpcore-4.3.jar;"%REPO%"\org\apache\httpcomponents\httpcore-nio\4.3\httpcore-nio-4.3.jar;"%REPO%"\com\google\code\findbugs\annotations\1.3.9\annotations-1.3.9.jar;"%REPO%"\com\mycompany\attMaven\1.0-SNAPSHOT\attMaven-1.0-SNAPSHOT.war
set EXTRA_JVM_ARGUMENTS=
goto endInit

@REM Reaching here means variables are defined and arguments have been captured
:endInit

%JAVACMD% %JAVA_OPTS% %EXTRA_JVM_ARGUMENTS% -classpath %CLASSPATH_PREFIX%;%CLASSPATH% -Dapp.name="webapp" -Dapp.repo="%REPO%" -Dbasedir="%BASEDIR%" launch.Main %CMD_LINE_ARGS%
if ERRORLEVEL 1 goto error
goto end

:error
if "%OS%"=="Windows_NT" @endlocal
set ERROR_CODE=1

:end
@REM set local scope for the variables with windows NT shell
if "%OS%"=="Windows_NT" goto endNT

@REM For old DOS remove the set variables from ENV - we assume they were not set
@REM before we started - at least we don't leave any baggage around
set CMD_LINE_ARGS=
goto postExec

:endNT
@endlocal

:postExec

if "%FORCE_EXIT_ON_ERROR%" == "on" (
  if %ERROR_CODE% NEQ 0 exit %ERROR_CODE%
)

exit /B %ERROR_CODE%
