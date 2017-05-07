-module(mailbox).

-include_lib("eunit/include/eunit.hrl").
-export([receiver1/0, receiver2/0, receive_seq/0]).

receiver1() ->
  receive
    Msg ->
      case Msg of
        stop -> print();
        _ -> print(),
          timer:sleep(3000),
          receiver1()
      end
  end.

receiver2() ->
  receive
    stop -> print();
    _ -> print(),
      timer:sleep(3000),
      receiver2()
  end.

print() -> io:format("message:~w~n", [{ok, 42}]).



receive_seq() ->
  receive_first().

receive_first() ->
  receive
    {first, FirstString} ->
      io:format("~s~n", [FirstString]),
      receive_second()
  end.

receive_second() ->
  receive
    {second, SecondString} ->
      io:format("~s~n", [SecondString]),
      receive_first()
  end.