#!/bin/bash
# Setup your compliance environment for quick access to the relevant WebPKI compliance
# docs that we're beholden to.


git clone https://github.com/letsencrypt/cp-cps/ letsencrypt-cp-cps \
    || { cd letsencrypt-cp-cps; git pull; cd -; }

git clone https://github.com/apple/apple-root-program \
    || { cd apple-root-program; git pull; cd -; }

git clone https://github.com/mozilla/www.ccadb.org \
    || { cd www.ccadb.org; git pull; cd -; }

git clone https://github.com/GoogleChrome/CertificateTransparency chrome-root-program-ctpolicy \
    || { cd chrome-root-program-ctpolicy; git pull; cd -; }

git clone https://github.com/mcpherrinm/rfc-mirror \
    || { cd rfc-mirror; git pull; cd -; }

git clone --no-checkout https://github.com/MicrosoftDocs/security microsoft && {
    cd microsoft
    git sparse-checkout init --cone
    git sparse-checkout set security-docs/trusted-root
    git checkout main
    cd -
    } || { cd microsoft; git pull; cd -; }

git clone --no-checkout https://github.com/GoogleChrome/chromerootprogram chrome-root-program && {
    cd chrome-root-program
    git sparse-checkout init --cone
    git sparse-checkout set content
    git checkout main
    cd -
    } || { cd chrome-root-program; git pull; cd -; }

git clone --no-checkout https://github.com/cabforum/servercert brs && {
    cd brs
    git sparse-checkout init --cone
    git sparse-checkout set docs
    git checkout main
    cd -
    } || { cd brs; git pull; cd -; }

git clone --no-checkout https://github.com/mozilla/pkipolicy mozilla-root-program && {
    cd mozilla-root-program
    git sparse-checkout init --cone
    git sparse-checkout set rootstore
    git checkout master
    cd -
    } || { cd mozilla-root-program; git pull; cd -; }

git clone --no-checkout https://github.com/cabforum/netsec && {
    cd netsec
    git sparse-checkout init --cone
    git sparse-checkout set docs
    git checkout main
    cd -
    } || { cd netsec; git pull; cd -; }

cat << 'EOF' > CLAUDE.md
# Project Context

This directory contains various standards and policy documents related to the
Web PKI (Public Key Infrastructure), especially as they pertain to the
day-to-day operations and compliance obligations of the Let's Encrypt
Certificate Authority.

Policy documents are in Markdown format within individual git repositories.

## Key Directories and Files

- `letsencrypt-cp-cps/` - The Let's Encrypt Certificate Policy / Certification Practice
  Statement (CP/CPS) repo
  - `letsencrypt-cp-cps/CP-CPS.md` - The current Let's Encrypt combined CP/CPS
- `rfc-mirror/` - A mirror of available RFCs and errata relating to those RFCs. Use this
   instead of going out to the internet unless absolutely needed.
- `apple-root-program/` - The Apple Root Certificate Program repo
  - `apple-root-program/policy.md` - Apple's current policy
  - `apple-root-program/ct/ct-policy.md` - Apple's current policy pertaining to
    Certificate Transparency requirements on TLS certificates issued by CAs
  - `apple-root-program/ct/ct-log-program.md` - Apple's current policy
    pertaining to the operation of public Certificate Transparency logs
- `chrome-root-program/` - The Chrome Root Program repo
  - `chrome-root-program/content/index.md` - Chrome's current policy
  - `chrome-root-program/content/apply-for-inclusion.md` - Instructions and
    requirements around applying for inclusion
  - `chrome-root-program/content/policy-archive/` - Historical versions of
    Chrome's policy
- `mozilla-root-program/` - The Mozilla Root Store repo
  - `mozilla-root-program/rootstore/policy.md` - Mozilla's policy
- `microsoft/` - The Microsoft Trusted Root Program repo
  - `microsoft/security-docs/trusted-root/Program-Requirements.md` - Microsoft's current policy
  - `microsoft/security-docs/trusted-root/new-ca-application.md` - Instructions
    and requirements around applying for inclusion
  - `microsoft/security-docs/trusted-root/Incident-Reporting.md` - Instructions and
    requirements around reporting a compliance- or security-related incident
- `www.ccadb.org/` - The Combined CA Database (CCADB) repo
  - `www.ccadb.org/policy.md` - The current CCADB policy
  - `www.ccadb.org/cas/incident-report.md` - The current CCADB Incident
    Reporting Guidelines (IRGs)
  - `www.ccadb.org/policy_archive/` - Historical versions of the CCADB policy
  - `www.ccadb.org/incident_archive/` - Historical versions of the CCADB IRGs
- `brs/` - The CA/Browser Forum's Server Cert Working Group repo
  - `brs/docs/BR.md` - The TLS Baseline Requirements (BRs) that all CAs
    issuing TLS certificates must follow
- `netsec/` - The CA/Browser Forum's Network Security Working Group repo
  - `netsec/docs/NSR.md` - The Network and Certificate System Security
    Requirements (NCSSRs or NSRs) that all CAs issuing TLS certificates must
    follow
- `chrome-root-program-ctpolicy/` - The Chrome Root Program's Certificate
  Transparency repo
  - `chrome-root-program-ctpolicy/ct_policy.md` - Chrome's current policy pertaining
    to Certificate Transparency requirements on TLS certificates issued by CAs
  - `chrome-root-program-ctpolicy/log_policy.md` - Chrome's current policy
    pertaining to the operation of public Certificate Transparency logs

## Notes

Ignore `brs/docs/NSR.md` in favor of `netsec/docs/NSR.md`.

Despite being focused on how CAs should present and submit metadata and audit
documentation to CCADB, the CCADB policy also contains some normative
requirements about certificate contents and issuance practices. Make sure to
consult it alongside the root program policies and the BRs.
EOF
