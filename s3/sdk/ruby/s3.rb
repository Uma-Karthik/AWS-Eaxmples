require 'aws-sdk-s3'      # Loads the AWS SDK library for Amazon S3.
require 'securerandom'    # Loads the SecureRandom library to generate UUIDs.

bucket_name = ENV['BUCKET_NAME']   # Reads the S3 bucket name from the environment variable.
region = 'us-east-1'               # Specifies the AWS region.

puts bucket_name                   # Prints the bucket name to the console.

client = Aws::S3::Client.new(      # Creates an S3 client object.
  region: region                   # Configures the client to use the specified AWS region.
)

client.create_bucket(              # Creates a new S3 bucket.
  bucket: bucket_name              # Specifies the bucket name.
)

Dir.mkdir("tmp") unless Dir.exist?("tmp")   # Creates the 'tmp' directory if it doesn't already exist.

number_of_files = 1 + rand(6)      # Generates a random number between 1 and 6.

puts "number_of_files: #{number_of_files}"  # Prints the number of files to be created.

number_of_files.times do |i|       # Loops once for each file.

  puts "i: #{i}"                   # Prints the current loop number.

  filename = "file_#{i}.txt"       # Creates a filename (e.g., file_0.txt).
  output_path = "tmp/#{filename}"  # Creates the local file path.

  File.open(output_path, "w") do |f|   # Opens the file in write mode.
    f.write(SecureRandom.uuid)         # Writes a random UUID into the file.
  end

  File.open(output_path, "rb") do |f|  # Opens the file in binary read mode.

    client.put_object(                 # Uploads the file to the S3 bucket.
      bucket: bucket_name,             # Destination S3 bucket.
      key: filename,                   # Object name in S3.
      body: f                          # File content to upload.
    )
  end

end                                   # Ends the loop.