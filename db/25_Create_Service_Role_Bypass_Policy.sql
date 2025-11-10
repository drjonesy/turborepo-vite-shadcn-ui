-- ============================================================
-- SERVICE ROLE POLICIES (For n8n)
-- ============================================================
-- This allows your n8n workflows to bypass RLS completely

-- Helper function to check if service role
CREATE OR REPLACE FUNCTION is_service_role()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN current_setting('request.jwt.claims', true)::json->>'role' = 'service_role';
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Apply service role bypass to ALL tables
CREATE POLICY "Service role has full access" ON users
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON roles
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON user_roles
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON apps
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON user_apps
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON memberships
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON user_memberships
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON volunteer_timesheets
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON volunteer_schedules
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON user_credits
  FOR ALL USING (is_service_role());

CREATE POLICY "Service role has full access" ON credit_transactions
  FOR ALL USING (is_service_role());