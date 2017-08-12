defmodule Bittrex.Interactor.MarketSummary.GetMarketSummary do
  use Bittrex.Interactor
  alias Bittrex.MarketSummary

  def call(market_name) do
    HttpRequest.new(:get, "/public/getmarketsummary", [market: market_name])
    |> Client.send()
    |> format_response()
  end

  defp format_response({:ok, result}) do
    result
    |> List.first()
    |> MarketSummary.new()
  end
  defp format_response({:error, _result}), do: []
end