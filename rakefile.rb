desc 'flash the ergodox'
task :flash do
  sh "teensy_loader_cli -mmcu=atmega32u4 -v -w keyboard/ergodox/ergodox_lufa.hex"
end

desc 'build for ergodox'
task :build do
  cd 'keyboard/ergodox' do
    sh 'env KEYMAP=ck make -f Makefile.lufa -j'
  end
end

desc 'clean'
task :clean do
  cd 'keyboard/ergodox' do
    sh 'env KEYMAP=ck make -f Makefile.lufa clean'
  end
end

desc 'default'
task :default => [:build, :flash]
