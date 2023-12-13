create policy "Enable insert for authenticated users with admin/event_co role"
on "public"."hackathons"
as permissive
for insert
to authenticated
with check ((auth.uid() IN ( SELECT user_roles.user_id
   FROM user_roles
  WHERE ((user_roles.role = 'admin'::user_role) OR (user_roles.role = 'event_coordinator'::user_role)))));


create policy "Enable read access for all users"
on "public"."hackathons"
as permissive
for select
to public
using (true);


create policy "Enable update for authenticated users with admin/event_co role"
on "public"."hackathons"
as permissive
for update
to authenticated
using ((auth.uid() IN ( SELECT user_roles.user_id
   FROM user_roles
  WHERE ((user_roles.role = 'admin'::user_role) OR (user_roles.role = 'event_coordinator'::user_role)))))
with check (true);