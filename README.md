# MyBasecamp1 - Project Collaboration Platform

A Rails-based project management and collaboration platform inspired by Basecamp. Users can create accounts, manage projects, collaborate with team members, and administrators can manage user roles and permissions.

## Features

### User Management
- **User Registration** - New users can create accounts with email and password
- **User Authentication** - Secure login/logout with bcrypt password hashing
- **Role-based Permissions** - Two roles: Member (default) and Admin
- **Admin Dashboard** - Admins can promote/demote users and manage the platform
- **User Profiles** - View user details and account information

### Project Management
- **Create Projects** - Logged-in users can create new projects
- **Project Details** - View project name, description, and owner
- **Edit Projects** - Project owners can edit project information
- **Delete Projects** - Project owners can delete their projects
- **Project Grid View** - Beautiful card-based display of all projects
- **Team Collaboration** - Add team members to projects

### Authorization & Security
- **Session-based Authentication** - Secure user sessions with Rails session management
- **Role-based Access Control** - Admin-only features and project owner restrictions
- **CSRF Protection** - Built-in Rails CSRF token protection
- **Password Hashing** - bcrypt secure password storage

## Technology Stack

- **Ruby:** 3.4.7
- **Rails:** 8.1.1
- **Database:** SQLite3 (development), PostgreSQL (production-ready)
- **Authentication:** bcrypt with has_secure_password
- **Frontend:** ERB templates with CSS
- **Server:** Puma

## System Dependencies

- Ruby 3.4.7 or higher
- Rails 8.1.1
- SQLite3 (development)
- Node.js (for asset compilation)
- Bundler (Ruby dependency manager)

## Installation & Setup

### 1. Clone the Repository
```bash
git clone <repository-url>
cd MyBasecamp1
```

### 2. Install Dependencies
```bash
bundle install
```

### 3. Set Up the Database
```bash
# Create and migrate the database
bin/rails db:create
bin/rails db:migrate

# (Optional) Load seed data
bin/rails db:seed
```

### 4. Create Admin User
```bash
bin/rails runner "User.create!(
  name: 'Admin',
  email: 'admin@example.com',
  password: 'admin123',
  password_confirmation: 'admin123',
  role: :admin
)"
```

### 5. Start the Server
```bash
bin/rails server
```

The application will be available at `http://localhost:3000`

The homepage (/) displays the login page. After logging in, you'll be redirected to the projects dashboard.

## Default Credentials

After setup, you can log in with:
- **Email:** `admin@example.com`
- **Password:** `admin123`
- **Role:** Admin
<<<<<<< HEAD

## Usage

### For Regular Users

1. **Sign Up**
   - Visit `/users/new`
   - Enter name, email, and password
   - Click "Create Account"

2. **Log In**
   - Visit `/sessions/new`
   - Enter email and password
   - Click "Log In"

3. **Create a Project**
   - Click "New Project" button on projects page
   - Enter project name and description
   - Click "Create Project"

4. **Manage Your Projects**
   - Click "Edit" to modify project details
   - Click "Delete" to remove a project
   - Only project owners can edit/delete

### For Administrators

1. **Access User Management**
   - Click "Users" in navigation (admin-only link)
   - View all registered users

2. **Promote Users to Admin**
   - On Users page, click "Make Admin" for any member
   - User will gain admin privileges immediately

3. **Demote Admins to Members**
   - On Users page, click "Remove Admin" for any admin user
   - User will lose admin privileges

## Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  password_digest VARCHAR NOT NULL,
  role INTEGER DEFAULT 0,  -- 0: member, 1: admin
  created_at DATETIME,
  updated_at DATETIME
);
```

### Projects Table
```sql
CREATE TABLE projects (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  user_id INTEGER NOT NULL,  -- Project owner
  created_at DATETIME,
  updated_at DATETIME
);
```

### Project Members Table
```sql
CREATE TABLE project_members (
  id INTEGER PRIMARY KEY,
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  role INTEGER DEFAULT 0,  -- 0: collaborator, 1: manager
  created_at DATETIME,
  updated_at DATETIME,
  UNIQUE(project_id, user_id)
);
```

## API Routes

### Users
- `GET /users/new` - User registration form
- `POST /users` - Create new user account
- `GET /users/:id` - View user profile
- `GET /users` - List all users (admin only)
- `DELETE /users/:id` - Delete user account
- `PATCH /users/:id/set_admin` - Promote to admin (admin only)
- `PATCH /users/:id/remove_admin` - Demote from admin (admin only)

### Sessions
- `GET /sessions/new` - Login form
- `POST /sessions` - Create session (login)
- `DELETE /sessions/:id` - Destroy session (logout)

### Projects
- `GET /projects` - List all projects
- `GET /projects/new` - New project form
- `POST /projects` - Create project
- `GET /projects/:id` - View project details
- `GET /projects/:id/edit` - Edit project form
- `PATCH /projects/:id` - Update project
- `DELETE /projects/:id` - Delete project
=======
>>>>>>> b503e96f2f464ca4fe1e55b93642c30c16946a50

## Usage

### For Regular Users

1. **Sign Up**
   - Visit `/users/new`
   - Enter name, email, and password
   - Click "Create Account"

2. **Log In**
   - Visit `/sessions/new`
   - Enter email and password
   - Click "Log In"

3. **Create a Project**
   - Click "New Project" button on projects page
   - Enter project name and description
   - Click "Create Project"

4. **Manage Your Projects**
   - Click "Edit" to modify project details
   - Click "Delete" to remove a project
   - Only project owners can edit/delete

### For Administrators

1. **Access User Management**
   - Click "Users" in navigation (admin-only link)
   - View all registered users

2. **Promote Users to Admin**
   - On Users page, click "Make Admin" for any member
   - User will gain admin privileges immediately

3. **Demote Admins to Members**
   - On Users page, click "Remove Admin" for any admin user
   - User will lose admin privileges

## Database Schema

### Users Table
```sql
CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  email VARCHAR NOT NULL UNIQUE,
  password_digest VARCHAR NOT NULL,
  role INTEGER DEFAULT 0,  -- 0: member, 1: admin
  created_at DATETIME,
  updated_at DATETIME
);
```
<<<<<<< HEAD
/my_project
```

### The Core Team
Qwasar Team
=======

### Projects Table
```sql
CREATE TABLE projects (
  id INTEGER PRIMARY KEY,
  name VARCHAR NOT NULL,
  description TEXT,
  user_id INTEGER NOT NULL,  -- Project owner
  created_at DATETIME,
  updated_at DATETIME
);
```

### Project Members Table
```sql
CREATE TABLE project_members (
  id INTEGER PRIMARY KEY,
  project_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  role INTEGER DEFAULT 0,  -- 0: collaborator, 1: manager
  created_at DATETIME,
  updated_at DATETIME,
  UNIQUE(project_id, user_id)
);
```

## API Routes

### Users
- `GET /users/new` - User registration form
- `POST /users` - Create new user account
- `GET /users/:id` - View user profile
- `GET /users` - List all users (admin only)
- `DELETE /users/:id` - Delete user account
- `PATCH /users/:id/set_admin` - Promote to admin (admin only)
- `PATCH /users/:id/remove_admin` - Demote from admin (admin only)

### Sessions
- `GET /sessions/new` - Login form
- `POST /sessions` - Create session (login)
- `DELETE /sessions/:id` - Destroy session (logout)

### Projects
- `GET /projects` - List all projects
- `GET /projects/new` - New project form
- `POST /projects` - Create project
- `GET /projects/:id` - View project details
- `GET /projects/:id/edit` - Edit project form
- `PATCH /projects/:id` - Update project
- `DELETE /projects/:id` - Delete project
>>>>>>> b503e96f2f464ca4fe1e55b93642c30c16946a50

<span><i>Made at <a href='https://qwasar.io'>Qwasar SV -- Software Engineering School</a></i></span>
<span><img alt='Qwasar SV -- Software Engineering School's Logo' src='https://storage.googleapis.com/qwasar-public/qwasar-logo_50x50.png' width='20px' /></span>