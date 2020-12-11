%module main

%include "std_string.i"
%include "base.i"
%include "exception.i"

// Add necessary symbols to generated header
%{
#include <foo/Foo.hpp>
%}

%ignore "";
%define %unignore %rename("%s") %enddef

 // Convert C++ exceptions to Java exceptions
%exception {
  try {
    $action
  }
  SWIG_CATCH_STDEXCEPT
}

%unignore foo;
namespace foo {
%unignore fooHello(int);
%unignore fooHello(int64_t);

%unignore Foo;
%unignore Foo::hello(int);
%unignore Foo::hello(int64_t);

%unignore Foo::getInt() const;
%unignore Foo::setInt(int);

%unignore Foo::getInt64() const;
%unignore Foo::setInt64(int64_t);

%unignore Foo::justThrow();

%rename ("toString") Foo::operator();
} // namespace foo

// Process symbols in header
%include "foo/Foo.hpp"

%exception; // Turn off exception conversion

%unignore ""; // unignore all
