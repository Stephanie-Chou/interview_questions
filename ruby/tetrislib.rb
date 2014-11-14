module TetrisLib
  # Returns the key that was read from stdin. Either :left, :right, :down, :up, or :unknown.
  def get_input
    begin
      original_terminal_state = `stty -g`
      # Put the terminal in raw mode so we can capture one keypress at a time instead of waiting for enter.
      `stty raw -echo`
      input = STDIN.getc
      exit if input == (ctrl_c = "\003")

      # The arrow keys are read as escaped sequences of 3 characters. If the first character we read is the
      # beginning of an escape sequence, read until we have the full escape sequence.
      input += (STDIN.getc + STDIN.getc) if input == "\e"

      recognized_keys = { "\e[D" => :left, "\e[B" => :down, "\e[C" => :right, "\e[A" => :up, " " => :space }
      return recognized_keys[input] || :unknown
    ensure
      system `stty #{original_terminal_state}`
      print "\n"
    end
  end
end
