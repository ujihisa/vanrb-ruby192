rule '.html' => ['.md'] do |t|
  sh "pandoc -w slidy -s --from=markdown #{t.source} --offline > #{t.name}"
  f = File.read t.name
  File.open t.name, 'w' do |io|
    io.write f.sub(
      %r|<style type="text/css">|m,
      '\0em{color: red}')
  end
end

desc 'build html from markdown with pandoc'
task :build => ['slides.html']

desc 'and open the file on your browser'
task :default => [:build] do
  sh 'open slides.html'
end
