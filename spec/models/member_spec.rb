require 'spec_helper'

describe Member do
  # ActiveGroonga $B$NI>2A$N$?$aHs>o$K4pK\E*$J(Bspec
  describe "$B%a%C%;!<%8$rEPO?$7$?$i(B" do
    before do
      @body = '$B$3$l$OK\J8$G$9(B'
      @message = Message.new(:body => @body)
      @message.save
    end

    it "$BK\J8$r<hF@$G$-$k(B(trivial)" do
      @message.body.should = @body
    end
  end
end
