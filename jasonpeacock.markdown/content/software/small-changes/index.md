---
title: Small Changes
subtitle: How do your features grow?
date: 'January 13, 2019'
toc-title: Table Of Contents
---

## Introduction

[Many teams have fallen]{.newthought} into a *mini-waterfall* process. They call it *Agile Development* because they are squeezing a feature's full lifecycle[^feature_lifecycle] into a single sprint, but they are not reaping the benefits.

[^feature_lifecycle]:
Design, implementation, testing, review, documentation, release.

For small features, this is not a problem, but most features are not small. Features sound small when first captured as a user story; once development starts there is refactoring, code cleanup, unit & integration tests, code review (with revisions!), and documentation before it can be released.

Making small changes puts the *agile* back in Agile Development.

## What Usually Happens

[Your team is starting]{.newthought} its next sprint[^sprint_length]. You're excited to deliver a long-anticipated feature, and customers are excited to see the feature finally assigned to a sprint and moved to *Work In Progress* status.

[^sprint_length]:
It doesn't matter how long your sprint is -- 2wks, 4wks -- the story is always the same.

Each day during stand-up you report that you're making good progress and there are no blockers. It's taking a little more effort than planned because you had to refactor some shared logic, and update a dependency which had a new API. But you're still confident the feature will be completed by the end of the sprint.

As the sprint draws to a close you complete your work on the feature; it works exactly as described in the user story. You're ready for the sprint demo and excited to show customers.

You send the code review to your teammates. You didn't have time to write tests because of the refactoring work and dependency upgrade, but you filed a backlog item to add tests later, so it's OK.

Late in the day you finally get some feedback on your code review. It's good feedback, but some of the feedback changes are not trivial. You realize that it's going to be a long night to make most of the feedback changes in time for the sprint demo.

You won't have time to update the documentation, and you'll have to move some of the larger feedback changes to the backlog as follow-up issues, but at the feature will be released!

Hopefully there is no additional feedback when you update the code review...

Best case: you released the feature to customers on time and created new technical debt:

* No tests.
* No documentation.
* Open issues from the code review.

[Or maybe]{.newthought} your team has a *Definition of Done*[^done_done_done], and you can't release the feature without testing and documentation. Even though the feature is code-complete, it's not *done*.

[^done_done_done]:
Coded, reviewed, tested, documented, and released.

You failed to release the feature; it goes back into the backlog to be re-prioritized for the next sprint. If you're lucky, you'll continue working on it in the next sprint and hopefully release it then. If not, the feature slowly rots on its own branch and will require extra work to bring it back up-to-date[^rebase] before it can be completed.

[^rebase]:
`git rebase`, etc.

## What Went Wrong

[Every sprint]{.newthought} starts with the best intentions.

The feature was developed in isolation[^feature_branch] and prepared for a big bang[^big_bang] release. After approval the changes were merged to `master` and released.

[^feature_branch]:
Usually on a feature branch.

[^big_bang]:
One moment the feature is not there, then **BANG!** it's there.

The problem was spending 90% of the sprint on one part of the feature lifecycle -- implementation -- while skipping the design phase and leaving little time for testing, review, documentation, and release.

The result is a rush to release the feature before the sprint ends, with a lot of pressure on teammates to approve the changes, deferring any significant feedback and accepting technical debt, all in the name of completing the story on time[^date_driven].

[^date_driven]:
Also known as *Date-Driven Development*, where changes are released by deadline (e.g. end of sprint) instead of when they meet the Definition of Done.

## Making Small Changes

[Aim for a steady trickle]{.newthought} of small changes released throughout the sprint instead of a big-bang release at the end of the sprint.

A small change is the smallest step[^smallest] that moves the feature closer to complete. Small changes usually align with the implementation steps in the feature design.

[^smallest]:
A small change should make sense on its own, don't break a change in half just to make it small. Figure out the steps to implementation the change, then make each step a small change.

Small changes don't always result in a customer-visible change, they can refactor existing code or lay the groundwork for later changes.

Small changes are released as they are completed, which includes review, testing, and documentation to meet the *Definition of Done*.

The work of coding, testing, reviewing, documenting, and releasing a change should all be *completed within one business day*[^business_day]. If it takes two days, or a week, to complete a change then it isn't small.

[^business_day]:
It doesn't have to be literally 8am to 5pm, it could be 10am today to 10am tomorrow, etc. A casual approach could be "make a change today, release it tomorrow morning, then start the next change."

Completing small changes within a day is possible because small changes have small tests, quick reviews, short docs, and fast releases.

Frequently, small changes are completed in less than a day, and multiple changes are released in the same day.[^same_day_goals]

[^same_day_goals]:
This is a good goal to strive for, it demonstrates you have achieved small-change enlightenment!

### The importance of Definition of Done

Making small changes is not about pushing whatever the current state of the feature is at the end of the day.

Commonly, a series of changes are released to support a feature, then another series of changes are released to pay off the technical debt (code cleanup, refactoring, unit tests).

That's just making changes to production "live", accumulating technical debt to be paid off before the feature can be completed.

Applying the *Definition of Done* to every change ensures no technical debt is accumulated. Feature development can be stopped[^stopped] at any moment with no technical debt.

[^stopped]:
Priorities change, fires need fighting, orgs get re-org'd.

## Small Changes in Practice

[At the start of each sprint]{.newthought} every story is broken down into day-sized tasks (or smaller) needed to implement the features.

This is a great opportunity for a sanity check - can all the tasks for each story be completed in the current sprint? Some stories may need to be split into additional backlog stories if there are too many tasks.

