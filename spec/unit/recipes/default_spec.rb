require 'chefspec'

describe 'codegolf::default' do
  let(:chef_run) { ChefSpec::Runner.new do |node|
      node.set['lsb']['codename'] = 'ubuntu'
    end.converge(described_recipe)
  }

  before :each do
    stub_command("pgrep postgres").and_return(nil)
    stub_command("test -f /var/lib/postgresql/9.3/main/PG_VERSION").and_return(nil)
  end

  # it 'install monit package' do
  #   expect(chef_run).to install_package('monit')
  # end

  # it 'enable monit service' do
  #   expect(chef_run).to enable_service('monit')
  # end

  it { expect(chef_run).to create_user('golfer') }

  it 'create direcory for custom services' do
    expect(chef_run).to create_directory('/codegolf').with(
      user:   'vagrant',
      group:  'vagrant'
    )
  end

  it 'create main monit config' do
    expect(chef_run).to create_template('/home/golfer/.ssh/authorized_keys')
  end

  it 'uses the rbenv cookbook' do
    expect(chef_run).to include_recipe('rbenv::default')
    expect(chef_run).to include_recipe('rbenv::ruby_build')
  end

  it 'should add users to rbenv group' do
    expect(chef_run).to create_group('rbenv').with(members: ['vagrant', 'golfer'])
  end

  it 'uses the rbenv cookbook' do
    expect(chef_run).to include_recipe('postgresql::server')
    expect(chef_run).to include_recipe('postgresql::libpq')
  end

  it 'enable postgres service' do
    expect(chef_run).to enable_service('postgresql')
  end
end
