# Socializer

Socializer is a rails engine fully dedicated to add social network capabilities so you can focus
on what really matters.

It is designed based on the wikipedia definition of social networks (http://en.wikipedia.org/wiki/Social_network) and
the excellent spec from http://www.activitystrea.ms. Yes, it may looks like a Google+ clone, but Google did a
great job at implenting the social network definition. And yes, it does a lot less than Google+, but we don't have
400 developers on the subject.

## Core concepts

*People* are connected with each other in numerous ways. First of all, they can significate to another person
that they want to be connected with them by adding them to their *circles*. The association between a person
and a circle is called a *tie*. This link is not direct and does not force each other to have the same link.
For instance, one can classify the other person as a 'friend', while the other one will return the favor by adding
them to their 'colleague' circle. Second, *groups* are a link between people where all members share the same level
of connection with each other. They are all members of the 'Project X Research Group'. The association between a
person and a group is called *membership*.

Like any other social networking application, you can post *notes*. Notes are pieces of information (currently only
text is supported, but pictures, videos, files and more are coming) that you want to keep for posterity.

When you perform actions in Socializer, there is a log of your *activities*. Activities are shared with
an *audience*. Let's say you perform the action of creating a note. While creating that note,
you will have to specify this activity audience. You can choose between 'Public', 'All your circles', any of your
circles, any of your groups and any of the people you are connected with.

People can consult the activity *stream* with different filters : 'profile' where you see all the activities of a
single person, 'circle' where you see the activities performed by the people in that circle, 'group' where you
see activities performed by people in that group or 'home, where you see everything that people you are connected
with (groups, circles, yourself) performed. When viewing a stream, people can *comment* any of the stream.

For the registration and login, Socializer is currently using only omniauth with the following providers :
LinkedIn, Facebook, Twitter, Yahoo and Google. It is planned to add a registration process with internal accounts.
When you register with one of the omniauth providers, you create yourself an *authentication*. Once your account is
created, you can bind multiple authentications to your account. This will be used later on to share your activities
with other networking sites.

## If you want to contribute

The best way to contribute is to do one of the following :
* Creating tests
* Refactoring
* Testing (over at http://socializer.froggedsoft.com) and creating issues for me to solve
* Correcting my english ! (im a french Canadian, so don't hesitate to fix my sentences or whole texts)