Each day, developers make code changes, write tests, and do code reviews. They update docs and release small changes, completing the tasks.

When developers are waiting on code review feedback for a task they can switch[^multitasking] to another task and start working on that small change.

[^multitasking]:
Multitasking has been proven to not work. Instead, this follows the single-tasking approach of working one thing until blocked, *then* switching.

### Every story has day-sized tasks

Some stories are simple and only need one task. A day-sized task is still created to track the effort.

Some stories have tasks that are not development related -- debugging, doc writing, design, training, etc. They are still broken down into day-sized tasks.

Open-ended tasks such as investigation or debugging are broken down into day-sized tasks with goals for each day, even when the effort spans multiple days.

Creating day-sized tasks for all efforts, even on-going multi-day efforts, ensures the team always knows the current status of all stories and avoids the useless "it's still in progress" daily stand-up update.

## Adopting Small Changes

[It can be challenging]{.newthought} to adopt new practices like making small changes. Here are some suggestions to apply in your team:

* Schedule a daily time for teammates to review open CRs to unblock small changes.
* Create tasks *smaller** than a day, as they will most likely be under-estimated.
* Break down stories into tasks as a team.
* Update tasks every day, don't wait until the end of the sprint.

## Benefits of Small Changes

&check; *Easy to understand*

Small changes are easy to understand and quick to communicate to all teammates, instead of the one teammate who did the review.[^bb_understand]

[^bb_understand]:
{-} Big changes can require sitting with teammates to explain them, or even a team meeting!

&check; *Fast code reviews*

Small changes have small code reviews, and fast turnaround, increasing the chance of multiple teammates participating in the review.[^bb_cr]

[^bb_cr]:
{-} Big changes require playing tag to find a teammate for your review, because nobody wants spend their time on a large review. Large reviews produce lots of feedback, which leads to many revisions.

&check; *Continuous feedback*

Teammates can provide early & constant feedback when releasing small changes frequently. It's cheaper to change your implementation early, before you are fully invested, and when you are more receptive to feedback.

Feedback about performance, bugs, etc. is immediate when small changes are released frequently.

&check; *Code is always working*

Code is always in a working state when releasing small changes, you avoid "tear it all apart and try to put it back together" problems.

&check; *Test coverage is clear*

Writing comprehensive tests cases is straightforward when changes are small; reviewers understand what changed and what should be included in testing.

&check; *Documentation is updated continuously*

Writing documentation can be slow and overwhelming, small changes minimize the required documentation.

&check; *Bugs are smaller*

Bugs are easier to find; `git-bisect` works very well when a feature is composed of many small changes. You can pinpoint the exact (small!) change that caused the issue instead of debugging a large change in a single commit.

&check; *High confidence releases*

It's easier to capture and understand the impact of small changes,

&check; *Work can be paused at any time.*

The amount of in-progress work is small when all changes are small and already released. If priorities change, all the work for the feature is either already released as small changes or not yet started, and it can easily be moved to the backlog to be resumed later.

&check; *No merge hell.*

Small changes have small scope, and rarely conflict with changes from other teammates. Small changes are easy to rebase before you release, and just as easy for your teammates to rebase after release.

&check; *Progress is obvious.*

Burn down graphs and other tracking tools provide fine-grained detail due to small changes being constantly released & their tasks resolved. Teammates, managers, and customers how close the feature is being completed, and can easily track the team's progress towards its sprint goals.

## FAQ

### Changes can't be completed in a day.

The team's *Definition of Done* may be too onerous. Review the definitions to see what is causing the most friction. It does not need to be extensive -- usually it is as simple as "code complete, tested, and reviewed." Many teams include documentation and release as well.

Or, the tasks are not actually day-sized. Teams are usually optimistic, especially when they are not used to including testing, review, and release in their task estimates. Try breaking down the tasks into smaller than day-sized estimates until the team

### Code reviews don't happen fast enough to release every day.

Schedule a daily time for teammates to review open CRs to unblock small changes, or have assigned teammates responsible for handling CRs each day.

### Our release process doesn't support changes every day.

Small changes and agile development go hand-in-hand with continuous development. Teams can use the frequent releases of small changes to work on improving their continuous development expereince and streamline the release process.

### When is a small change too small?

There is an overhead to applying the *Definition of Done* to too-small changes, just as there is an exponential cost with changes that are too large.

Don't release changes just for the sake of releasing every day. Evaluate if the change moves the feature closer to complete.

### How does this fit with Agile Development?

kent beck's "commit or revert" experiment

https://medium.com/@kentbeck_7670/limbo-on-the-cheap-e4cfae840330

https://medium.com/@kentbeck_7670/test-commit-revert-870bbd756864

don't take my work for it: https://en.wikipedia.org/wiki/Kent_Beck

### How do I know what changes are needed before I start?

This is what skipping the design phase sounds like. Before making any changes there should be a design, reviewed with your teammates, about how the feature will be implemented.

Depending on the size of the feature, the design can be:

1. A bullet list of exit criteria in the story description, as the changes are obvious & straightforward.
1. A quick 2-4 paragraphs in a wiki describing the problem to be solved and the changes required to solve it.
1. A full design document, capturing the problems, customer requirements, user experience, and proposed solution/implementation.

Of course, nothing says that you're not allowed to change your mind. Was that change 3 commits ago not quite right? Change it!

### How do you revert the feature without a single, atomic commit?

Use feature flags.

Changes are released continually and bugs fixed as they appear, less risk than big-bang release.

Use `git-bisect` to identify the commit that introduced the change, can't do that with big-bang release.

### How to work on serial tasks without being blocked by reviews?

Use `git` branches.
