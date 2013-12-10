require 'spec_helper'

describe ArticleHelper do
  it "has a per_page helper" do
    expect(helper.per_page_options).to match_array([["10 per page", '10'], ["25 per page", '25'], ["50 per page", '50'], ["100 per page", '100']])
  end
end
