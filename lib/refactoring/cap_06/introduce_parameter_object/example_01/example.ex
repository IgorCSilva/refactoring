defmodule Refactoring.Cap06.IntroduceParameterObject.Example01.Example do

  alias Refactoring.Cap06.IntroduceParameterObject.Example01.NumberRange

  def start do
    operating_plan = %{
      temperature_floor: 48,
      temperature_ceiling: 50
    }
    station = %{
      name: "ZB1",
      readings: [
        %{temp: 47, time: "2016-11-10 09:10"},
        %{temp: 53, time: "2016-11-10 09:10"},
        %{temp: 58, time: "2016-11-10 09:10"},
        %{temp: 53, time: "2016-11-10 09:10"},
        %{temp: 51, time: "2016-11-10 09:10"},
      ]
    }

    range = %NumberRange{min: operating_plan.temperature_floor, max: operating_plan.temperature_ceiling}
    alerts = reading_outside_range(station, range)
  end

  def reading_outside_range(station, range) do
    Enum.filter(station.readings, fn reading ->
      not range.__struct__.contains(range, reading.temp)
    end)
  end
end
