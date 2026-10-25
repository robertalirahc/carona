-- MIGRACAO ADITIVA: nao altera nem remove registros existentes.
-- Execute SOMENTE após exportar backup das tabelas no Supabase.
-- Pressupõe a tabela public.participantes do projeto original.
BEGIN;
CREATE TABLE IF NOT EXISTS public.adesoes (
 participante_id uuid NOT NULL REFERENCES public.participantes(id) ON DELETE CASCADE,
 grupo_id uuid NOT NULL REFERENCES public.participantes(id) ON DELETE CASCADE,
 created_at timestamptz NOT NULL DEFAULT now(),
 PRIMARY KEY (participante_id, grupo_id),
 CONSTRAINT adesoes_nao_auto CHECK (participante_id <> grupo_id)
);
ALTER TABLE public.adesoes ENABLE ROW LEVEL SECURITY;
GRANT SELECT, INSERT ON public.adesoes TO anon;
DO $$ BEGIN
 IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='adesoes' AND policyname='Adesoes visiveis') THEN
  CREATE POLICY "Adesoes visiveis" ON public.adesoes FOR SELECT TO anon USING (true);
 END IF;
 IF NOT EXISTS (SELECT 1 FROM pg_policies WHERE schemaname='public' AND tablename='adesoes' AND policyname='Entrar em grupo') THEN
  CREATE POLICY "Entrar em grupo" ON public.adesoes FOR INSERT TO anon WITH CHECK (true);
 END IF;
END $$;
COMMIT;
-- AVISO: essa política de inserção pública permite adesões indevidas;
-- não use com dados reais até implantar confirmação de identidade/moderação.
