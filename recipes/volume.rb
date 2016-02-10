directory '/var/downloads/updates' do
    mode '0755'
end

include_recipe 'aws'

aws_ebs_volume 'downloads_volume' do
    size 300
    device '/dev/sdf'
    volume_type 'gp2'
    snapshots_to_keep 0
    description 'local repo downloads directory'
    action [ :create, :attach ]
    only_if { node['cloud'] }
end

mkfs_device '/dev/xvdf' do
    device '/dev/xvdf'
    fs_type 'ext4'
    only_if { node['cloud'] }
end

mount '/var/downloads/updates' do
    device '/dev/xvdf'
    action [ :mount, :enable ]
    not_if 'cat /proc/mounts | grep /var/downloads/uplodas'
end
