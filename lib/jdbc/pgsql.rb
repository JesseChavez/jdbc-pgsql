warn 'jdbc-pgsql must be used with JRuby only' unless defined? JRUBY_VERSION

require 'jdbc/pgsql/version'

module Jdbc
  module Pgsql
    JAVA_VERSIONS = {
      '1.8' => 8,
      '9' => 9,
      '10' => 9,
      '11' => 11
    }.freeze

    JAVA_DRIVER_VERSIONS = {
      '1.8' => '42.2.5',
      '9' => '42.2.5',
      '10' => '42.2.5',
      '11' => '42.2.5'
    }.freeze

    def self.java_specification_version
      ENV_JAVA['java.specification.version']
    end

    def self.jre_version
      JAVA_VERSIONS[java_specification_version]
    end

    def self.driver_version
      JAVA_DRIVER_VERSIONS[java_specification_version]
    end

    def self.jar_file
      "postgresql-#{driver_version}.jar"
    end

    def self.load_driver
      warn 'loading JDBC driver on require "jdbc/pgsql"' if $VERBOSE

      raise 'No JDBC driver for your java version' if jre_version.nil? || driver_version.nil?

      require jar_file
    end

    load_driver
  end
end
