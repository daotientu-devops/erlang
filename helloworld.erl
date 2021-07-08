% The % sign is used to add comments to the program
% hello world program
% The module statement is like adding a namespace as in any programming language
-module(helloworld).
% Module
-author("TutorialPoint").
-version("1.0").
% The export function is used so that any function defined within the program can be used
% The /0 means that our function 'start' accepts 0 parameters
-export([start/0, service/3]).
% Macro
% Record
% Function
% The slash (/) symbol is used along with the function to define the number of parameters
% Each statement is delimited with the dot(.) symbol
% Keywords in Erlang: after, and, andalso, band, begin, bnot, bor, bsl, bsr, bxor, case, catch, cond, div, end, fun, if, let, not, of, or, orelse, receive, rem, try, when, xor
% Data Types: Number, Atom, Boolean, Bit String, Tuple, Map, List
% Atom: An atom is a literal, a constant with name. An atom is to be enclosed in single quotes (')
% if it does not begin with a lower-case letter or if it contains other characters than alphanumeric characters, underscore (_), or @
% Bit string: A bit string is used to store an area of un-typed memory
% This program defines a bit string consisting of 2 bits. The binary_to_list is an inbuilt function defined in Erlang which can be used to convert a bit string to a list
% Tuple: A map is a compound data type with a variable number of key-value associations
% Here we are defining a Tuple P which has 3 terms
% Map: A map is a compound data type with a variable number of key-value associations
% Each key-value association in the map is called an association pair
% The number of association pairs is said to be the size of the map
% Here we are defining a Map M1 which has 2 mappings
% List: A list is a compound data type with a variable number of terms
% Here we are defining a List L which has 3 items
% Variable: ~ this character symbolizes that some formatting needs to be carried out for the output
% ~f the argument is a float which is written as [-]ddd.ddd, where the precission is the number of digits after the decimal point.
% The default precision is 6 and it cannot be less than 1
% ~n this is to println to a new line
% ~e the argument is a float which is written as [-]d.ddde+-ddd, where the precision is the number of digits written.
% The default precision is 6 and it cannot be less than 2
% We recursively call the for function, by reducing the value of N at each recursion
% Function
% Anonymous function
% is defined with the fun() keyword
% is assigned to a variable called Fn
% is called via the variable name
% Function with guard sequence
% FunctionName(Pattern1... PatternN)[when GuardSeq1]->
% Body;
% Tail recursion
% Number
% String
% Nested record
% Guard
% are constructs that we can use to increase the power of pattern matching.
% using guards, we can perform simple tests and comparisions on the variables in a pattern
% Syntax: function(paramter) when condition ->
% BIFS
% are functions that are built into Erlang. 
% In the first example, we are using the BIF called tuple_to_list to convert a tuple to a list
% In the second BIF functions, we are using the time function to output the system time
% Binaries: Lưu trữ dữ liệu thông qua các mã nhị phân
% use a data structure called a binary to store large quantities of raw data. Binaries store data in a much more space efficient manner than in lists or tuples,
% and the runtime system is optimized for the efficient input and output of binaries
% Functions within functions
% One of the other most powerful aspects of higher order functions, is that you can define a function within
% a function
% Processes
% A function called call is defined and will be used to create the process
% The spawn method calls the call function with the parameters hello and process
% Port
% Type of protocol used in port
% There are 2 types of protocols available for communication. One is UDP and the other is TCP.
% UDP lets applications send short messages (called datagrams) to each other, but there is no guarantee of delivery for these messages
% TCP, on the other hand, provides a reliable stream of bytes that are delivered in order as long as the connection is established
% Sending a message on the port
% Syntax: send(socket, address, port, packet)
% socket: this is the socket created with the gen_udp:open command
% address: this is machine address to where the message has to be sent to
% port: this is the port no on which the message needs to be send
% packet: this is the packet or message details which needs to be sent
% Concurrency: Lập trình đồng thời
% Concurrent programming in Erlang needs to have the following basic principles or processes
% piD = spawn(Fun)
% Pid ! Message
% Send a message to the process with identifier Pid. Message sending is asynchronous.
% The sender does not wait but continues with what it was doing. '!' is called the send operator
% Receive...end
% Receives a message that has been sent to a process. It has the following syntax
% receive
% Pattern1 [when Guard1] ->
% Expressions1;
% Pattern1 [when Guard2] ->
% Expressions2;
% ...
% End
% Maximum number of processes
% Recieve with a timeout
% Syntax
% receive
% Pattern1 [when Guard1] ->
%  Expressions1;
% Pattern2 [when Guard2] ->
%  Expressions2;
% ...
% after Time ->
%  Expressions
% end
% inets library is available to build web servers in Erlang
start()->
  inets:start(httpd, [
    {
      modules, [
        mod_alias,
        mod_auth,
        mod_esi,
        mod_actions,
        mod_cgi,
        mod_dir,
        mod_get,
        mod_head,
        mod_log,
        mod_disk_log
        ]},
        {port, 8081},
        {server_name, "helloworld"},
        {server_root, "D://xampp"},
        {document_root, "D://xampp/htdocs"},
        {erl_script_alias, {"/erl", [helloworld]},
        {error_log, "error.log"},
        {security_log, "security.log"},
        {transfer_log, "transfer.log"},
        {mime_types,[
          {"html", "text/html"}, {"css", "text/css"}, {"js", "application/x-javascript"}]}
        }
        ]).
  service(SessionID, _Env, _Input)->mod_esi:deliver(SessionID, []).
