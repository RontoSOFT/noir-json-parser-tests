use dep::std::option::Option;

use dep::rontosoft::globals::BYTE_NULL;
use dep::rontosoft::globals::MINUS;
use dep::rontosoft::globals::PLUS;
use dep::rontosoft::globals::DECIMAL_POINT;
use dep::rontosoft::globals::eE;
use dep::rontosoft::JSON;
use dep::rontosoft::convert::asFloat;

#[test]
unconstrained
fn float_zero_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_zero_dot_seven_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 0, fraction: 5, leading_zeros: 7 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_one_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_one_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 1, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_two_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_two_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_two_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 2, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     dep::std::println(y.leading_zeros);
//     dep::std::println(dep::rontosoft::float::precision);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_three_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_three_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_three_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 3, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     dep::std::println(y.leading_zeros);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_four_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_four_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_four_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     dep::std::println(y.leading_zeros);
//     assert(y.leading_zeros == (dep::rontosoft::float::precision - 1));
// }

// #[test]
// unconstrained
// fn float_four_dot_eight_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 4, fraction: 5, leading_zeros: 8 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == (dep::rontosoft::float::precision - 1));
// }

#[test]
unconstrained
fn float_five_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_five_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_five_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 5, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);
//     dep::std::println(y);
//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_six_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_six_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_six_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 6, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_seven_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_seven_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_seven_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 7, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_eight_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_eight_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_eight_dot_six_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 6 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

// #[test]
// unconstrained
// fn float_eight_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: 8, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(x.whole == y.whole);
//     assert(x.whole == y.whole);
//     assert(y.leading_zeros == x.leading_zeros);
// }

#[test]
unconstrained
fn float_minus_one_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_one_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_minus_one_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: -1, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     dep::std::println(y.fraction);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == dep::rontosoft::float::precision - 1);
// }

#[test]
unconstrained
fn float_minus_two_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_two_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_minus_two_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: -2, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     dep::std::println(y.fraction);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == dep::rontosoft::float::precision - 1);
// }

#[test]
unconstrained
fn float_minus_three_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_three_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_minus_three_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: -3, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     dep::std::println(y);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == dep::rontosoft::float::precision - 1);
// }

#[test]
unconstrained
fn float_minus_four_dot_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 0 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_one_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 1 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_two_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 2 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_three_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 3 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_four_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 4 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_five_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 5 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

#[test]
unconstrained
fn float_minus_four_dot_six_leading_zero_five()
{
    let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 6 };
    let y = x.toFloat32().toFields(1);

    assert(y.whole == x.whole);
    assert(y.fraction == x.fraction);
    assert(y.leading_zeros == x.leading_zeros);
}

// #[test]
// unconstrained
// fn float_minus_four_dot_seven_leading_zero_five()
// {
//     let x = dep::rontosoft::float::Float32Fields { whole: -4, fraction: 5, leading_zeros: 7 };
//     let y = x.toFloat32().toFields(1);

//     assert(y.whole == x.whole);
//     dep::std::println(y.fraction);
//     assert(y.fraction == x.fraction);
//     assert(y.leading_zeros == dep::rontosoft::float::precision - 1);
// }

// #[test]
// unconstrained
// fn convert_bytes_array_as_float()
// {
//     dep::std::println("");
//     let bytes = [ 0x31, DECIMAL_POINT, 0x35, 0x35 ];
//     // let tuple = asFloat(bytes);

//     // assert(tuple.0.is_some() == true);
//     // assert(tuple.0.unwrap_unchecked() == 101);
//     // assert(tuple.1.is_some() == true);
//     // assert(tuple.1.unwrap_unchecked() == 234);


//     // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 1).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 2).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(0, 55, 3).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 5).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 2).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(1, 55, 3).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(2, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(3, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(4, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(5, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(6, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(7, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(8, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(9, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(10, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(11, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(12, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(13, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(14, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(15, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(16, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(17, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(18, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(31, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(32, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(33, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(34, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(63, 55, 0).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(64, 55, 0).toFields(1));

//     // dep::std::println(dep::rontosoft::float::toFloat32(85, 125, 1).toFields(1));
//     // dep::std::println(dep::rontosoft::float::toFloat32(13, 26, 0).toFields(1));

//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 1).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 2).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 3).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 4).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 5).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 6).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(0, 5, 7).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 1).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 2).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 3).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 4).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 5).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 6).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(3, 5, 7).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(2, 55, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(4, 55, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(8, 55, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(85, 125, 0).toFields(1));
//     dep::std::println(dep::rontosoft::float::toFloat32(13, 26, 0).toFields(1));
// }

//         // dep::std::println(f"iterations: {iterations}");
//         // dep::std::println(f"value_exponent: {value_exponent}");
//         // dep::std::println(f"pre_num: {pre_num}");
//         // dep::std::println(f"numerator: {numerator}");
//         // dep::std::println(f"ten: {ten}");
