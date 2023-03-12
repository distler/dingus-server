require 'maruku'
require 'maruku/ext/math'
require 'itex_stringsupport'
require 'json'

class ApplicationController < ActionController::Metal
include ActionController::Instrumentation

  def json
    if params['text']
      if params['text'].length < 1000
        s =  parse(params['text'])
      else
        s = '<p>Error: text too long. Try something shorter.</p>'
      end
    else
      s = '<p>You must supply a <code>text</code> parameter.</p>'
    end
    self.content_type = 'application/json'
    self.response_body = {'name' => parser_name, 'version' => parser_version, 'html' => s}.to_json
  end

private

  def parse(text)
    # This bullet-proofing is for robustness, and is probably unnecessary.
    str = text.purify.delete("\r").to_utf8
    
    Maruku.new(str, {:math_enabled => true, :math_numbered => ['\\[','\\begin{equation}']}).to_html
  end
  
  def parser_name
    'Maruku (Math-Enabled)'
  end
  
  def parser_version
    MaRuKu::VERSION
  end

end
