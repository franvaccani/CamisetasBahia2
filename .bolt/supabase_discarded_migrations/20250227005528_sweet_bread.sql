/*
  # Fix products table and permissions

  1. Changes
     - Remove foreign key constraint on user_id
     - Update RLS policies to allow all operations
     - Allow both authenticated and anonymous users to manage products
  
  2. Security
     - Enable open access for demonstration purposes
     - In a production environment, stricter policies would be recommended
*/

-- Drop the foreign key constraint if it exists
ALTER TABLE IF EXISTS products DROP CONSTRAINT IF EXISTS products_user_id_fkey;

-- Drop existing policies
DROP POLICY IF EXISTS "Anyone can view products" ON products;
DROP POLICY IF EXISTS "Users can create their own products" ON products;
DROP POLICY IF EXISTS "Users can update their own products" ON products;
DROP POLICY IF EXISTS "Users can delete their own products" ON products;
DROP POLICY IF EXISTS "Anyone can create products" ON products;
DROP POLICY IF EXISTS "Anyone can update products" ON products;
DROP POLICY IF EXISTS "Anyone can delete products" ON products;

-- Create new policies
CREATE POLICY "Anyone can view products"
  ON products
  FOR SELECT
  USING (true);

CREATE POLICY "Anyone can create products"
  ON products
  FOR INSERT
  TO authenticated, anon
  WITH CHECK (true);

CREATE POLICY "Anyone can update products"
  ON products
  FOR UPDATE
  TO authenticated, anon
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Anyone can delete products"
  ON products
  FOR DELETE
  TO authenticated, anon
  USING (true);