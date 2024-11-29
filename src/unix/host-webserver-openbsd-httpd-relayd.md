date: 2024-11-30
title: Host websites with OpenBSD httpd and relayd

## Introduction

The post try to describe how to run your own website on OpenBSD VPS with built-in tools
- `httpd`
- `relayd`
- `openssl (LibreSSL)`, do not be confused it is not a SSL, but TLS
- `acme`

I am absolutely beginner so there could be some mistakes. Do not repeat all steps blindly. Main purpose of this guide
is to understand how things works.

I can recommend these resources to start with `httpd` and rest if you are beginner:

**Books**:

- [Michael W Lucas - Httpd and Relayd Master (ebook)](https://www.tiltedwindmillpress.com/?product=httpd-and-relayd-mastery) I really love which Mr. Lucas write books about BSDes OSes. There is maybe not everything, but it helps you to understand the whole concept. The book is from 2017, but it still enough updated in 2024.

**Web**:

- [Tales mbivert: openbsd with httpd, acme, self-signed certificate, lets encrypt, relayd](https://tales.mbivert.com/on-letsencrypt-on-openbsd/)
- [BSDHowTo: how set webserver with openbsd](https://www.bsdhowto.ch/webserver.html)
- [Roman Zolotarev: set up httpd](https://romanzolotarev.com/openbsd/httpd.html)
- [Roman Zolotarev: set up https with acme](https://romanzolotarev.com/openbsd/acme-client.html)
- [Roman Zolotarev: set up http headers with relayd and acme](https://romanzolotarev.com/ow.html)
- [OpenBSD with acme and Let's encrypt](https://obsd.solutions/en/blog/2022/03/04/openbsd-acme-client-70-for-letsencrypt-certificates/index.html)
- [tumfatig.net: How relayd works](https://www.tumfatig.net/2023/using-openbsd-relayd8-as-an-application-layer-gateway/)
- [dev.to: How to set self-signed certificate with LibreSSL](https://dev.to/techschoolguru/how-to-create-sign-ssl-tls-certificates-2aai)
- [dev.to: How SSL/TLS works](https://dev.to/techschoolguru/a-complete-overview-of-ssl-tls-and-its-cryptographic-system-36pd)


When I've started with learning how to run `httpd` correctly I have these questions in my head:

- Why do guides on the internet setup `httpd` server domain also with and without `www` prefix?
- Can I host webserver without domain? Server can be reached only with IP address.
- How to correctly split several sites with one public IP address? Setup server location or setup several server?
- Do I need certificate or it is OK running just HTTP?

I have one VPS running on [OpenBSD.amsterdam](https://openbsd.amsterdam/) with one IPv4 and one IPv6 address.

## What protocol should I support for websites (HTTP, HTTPS)

When you want to host a websites I mean just static sites, then there are two main protocols you will meet HTTP and HTTPS. There are other like GOPHER or GEMINI, but they are not so common in daily browsing the internet. Honestly I want to try them some day, but it makes sense to fully understand HTTP and then start with other less used.

HTTP and HTTPS are related. HTTPS is just HTTP with SSL/TLS, currently with TLS. SSL is predecessor of TLS. SSL is considered as unsecure today, it should be used only TLS. Last version of SSL was deprecated in 2015. Curentle up to date version of TLS is 1.3
I have to used HTTPS if I want to host only static sites with html content with no login, no sensitive data, ...
Yes you should, because even though you send data which have not to be encrypted there other reason why it is not good idea to host your site only on HTTP protocol:
1. HTTPS respective TLS is not just about protecting **CONFIDENTIALITY** (data encryption), but also about protecting **AUTHENTICITY** (verifying communicating parties, parties are usually the client - server). TLS ensures that you are communicating with the right server and not with the fake one. Last protection is **INTEGRITY**, TLS checks MAC - message authentication code to verify that the sent data were not altered. There are real examples where lack of TLS caused injection of ads to your site or injection of malware byt MITM (man in the middle).
2. Your users might not want that every network they traverse will know exactly which pages they are viewing. So TLS is protecting your users from sniffing by others.
3. Even a static site can have areas which require a link to access.

The main advantage to use TLS are
1. Confidentiality
2. Authenticity
3. Integrity

We lose the standard level of security if we use just HTTP. It is not recommended to use only HTTP.

Thanks to [kasperd](@kasperd@westergaard.social) to point out me on these points above, which I did not realized.

There is little confusion on OpenBSD with TLS and SSL, because OpenBSD uses project `LibreSSL` where one his utility is command `openssl`, despite of these names none of them use SSL. `LibreSSL` is fork of origin `OpenSSL` and uses TLS

## Do I need to use domain or IP address is enough

There are many reasons why you should use a domain name.

If we want to use TLS then we need domain. The easiest and free validation your site certification with some CA (certification authority) is validation with CA called [Let's encrypt](https://letsencrypt.org/). [Let's encrypt](https://letsencrypt.org/) is used for many hobby sites and it is supprted by `acme` builtin tool on OpenBSD. [Let's encrypt](https://letsencrypt.org/) validate only certificate with domain not IP address. You can validate certificate to IP address by yourself with self-signed certificate, but this is not recommended. You will not be listed in browser as CA so your users will get a big warning of untrusted certificate when they visit your site for first time, then they need to save your certificate to not get warning again, but if you revoke your certificate then they have to proceed again. It can be problem especially for user who has no idea about certificates, HTTPS and so on.

Anyway I think that usage of self signed certificate to IP address is good idea for learning purpose and before you obtain the domain you can try your settings with https.

At some point the IP address may need to change. You change provider of VPS because of services or you want to use another platform which current provider can not handle and so on. Then will be a lot easier to manage if you are using a domain name and just need to update a DNS record. Otherwise you will have track down every link to the IP and update them. Some of those may exist in users bookmarks, which will be difficult for you to update.

Using a domain name with DNS means you can add redundancy as needed. If there multiple DNS records pointing to different IP addresses a browser will try them in turn. You can't get that kind of redundancy with a hardcoded IP address.

Even if the site has no redundancy it will not be sufficient for you to remember one IP address. You will need to remember both the IPv4 address and the IPv6 address.

### How to obtain a domain

Now it should be obvious that ideal path to host website is with TLS and hosting stable website for long period of time is convenient with domain.

I know two reliable ways how to get domain for purpose of hosting website:
1. Buy domain from some domain name registrar. If you buy a domain name then usually you can add several subdomains for free.
2. Obtain subdomain for free from shared domain via [FreeDNS](https://freedns.afraid.org/), [EU.org](https://nic.eu.org/), these two seems to me trusworthy, but do your research on your own. There is another like [noIP](https://www.noip.com/)

Finally set your IP address to your domain.

## Setup httpd

If you have no experience with setup webserver as for example `nginx` or `apache` then just play with that.

I created some scenarios for playing as homework to be sure how really `httpd` works, you can follow it if you want.

1. to practice how httpd server <name> works, try to make two servers first with some dummy name, and second server where the name will be your IP address, if httpd will not match any server it should take the first hence the server with IP adress should be second and nonsense name first one. You will try if server match also the IP address and if it is true that if there is no match the first server is taken.

```
# /etc/httpd.conf
server "noexistname" {
    listen on * port 80
    root "/htdocs/first_server"
}

server <your.ip.addr.ess> {
    listen on * port 80
    root "/htdocs/second_server"
}
```

Create some files in directories to know which server match.

```terminal
echo "first" | doas tee /var/www/htdocs/first_server/index.html
echo "second" | doas tee /var/www/htdocs/second_server/index.html
```

If you setup everything correct, then the second one with the IP should be loaded to your browser.
Then change the IP address to some unreachable name as "noexistnamesecond" or "secondhello" whatever and
refresh page and the first one should be loaded. If not try hard refresh the site probably cached to your browser and serves you the last version and not the new one.

