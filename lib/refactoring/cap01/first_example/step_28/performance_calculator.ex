defmodule Refactoring.Cap01.FirstExample.Step28.PerformanceCalculator do
  defstruct(
    performance: nil,
    play: nil
  )

  def new(a_performance, a_play) do
    %__MODULE__{
      performance: a_performance,
      play: a_play
    }
  end
end
