require "pubcrawl"

describe Pubcrawl do

  #--------------------------------------
  # PASSING A DOUBLE
  #--------------------------------------

  let(:pub_var) { double "pub" }

  describe "#arrive_in_pub" do
    it "adds the new pub to the @visited_pubs array" do
      check_this_works  Pub.new("Swan and Tomato") # This is want we don't want to include
      check_this_works  (double "Swan and Tomato")
      check_this_works  (double "test_pub")
      check_this_works  :pub_var
      check_this_works  pub_var
    end

    def check_this_works(test_pub)
      expect { subject.arrive_in_pub(test_pub) }.to change { subject.visited_pubs.count }.by(1)
    end
  end

  #--------------------------------------
  # PASSING A DOUBLE WITH BEHAVIOUR
  #--------------------------------------

  let(:pub_var_2) { double(:pub, :name => "The Oval Tavern") }

  describe "#what_pub_are_we_in?" do
    it "returns the name of the pub you're in" do
      allow(pub_var).to receive(:name).and_return("The Oval Tavern")
      check_this_works  Pub.new("The Oval Tavern")
      check_this_works  pub_var # This is the same variable used in the arrive_in_pub test
      check_this_works  pub_var_2
      check_this_works  double("another_pub", :name => "The Oval Tavern")
    end

    def check_this_works(test_pub)
      subject.arrive_in_pub(test_pub)
      expect(subject.what_pub_are_we_in?).to eq "The Oval Tavern"
    end
  end

  # Note: pub_var.class == RSpec::Mocks::Double

end
