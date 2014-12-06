require "aws"
require "yaml"

if ARGV.length < 2
  puts "Usage: ruby #{$PROGRAM_NAME} key value"
  puts
  puts "This program writes data to Amazon S3."
  puts "You can access to wrote data following url:"
  puts "http://s3-ap-northeast-1.amazonaws.com/training-aws-sdk/:key"
  exit false
end

key = ARGV[0]
value = ARGV[1]

config = YAML.load_file("config/aws.yml")
AWS.config(config["development"])

s3 = AWS::S3.new
bucket = s3.buckets["training-aws-sdk"]
obj = bucket.objects[key]
obj.write(value, acl: :public_read)
