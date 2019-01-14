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

For small features, this is not a problem, but most features are not small. Features usually sound small when first captured as a user story, but once development starts there is refactoring, code cleanup, unit & integration tests, code review (with revisions!), and documentation before it can be released.

Making smaller changes can bring the *agile* back to Agile Development.

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

Best case, you release the feature to customers on time and created new technical debt:

* No tests.
* No documentation.
* Open issues from the code review.

### Or maybe...

Your team has a *Definition of Done*[^done_done_done], and you can't release the feature without testing and documentation. Even though the feature is code-complete, it's not yet ready for release.

[^done_done_done]:
Coded, tested, documented, and released.

You failed to release the feature, it back into the backlog to be re-prioritized for the next sprint. If you're lucky, you'll continue working on it in the next sprint, and hopefully release it then. If not, the feature slowly rots on its own branch and will require extra work to bring up-to-date before it can be completed.

### What went wrong

Every sprint starts with the best intentions, but quickly meets reality. The problem was not with the refactoring, or dependency upgrade -- those are all good things that should be done. The problem was spending 90% of the sprint on one part of the feature lifecycle, implementation, leaving very little time for testing, review, documentation, and release.


## Making Smaller Changes

The advantages of incremental development and release throughout the sprint. Constant feedback, always have a working version, requires more thought before starting. Smaller changes are faster to review, easier to understand, quicker to fix.

### What it looks like in practice

What it looks like in practice and how to implement for your team.

## Exercises to Challenge You & Your Team

Exercises to challenge current paradigms and find what fits best for your team. E.g. force everyone to review/commit at the end of each day for a sprint and then talk about the experience in the retrospective.

