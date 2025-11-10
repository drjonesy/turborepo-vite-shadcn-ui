-- ============================================================
-- ADMIN POLICIES (For users with admin role)
-- ============================================================

-- Helper function to check if user is admin
CREATE OR REPLACE FUNCTION is_admin()
RETURNS BOOLEAN AS $$
BEGIN
  RETURN EXISTS (
    SELECT 1 FROM user_roles ur
    JOIN roles r ON ur.role_id = r.id
    WHERE ur.user_id = auth.uid() AND r.name = 'admin'
  );
END;
$$ LANGUAGE plpgsql SECURITY DEFINER;

-- Admins can view all users
CREATE POLICY "Admins can view all users" ON users
  FOR SELECT USING (is_admin());

-- Admins can update all users
CREATE POLICY "Admins can update all users" ON users
  FOR UPDATE USING (is_admin());

-- Admins can view all timesheets
CREATE POLICY "Admins can view all timesheets" ON volunteer_timesheets
  FOR SELECT USING (is_admin());

-- Admins can view all schedules
CREATE POLICY "Admins can view all schedules" ON volunteer_schedules
  FOR SELECT USING (is_admin());

-- Admins can view all credits
CREATE POLICY "Admins can view all credits" ON user_credits
  FOR SELECT USING (is_admin());

-- Admins can view all transactions
CREATE POLICY "Admins can view all transactions" ON credit_transactions
  FOR SELECT USING (is_admin());