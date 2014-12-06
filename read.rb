require "aws"
require "yaml"

if ARGV.length < 1
  puts "Usage: ruby #{$PROGRAM_NAME} key"
  puts
  puts "This program reads data from Amazon S3."
  exit false
end

key = ARGV[0]

config = YAML.load_file("config/aws.yml")
AWS.config(config["development"])

s3 = AWS::S3.new
bucket = s3.buckets["training-aws-sdk"]
obj = bucket.objects[key]
puts obj.read
