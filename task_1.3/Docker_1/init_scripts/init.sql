CREATE TABLE IF NOT EXISTS public.index_mass (
    user_id BIGINT,
    name BIGINT,
    older BIGINT
);
INSERT INTO public.index_mass (user_id, name, older) VALUES
    (101, Иван, 75),
    (102, Мурад, 82),
    (103, Саня, 81);