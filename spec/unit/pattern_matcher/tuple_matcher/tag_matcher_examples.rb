RSpec.shared_examples "tag matcher" do
  let( :not_tag ){ "not_#{tag}".to_sym }

  it { expect( tag_matcher === 42 ).to eq(false)  }
  it { expect( tag_matcher === [tag, 42] ).to eq(true)  }
  it { expect( tag_matcher === [not_tag, 42] ).to eq(false)  }
  it "has a value if matching" do
    tag_matcher === [tag, 42]
    expect( tag_matcher.value ).to eq(42)
  end
  it "has no value unless matching" do
    tag_matcher === [not_tag, 42]
    expect( tag_matcher.value ).to be_nil
  end
  it "has no error" do
    tag_matcher === [not_tag, 42]
    expect( tag_matcher.error ).to be_nil
  end
  it "has no error unless the protocol is not respected" do
    tag_matcher === [42]
    expect( tag_matcher.value ).to be_nil
    expect( tag_matcher.error ).to eq({:error_type=>Lab42::PatternMatcher::ProtocolError, :violating_value=>[42]})
  end
end


