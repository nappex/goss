---
Title: Transcript of FOSDEM talk NSA operation orchestra
Date: 2022-05-07
Category: Privacy, Networks
Tags: networks, privacy, talk
Slug: NSA-orchestra-transcript-en
Authors: David
Summary: English transcript of FOSDEM talk about NSA habits
Status: published
---

[TOC]

# Introduction
This is text representation of FOSDEM 2014 talk about NSA, privacy and security.

This transcript was came out to facilitate understanding
the video of the talk to people who dont speak english very well.

This transcript was created also because of incorrect automatic english
subtitles available in youtube video.
Sometimes it is really difficult to understand to speaker.
Especially non native speaker audience will have a problem to understand this interesting talk.
But reading the transcript should be help to understand difficult parts.
There is also [Czech](https://nappex.github.io/myblog/NSA-orchestra-transcript-cz) translation of transcript.

## Transcript subject

NSA annual state report by Poul-Henning Kamp (FreeBSD developer) - FOSDEM 2014

video links:

* [youtube](https://www.youtube.com/watch?v=fwcl17Q0bpk)
* [vimeo](https://vimeo.com/86567061)
* [FOSDEM](https://ftp.fau.de/fosdem/2014/Janson/Sunday/NSA_operation_ORCHESTRA_Annual_Status_Report.webm)

presentation links:

* [Poul-Henning Kamp personal page](http://phk.freebsd.dk/pubs/FOSDEM_2014.pdf)

Presentation consist of this main part, thats why is named as orchestra.

**Playlist spoiler**:

* Electric Light ORCHESTRA: Confusion

* ABBA: Money, Money, Money

* Backman Turner OVERDRIVE: Taking Care Of Business

* QUEEN: Bicycle Race

* Beastie BOYS: Sabotage

* PASADENA Roof Orchestra: Pennies From Heaven


# Interview with Poul-Henning Kamp before talk:

Interview with Poul-Henning Kamp.
Poul-Henning Kamp will give a talk about
NSA operation ORCHESTRA: Annual Status Report at FOSDEM 2014.

1. Q: Could you briefly introduce yourself?

    I’m a six foot ape-descendant who makes a living doing weird stuff with computers.
    I’ve been in computing for 30 years and open source for 29.
    I used to be one of the central developers in FreeBSD,
    these days I am the man behind the Varnish HTTP accelerator.

2. Q: What will your talk be about, exactly?

    My talk is about the NSA - FOSS relationship.

    I think we need to reevaluate it.

3. Q: What brought you to this topic, why do you care about it?
    Why is it so important for you to talk about it?

    The inspiration is the disclosures by Edward Snowden,
    but while they have mainly been aimed at the general
    population and politicians,
    there is a different message for the IT world and in
    particular for the FOSS community, but most people seem to miss it.

4. Q: Could you shed some light on the main message you want
    to convey in your talk? If there’s one thing that people
    should remember after your talk, what should it be?

    “Who do you trust, and why...”

5. Q: What do you hope to accomplish by giving this talk? What do you expect?

    I hope that people will laugh and think.

6. Q: What’s the role of FOSS in this age of surveillance
    by the NSA and other shady agencies? Can we fight
    the current privacy crisis with FOSS?

    Those are very good questions, and I hope my talk will inspire people
    to think about and investigate evidence to find the answers.

7. Q: Have you enjoyed previous FOSDEM editions?

    No, I have never been to FOSDEM before.


# Transcript of talk NSA operation ORCHESTRA: Annual Status Report
**Moderator:**

Thank you for joining us we going to have a Poul-Henning Kamp also maybe better known as phk
on annual status report on NSA operation orchestra, welcome.


## Presentation
**Poul-Henning Kamp:**
Thank you.

### Introduction - What it is?
So couple a years ago there was a news item that made me sit up in the chair and think.
It's probably not the one you think about now,
the director of CIA had his love affair exposed by the FBI,
because they trade this telecommunication.
Being a security researcher which is not normally something I called myself.
It is a matter of imagination.
In a situation like that. You need to sit back and try to think like
the minds who did that.

Later on we've got Edward Snowden's disclosures and I sat down and
I thought what would I do if I have budget a 1 billion dollars
and a mandate and order to collect as much communication as possible.

### Operation ORCHESTRA

Then a week ago I got an email from Phillip (some guy from FOSDEM) going like:

"I need a keynote speaker what are you doing next weekend".

And since I owe Phillip a lot of favors I said:

"I can do that"

and then I sat down and made a set of slides.
The basic premise here is that you should imagine
a junior NSA staffer arriving in Brussels to give a update to NATO
on one of the NSA programs and then
because he is American he ends up here instead.

If I had a lot of time I would have done the part you knowthe black hair,
the sunglasses and all that, but you'll just have to imagine that.

So this is Operation Orchestra and this is of course top secret
and none of this will exit this room I am sure.

### ORCHESTRA operation at a glance

So the orchestra operation has as a primary objective to reduce
the cost of gathering information.
NSA has in the law, that controls their funding,
it says collect as much information as possible and as a responsible
government agency we're trying to do that as cost-effectively as possible.

So Operation Orchestra is about reducing NSA cost of collecting information
and all of it has to be above board.
There's no black ops (black operations - see wiki) allowed.
Black ops are where you break the laws. And we have no special authorizations
we have no 007 with the license to wiretap or anything of that sort.

And the means the way we do this is we try to eliminate prevent
of weakening encryption we try to enable access to information
and we try to frustrate players that are trying to make it harder for us.

### History
And the history about....,
This is actually a very old program.
It started out very soon after the escape of the Inter-Net.

The internet was meant for the military
is not meant for grandmother and terrorists and so on. And the big problem
with Internet is unlike the telecommunication network as we knew it
you can plug anything into the internet you don't have to get approval first.
People can build their own computers and hook them up to network.
You couldn't do that with the old telecommunications network.
You went to the FCC and you got a little sticker and all this stuff.

So suddenly we're in this unregulated network.
and there's far too many players in the network.
It used to be we just talk to AT&T who could wiretap anybody.
And they would heavily do that.
Now we have you know millions of Internet networks, and many of them abroad.
We cannot negotiate with all them. We have to find scalable methods
to deal with this.
And our attempt to try to manipulate the outside protocols
in instead of the tcp/ip protocols unfortunately failed.
that would have continued the connection-oriented models of the
telephone network but that didn't work. That was really too bad.

### Orchestra Origin

The original of this is the deep thought working group
which came up with these ideas of trying to gain control
of the key leverage points on the internet.
there's still some places where things really happen.

Influence the process to our advantage and to identify leverage persons,
where low-cost can get a high impact.

### ABBA operation
So one of the new things in operation in the orchestra version
is what we call ABBA operations.

And this is a very old problem.
Some smart inventor will invent something, that makes our life more difficult.

And we don't want that.
So what do we do?

#### Old school
So the way we used to do this is we would try to bribe him,
try to hire him or something.
We would classify his patent.
So he would get a patent but he couldn't show it to anybody.
In some cases we can swear people to silence you know national security,
yade yade (etc.), the president will give you a hand shaking and all this stuff,
but there's a lot of paperwork involved in this and it leaves a lot of traces.
And involves many people. So it's kind of an expensive process.

#### New school
So we've found a new way to do this.
We're using the raw capitalism of the market.
We're simply throwing money at the problem.

So we spot some startup that's going to give us problems.
We read HackerNews and all that stuff of course.

So there's a venture capitalist who contacts them it's like:
"Oh I saw you on HackerNews can I drop by?"

So this dude drops by and you know chats them up and
invites them out for a fancy dinner and you know drops 10k dollars,
get some better chairs or something you know keep me posted right.

Now that he knows what they were up to,
he comes home and we start looking for a good patent.

If we're lucky this patent is already with one of the friends of NSA
and would draw the line to IBM and for their patent lawyers.
And you should look at these guys because that's awfully close to your patent.

And like less not IBM we'll send out a couple of patent lawyers
with lots of patents and that startup will be dead.
Very often they'll even call to the venture capitalist back:
"Oh we sorry..."
So we get feedback we know they're stopped it's wonderful
and it's like 30k dollars.

If the patent is not in, what we call good hands.
We'll obviously try to find a better patent or we'll try
to get it transferred.
There's some very cooperative patent companies out there,
who will go out and buy a patent. So that they can use it on our behalf.

### PASADENA operation
It's a very convenient process.
we've used some of the same to solve another old problem.
We have this problem with people who are working for us
in different situations and we need to reward them.

And this used to be some kind of bogus operation,
you know they would suddenly win the lottery.
Some distant relative would have left them a fortune.
We can not sorry about the Nigerian scam but that's kind of how it started.
People get amazing job offers. Sometimes new identities sort of stuff like that.
And you have to bend a lot of rules to do that.
And it's hard to hide the trails and Google has made this incredibly difficult.
It's like:
"Oh, so you suddenly have this distant relative left...
why can't we find any traces of this person on Google at all?"
It's like: "hmm?!" right.

No. It's much easier today.
"Hey, I quit!".
Then he makes a startup, finds a venture capitalist who dumped
a couple of millions on it.
And then he sits browsing the internet for
a couple of years or whatever he want to do and that's it.
Paperwork is standard there's a tax-form for this, right?

And that's actually one of these do tax I ended up making a company that worked.
That's the point, Ruby.
So this is a way to move money into our objectives.
This is a way we can move money into people that we want to do things.

### OVERDRIVE activities
So in the other end of the scale speaking of money we have what we call the overdrive activities.
This is about influencing bussines decisions.

We used NSA's contracting we rather big purchases of IT services.
And we can pretty much decide,
who we give the order to ourselves.
There's no fair purchasing when it's national security.
And the good thing about contract law is you can do anything.
It cannot be directly illegal,
you cannot have a contract to kill somebody,
but you can do anything that's possible within the law with a contract.

And it's very good mechanism to solve big problems.
The bad news is usually very big players so there's lawyers
and it's kind of expensive and stuff like that.
And that can be some objective screw,
but it's a good way to solve problems
and this is actually how we solved the Skype problem.

#### OVERDRIVE: Skype example
Skype was peer-to-peer encrypted video and audio.
They didn't use standard protocols. They are out of the FTC.
We cannot just say "this is illegal" and get them banned.
It's not open source and they did not buy it on our attempt to right them.
It's very popular with independent actors,
human rights groups in Belorusssia for instance.

It's also very popular with a political movements
adverse to the US course in Middle East.
And of course terrorists use its we're absolutely sure.

So first we partnered with eBay which is a very special friend of NSA.
For some minor considerations and foreign intelligence they bought Skype for us.
Unfortunately they bungled it, they bought only the access to Skype.
They didn't get the source code they didn't get control with the network.
So that's sort of like "prkk".

It's unclear why their lawyers were not briefed, but we didn't get what we want.
So we had to try again but we can't do that while eBay is sitting there.
So we get eBay to sell it again at a loss
and now they're not quite as good a friend of NSA.
We're working in that relationship.
So we've got Microsoft to buy it instead and this time they got all of it.
Microsoft has now changed the architecture of Skype to be centralized.
Now Skype goes through Microsoft servers very convenient,
where it will be decrypted if need be.
That was a pretty expensive operation, but it was necessary.
We couldn't have people communicating outside our jurisdiction.

#### OVERDRIVE: Summary
So it's a very big hammer.
It requires signatures very high above my pay level,
but it's a very good way to do things.
And one of the interesting things here is some of these big players
no matter what they do it's brilliant.
We don't understand this but it's brilliant.
It doesn't make sense but it's brilliant, because he's a genius we know that.
So you can do pretty strange things this way, totally in the open,
nobody blinks an eye, we like that.

### QUEEN activities
Then we have the Queen activities and this is we're working this a lot.
So open source and the internet as such is a consensus-based activity,
which means anybody can participate.
Nobody has special authority.
There may be some people, who are you know the first among equals
yade yade kind of thing, but it's not like there's somebody,
who has a the letter of the law on his back and can say:
"I say because law number bla."

It's very much rough consensus and working code
except it's these days it's more very long elaborate standard
not very much working code.
And there's a heavy international participation which means
that you cannot appeal to people's patriotism you can't say:
"for the good of the country you have to..." It doesn't really work.
That's a very significant talent mass which is a problem,
because they will spot things.

In theory all of this belong under the Secretary State,
because these are foreign relations in many cases,
but Foggy bottom is not really that tech-savy once it comes to it.
Diplomats have absolutely no traction then setting like the IETF.
If you come in with a tie they can looks strange on you.
And our goals not already ...... it's,
they may be misaligned to the Secretary State's goals.
And there are other players (DoC, NIST, DoD, FBI, CIA)
involved in this also which we are not necessarily
agreeing with in all kind of things.
So it's kind of a tricky space.

So what we do is we leverage our existing resources.
We have web resources embedded with friends of NSA.
We have free agents, people who will do things for a consideration.
And we have what we call witless volunteers people,
who can be manipulated to do our bidding without
ever paying them anything for it.
It's very good there's no traceability.
So what we do is we deploy very carefully designed talking points.
Meanness if we can.
We have a department, who have that put a sign
on their door saying "PSYOPS for nerds".
And the idea is to steer discussions in these forums
to or from particulars topics where we want them.
And in general very often to disrupt consensus building
that goes against our purposes.

#### QUEEN: success example SSC
So self signed certificates in browsers is a very good example.
So a self signed certificate is a certificate I make that says this is me.
So it doesn't really authenticate me an innocence of the world,
but if I have that on my web server you can take your browser
and we can establish a secret channel.
That's not very good for us because we will have to spend very expensive
resources decrypting that if we ever need to.
But it's practically free for people to do this.
The only reason why people are not doing this is,
because we really don't want them to.
It would be obvious to be a default on Apache
just always do a self signed certificate if that's not a real certificate.

So we have spent a lot of time on this room.
And some of the talking points you've no doubt hurt these is like
"Oh but secrecy without authentication is pointless,
you might be talking to the NSA and you wouldn't know it" right.

We like that one, we're proud of that one.
"It gives a false sense of security." right
The point is these kind of things if you tailor them carefully,
they speak to people's political leanings.
If people are slightly paranoid to begin with,
which is what a lot of security people are.
This is like:
"Yeah no that wouldn't do it, if I don't have a 2048-bit ironclad guaranteed
that I know who's on the other end, then it's no good."

So today if you try to go into a web server that has itself signed certificate,
you get these hideous warning like:
"Oh you shouldn't do that, this is dangerous are you really sure you know
what you're doing, do you have a PhD in this?"
And the more buttons you press the more warnings should get, right.
By now grandmother and terrorists are totally turned off, right.
And that's one thing in this, some of our predecessors
we really loved them getting certificates to be x.509 that was so brilliant.
Have you ever tried looking at all this stuff that's in certificate,
nobody understands a word of it.
So it's like: "No, I don't understand this, get me out of here"

This is a very good example of how the Queen program works.
Simply getting people to not do things by miss directing their attention on it.

#### QUEEN achievements
So among the other thing we've done in the Queen is
that there's no multihome routing (multihoming) without having your own AS number.
That means we can always find where all your traffic goes
because it always goes through your ISP.
We don't need to track you around seven different sides and stuff like that.

There's also no flow routing in IP version 6.
When IP version 6 were proposed there was a very intelligent proposal,
that said we shouldnt slam these speak addresses into all the packets,
we'll just do it in the first packet.
And then we'll get a small float number,
that says all the packets in this flow go that direction,
but that would be very inconvenient for us,
because we would have to track all these flow numbers all the time.
When you have the IP numbers in package you can just grab all the packets
and you have all the information you need for all time in those packets.
You don't need to have all the flow states
and know what the flows means in all the end
that was a very big success not that IP version 6 was it's not really a big problem for us yet.
Collection wise, but we prepared shoot IP version 6 off.
We've also made it so that there's practically no way compatibly to send
encrypted email.
Everybody does down where you have to have the same program in both ends,
because otherwise it doesn't work and the result is nobody ever uses it.

And we've managed to delay voice over IP until Skype happened.
The voice over IP is a big problem,
because you cannot automatically search through voice data.
It's a lot easier when people send emails
you can just look for patterns and stuff like that.

So these are some of very big successes in the Queen program.

#### QUEEN recent work
Recently we're working on the HTTP 2.0 standard.
They want there's a very big contingent they wants everything to be TLS,
which would be inconvenient.
We're trying to misdirect that we're trying to screw up that process.
I mean look at the good side if would bring them into TLS,
we have all the rooted CA's (certificate authorities) doing a job for us.
So we have all the keys if it comes to
that we give man in the middle and all that stuff.
We prefer to stay on encrypted if we can.
As a fallback we're trying to push them to some of the broken by design protocols.
Unfortunately one of them seem to have been exposed now,
but we're working on getting new ones launched.
That's not our department we just try to push people into that sort of thing.

#### QUEEN methods
The methods we use is basic fear, uncertain and doubt,
if you're uncertainty and doubt.
Playing with the GPL versus BSD card still works, it's wonderful.
It's like: "Do they never get tired of that?"
Yeah that's some wonderful crypto code,
but I know we can't use it for licence reasons.

Bikeshed discussions (means endless discussion, the terms was invented by phk
[check his article](http://phk.freebsd.dk/sagas/bikeshed/#the-bikshed-email)),
it's so wonderful.
Sometimes just one single email from an anonymous person
can derail an open-source project for months.

And we can soak up immense amount of cryptographers bandwidth
with bogus proposals for cryptography.
You sent this proposal saying
"oh I found this wonderful way to do"
and they spent like a month tearing it apart, instead of doing real work.

#### QUEEN recent work
So that works for the world.
One of the current focus areas is that there's a push
to go from the certificate PKI model to DANE
which is getting your certificates approved through DNS.
And this is a cost brought on by the fact that people
realizing that everybody has compromised the CA/PKI system.
I mean, if you look in your browser there's like 200 approved CA's
and half of them are owned by secret services throughout the world.
It's sort of pointless at this point, right.

So people want to move that into what's called the DANE protocol.
And the idea here is you validate the certificate using the DNSSEC.
So you have this signature on the root zone and that signs the next one
and signs next one of the signs next one that says my server has this certificate.
So you can trust that now, you only trust this one single key, right.
So the advantage of PKI/CA is of course we have access today,
but the DANE project would really like that,
because now we only trust one single certificate, right.
"Nudge, nudge, wink wink he said knowingly ....".

And even the best part about this is I don't understand how these supposedly
professional people can overlooked.

DNS is UDP.

It's much easier to do a packet-race with UDP than with TCP.
They send a DNS request you aren't to come first, done.

### BOYS - A special gift
This is another interesting program we're working on.
It's actually inspired by a field accident.
We had to evacuate a high risk and high-quality resource
and we had no facilities nearby his location that could be used.
So we set him up as a independent contractor.

Story was you know tired of the Boss and yade bad company politics yade yade...
I'm stuck for himself and so on.
And I was lucky to find some customers and so on.
And while sitting there he spent some time on some open source projects...
he had to do something.
He spotted some opportunities for groundwork.
So most open-source projects are based on trust.

There's no formal vetting,

there's no checking people's resumes,

there's no checking, if they're really who they say they are.

It's like:

"Oh I'm this dude who sits in Ulaanbaatar and here's some patches".

And if you send good patches for some years people will start to trust you
and not check your patches and that will give you a "commit bit",
so you can add them yourself, because that's really much easier.
It's a fantastic environment that people can come in
and announcly nobody knows that you're a dog or NSA agent.
So not only can you collect information about the project's interiors by that way.
Once the trust is in place, you can start to influence their code.

So perception is an easy thing to get right here it's like:
"Yeah, you know I'm sysad of this nonprofit thing and as long
as email works and the printers print."
It's all humming I mean I'm sitting here seven hours a day doing not a shit.
And "okay, cool."
Here's a dude and his time and he's delivering a good code we cool with that.
And one of the things we found out here is would actually can do.
In reality this is one of our people, right.
And he's sitting somewhere in a shop front that looks like
it's this nonprofit thing for you know stopping,
I don't know, oak trees falling over or whatever it is.
Actually that's our neighbors who has this kind of shop-front.
And then need somebody to get the computers to work in this little
stealth setup they have.
And we need to have an Internet and a desk for our man,
so it's very convenient that. And the bosses can actually claim:
"Oh we're doing cooperative work and we're saving money" and stuff like that.
It's really really really well.

And of course, you cannot go in and add obvious vulnerabilities to source code.
People would spot that. It has to be more subtle than that.

Programming mistakes.
you know the careless, semicolon yade, yade serial one based error is,
all these classics.
It's kind of dangerous to do it yourself.
It's best to say:
"Oh I got this patch and I look at it and it looks okay and you stick that in."

People will start to notice if your own code quality sucks,
but if you accept patches which are not you know quite up to standard.
Everybody can have a bad day.

So, in general obfuscating the code making it harder to understand
critical bits of the code makes it easier to make it,
almost do what it was supposed to do.

Misleading documentation is always a wonderful thing particular
for crypto sensitive stuff.

And deceptive defaults so that things don't do what people think.

It doesn't have to be the core code.
It doesn't have to be the operating system kernel.
In FreeBSD there's 20,000 packages of software.
There are built using, you know.
There're some patches needed for FreeBSD yade, yade,
okay builds and you have a package.
Nobody ever looks at those patches.
Who ever ported this piece of software does these patches,
it takes the packaging and that's it, it's never reviewed.
It maybe, if it's set "setuid" program somebody may look at it,
but in general nobody has ever looked at all the patches
in the FreeBSD ports collection.

They should.

So this is our poster boy.
The Debian random number generator.
This is really beautifully executed.
There's dude who sends in the Patch set you know.
This gets Valgrind to complain
and I can't see does anything sensible you should just remove it.
And they did.
So for two years, all the debians had lousy random numbers,
which made you know brute-forcing SSL keys and stuff like that, done.

Here end up a pretty good bonus.
OpenSSL is the crown jewel.
OpenSSL is a standard library if you want crypto.
Getting SSL to work against all browsers
and all that stuff without using OpenSSL is very very tricky.
Reading the OpenSSL manuals or source code is not tricky
that's close to impossible.
And that's three hundred thousand lines of code.
So good luck with that.
The documentation is deficient and misleading.
And the defaults are deceptive, they don't do what do you think they do.
This saves so much money in collection you have no idea.

### Operation ORCHESTRA current status
So the overall status of operation orchestra is,
it's a resounding success we spend less than a third of the percent of the NSA budget.
And it probably cost the collection cost by something like 50%.
It's kept most of the Internet in plaintext.
And has never been exposed.
That was snowden has no papers on Orchestra at all.
You're not going to read about this in the Guardian,
because it's all buried in boring departments.

Operation overdrive that's in purchasing.

BOYS that's facility management.

ABBA and Pasadena that's Personnel, he didn't have access to any of that.

Thank you!


### Epilog
So the standard reaction in the open source environment to
it would Snowden's disclosures, have been:

"We need to strengthen the protocols. We need to have SSL everywhere."

And I think that misses the point by a large margin.
The things that have been published of the Snowden documents by now is
the thing the general public can understand reading their newspaper.
The stuff we would be interested in have not been published and maybe never will.
And adding more attempting to add more encryption is most likely
just going to have more broken encryption on the internet.
This is not a technical problem, this is a political problem.
It must be solved by political means.
That means find politicians in your country,
who can understand this and make sure they understand it.
If you cannot find politicians get you some politicians who can understand it.
Political will is a renewable resource use your pencil,
when you vote or run yourself.
This is your children and grandchildren's future society you're looking at.
And we're the guys who sort of miss the boat.


## Q&A SECTION

There's a time for questions, if anybody want.
We are going to take questions and afterwards FOSDEM staff will perform the closing talk.
So please don't go away.

Could ask anybody that's leaving to trying to keep a quiet, Q&A is going on.

1. **Question**: So one of the biggest security leaks for the OpenSSL for instance
    is actually their documentation and all the stuff,
    people generally say like: I'd rather be coding?

    **Answer:**

    Yes. Yeah I mean OpenSSL is a catastrophy in my eyes.
    And should be thrown out and started from scratch,
    written in a readable style and documented.

2. **Question**: Yeah, I found your last remark very interesting referring
    to politics and especially in FOSDEM. Well we had this a little
    encounter where it was about politics and FOSDEM and then the
    reaction was like "no no no politics it's FOSDEM it's only about
    open source but how would you feel about that the relationship
    between open source and politics apart from what you
    just said in the end.

    **Answer:**

    I have the same feeling about it I have about global warming.
    It may be that the open source community doesn't believe in
    politics that doesn't mean politics doesn't apply to them.
    So you can ignore politics, but the politics will not ignore you.


3. **Question**: Thank you for your awesome presentation.
    I might have been experiencing with friends some of those situations.
    I just wonder about the OpenSSL bit, if it's your guess because
    maybe there is a little bit of guessing or.
    And I wonder if we should really start having some
    investigations ourself as the open source community into these cases.
    Maybe in the OpenSSL case there is no malignity intended
    I'm not sure where you got your analysis.

    **Answer:**

    Show me.


4. **Question**: Yes, thank you very much for the presentation.
    Very interesting, very inspiring for the NSA wannabes.
    You mentioned that some of the Snowden documents may never be leaked
    those are your exact words.
    Why do you think that? Why do you think that the largest leak
    in basically human history at this point, could go quietly under
    wraps and people will forget about it? Why?

    **Answer:**

    Three reasons:

    *One of them is* - that Glenn Greenwald is a very responsible person.
    So there's undoubtedly stuff in there that he will not publish because
    there would be too damaging for whatever reason.

    *Second* - some of them will be so technical that he will not be able
    to explain them to the readers of The Guardian, much
    less other newspapers and.

    *Third* - because I think USA is getting ready to make a deal with
    Snowden to stop the flow. This has been Chinese water torture
    for them.
    Every time they've said something in public one week, two weeks later
    Snowden document come out showing they're lying.
    And I think they're kind of tired of that now.
    So I would be surprised if there is not already known
    negotiations going on for terms that will allow Snowden
    to return to the USA in return for the flow of documents to stop.
    And what the terms will be we'll probably never known.

    I presume at some point the documents will just stop and we'll never
    hear from Snowden again.
    So I don't think they'll have time to leak all of it,
    however much it is not that NSA might know.
    I mean that's the aspect of this that,
    I think is most interesting is that NSA has absolutely
    no idea what's going on.
    They know that 4,000 of their employees and contractors have used
    that data to check up on their love interests, but they know
    this because people have volunteered the information
    they don't know it because they have like locked files or anything
    showing it.
    So it's a totally leaky bucket with no idea what they're doing.
    That should be the real scandal.
    They're not competent.


5. **Question**: Well first of all, thanks for a great talk.
    I would like to ask, answer you, what is the level on the European
    level, not just politics in the the countries, but on the European level.
    We saw that was it CIA or NSA hacking into until Americans mobile phone.
    So I don't know where veto stand there?

    **Answer:**

    I'm pretty sure that they do not have a public relations
    department that have any influence on that kind of decision,
    but if they had, I'm pretty sure that public relations
    department would said whatever you do, do not hack into Merkle.
    Merkle is the one person in Europe you do not want to spy on,
    because she's from the eastern Germany.
    They would have been better off not knowing what she said in her
    phone than having what came out now.
    I would never have taken that risk if I'd been sitting there.

    The other thing is that I don't think anybody who think they can
    trust the mobile phone, I deceived themselves.
    All mobile phones are controlled by everybody else,
    but the guy who has it in his pocket.
    Same thing goes for iPads, computers, pretty much anything
    I don't think we have many devices where we can say this one
    is by guaranteed not rooted at this point in time.
    That's one place where the European Union could step in.
    They could actually go in and mandate computing platforms
    that can be verified as free from all kind of crap.
    And Angela Merkel is actually a scientist.
    She may get the idea behind this.
    I could hope that she would do something like that and push it
    through the European Union.
    Unfortunately she's kept busy with the economy in southern EU.
    I don't know if she has a time, but a good place to go in
    would be to say the person, who pays for the device controls it,
    only that person.
    And Tell-Telcos and people like that to get the fuck out of
    people's mobile phones.


6. **Question**: So discussing politics I have a very short remark to make.
    Techie people usually believe that we can overcome political
    issues by using technical tools like "oh they are spying
    on us, hmm!? Now we have encryption, we have Tor things like that."

    But that is not actually the question, because of course
    we can avoid being tracked by doing technical stuff.
    But the question rather is: Do we really want to have a society like that?
    And I believe that us as people, who understand
    things more from the technical point of view should help
    the rest of the society the dozens.
    So I think that this really is a political issue so there
    are elections this May in the European Parliament as a matter
    of fact I run for a seat.

    **Answer:**

    I can only agree with that. This is very much a matter of what
    kind of society we leave to our kids.
    Some of the opportunities for goofing around that we had
    our kids will never have without having it pasted all over
    YouTube ten minutes later.
    And I realized this big.
    You start thinking differently once you have kids.
    I have to admit it myself, but I'm pretty sure those of
    you who have kids will see what I mean when I say this
    is about what your grandchildren will live in.


7. **Question**: Hi, very good presentation nerves and impressed.
    So you mentioned the strategy that it's quite easy to disturb
    important open source projects by just creating some discord
    over issues that have been problematic issues for a very
    long time and then like 10 minutes later, you suggest
    ripping OpenSSL out of everything and replacing it with
    something that's a new implementation.
    How is that any different?

    **Answer:**

    Do you think is it really a controversial opinion to think
    that OpenSSL is a pile of crap?

    **Q7 continue...**

    It actually a lot of components in the internet rely on that for encryption.
    So if you rip that out it's not getting any more secure is it.
    It's a controversial issue you just can accepted that.
    And your comment. how's that making anything more secure
    I think this is the same kind of strategy that,
    you're suggesting the NSA and other evil forces
    do with other open-source project.

    **Answer continue ...:**

    So how do you know I don't work for NSA?

    **Q7 continue ...:**

    Exactly!

    **A continue ...:**

    It's a tricky question right?
    And there's a lot of, if you want to take the technical path on it.
    The FreeBSD patch collection last time I looked had thirteen
    hundred and forty two copies of the md5 algorithm.
    That's bogus from a software engineering perspective, right.
    OpenSSL is sort of the non solution to that in that
    we have this library that has any encryption algorithm
    anybody has ever thought up and the defaults will let you use them.
    All the downgrade attacks is no SSL is pill areas.
    So if we want to use technical means to reduce the ability
    of governmental players to spy on people, we'll have to
    start acting like grown-up software developers, who do things
    by a sensible way, rather than saying:

    "Oh I have this fancy new algorithm I'll stick
    it into a OpenSSL with the rest of them so now we have 50".

    And that would probably require some kind of architectural
    oversight which means we'd probably have to find you
    know maximum of eight persons globally we could agree on probably trust.
    We can start out with Bruce Schneier and seven others.
    But I don't think that the cut hurting is up to that
    level of ability, yet.
    So I don't simply don't believe we will have technical
    solutions to this problem.
    There's always going to be some bungholes somewhere
    who does something stupid.

    And you pretty soon are up against some very big companies
    who has a very big interest in defending certain protocols
    and stuff like that.
    So I think the OpenSSL is making things worse because people think it works.
    And people trust it without understanding it.
    And I met two persons who claimed to understand OpenSSL
    one of them was absolutely lying.
    So yes I think OpenSSL is a big problem because people
    think it gives security and it doesn't.

8. **Question**: Yes. I agree with you that this is more over a political
    issue but I wonder what should I or we ask or try to explain
    to a politician if I can get hold the one.
    What is what is a concrete thing I can suggest or,  yeah...

    **Answer:**

    I think a very good place to start is to demand ownership
    of our device..... VIDEO CUT!


9. **Question**:...............work technically speaking should we go and repair
    to OpenSSL everywhere or should we start a new SSL stack.
    Or what should what's our homework we've just had a weekend
    of technical inundation what should we now go and do other
    than harassing our politicians.

    **Answer:**

    I don't know.

    **Questioner:**

    Fair enough.

    **Answer continue...**

    And the reason why I don't know is I don't see a technical solution
    with 1 billion dollars of budget to collect information
    we are not going to be able to stand up to that with
    any kind of technical solution.
    I only see political solutions.
    But I mean obviously we can write better code we can stop copying
    and pasting code we don't understand and use
    libraries instead of copy and pasting and so on.
    And that will help.
    But it's not gonna solve the problem.
    It's just gonna close some of the security holes.
    Which is a good idea, but that's not a real problem right now.
    So know, I mean yes write better code!


**Moderator:**

Should we stop here? yes.

Thank you, all!
