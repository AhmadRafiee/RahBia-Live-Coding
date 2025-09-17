# create bucket
mc mb rahbia/multirepo-voting-app-backup

# create user
mc admin user add rahbia multirepo-voting-backup-check <PASSWORD>
mc admin user add rahbia multirepo-voting-backup-create <PASSWORD>
mc admin user list rahbia

# create policy
mc admin policy create rahbia multirepo-voting-backup-check ./minio/check-backup-policy.json
mc admin policy create rahbia multirepo-voting-backup-create ./minio/create-backup-policy.json
mc admin policy list rahbia 

# attach policy to user 
mc admin policy attach rahbia multirepo-voting-backup-check --user multirepo-voting-backup-check
mc admin policy attach rahbia multirepo-voting-backup-create --user multirepo-voting-backup-create
mc admin user list rahbia