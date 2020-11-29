RSpec.describe Jdbc::Pgsql do
  java_versions = ['1.8'] + ('9'..'15').to_a

  it 'has a version number' do
    expect(Jdbc::Pgsql::VERSION).not_to be nil
  end

  context '.jre_version' do
    it 'should return current jre_version' do
      expect(ENV_JAVA['java.specification.version']).to include(Jdbc::Pgsql.jre_version.to_s)
    end
  end

  context '.jar_file' do
    it "should exist driver jar file" do
      jar_file = Jdbc::Pgsql.jar_file

      expect(File.exist?("./lib/#{jar_file}")).to eq(true)
    end
  end

  context '.driver_version' do
    it 'should not load driver when jre_version is nil' do
      driver = org.postgresql.Driver.new
      major = driver.get_major_version
      minor = driver.get_minor_version

      expect(Jdbc::Pgsql.driver_version).to include("#{major}.#{minor}")
    end
  end

  context '.load_driver' do
    it 'should not load driver when java is 6' do
      allow(Jdbc::Pgsql).to receive(:java_specification_version).and_return('1.7')

      expect { Jdbc::Pgsql.load_driver }.to raise_error(RuntimeError)
    end

    it 'should not load driver when java is 7' do
      allow(Jdbc::Pgsql).to receive(:java_specification_version).and_return('1.7')

      expect { Jdbc::Pgsql.load_driver }.to raise_error(RuntimeError)
    end

    java_versions.each do |java_version|
      it "should load driver when java version is #{java_version}" do
        allow(Jdbc::Pgsql).to receive(:java_specification_version).and_return(java_version)

        expect { Jdbc::Pgsql.load_driver }.not_to raise_error
      end
    end

    it 'should return false for loading driver again for current jre' do
      expect(Jdbc::Pgsql.load_driver).to eq(false)
    end
  end
  # specs ends here
end
