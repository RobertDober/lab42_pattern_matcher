require 'spec_helper'
require_relative 'tag_matcher_examples'

RSpec.describe Lab42::PatternMatcher::TupleMatcher do

  let( :subject ){ described_class.new }

  context "tag do" do
    let( :tag_matcher ){ described_class.new }
    it "cannot match without a tag" do
      expect{ tag_matcher === 42  }.to raise_error(RuntimeError, %r{@tag not defined, cannot match}) 
    end
  end

  context ":ok matchers" do
    let( :tag )    { :ok }

    context "explicit" do
      let( :tag_matcher ){ described_class.new(:ok) }
      include_examples "tag matcher"
    end
    context "set" do
      let( :tag_matcher ){ subject.set_tag(:ok) }
      include_examples "tag matcher"
    end
    context "query" do
      let( :tag_matcher ){ subject.ok? }
      include_examples "tag matcher"
    end
  end

  context ":error matchers" do
    let( :tag )    { :error }

    context "explicit" do
      let( :tag_matcher ){ described_class.new(:error) }
      include_examples "tag matcher"
    end
  end
end

