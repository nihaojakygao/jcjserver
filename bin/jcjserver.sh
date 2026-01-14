#!/bin/sh
# ----------------------------------------------------------------------------
#  Copyright 2001-2006 The Apache Software Foundation.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# ----------------------------------------------------------------------------
#
#   Copyright (c) 2001-2006 The Apache Software Foundation.  All rights
#   reserved.


# resolve links - $0 may be a softlink
PRG="$0"

while [ -h "$PRG" ]; do
  ls=`ls -ld "$PRG"`
  link=`expr "$ls" : '.*-> \(.*\)$'`
  if expr "$link" : '/.*' > /dev/null; then
    PRG="$link"
  else
    PRG=`dirname "$PRG"`/"$link"
  fi
done

PRGDIR=`dirname "$PRG"`
BASEDIR=`cd "$PRGDIR/.." >/dev/null; pwd`



# OS specific support.  $var _must_ be set to either true or false.
cygwin=false;
darwin=false;
case "`uname`" in
  CYGWIN*) cygwin=true ;;
  Darwin*) darwin=true
           if [ -z "$JAVA_VERSION" ] ; then
             JAVA_VERSION="CurrentJDK"
           else
             echo "Using Java version: $JAVA_VERSION"
           fi
           if [ -z "$JAVA_HOME" ] ; then
             JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Versions/${JAVA_VERSION}/Home
           fi
           ;;
esac

if [ -z "$JAVA_HOME" ] ; then
  if [ -r /etc/gentoo-release ] ; then
    JAVA_HOME=`java-config --jre-home`
  fi
fi

# For Cygwin, ensure paths are in UNIX format before anything is touched
if $cygwin ; then
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --unix "$JAVA_HOME"`
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --unix "$CLASSPATH"`
fi

# If a specific java binary isn't specified search for the standard 'java' binary
if [ -z "$JAVACMD" ] ; then
  if [ -n "$JAVA_HOME"  ] ; then
    if [ -x "$JAVA_HOME/jre/sh/java" ] ; then
      # IBM's JDK on AIX uses strange locations for the executables
      JAVACMD="$JAVA_HOME/jre/sh/java"
    else
      JAVACMD="$JAVA_HOME/bin/java"
    fi
  else
    JAVACMD=`which java`
  fi
fi

if [ ! -x "$JAVACMD" ] ; then
  echo "Error: JAVA_HOME is not defined correctly." 1>&2
  echo "  We cannot execute $JAVACMD" 1>&2
  exit 1
fi

if [ -z "$REPO" ]
then
  REPO="$BASEDIR"/lib
fi

