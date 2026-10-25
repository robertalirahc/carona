# Vamos Juntos — site para GitHub Pages

## Publicar
1. Crie um repositório no GitHub e envie `index.html` e `config.js` para a raiz.
2. Em Settings > Pages, escolha Deploy from a branch > main > / (root).
3. Sem configuração, o site funciona apenas como DEMONSTRAÇÃO, com dados salvos no navegador.

## Habilitar lista compartilhada
1. Crie um projeto no Supabase.
2. No SQL Editor, execute `banco.sql`.
3. No painel do Supabase, copie Project URL e a chave pública anon/publishable para `config.js`.
4. Publique novamente `config.js` no GitHub. Não coloque `service_role` ou chaves secretas no site.
5. Faça um cadastro de teste em um aparelho e verifique em outro aparelho.

## Privacidade e segurança
- O site é público e expõe nome/codinome, telefone e deslocamentos. Codinome não impede identificação pelo WhatsApp.
- O formulário exige consentimento explícito. Garanta canal de remoção e responsável pelos dados.
- As políticas SQL permitem leitura e cadastro por qualquer visitante. Não permitem edição/exclusão por visitantes, mas não impedem spam ou cadastros falsos.
- Para uso público real, recomenda-se proteção contra bots, moderação, limite de cadastros e prazo de exclusão dos registros.
- O botão WhatsApp abre conversa externa; não cria grupo no aplicativo.
- Grupos são agrupamentos sugeridos por coincidência exata de destino, ponto, hora e aplicativo; não são reservas confirmadas.
