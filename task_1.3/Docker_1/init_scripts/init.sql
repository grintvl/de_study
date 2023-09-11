CREATE TABLE IF NOT EXISTS public.index_mass (
    user_id BIGINT,
    weight BIGINT,
    height BIGINT
);
INSERT INTO public.index_mass (user_id, weight, height) VALUES
    (101, 75, 175),
    (102, 60, 182),
    (103, 93, 181);