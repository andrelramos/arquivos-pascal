Program Pzim ;

Type
	reg = record
		palavra: string[30];
	end;
	arqtexto = text;
	
Procedure criar(var arq: arqtexto);
	begin 
		{$I-}
		reset(arq);
		{$I+}
		
		if ioresult <> 0 then
			rewrite(arq);
		close(arq);		
	end;
	
Procedure cadastra(var arq: arqtexto);
	var
		x: reg;		
		
	begin
		clrscr;
	
		append(arq);
		write('palavra: ');
		readln(x.palavra);
		
		writeln(arq, x.palavra);
		
		close(arq);
		clrscr;
	end;
	
Procedure exibe(var arq: arqtexto);
	var
		x: reg;
		
	begin
		clrscr;
	
		reset(arq);
		while not eof(arq) do
			begin
				readln(arq, x.palavra);
								
				writeln('palavra: ', x.palavra);
			end;
		close(arq);				
	end;
	
Procedure consulta(VAR arq:arqtexto);
	var
		achou: boolean;
		x: reg;
		pesq: string[30];
		count: integer;
		
	begin
		clrscr;
	
		write('Digite a palavra: ');
		readln(pesq);
		achou:=false;
		reset(arq);
		count := 0;
		while not eof(arq) do
			begin
				count:= count+1;
				readln(arq, x.palavra);
				
				if x.palavra = pesq then
					begin
						writeln('A palavra ', x.palavra, ' está na posição ',count);
						achou:=true;
					end;
			end;
		close(arq);
						
		if achou = false then
			writeln('Palavra não encontrado');
	end;
	
Procedure quantidade(VAR arq:arqtexto);
	var
		count: integer;
		x: reg;
		
	begin
		reset(arq);
		count:=0;
		
		while not eof(arq) do
			begin
			readln(arq, x.palavra);
				count:= count+1;
			end;
		
		close(arq);
		
		writeln(count, ' palavra(s) esta(ão) armazenada(s)');
	end;	
	
Var 
	op: integer;
	ag: arqtexto;  
	
begin
	assign(ag, 'palavra.txt');
	criar(ag);
		
	repeat
		writeln('###########################');
		writeln('');
		writeln('1-Cadastro');
		writeln('2-Listagem');
		writeln('3-Consulta');
		writeln('4-Exibir quantidade de palavras armazenadas');
		writeln('5-Sair');
		writeln('');
		writeln('###########################');
		writeln('');
		write('Digite sua opção: ');
		readln(op);
		case op of
			1: cadastra(ag);
			2: exibe(ag);
			3: consulta(ag);
			4: quantidade(ag);
		end;
	until op = 4;
	
End.			