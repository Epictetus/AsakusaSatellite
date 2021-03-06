# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/../../../../../spec/spec_helper'
require 'auto_link'

describe AsakusaSatellite::Filter::AutoLink do
  before do
    @filter = AsakusaSatellite::Filter::AutoLink.new({})
  end

  it 'URLにリンクを貼る' do
    @filter.process('http://example.com').should == '<a target="_blank" href="http://example.com">http://example.com</a>'
  end

  it "httpsについても動作する" do
    @filter.process('https://example.com').should == '<a target="_blank" href="https://example.com">https://example.com</a>'
  end

  it "前後に文字があっても動作する" do
    @filter.process('ほげhttp://example.comほげ').should == 'ほげ<a target="_blank" href="http://example.com">http://example.com</a>ほげ'
    @filter.process('ほげhttp://example.com/abcほげ').should == 'ほげ<a target="_blank" href="http://example.com/abc">http://example.com/abc</a>ほげ'
  end

  it 'twitpicを展開する' do
    @filter.process('http://twitpic.com/3gy2dn').should == '<a target="_blank" href="http://twitpic.com/3gy2dn" class="expand-image"><img src="http://twitpic.com/show/thumb/3gy2dn" /></a>'
  end
end
