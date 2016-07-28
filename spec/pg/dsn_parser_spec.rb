describe PG::DSNParser do
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
      s = "host = 'local host'"
      expect(subject.parse(s)).to eq(:host => "local host")
    end

    it "spaces, quotes, quote in value" do
      s = "host = 'local\\'shost\\''"
      expect(subject.parse(s)).to eq(:host => "local'shost'")
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
