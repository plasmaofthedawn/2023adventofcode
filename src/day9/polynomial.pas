{$mode objfpc}

uses sysutils, math;

{$include bigint.pas}

const
    MAX_POLYNOMIAL_LENGTH = 100;
    EPSILON: double = 0;
type
    fraction = record
        numerator: int512;
        denominator: int512;
    end;
    polynomial = record
        degree: int64;
        { coefficients will be stored in reverse. ofc}
        coefficients: array[0..MAX_POLYNOMIAL_LENGTH] of fraction;
    end;
    

procedure print_fraction(a: fraction);
begin
    if a.denominator <> 1 then
    begin
        print512d(a.numerator);
        write('/');
        print512d(a.denominator);
    end
    else
        print512d(a.numerator);
end;

function c_fraction(num: int512; den: int512): fraction;
begin
    if den = 0 then
        writeln('holy hell what are you doing');

    c_fraction.numerator := num;
    c_fraction.denominator := den;

end;

operator := (f: int64) out_ : fraction;
begin
    out_ := c_fraction(f, 1);
end;


function gcd(a, b: int512): int512;
var
    r: int512;
begin

    while true do
    begin

        r := a mod b;

        if r = 0 then
            break;

        a := b;
        b := r;
        
    end;

    gcd := b;
end;

function simplify(f: fraction): fraction;
var
    b: int512;
    neg: boolean;

begin

    neg := false;
    if isneg(f.numerator) then
    begin
        neg := not neg;
        f.numerator := -f.numerator;
    end;

    if isneg(f.denominator) then
    begin
        neg := not neg;
        f.denominator := -f.denominator;
    end;

    b := gcd(f.numerator, f.denominator);
    
    if b <> 0 then
        simplify := c_fraction(f.numerator div b, f.denominator div b)
    else
        simplify := f;

    if neg then
        simplify.numerator := -simplify.numerator;

end;

{ add fractions }
operator + (a, b: fraction) out_: fraction;
//var
    // g: int512;
begin

    // print_fraction(a);
    // write(' ');
    // print_fraction(b);
    // write(' ');

    // g := gcd(a.denominator, b.denominator);

    out_.denominator := a.denominator * b.denominator;
    out_.numerator := a.denominator * b.numerator + b.denominator * a.numerator;

    // print_fraction(out_);
    // write(' ');
    if abs(out_.numerator) > $7FFFFFFFFFFFFFFF then
       out_ := simplify(out_);
    // print_fraction(out_);
    // writeln('ya');
end;

{ mult fractions }
operator * (a, b: fraction) out_: fraction;
begin
    out_.denominator := a.denominator * b.denominator;
    out_.numerator := a.numerator * b.numerator;
    
    //if out_.numerator > (1 shl 60) then
    //    out_ := simplify(out_);

end;


procedure fill_array_1(var a: array of fraction; l: int64 = MAX_POLYNOMIAL_LENGTH);
var
    i: int64;
begin

    for i := 0 to l do
        a[i] := c_fraction(0, 1);
    
end;

{ add polynomials }
operator + (a, b: polynomial) add_polynomial: polynomial;
var

    new_degree: int64;
    max_degree: int64;
    i: int64;

begin
    
    case a.degree > b.degree of 
        true: max_degree := a.degree;
        false: max_degree := b.degree;
    end;

    fill_array_1(add_polynomial.coefficients);

    for i := 0 to max_degree do
    begin
        add_polynomial.coefficients[i] := a.coefficients[i] + b.coefficients[i];

        if add_polynomial.coefficients[i].numerator <> 0 then
            new_degree := i
    end;
    
    add_polynomial.degree := new_degree;
end;

{ mult polynomials }
operator * (a, b: polynomial) out_: polynomial;
var 

    i, j: int64;
    new_degree: int32;

begin

    out_.degree := a.degree + b.degree;

    fill_array_1(out_.coefficients);

    for i := 0 to a.degree do
    begin
        for j := 0 to b.degree do
        begin

            out_.coefficients[i + j] := out_.coefficients[i + j] + a.coefficients[i] * b.coefficients[j];

        end;
    end;

    for i := 0 to out_.degree do
    begin

        if out_.coefficients[i].numerator <> 0 then
            new_degree := i
    end;
    
    out_.degree := new_degree;

end;

function constant(c: fraction): polynomial;
begin
    fill_array_1(constant.coefficients);
    constant.coefficients[0] := c;
    constant.degree := 0;
end;

function binomial(m, b: fraction): polynomial;
begin
    fill_array_1(binomial.coefficients);
    binomial.coefficients[0] := b;
    binomial.coefficients[1] := m;
    binomial.degree := 1;
end;


function eval_polynomial(a: polynomial; b: int512): fraction;
var
    i: int64;
begin

    eval_polynomial := c_fraction(0, 1);

    for i := 0 to a.degree do
    begin
        eval_polynomial := eval_polynomial + a.coefficients[i] * c_fraction(power(b, i), 1);
    end;
end;

procedure print_polynomial(a: polynomial);
var

    i: int64;

begin

    for i := 0 to a.degree do
    begin
        if (a.coefficients[a.degree - i].numerator <> 0) or (a.degree = 0) then
        begin
            if i <> 0 then
            begin
                if isneg(a.coefficients[a.degree - i].numerator) then
                begin
                    a.coefficients[a.degree - i].numerator := -a.coefficients[a.degree - i].numerator;
                    write(' - ');
                end
                else
                    write(' + ');
                end;

            { yeah. need an equality for fraction. }
            if (a.coefficients[a.degree - i].numerator <> 1) and (a.coefficients[a.degree - i].denominator <> 1) or (i = a.degree) then
                print_fraction(a.coefficients[a.degree - i]);

            if i = a.degree - 1 then
                write('x')
            else if i < a.degree - 1 then
            begin
                write('x^');
                write(a.degree - i);
            end;
        end;
    end;

    write(' (');
    write(a.degree);
    write(')');

end;

function simplify_poly(a: polynomial): polynomial;
var 
    i: int32;
begin
    for i := 0 to a.degree do
    begin
        simplify_poly.coefficients[i] := simplify(a.coefficients[i]);
    end;
    simplify_poly.degree := a.degree;
end;
