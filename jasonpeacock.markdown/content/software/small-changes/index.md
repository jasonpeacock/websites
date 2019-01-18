---
title: Small Changes
subtitle: How does your feature grow?
date: 'January 13, 2019'
toc-title: Table Of Contents
---

## Introduction

[Agile was supposed]{.newthought} to help deliver software faster. Instead, many teams have fallen into a *mini-waterfall* process, squeezing a feature's full lifecycle[^feature_lifecycle] into a single sprint.

[^feature_lifecycle]:
Design, implementation, testing, review, documentation, release.

For small features, this is not a problem, but most features are not small. Features sound small when first captured as a user story, but once development starts there is refactoring, code cleanup, unit & integration tests, code review (with revisions!), and documentation before it can be released.

Making smaller changes can put the *agile* back in Agile Development.

## What Usually Happens

[Your team is starting]{.newthought} its next sprint[^sprint_length]. You're excited to deliver a long-anticipated feature, and customers are excited to see the feature finally assigned to a sprint and moved to *Work In Progress* status.

[^sprint_length]:
It doesn't matter how long your sprint is -- 2wks, 4wks -- the story is always the same.

Each day during stand-up you report that you're making good progress and there are no blockers. It's taking a little more effort than planned because you had to refactor some shared logic, and update a dependency which had a new API. But you're still confident the feature will be completed by the end of the sprint.

As the sprint draws to a close you complete your work on the feature; it works exactly as described in the user story. You're ready for the sprint demo and excited to show customers.

You send the code review to your teammates. You didn't have time to write tests because of the refactoring work and dependency upgrade, but you filed a backlog item to add tests later, so it's OK.

Late in the day you finally get some feedback on your code review. It's good feedback, but some of the requested changes are not trivial. You realize that it's going to be a long night to make most of the requested changes in time for the sprint demo.

You won't have time to update the documentation, and you'll have to move some of the larger requested changes to the backlog as follow-up issues, but at the feature will be released!

Hopefully there is no additional feedback when you update the code review...

Best case: you released the feature to customers on time and created new technical debt:

* No tests.
* No documentation.
* Open issues from the code review.

### Or maybe...

Your team has a *Definition of Done*[^done_done_done], and you couldn't release the feature without testing and documentation. Even though the feature is code-complete, it's not done.

[^done_done_done]:
Coded, reviewed, tested, documented, and released.

You failed to release the feature; it goes back into the backlog to be re-prioritized for the next sprint. If you're lucky, you'll continue working on it in the next sprint and hopefully release it then. If not, the feature slowly rots on its own branch and will require extra work to bring up-to-date before it can be completed.

## What went wrong

[Every sprint]{.newthought} starts with the best intentions.

The feature was developed in isolation[^feature_branch] and prepared for a *big bang*[^big_bang] release. After approval the changes merged to `master` and released.

[^feature_branch]:
Usually on a feature branch.

[^big_bang]:
One moment the feature is not there, then **BANG!** it's there.

The problem was spending 90% of the sprint on one part of the feature lifecycle -- implementation -- while skipping the design and leaving little time for testing, review, documentation, and release.

The result is a rush to release the feature before the sprint ends, with a lot of pressure on the code reviewers to approve the changes, deferring any significant feedback and accepting technical debt, all in the name of completing the story on time[^date_driven].

[^date_driven]:
Also known as *date-driven development*, where changes are released by deadlines (e.g. end of sprint) instead of when they meet the quality bar.

## Making Smaller Changes

[Aim for a steady trickle]{.newthought} instead of a big bang.

A series of small, incremental changes that add up to a feature can be released throughout the sprint; you don't have to wait until the end of the sprint to release changes.

*The advantages of incremental development and release throughout the sprint. Constant feedback, always have a working version, requires more thought before starting. Smaller changes are faster to review, easier to understand, quicker to fix.*

### What it looks like in practice

At the start of the sprint you capture the series of changes needed to implement the feature. Then, every day, you make a small change, send it for code review, and release it.

## Exercises to Challenge You & Your Team

*Exercises to challenge current paradigms and find what fits best for your team. E.g. force everyone to review/commit at the end of each day for a sprint and then talk about the experience in the retrospective.*

## FAQ

### I don't know what changes are needed before I start

This is what skipping the design sounds like. Before starting any changes there should be a plan, reviewed with your teammates, about how the feature will be implemented.

Depending on the size of the feature, the design can be:

1. A bullet list of exit criteria in the story description, as the changes are obvious & self-evident.
1. A quick 2-4 paragraphs in a wiki describing the problem to be solved and the changes required to solve it.
1. A full design document, capturing the problems, customer requirements, user experience, and proposed solution/implementation.
