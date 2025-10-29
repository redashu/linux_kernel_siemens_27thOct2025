# 🧠 Scenario

Your organization's internal storage will be hosted under `/data-storage`.
You need to manage access to this directory for multiple users and groups according to specific rules.

## 🧾 Task Requirements

### 🔹 1. User and Group Setup

**Create 3 users:**
- `user1`
- `user2` 
- `user3`

**Create 2 groups:**
- `group1`
- `group2`

**Add:**
- `user1` and `user2` → `group1`
- `user3` → `group2`

*(Ensure the users retain their primary groups while joining the new groups.)*

### 🔹 2. Directory Setup

**Create a directory:**
```
/data-storage
```

**Assign the group ownership** of this directory to `group1`.

**Apply appropriate permissions or ACLs** so that:

**Users from `group1` can:**
- Read, write, and execute inside `/data-storage`
- But cannot delete or modify files created by other users of the same group

**Users from `group2`:**
- Should have no access (no read, write, or execute) to `/data-storage`

*Hint: Consider using group permissions, sticky bit, or ACLs appropriately.*

### 🔹 3. Command Access Control

Configure permissions such that:
- Members of `group1` can execute the `date` command
- Members of `group2` cannot run the `date` command

*Hint: Explore how command execution permissions, PATH variables, or sudoers configuration can achieve this control.*

### 🔹 4. Validation Requirements

After configuration, validate the following:
- Each user's group memberships
- Group ownership and permissions of `/data-storage`

**Behavior tests:**
- Each `group1` user can create files inside `/data-storage`
- One `group1` user cannot delete or edit another `group1` user's files
- `group2` user cannot access `/data-storage`
- `group1` users can execute `date`, but `group2` cannot

Provide screenshots or output showing your verification process.

## 🧩 Deliverables

Submit a short report including:
- List of all users and groups created
- Ownership and permissions of `/data-storage`
- Evidence of correct access control (screenshots or output)
- Short explanation (2–3 lines) of how you ensured command access control worked as required