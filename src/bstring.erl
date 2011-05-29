-module(bstring).

-author('@voluntas').

-export([to_upper/1,
         to_lower/1,
         to_integer/1,
         to_float/1]).

-spec to_upper(binary()) -> binary().
to_upper(Binary) when is_binary(Binary) ->
  list_to_binary(string:to_upper(binary_to_list(Binary)))

-spec to_lower(binary()) -> binary().
to_lower(Binary) when is_binary(Binary) ->
  list_to_binary(string:to_lower(binary_to_list(Binary)))

-spec to_integer(binary()) -> {ok, integer()} | {error, no_integer}.
to_integer(Binary) when is_binary(Binary) ->
  case string:to_integer(binary_to_list(Binary)) of
    {Integer, []} ->
      {ok, Integer};
    _ ->
      {error, no_integer}
  end;
to_integer(_) ->
  {error, not_a_binary}.

-spec to_float(binary()) -> {ok, float()} | {error, no_float}.
to_float(Binary) when is_binary(Binary) ->
  case string:to_float(binary_to_list(Binary)) of
    {Float, []} ->
      {ok, Float};
    _ ->
      {error, no_float}
  end;
to_float(_) ->
  {error, not_a_binary}.

