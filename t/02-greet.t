use v6;
use lib 'lib';
use MyGreeter;
use Test;

subtest {
    my $greeter = MyGreeter.new;

    subtest {
        ok $greeter.greet.chars > 0, 'Str length > 0';
    }, '`greet` returns a greeting';

}, 'Test instance';

subtest {

    my $injection_test = sub (:$hour, :$minute, :$second, :$expected) {
        my $dt = DateTime.new(
            :year(2000),
            :month(1),
            :day(1),
            :hour($hour),
            :minute($minute),
            :second($second),
        );
        my $g = MyGreeter.new(:dt($dt));

        is $g.greet, $expected, "'{$expected}' is expected at {$dt.Str}";
    };

    $injection_test.(
        :hour(0),
        :minute(0),
        :second(0),
        :expected('Good morning!'),
    );

    $injection_test.(
        :hour(11),
        :minute(59),
        :second(59),
        :expected('Good morning!'),
    );

    $injection_test.(
        :hour(12),
        :minute(0),
        :second(0),
        :expected('Good afternoon!'),
    );

    $injection_test.(
        :hour(17),
        :minute(59),
        :second(59),
        :expected('Good afternoon!'),
    );

    $injection_test.(
        :hour(18),
        :minute(0),
        :second(0),
        :expected('Good evening!'),
    );

    $injection_test.(
        :hour(23),
        :minute(59),
        :second(59),
        :expected('Good evening!'),
    );

}, 'Test `greet` with injection';

done-testing;
