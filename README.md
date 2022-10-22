# LazyCow

LazyCow is a one step destination to browse dev environment setups by developers across the globe.

```text
            ^__^
            (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## What the heck is this ?

Its your first day at a company and you are already crying over the pandemic, virtual onboarding, pigeons shitting on your car and that you have no clue about your team. The shit gets real,when you have to setup your dev environment too! :disappointed:

```text
 _________________
< I miss my farm  >
 -----------------
        \   ^__^
         \  (--)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
```

## Benefit

Let's get serious and see the benefits

Over time, people have already written scripts to automate most of the setup. This tool can use them and let the newcomers breathe on their first day.

New scripts and updates can be fetched and updated too.

Uses brew internally so its sleek in design and easy to install.

## How to

### install

`brew tap raul1991/lazycow git@github.com:raul1991/lazycow.git; brew install lazy-cow`

### verify

Run `lazycow --moo` in your terminal. It should print the welcome text after successful installation

### update

`brew tap --force-auto-update raul1991/lazycow; brew upgrade lazy-cow`

### search

`lazycow --search dev`

### use

`lazycow dev-tools`

## Want to contribute ?

We are looking forward for more and more atlassian teams getting onboarded to lazycow for automating their developer setups.

Run the following command with your script name and we'll get you started.

```bash
./scripts/scaffold.sh your-script-name
```

## Guidelines

- Use the command above to scaffold your scripts.
- We already install cowsay, lolcat and boxes to prettify your logging. So use them sparingly.
