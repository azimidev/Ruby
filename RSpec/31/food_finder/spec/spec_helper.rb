# The spec_helper file is the place for loading up any code needed 
# by all tests (especially the code being targeted by the tests).

require 'guide'

# Set the application root for easy reference.
APP_ROOT = File.expand_path('../..', __FILE__)


def no_output(&block)
  original_stdout = $stdout.dup
  $stdout.reopen('/dev/null')
  $stdout.sync = true
  begin
    yield
  ensure
    $stdout.reopen(original_stdout)
  end
end

def capture_output(&block)
  original_stdout = $stdout.dup
  output_catcher = StringIO.new
  $stdout = output_catcher
  begin
    yield
  ensure
    $stdout = original_stdout
  end
  output_catcher.string
end

def setup_fake_input(*args)
  allow(Readline).to receive(:readline).and_return(*args)
end

# clean up by deleting created files
def remove_created_file(file_path)
  if file_path && File.exists?(file_path)
    File.delete(file_path)
  end
end

