-module(server).

-include_lib("eunit/include/eunit.hrl").

-export([server/1]).

server(Pid) ->
  receive
    {check, W} -> Pid ! {result, is_palindrome(W)},
      server(Pid);
    stop -> io:format("stopping server...")
  end.

is_palindrome(W) ->
  case palin:palindrome(W) of
    true -> W ++ " is a palindrome";
    _ -> W ++ " is not a plaindrome"
  end.