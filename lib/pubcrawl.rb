class Pubcrawl
  # Tracks my pubcrawl by showing which pub I'm in now 
  # and which pubs I've been to already

  attr_reader :visited_pubs

  def initialize
    @current_pub = nil
    @visited_pubs = []
  end

  def arrive_in_pub(pub)
    @visited_pubs << pub
    @current_pub = pub
  end

  def what_pub_are_we_in?
    @current_pub.name
  end

end

class Pub

  attr_reader :name

  def initialize(pub_name)
    @name = pub_name
  end

end