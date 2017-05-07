-module(mailbox).

-include_lib("eunit/include/eunit.hrl").
-export([receiver1/0, receiver2/0]).

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
