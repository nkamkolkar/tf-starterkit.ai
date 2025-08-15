## PRIVATE PUBLIC SYNCH INSTRUCTIONS 

-----

### 🍴 Fork Management Cheat Sheet

This guide explains how to keep your private fork up-to-date with the original `n8n` public repository while managing your local changes.

#### **1. Verify Your Remotes**

First, check that your remotes are set up correctly. You should have two remotes:

  * **`origin`**: This points to **your private fork** where you push your changes.
  * **`upstream`**: This points to the **original public repository** where you pull updates.

To check your remotes, run this command in your local project directory:

```bash
git remote -v
```

You should see output similar to this:

```
origin	https://github.com/nkamkolkar/trainingfoundry.ai.git (fetch)
origin	https://github.com/nkamkolkar/trainingfoundry.ai.git (push)
upstream	https://github.com/n8n-io/self-hosted-ai-starter-kit.git (fetch)
upstream	https://github.com/n8n-io/self-hosted-ai-starter-kit.git (push)
```

If the `upstream` remote is missing, add it with this command:

```bash
git remote add upstream https://github.com/n8n-io/self-hosted-ai-starter-kit.git
```

-----

#### **2. Sync Your Fork with the Original Public Repo**

To get the latest changes from the original `n8n` repo, follow these steps. It's recommended to do this often to avoid major merge conflicts.

1.  **Fetch the latest changes** from the `upstream` remote.

    ```bash
    git fetch upstream
    ```

    This command downloads the commits but does not apply them to your local branches.

2.  **Checkout your main branch** and ensure you're in the right place to merge.

    ```bash
    git checkout main
    ```

3.  **Merge the changes** from `upstream/main` into your local `main` branch.

    ```bash
    git merge upstream/main
    ```

    Git will now merge any new commits from the public repo into your local code. If there are conflicts, you will need to resolve them manually.

-----

#### **3. Push Your Local and Merged Changes**

After syncing your local branch with the public repo, you need to push these changes to your private fork (`origin`).

1.  **Push the updated `main` branch** to your private repository.
    ```bash
    git push origin main
    ```

This ensures your private fork is a true reflection of both your local changes and the latest updates from the public repo.
