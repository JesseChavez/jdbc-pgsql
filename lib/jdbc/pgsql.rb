warn 'jdbc-pgsql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/pgsql/version'

module Jdbc
  module Pgsql
    def self.java_specification_version
      ENV_JAVA['java.specification.version']
    end

    def self.jre_version
      java_specification_version.split('.').last.to_i
    end

    def self.driver_version
      "42.7.4"
    end

    def self.jar_file
      "postgresql-#{driver_version}.jar"
    end

    def self.driver_name
      'org.postgresql.Driver'
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/pgsql"' if $VERBOSE

      raise 'No JDBC driver for your java version' unless jre_version > 7

      require jar_file
    end

    load_driver
  end
end
