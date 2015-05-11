unit ULume_br_style;

interface

uses
  Classes, SysUtils, AdvMemo, AdvmPS;

function CreateLumeBrStyler(Owner: TComponent): TAdvPascalMemoStyler;

implementation

uses
  Graphics;

// Cria um estilizador para a linguagem Lume-br
function CreateLumeBrStyler(Owner: TComponent): TAdvPascalMemoStyler;
var
  itm: TElementStyle;
begin
  Result := TAdvPascalMemoStyler.Create(Owner);
  Result.Description := 'Lume-br';
  Result.Filter := 'Arquivos Lume-br (*.lbr)|*.lbr';
  Result.DefaultExtension := '.lbr';
  Result.StylerName := 'Lume-br';
  Result.Extensions := 'lbr';

  Result.LineComment := '//';
  Result.MultiCommentLeft := '/*';
  Result.MultiCommentRight := '*/';
  Result.CommentStyle.TextColor := clHighlight;
  Result.CommentStyle.BkColor := clWhite;
  Result.CommentStyle.Style := [fsItalic];
  Result.NumberStyle.TextColor := clBlack;
  Result.NumberStyle.BkColor := clWhite;
  Result.NumberStyle.Style := [];
  Result.BlockStart := 'início,escolha,registro';
  Result.BlockEnd := 'fim';
  Result.HexIdentifier := '$';

  //------------Lume-br -------------
  Result.AllStyles.Clear;
  itm := Result.AllStyles.Add;
  itm.Info := 'Lume-br Standard Default';
  itm.Font.Color := clNavy;
  itm.Font.Style := [fsBold];
  with itm.KeyWords do
  begin
    Add('adiante');
    Add('aloque');
    Add('arranjo');
    Add('até');
    Add('caractere');
    Add('caso');
    Add('conjunto');
    Add('const');
    Add('de');
    Add('div');
    Add('enquanto');
    Add('escolha');
    Add('escreva');
    Add('fim');
    Add('função');
    Add('inclui');
    Add('início');
    Add('inteiro');
    Add('leia');
    Add('libere');
    Add('lógico');
    Add('mod');
    Add('não');
    Add('nulo');
    Add('para');
    Add('ponteiro');
    Add('procedimento');
    Add('programa');
    Add('real');
    Add('registro');
    Add('repita');
    Add('retorne');
    Add('se');
    Add('senão');
    Add('sim');
    Add('texto');
    Add('tipo');
    Add('var');
  end;

  //------------Double Quote " "----------------
  itm := Result.AllStyles.Add;
  itm.StyleType := stBracket;
  itm.Info := 'Double Quote';
  itm.Font.Color := clBlue;
  itm.Font.Style := [];
  itm.BracketStart := '"';
  itm.BracketEnd := '"';

  //----------SYMBOL --------------
  itm := Result.AllStyles.Add;
  itm.StyleType := stSymbol;
  itm.Info := 'Symbols Delimiters';
  itm.Font.Color := clBlack;
  itm.Font.Style := [];
  itm.Symbols := #32+',;:.(){}[]=+-*/^%<>#'+#13+#10;

  Result.HintParameter.Parameters.Clear;
  Result.HintParameter.BkColor := clInfoBk;
  Result.HintParameter.TextColor := clBlack;
  with Result.HintParameter.Parameters do
  begin
    Add('alt_modo_caneta(tela: janela; modo: inteiro);');
    Add('obt_modo_caneta(tela: janela): inteiro;');
    Add('alt_estilo_caneta(tela: janela; estilo: inteiro);');
    Add('obt_estilo_caneta(tela: janela): inteiro;');
    Add('existe_arq(nome_arq: texto): lógico;');
    Add('dsn_bezier(x3, y3, x4, y4, x2, y2: inteiro);');
    Add('dsn_arco(x1, y1, x2, y2, x3, y3, x4, y4: inteiro);');
    Add('dsn_fatia(x1, y1, x2, y2, x3, y3, x4, y4: inteiro);');
    Add('cor_rgb(vermelho, verde, azul: inteiro): inteiro;');
    Add('alt_pixel(tela: janela; x, y: inteiro; cor: inteiro);');
    Add('última_tecla(): caractere;');
    Add('cor_do_fundo(): inteiro;');
    Add('alt_estilo_pincel(tela: janela; estilo: inteiro);');
    Add('obt_estilo_pincel(tela: janela): inteiro;');
    Add('obt_tam_fonte(tela: janela): inteiro;');
    Add('obt_cor_fonte(tela: janela): inteiro;');
    Add('obt_tam_caneta(tela: janela): inteiro;');
    Add('obt_cor_caneta(tela: janela): inteiro;');
    Add('obt_cor_pincel(tela: janela): inteiro;');
    Add('obt_pixel(tela: janela; x, y: inteiro): inteiro;');
    Add('último_evento(): inteiro;');
    Add('mouse_x(): inteiro;');
    Add('mouse_y(): inteiro;');
    Add('mouse_xy(var x, y: inteiro);');
    Add('espere_por(eventos: inteiro);');
    Add('dsn_ret(tela: janela; x, y, largura, altura: inteiro);');
    Add('dsn_tri(tela: janela; x, y, largura, altura: inteiro);');
    Add('dsn_cir(tela: janela; x, y, largura, altura: inteiro);');
    Add('dsn_lin(tela: janela; x, y: inteiro);');
    Add('alt_pos_caneta(tela: janela; x, y: inteiro);');
    Add('dsn_txt(tela: janela; x, y: inteiro; txt: texto);');
    Add('alt_cor_pincel(tela: janela; cor: inteiro);');
    Add('alt_cor_caneta(tela: janela; cor: inteiro);');
    Add('alt_tam_caneta(tela: janela; tam: inteiro);');
    Add('alt_cor_fonte(tela: janela; cor: inteiro);');
    Add('alt_tam_fonte(tela: janela; tam: inteiro);');
    Add('alt_nome_fonte(tela: janela; nome: texto);');
    Add('alt_estilo_fonte(tela: janela; estilo: inteiro);');
    Add('raiz(x: real): real;');
    Add('tamanho(txt: texto): inteiro;');
    Add('maiúscula(txt: texto): texto;');
    Add('minúscula(txt: texto): texto;');
    Add('arredonde(x: real): inteiro;');
    Add('sen(x: real): real;');
    Add('cos(x: real): real;');
    Add('obt_caneta_x(tela: janela): inteiro;');
    Add('obt_caneta_y(tela: janela): inteiro;');
    Add('random(n: inteiro): inteiro;');
    Add('crt_para_int(crt: caractere): inteiro;');
    Add('int_para_crt(n: inteiro): caractere;');
    Add('int_para_txt(n: inteiro): texto;');
    Add('txt_para_int(txt: texto): inteiro;');
    Add('caractere_em(txt: texto; pos: inteiro): caractere;');
    Add('alt_ev_tempo(ms: inteiro)');
    Add('obt_ev_tempo(): inteiro;');
    Add('durma(ms: inteiro);');
    Add('botão_mouse(bts: inteiro): lógico;');
    Add('estado_teclado(teclas: inteiro): lógico;');
    Add('agora(): real;');
    Add('dcod_data(dt: real; var dia, mês, ano: inteiro);');
    Add('dcod_hora(dt: real; var hora, minuto, segundo, milissegundo: inteiro);');
    Add('cod_data(var dt: real; dia, mês, ano: inteiro);');
    Add('cod_hora(var dt: real; hora, minuto, segundo, milissegundo: inteiro);');
    Add('potência(base, expoente: real): real;');
    Add('real_para_txt(x: real): texto;');
    Add('txt_para_real(txt: texto): real;');
    Add('nova_janela(): janela;');
    Add('toq_som(s: som);');
    Add('novo_botão(tela: janela; x, y, largura, altura: inteiro; txt: texto): botão;');
    Add('novo_rótulo(tela: janela; x, y, largura, altura: inteiro; txt: texto): rótulo;');
    Add('lib_janela(jan: janela);');
    Add('alt_pos_janela(jan: janela; x, y: inteiro);');
    Add('alt_tam_janela(jan: janela; largura, altura: inteiro);');
    Add('alt_txt_janela(jan: janela; txt: texto);');
    Add('alt_cor_janela(jan: janela; cor: inteiro);');
    Add('novo_editor_lin(tela: janela; x, y, largura, altura: inteiro; txt: texto): editor_lin;');
    Add('novo_editor_txt(tela: janela; x, y, largura, altura: inteiro; txt: texto): editor_txt;');
    Add('nova_caixa_marca(tela: janela; x, y, largura, altura: inteiro; txt: texto): caixa_marca;');
    Add('nova_caixa_escolha(tela: janela; x, y, largura, altura: inteiro; txt: texto): caixa_escolha;');
    Add('nova_caixa_lista(tela: janela; x, y, largura, altura: inteiro; txt: texto): caixa_lista;');
    Add('nova_caixa_comb(tela: janela; x, y, largura, altura: inteiro; txt: texto): caixa_comb;');
    Add('nova_caixa_grupo(tela: janela; x, y, largura, altura: inteiro; txt: texto): caixa_grupo;');
    Add('novo_quadro(tela: janela; x, y, largura, altura: inteiro; txt: texto): quadro;');
    Add('nova_imagem(tela: janela; x, y, largura, altura: inteiro; nome: texto): imagem;');
    Add('nova_imagem_crg(nome: texto): imagem;');
    Add('novo_som(nome: texto): som;');
    Add('cop_imagem(tela: janela; x, y: inteiro; img: imagem);');
    Add('alt_vis_janela(tela: janela; vis: lógico);');
    Add('obt_tam_janela(tela: janela; var altura, largura: inteiro);');
    Add('cop_imagem_ret(tela: janela; x1, y1, x2, y2: inteiro; img: imagem);');
    Add('arq_para_txt(nome_arq: texto): texto;');
    Add('txt_para_arq(nome_arq: texto; txt: texto);');
    Add('dsn_ret_cheio(tela: janela; x, y, largura, altura: inteiro);');
    Add('dsn_lin_sel(tela: janela; x, y: inteiro);');
    Add('reg_evento(tela: janela; evento, evnt_substituto: inteiro);');
    Add('obt_txt_janela(tela: janela): texto;');
    Add('caixa_marcada(cx: caixa): lógico;');
    Add('dsn_ret_sel(tela: janela; x, y, largura, altura: inteiro);');

  end;

  Result.AutoCompletion.Clear;
  with Result.AutoCompletion do
  begin
    Add('alt_modo_caneta');
    Add('obt_modo_caneta');
    Add('alt_estilo_caneta');
    Add('obt_estilo_caneta');
    Add('existe_arq');
    Add('dsn_bezier');
    Add('dsn_arco');
    Add('dsn_fatia');
    Add('cor_rgb');
    Add('alt_pixel');
    Add('última_tecla');
    Add('cor_do_fundo');
    Add('alt_estilo_pincel');
    Add('obt_estilo_pincel');
    Add('obt_tam_fonte');
    Add('obt_cor_fonte');
    Add('obt_tam_caneta');
    Add('obt_cor_caneta');
    Add('obt_cor_pincel');
    Add('obt_pixel');
    Add('último_evento');
    Add('mouse_x');
    Add('mouse_y');
    Add('mouse_xy');
    Add('espere_por');
    Add('dsn_ret');
    Add('dsn_tri');
    Add('dsn_cir');
    Add('dsn_lin');
    Add('alt_pos_caneta');
    Add('dsn_txt');
    Add('alt_cor_pincel');
    Add('alt_cor_caneta');
    Add('alt_tam_caneta');
    Add('alt_cor_fonte');
    Add('alt_tam_fonte');
    Add('alt_nome_fonte');
    Add('alt_estilo_fonte');
    Add('raiz');
    Add('tamanho');
    Add('maiúscula');
    Add('minúscula');
    Add('arredonde');
    Add('sen');
    Add('cos');
    Add('obt_caneta_x');
    Add('obt_caneta_y');
    Add('random');
    Add('crt_para_int');
    Add('int_para_crt');
    Add('int_para_txt');
    Add('txt_para_int');
    Add('caractere_em');
    Add('alt_ev_tempo');
    Add('obt_ev_tempo');
    Add('durma');
    Add('botão_mouse');
    Add('estado_teclado');
    Add('agora');
    Add('dcod_data');
    Add('dcod_hora');
    Add('cod_data');
    Add('cod_hora');
    Add('potência');
    Add('real_para_txt');
    Add('txt_para_real');
    Add('nova_janela');
    Add('toq_som');
    Add('novo_botão');
    Add('novo_rótulo');
    Add('lib_janela');
    Add('alt_pos_janela');
    Add('alt_tam_janela');
    Add('alt_txt_janela');
    Add('alt_cor_janela');
    Add('novo_editor_lin');
    Add('novo_editor_txt');
    Add('nova_caixa_marca');
    Add('nova_caixa_escolha');
    Add('nova_caixa_lista');
    Add('nova_caixa_comb');
    Add('nova_caixa_grupo');
    Add('novo_quadro');
    Add('nova_imagem');
    Add('nova_imagem_crg');
    Add('novo_som');
    Add('cop_imagem');
    Add('alt_vis_janela');
    Add('obt_tam_janela');
    Add('cop_imagem_ret');
    Add('arq_para_txt');
    Add('txt_para_arq');
    Add('dsn_ret_cheio');
    Add('dsn_lin_sel');
    Add('reg_evento');
    Add('obt_txt_janela');
    Add('caixa_marcada');
    Add('dsn_ret_sel');
  end;
end;

end.



