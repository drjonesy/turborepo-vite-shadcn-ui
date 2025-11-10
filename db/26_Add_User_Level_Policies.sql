-- ============================================================
-- USER POLICIES (For authenticated users via Supabase Auth)
-- ============================================================

-- USERS TABLE
---------------------------------------------------------
-- Users can view their own profile
CREATE POLICY "Users can view own profile" ON users
  FOR SELECT USING (auth.uid() = id);

-- Users can update their own profile (except sensitive fields)
CREATE POLICY "Users can update own profile" ON users
  FOR UPDATE USING (auth.uid() = id);

-- USER_ROLES TABLE
---------------------------------------------------------
-- Users can view their own role
CREATE POLICY "Users can view own role" ON user_roles
  FOR SELECT USING (auth.uid() = user_id);

-- ROLES TABLE (Read-only for everyone)
---------------------------------------------------------
-- Anyone can view roles (for dropdown menus, etc.)
CREATE POLICY "Anyone can view roles" ON roles
  FOR SELECT USING (true);

-- APPS TABLE (Read-only for everyone)
---------------------------------------------------------
-- Anyone can view apps
CREATE POLICY "Anyone can view apps" ON apps
  FOR SELECT USING (true);

-- USER_APPS TABLE
---------------------------------------------------------
-- Users can view their own app access
CREATE POLICY "Users can view own apps" ON user_apps
  FOR SELECT USING (auth.uid() = user_id);

-- MEMBERSHIPS TABLE (Read-only for everyone)
---------------------------------------------------------
-- Anyone can view membership tiers (for pricing page)
CREATE POLICY "Anyone can view memberships" ON memberships
  FOR SELECT USING (true);

-- USER_MEMBERSHIPS TABLE
---------------------------------------------------------
-- Users can view their own subscriptions
CREATE POLICY "Users can view own memberships" ON user_memberships
  FOR SELECT USING (auth.uid() = user_id);

-- VOLUNTEER_TIMESHEETS TABLE
---------------------------------------------------------
-- Users can view their own timesheets
CREATE POLICY "Users can view own timesheets" ON volunteer_timesheets
  FOR SELECT USING (auth.uid() = user_id);

-- VOLUNTEER_SCHEDULES TABLE
---------------------------------------------------------
-- Users can view their own schedules
CREATE POLICY "Users can view own schedules" ON volunteer_schedules
  FOR SELECT USING (auth.uid() = user_id);

-- Users can create their own schedules
CREATE POLICY "Users can create own schedules" ON volunteer_schedules
  FOR INSERT WITH CHECK (auth.uid() = user_id);

-- Users can update their own schedules
CREATE POLICY "Users can update own schedules" ON volunteer_schedules
  FOR UPDATE USING (auth.uid() = user_id);

-- USER_CREDITS TABLE
---------------------------------------------------------
-- Users can view their own credits
CREATE POLICY "Users can view own credits" ON user_credits
  FOR SELECT USING (auth.uid() = user_id);

-- CREDIT_TRANSACTIONS TABLE
---------------------------------------------------------
-- Users can view their own transactions
CREATE POLICY "Users can view own transactions" ON credit_transactions
  FOR SELECT USING (auth.uid() = user_id);