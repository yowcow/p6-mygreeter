use v6;
use lib 'lib';
use MyGreeter;
use Test;

lives-ok {
    MyGreeter.new
}, 'Succeeds without `dt`';

lives-ok {
    MyGreeter.new(dt => DateTime.now)
}, 'Succeeds with DateTime as `dt`';

dies-ok {
    MyGreeter.new(dt => 'something-else')
}, 'Fails with something wrong as `dt`';

done-testing;
