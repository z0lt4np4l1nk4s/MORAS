def _parse_macros(self):
    self._is_macro_loop = False
    self._macro_count = 0
    self._loop_variables = []
    self._available_macros = ["MV", "SWP", "SUM", "WHILE"]

    lines = []

    for (line, p, o) in self._lines:
        lineNumber = len(lines) + 1

        if line[0] != "$":
            if len(line.strip()) > 0:
                lines.append((line, lineNumber, lineNumber))
            continue
        
        parseResult = _parse_macro(self, line, p, o)
        if len(parseResult) == 0:
            return
        
        for l in parseResult:
            lineNumber = len(lines) + 1
            if(len(l.strip()) > 0):
                lines.append((l.strip(), lineNumber, lineNumber))

    if len(self._loop_variables) > 0:
        self._flag = False
        self._line = len(lines)
        self._errm = "While loop not closed: '" + line.strip() + "'"
        return []
    
    self._lines = lines.copy()

def _parse_macro(self, line, p, o):   
    l = line[1:]
    macro_split = l.strip().split("(")
    macro_name = macro_split[0]

    if macro_name == "END":
        if len(self._loop_variables) == 0:
            self._flag = False
            self._line = o
            self._errm = "Invalid macro end: '" + line.strip() + "'"
            return []
        
        return _while_macro_end(self)


    if macro_name not in self._available_macros:
        self._flag = False
        self._line = o
        self._errm = "Unknown macro: '" + line.strip() + "'"
        return []
        

    macro_arg_split = macro_split[1].split(")")

    if len(macro_arg_split) > 1 and len(macro_arg_split[1]) > 0 and macro_arg_split[1] != "\n":
        self._flag = False
        self._line = o
        self._errm = "Invalid macro: '" + line.strip() + "'"
        return []

    macro_arguments = macro_arg_split[0].split(",")

    if any(map(lambda x: len(x) == 0, macro_arguments)):
            self._flag = False
            self._line = o
            self._errm = "Invalid macro argument(s): '" + line.strip() + "'"
            return []

    if macro_name == "MV" or macro_name == "SWP":
        if len(macro_arguments) != 2:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments for macro: '" + line.strip() + "'"
            return []
        
        if macro_name == "MV":
            return _move_macro(self, macro_arguments[0], macro_arguments[1])
        if macro_name == "SWP":
            return _swap_macro(self, macro_arguments[0], macro_arguments[1])
        
    elif macro_name == "SUM":
        if len(macro_arguments) != 3:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments for macro: '" + line.strip() + "'"
            return []
        
        return _sum_macro(self, macro_arguments[0], macro_arguments[1], macro_arguments[2])
    
    elif macro_name == "WHILE":
        if len(macro_arguments) != 1:
            self._flag = False
            self._line = o
            self._errm = "Invalid arguments for macro: '" + line.strip() + "'"
            return []
        
        return _while_macro(self, macro_arguments[0])

def _move_macro(self, a, b):
    return [f"@{a}",
            "D=M",
            f"@{b}",
            "M=D"]

def _swap_macro(self, a, b):
    self._macro_count += 1
    temp = "@swap." + str(self._macro_count)

    return [
        f"@{a}",
        "D=M",
        temp,
        "M=D",
        f"@{b}",
        "D=M",
        f"@{a}",
        "M=D",
        temp,
        "D=M",
        f"@{b}",
        "M=D"
    ]

def _sum_macro(self, a, b, d):
    return [
        f"@{a}",
        "D=M",
        f"@{b}",
        "D=D+M",
        f"@{d}",
        "M=D"
    ]

def _while_macro(self, n):
    self._macro_count += 1
    self._loop_variables.append((n, self._macro_count))
    label = f"(while_start.{self._macro_count})"
    
    return [
        label
    ]

def _while_macro_end(self):
    variable, count = self._loop_variables[-1]
    self._loop_variables = self._loop_variables[:-1]
    labelStart = f"while_start.{count}"
    labelEnd = f"while_end.{count}"

    return [
        f"@{variable}",
        "D=M",
        f"@{labelEnd}",
        "D; JEQ",
        f"@{labelStart}",
        "0; JMP",
        f"({labelEnd})"
    ]
