# Allow the metal piece to run in isolation
require(File.dirname(__FILE__) + "/../../config/environment") unless defined?(Rails)

class UploadHandler
  def self.call(env)
    if env["PATH_INFO"] =~ /^\/upload_handler/
      request = Rack::Request.new(env)
      params = request.params


      name, data = params["Filename"], params["Filedata"][:tempfile]
      File.open("tmp/uploads/#{Time.now.to_f}.#{name}", "w") do |f|
        f.write(data.read)
      end
      [200, {"Content-Type" => "text/html"}, ["success"]]
    else
      [404, {"Content-Type" => "text/html"}, ["Not Found"]]
    end
  end
end
