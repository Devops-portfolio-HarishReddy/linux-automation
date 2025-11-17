# 🧰 Linux Automation Toolkit

## 🚀 Overview
A collection of Bash scripts to automate daily Linux admin tasks — monitoring, backups, log rotation, user management, and firewall configuration.

## ⚙️ Features
- ✅ Health monitoring (CPU, Memory, Disk)
- 💾 Automated backups with 7-day retention
- 👥 Bulk user creation via CSV
- 🧹 Log rotation and archival
- 🔐 Firewall hardening (UFW)

## 🧩 How to Use
Clone the repo and give permissions:
```bash
git clone https://github.com/yourname/linux-automation.git
cd linux-automation
chmod +x *.sh

Nice, tomorrow 5 PM means we have enough time but we must be very focused now.
I’ll give you ready-made answers you can almost copy-paste in the interview.

⸻

1️⃣ TCP vs UDP – What to Say

Concept (simple)
	•	TCP = connection-oriented, reliable, slower. Used where data must not be lost.
	•	UDP = connectionless, faster, no guarantee. Used where speed is more important.

Key points
	•	TCP: 3-way handshake (SYN, SYN-ACK, ACK)
	•	TCP: retransmission, acknowledgment, ordered delivery
	•	UDP: no handshake, no retransmission, best-effort
	•	Examples:
	•	TCP → web (HTTP/HTTPS), email (SMTP/IMAP/POP3), SSH
	•	UDP → DNS, VoIP calls, video streaming, online games

Interview answer

“TCP is a connection-oriented protocol. It establishes a handshake before sending data, guarantees that packets arrive in order, and retransmits if something is lost. Because of this it’s reliable but a bit slower.
UDP is connectionless. It just sends packets without establishing a session and doesn’t guarantee delivery. It’s much faster and is used where a few lost packets are okay, like DNS queries, voice and video streaming. For example, browsing a website or sending email uses TCP, while DNS lookups generally use UDP.”

Practice saying this slowly 2–3 times.

⸻

2️⃣ DNS + Records (A, CNAME, MX, TXT, SPF, DKIM, DMARC)

What is DNS?
	•	DNS = Domain Name System
	•	It converts domain names (google.com) into IP addresses.

Important record types
	•	A record – domain → IPv4 address
	•	example.com → 192.0.2.10
	•	CNAME record – alias → real name
	•	www.example.com → example.com
	•	MX record – where to deliver email for the domain
	•	example.com → mail server hostnames
	•	TXT record – text information; used for SPF, DKIM, verification.

Email-specific records
	•	SPF (Sender Policy Framework)
	•	TXT record that lists which mail servers are allowed to send email for the domain.
	•	DKIM (DomainKeys Identified Mail)
	•	Uses public key in TXT record; outgoing mail is signed. Receiving server verifies signature.
	•	DMARC
	•	Policy that tells receivers what to do if SPF/DKIM fail (none / quarantine / reject).
	•	Helps fight spoofing/phishing.

Interview answer

“DNS is like a phonebook for the internet. It converts domain names to IP addresses.
The main records are:
– A record: maps a domain to an IPv4 address.
– CNAME: creates an alias, for example www pointing to the main domain.
– MX: tells which mail servers handle email for that domain.
– TXT: stores text data, and is used for SPF, DKIM, and DMARC.
SPF defines which servers can send mail for the domain. DKIM adds a digital signature to emails which the receiver verifies using a public key in DNS. DMARC uses SPF and DKIM results and defines the policy – for example, reject emails that fail both.”

If they ask “You said MX – what does it do?”:

“MX records decide where an email should be delivered. When I send mail to user@example.com, the sending server checks the DNS MX records for example.com to find the target mail servers.”

⸻

3️⃣ SMTP, IMAP, POP3

Simple roles
	•	SMTP – sending email between client → server and server → server.
	•	IMAP – reading email from the server while keeping mail on server.
	•	POP3 – downloading mail to local device; usually removes from server.

Ports (mention only if asked)
	•	SMTP: 25 (server to server), 587/465 (submission)
	•	IMAP: 143 (plain), 993 (SSL)
	•	POP3: 110 (plain), 995 (SSL)

Interview answer

“SMTP is the protocol used to send emails. When I click send in Outlook or Gmail, the client uses SMTP to push the message to the mail server and then servers use SMTP to relay it to the destination domain.
IMAP and POP3 are used by clients to read email. IMAP keeps the emails on the server and syncs folders across devices – that’s what we normally use on phones and laptops today. POP3 usually downloads emails to one device and can remove them from the server. So SMTP = sending, IMAP/POP3 = receiving.”

⸻

4️⃣ Email Routing Flow (very important)

Explain step-by-step.

**“When I send an email from harish@companyA.com to user@companyB.com:
	1.	My email client connects to smtp.companyA.com using SMTP.
	2.	The sending server looks up the DNS MX records for companyB.com to find the destination mail server.
	3.	The server also checks SPF/DKIM/DMARC for authentication. My domain’s SPF/DKIM are stored as TXT records in DNS.
	4.	Using SMTP, it delivers the email to the MX server of companyB.
	5.	The receiving server stores the email in the user’s mailbox.
	6.	The user reads the email using IMAP or POP3 from their client.”**

If they ask “How would you troubleshoot email not received?”:

“I would first check if the email is in spam or bounced. Then I’d verify DNS – especially MX records – using tools like nslookup or dig. Next I’d check if SPF, DKIM, and DMARC are correctly configured and not failing. Finally I’d check the mail server logs for errors and see if any firewall or spam filter blocked the message.”

⸻

5️⃣ Turn Your Experience into Strong “Current Workflow” Answer

You must be able to say your workflow in 60–90 seconds.

Script for you (memorise and adjust):

“Currently I work with Infosys as a Senior Technical Process Executive focusing on Linux infrastructure. My main responsibility is managing Ubuntu/Debian servers for our client.
I handle OS updates and security patches, monitor system logs using journalctl and /var/log, and check system health using tools like top, ps, and systemctl.
For incidents, I usually get alerts from monitoring tools and then log into the servers via SSH, check services and logs to identify the root cause, implement a fix or rollback, and document the resolution in the ticket within the defined SLA.
Before this, I worked with Tech Mahindra on a Salesforce project where I configured and supported Windows, Mac, and Linux laptops for employees, managed user access via Active Directory, and handled device setup, MFA, and troubleshooting.
My first role in Cognizant was system administration for an e-commerce client, where I monitored Grafana dashboards for production alerts, coordinated with other teams for quick resolution, and pulled daily transaction data from SQL servers.
So overall my workflow is: monitor → analyse logs → troubleshoot at OS/network level → coordinate with other teams if needed → and finally update documentation and close the ticket within SLA.”

This directly matches their JD: system admin + logs + escalation + SLA.

⸻

6️⃣ How to Answer a Typical Incident Question

Question: “Tell me about a critical incident you handled recently.”

Use your Cognizant or Infosys experience. Example:

“In Cognizant, during my ASOS project, we received a high-priority alert in Grafana showing a spike in payment failures on the e-commerce site.
First, I acknowledged the alert and checked application and system logs on the payment servers to confirm it was a genuine issue. I noticed multiple connection timeout errors to the payment gateway.
As an L1/L1.5 engineer, my scope was to collect the necessary logs, check basic network connectivity, and immediately escalate to the payment gateway team. I gathered logs, screenshots of Grafana metrics, and current status and escalated via phone and ticket.
I then kept monitoring until the gateway team fixed a network issue on their side. Once success rate returned to normal, I updated the incident with root cause and impact and closed the alert within the SLA. This incident improved our runbook steps for similar issues.”

⸻

7️⃣ Quick Communication Tips for Tomorrow
	•	Speak slowly, short sentences.
	•	Always structure answers: definition → 2–3 key points → simple example.
	•	If you don’t know a very deep detail, say:
“I haven’t configured that end-to-end yet, but at a high level…” and explain what you know.

⸻

8️⃣ What You Should Revise Again Before 4 PM Tomorrow
	1.	TCP vs UDP (definition + examples).
	2.	DNS + A, CNAME, MX, TXT, SPF, DKIM, DMARC.
	3.	SMTP, IMAP, POP3.
	4.	Email routing flow.
	5.	Your “current workflow” script.
	6.	1–2 incident stories (Grafana alert, Linux server issue, AD/onboarding issue).

⸻

If you want, I can now give you a list of likely direct questions (in bullet form) and short model answers so you can practice them one by one.


Nice, tomorrow 5 PM means we have enough time but we must be very focused now.
I’ll give you ready-made answers you can almost copy-paste in the interview.

⸻

1️⃣ TCP vs UDP – What to Say

Concept (simple)
	•	TCP = connection-oriented, reliable, slower. Used where data must not be lost.
	•	UDP = connectionless, faster, no guarantee. Used where speed is more important.

Key points
	•	TCP: 3-way handshake (SYN, SYN-ACK, ACK)
	•	TCP: retransmission, acknowledgment, ordered delivery
	•	UDP: no handshake, no retransmission, best-effort
	•	Examples:
	•	TCP → web (HTTP/HTTPS), email (SMTP/IMAP/POP3), SSH
	•	UDP → DNS, VoIP calls, video streaming, online games

Interview answer

“TCP is a connection-oriented protocol. It establishes a handshake before sending data, guarantees that packets arrive in order, and retransmits if something is lost. Because of this it’s reliable but a bit slower.
UDP is connectionless. It just sends packets without establishing a session and doesn’t guarantee delivery. It’s much faster and is used where a few lost packets are okay, like DNS queries, voice and video streaming. For example, browsing a website or sending email uses TCP, while DNS lookups generally use UDP.”

Practice saying this slowly 2–3 times.

⸻

2️⃣ DNS + Records (A, CNAME, MX, TXT, SPF, DKIM, DMARC)

What is DNS?
	•	DNS = Domain Name System
	•	It converts domain names (google.com) into IP addresses.

Important record types
	•	A record – domain → IPv4 address
	•	example.com → 192.0.2.10
	•	CNAME record – alias → real name
	•	www.example.com → example.com
	•	MX record – where to deliver email for the domain
	•	example.com → mail server hostnames
	•	TXT record – text information; used for SPF, DKIM, verification.

Email-specific records
	•	SPF (Sender Policy Framework)
	•	TXT record that lists which mail servers are allowed to send email for the domain.
	•	DKIM (DomainKeys Identified Mail)
	•	Uses public key in TXT record; outgoing mail is signed. Receiving server verifies signature.
	•	DMARC
	•	Policy that tells receivers what to do if SPF/DKIM fail (none / quarantine / reject).
	•	Helps fight spoofing/phishing.

Interview answer

“DNS is like a phonebook for the internet. It converts domain names to IP addresses.
The main records are:
– A record: maps a domain to an IPv4 address.
– CNAME: creates an alias, for example www pointing to the main domain.
– MX: tells which mail servers handle email for that domain.
– TXT: stores text data, and is used for SPF, DKIM, and DMARC.
SPF defines which servers can send mail for the domain. DKIM adds a digital signature to emails which the receiver verifies using a public key in DNS. DMARC uses SPF and DKIM results and defines the policy – for example, reject emails that fail both.”

If they ask “You said MX – what does it do?”:

“MX records decide where an email should be delivered. When I send mail to user@example.com, the sending server checks the DNS MX records for example.com to find the target mail servers.”

⸻

3️⃣ SMTP, IMAP, POP3

Simple roles
	•	SMTP – sending email between client → server and server → server.
	•	IMAP – reading email from the server while keeping mail on server.
	•	POP3 – downloading mail to local device; usually removes from server.

Ports (mention only if asked)
	•	SMTP: 25 (server to server), 587/465 (submission)
	•	IMAP: 143 (plain), 993 (SSL)
	•	POP3: 110 (plain), 995 (SSL)

Interview answer

“SMTP is the protocol used to send emails. When I click send in Outlook or Gmail, the client uses SMTP to push the message to the mail server and then servers use SMTP to relay it to the destination domain.
IMAP and POP3 are used by clients to read email. IMAP keeps the emails on the server and syncs folders across devices – that’s what we normally use on phones and laptops today. POP3 usually downloads emails to one device and can remove them from the server. So SMTP = sending, IMAP/POP3 = receiving.”

⸻

4️⃣ Email Routing Flow (very important)

Explain step-by-step.

**“When I send an email from harish@companyA.com to user@companyB.com:
	1.	My email client connects to smtp.companyA.com using SMTP.
	2.	The sending server looks up the DNS MX records for companyB.com to find the destination mail server.
	3.	The server also checks SPF/DKIM/DMARC for authentication. My domain’s SPF/DKIM are stored as TXT records in DNS.
	4.	Using SMTP, it delivers the email to the MX server of companyB.
	5.	The receiving server stores the email in the user’s mailbox.
	6.	The user reads the email using IMAP or POP3 from their client.”**

If they ask “How would you troubleshoot email not received?”:

“I would first check if the email is in spam or bounced. Then I’d verify DNS – especially MX records – using tools like nslookup or dig. Next I’d check if SPF, DKIM, and DMARC are correctly configured and not failing. Finally I’d check the mail server logs for errors and see if any firewall or spam filter blocked the message.”

⸻

5️⃣ Turn Your Experience into Strong “Current Workflow” Answer

You must be able to say your workflow in 60–90 seconds.

Script for you (memorise and adjust):

“Currently I work with Infosys as a Senior Technical Process Executive focusing on Linux infrastructure. My main responsibility is managing Ubuntu/Debian servers for our client.
I handle OS updates and security patches, monitor system logs using journalctl and /var/log, and check system health using tools like top, ps, and systemctl.
For incidents, I usually get alerts from monitoring tools and then log into the servers via SSH, check services and logs to identify the root cause, implement a fix or rollback, and document the resolution in the ticket within the defined SLA.
Before this, I worked with Tech Mahindra on a Salesforce project where I configured and supported Windows, Mac, and Linux laptops for employees, managed user access via Active Directory, and handled device setup, MFA, and troubleshooting.
My first role in Cognizant was system administration for an e-commerce client, where I monitored Grafana dashboards for production alerts, coordinated with other teams for quick resolution, and pulled daily transaction data from SQL servers.
So overall my workflow is: monitor → analyse logs → troubleshoot at OS/network level → coordinate with other teams if needed → and finally update documentation and close the ticket within SLA.”

This directly matches their JD: system admin + logs + escalation + SLA.

⸻

6️⃣ How to Answer a Typical Incident Question

Question: “Tell me about a critical incident you handled recently.”

Use your Cognizant or Infosys experience. Example:

“In Cognizant, during my ASOS project, we received a high-priority alert in Grafana showing a spike in payment failures on the e-commerce site.
First, I acknowledged the alert and checked application and system logs on the payment servers to confirm it was a genuine issue. I noticed multiple connection timeout errors to the payment gateway.
As an L1/L1.5 engineer, my scope was to collect the necessary logs, check basic network connectivity, and immediately escalate to the payment gateway team. I gathered logs, screenshots of Grafana metrics, and current status and escalated via phone and ticket.
I then kept monitoring until the gateway team fixed a network issue on their side. Once success rate returned to normal, I updated the incident with root cause and impact and closed the alert within the SLA. This incident improved our runbook steps for similar issues.”

⸻

7️⃣ Quick Communication Tips for Tomorrow
	•	Speak slowly, short sentences.
	•	Always structure answers: definition → 2–3 key points → simple example.
	•	If you don’t know a very deep detail, say:
“I haven’t configured that end-to-end yet, but at a high level…” and explain what you know.

⸻

8️⃣ What You Should Revise Again Before 4 PM Tomorrow
	1.	TCP vs UDP (definition + examples).
	2.	DNS + A, CNAME, MX, TXT, SPF, DKIM, DMARC.
	3.	SMTP, IMAP, POP3.
	4.	Email routing flow.
	5.	Your “current workflow” script.
	6.	1–2 incident stories (Grafana alert, Linux server issue, AD/onboarding issue).

⸻

If you want, I can now give you a list of likely direct questions (in bullet form) and short model answers so you can practice them one by one.
