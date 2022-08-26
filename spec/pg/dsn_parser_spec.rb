describe PG::DSNParser do
  describe ".parse" do
    it "parses a dsn using #parse" do
      s = "host = localhost dbname=postgres user = 'postgres'"
      expect(described_class.parse(s)).to eq(:host => "localhost", :dbname => "postgres", :user => "postgres")
    end
  end

  describe "#parse" do
    it "no spaces, no quotes" do
      s = "host=localhost"
      expect(subject.parse(s)).to eq(:host => "localhost")
    end

    it "spaces, no quotes" do
      s = "host = localhost"
      expect(subject.parse(s)).to eq(:host => "localhost")
    end

    it "no spaces, quotes" do
      s = "host='localhost'"
      expect(subject.parse(s)).to eq(:host => "localhost")
    end

    it "spaces, quotes" do
      s = "host = 'localhost'"
      expect(subject.parse(s)).to eq(:host => "localhost")
    end

    it "spaces, quotes, space in value" do
      s = "password = 'pass word'"
      expect(subject.parse(s)).to eq(:password => "pass word")
    end

    it "leading space before key" do
      s = " password = 'pass word'"
      expect(subject.parse(s)).to eq(:password => "pass word")
    end

    it "multiple space around equals" do
      s = "host =  localhost"
      expect(subject.parse(s)).to eq(:host => "localhost")
    end

    it "multiple space around equals for second value" do
      s = "host = localhost dbname =  vmdb_test"
      expect(subject.parse(s)).to eq(:host => "localhost", :dbname => 'vmdb_test')
    end

    it "spaces, quotes, quote in value" do
      s = "password = 'pass\\'sword\\''"
      expect(subject.parse(s)).to eq(:password => "pass'sword'")
    end

    it "full dsn quoted" do
      s = "dbname = 'vmdb\\'s_test' host='example.com' user = 'root' port='' password='p=as\\' s\\''"
      expected = {
        :dbname   => "vmdb's_test",
        :host     => "example.com",
        :user     => "root",
        :port     => "",
        :password => "p=as' s'"
      }
      expect(subject.parse(s)).to eq(expected)
    end

    it "full dsn unquoted" do
      s = "dbname = vmdb\\'s_test host=example.com user = root password=p=as\\'s\\'"
      expected = {
        :dbname   => "vmdb's_test",
        :host     => "example.com",
        :user     => "root",
        :password => "p=as's'"
      }
      expect(subject.parse(s)).to eq(expected)
    end

    it "mixed quoted and unquoted" do
      s = "dbname = vmdb\\'s_test host=example.com user = 'root' port='' password='p=as\\' s\\''"
      expected = {
        :dbname   => "vmdb's_test",
        :host     => "example.com",
        :user     => "root",
        :port     => "",
        :password => "p=as' s'"
      }
      expect(subject.parse(s)).to eq(expected)
    end

    it "= with spaces" do
      s = "dbname=vmdb_test host=example.com password='pass = word'"
      expected = {
        :dbname   => "vmdb_test",
        :host     => "example.com",
        :password => "pass = word"
      }
      expect(subject.parse(s)).to eq(expected)
    end

    it "leading single quote" do
      s = "dbname=vmdb_test host=example.com password='\\'password'"
      expected = {
        :dbname   => "vmdb_test",
        :host     => "example.com",
        :password => "'password"
      }
      expect(subject.parse(s)).to eq(expected)
    end

    it "single quote after =" do
      s = "dbname=vmdb_test host=example.com password='pass =\\' word'"
      expected = {
        :dbname   => "vmdb_test",
        :host     => "example.com",
        :password => "pass =' word"
      }
      expect(subject.parse(s)).to eq(expected)
    end
  end
end
