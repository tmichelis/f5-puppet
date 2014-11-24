require 'spec_helper_acceptance'

describe 'f5_monitor external provider' do
  it 'creates a basic monitor called my_external' do
    pp=<<-EOS
    f5_monitor { '/Common/my_external':
      ensure   => 'present',
      provider => 'external',
    }
    EOS
    make_site_pp(pp)
    run_device(:allow_changes => true)
    run_device(:allow_changes => false)
  end
end