CLASSPATH=$CLASSPATH_PREFIX:"$BASEDIR"/conf:"$REPO"/spring-boot-starter-1.5.9.RELEASE.jar:"$REPO"/spring-boot-1.5.9.RELEASE.jar:"$REPO"/spring-boot-autoconfigure-1.5.9.RELEASE.jar:"$REPO"/spring-boot-starter-logging-1.5.9.RELEASE.jar:"$REPO"/logback-classic-1.1.11.jar:"$REPO"/logback-core-1.1.11.jar:"$REPO"/jcl-over-slf4j-1.7.25.jar:"$REPO"/jul-to-slf4j-1.7.25.jar:"$REPO"/log4j-over-slf4j-1.7.25.jar:"$REPO"/spring-core-4.3.13.RELEASE.jar:"$REPO"/snakeyaml-1.17.jar:"$REPO"/spring-context-support-4.3.13.RELEASE.jar:"$REPO"/spring-beans-4.3.13.RELEASE.jar:"$REPO"/spring-context-4.3.13.RELEASE.jar:"$REPO"/spring-expression-4.3.13.RELEASE.jar:"$REPO"/spring-boot-starter-aop-1.5.9.RELEASE.jar:"$REPO"/spring-aop-4.3.13.RELEASE.jar:"$REPO"/aspectjweaver-1.8.13.jar:"$REPO"/hamcrest-core-1.3.jar:"$REPO"/quartz-2.3.0.jar:"$REPO"/c3p0-0.9.5.2.jar:"$REPO"/mchange-commons-java-0.2.11.jar:"$REPO"/HikariCP-java6-2.3.13.jar:"$REPO"/slf4j-api-1.7.25.jar:"$REPO"/httpcore-4.4.10.jar:"$REPO"/httpclient-4.5.6.jar:"$REPO"/commons-io-2.6.jar:"$REPO"/spring-boot-starter-web-1.5.9.RELEASE.jar:"$REPO"/spring-boot-starter-tomcat-1.5.9.RELEASE.jar:"$REPO"/tomcat-embed-core-8.5.23.jar:"$REPO"/tomcat-annotations-api-8.5.23.jar:"$REPO"/tomcat-embed-el-8.5.23.jar:"$REPO"/tomcat-embed-websocket-8.5.23.jar:"$REPO"/hibernate-validator-5.3.6.Final.jar:"$REPO"/jboss-logging-3.3.1.Final.jar:"$REPO"/classmate-1.3.4.jar:"$REPO"/jackson-databind-2.8.10.jar:"$REPO"/spring-web-4.3.13.RELEASE.jar:"$REPO"/spring-webmvc-4.3.13.RELEASE.jar:"$REPO"/junit-4.12.jar:"$REPO"/cxf-spring-boot-starter-jaxws-3.2.4.jar:"$REPO"/cxf-spring-boot-autoconfigure-3.2.4.jar:"$REPO"/cxf-rt-transports-http-3.2.4.jar:"$REPO"/cxf-core-3.2.4.jar:"$REPO"/woodstox-core-5.0.3.jar:"$REPO"/stax2-api-3.1.4.jar:"$REPO"/xmlschema-core-2.2.3.jar:"$REPO"/cxf-rt-frontend-jaxws-3.2.4.jar:"$REPO"/xml-resolver-1.2.jar:"$REPO"/asm-5.2.jar:"$REPO"/cxf-rt-bindings-soap-3.2.4.jar:"$REPO"/cxf-rt-wsdl-3.2.4.jar:"$REPO"/wsdl4j-1.6.3.jar:"$REPO"/cxf-rt-databinding-jaxb-3.2.4.jar:"$REPO"/cxf-rt-bindings-xml-3.2.4.jar:"$REPO"/cxf-rt-frontend-simple-3.2.4.jar:"$REPO"/cxf-rt-ws-addr-3.2.4.jar:"$REPO"/cxf-rt-ws-policy-3.2.4.jar:"$REPO"/neethi-3.1.1.jar:"$REPO"/validation-api-1.1.0.Final.jar:"$REPO"/mybatis-spring-boot-starter-1.1.1.jar:"$REPO"/mybatis-spring-boot-autoconfigure-1.1.1.jar:"$REPO"/mybatis-3.4.0.jar:"$REPO"/mybatis-spring-1.3.0.jar:"$REPO"/spring-boot-starter-jdbc-1.5.9.RELEASE.jar:"$REPO"/tomcat-jdbc-8.5.23.jar:"$REPO"/tomcat-juli-8.5.23.jar:"$REPO"/spring-jdbc-4.3.13.RELEASE.jar:"$REPO"/commons-codec-1.10.jar:"$REPO"/jstl-1.2.jar:"$REPO"/mysql-connector-java-8.0.12.jar:"$REPO"/protobuf-java-2.6.0.jar:"$REPO"/commons-lang3-3.7.jar:"$REPO"/mssql-jdbc-6.3.6.jre8-preview.jar:"$REPO"/dom4j-1.6.1.jar:"$REPO"/xml-apis-1.4.01.jar:"$REPO"/spring-boot-devtools-1.5.9.RELEASE.jar:"$REPO"/commons-lang-2.6.jar:"$REPO"/fastjson-1.2.45.jar:"$REPO"/netty-all-4.1.17.Final.jar:"$REPO"/jna-4.2.2.jar:"$REPO"/spring-boot-starter-activemq-1.5.9.RELEASE.jar:"$REPO"/spring-jms-4.3.13.RELEASE.jar:"$REPO"/spring-messaging-4.3.13.RELEASE.jar:"$REPO"/spring-tx-4.3.13.RELEASE.jar:"$REPO"/activemq-broker-5.14.5.jar:"$REPO"/activemq-client-5.14.5.jar:"$REPO"/geronimo-jms_1.1_spec-1.1.1.jar:"$REPO"/hawtbuf-1.11.jar:"$REPO"/geronimo-j2ee-management_1.1_spec-1.0.1.jar:"$REPO"/activemq-openwire-legacy-5.14.5.jar:"$REPO"/jackson-module-parameter-names-2.8.10.jar:"$REPO"/jackson-core-2.8.10.jar:"$REPO"/jackson-datatype-jdk8-2.8.10.jar:"$REPO"/jackson-datatype-jsr310-2.8.10.jar:"$REPO"/jackson-annotations-2.8.0.jar:"$REPO"/commons-fileupload-1.3.jar:"$REPO"/commons-net-2.2.jar:"$REPO"/jcjserver-0.0.1-SNAPSHOT.jar
EXTRA_JVM_ARGUMENTS="-Xms128m"

# For Cygwin, switch paths to Windows format before running java
if $cygwin; then
  [ -n "$CLASSPATH" ] && CLASSPATH=`cygpath --path --windows "$CLASSPATH"`
  [ -n "$JAVA_HOME" ] && JAVA_HOME=`cygpath --path --windows "$JAVA_HOME"`
  [ -n "$HOME" ] && HOME=`cygpath --path --windows "$HOME"`
  [ -n "$BASEDIR" ] && BASEDIR=`cygpath --path --windows "$BASEDIR"`
  [ -n "$REPO" ] && REPO=`cygpath --path --windows "$REPO"`
fi

exec "$JAVACMD" $JAVA_OPTS \
  $EXTRA_JVM_ARGUMENTS \
  -classpath "$CLASSPATH" \
  -Dapp.name="jcjserver" \
  -Dapp.pid="$$" \
  -Dapp.repo="$REPO" \
  -Dapp.home="$BASEDIR" \
  -Dbasedir="$BASEDIR" \
  com.jiancangji.Application \
  "$@"
