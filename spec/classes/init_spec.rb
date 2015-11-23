require 'spec_helper'
describe 'omnisession' do

  context 'with defaults for all parameters' do
    it { should contain_class('omnisession') }
  end
end
