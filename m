Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20CB3BD5AD
	for <lists+linux-i2c@lfdr.de>; Wed, 25 Sep 2019 02:05:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390286AbfIYAFZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 24 Sep 2019 20:05:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:39454 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726118AbfIYAFY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 24 Sep 2019 20:05:24 -0400
Subject: Re: [PULL REQUEST] i2c for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569369924;
        bh=qMNqctDBThkqsBsd+QFxirflNL7gPoUksZcagCWzkKA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=odaPwqncVlb60wTcNg3hpmtUK4V8qw7tKPjrzoqQGhp35AJ+jVSWdZNGa5ZPmN9RX
         k7tRRwIaO6gDiiaNP5bp+OV/f3VRMBvB6mYfe7VDs9FHXcYRle2IEemnpm9J3tvw5v
         vNJjHG6+RuWnFMOawUQZDFZ4fvMw7M7eApZJj0eI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190924193054.GA2215@kunai>
References: <20190924193054.GA2215@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190924193054.GA2215@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.4
X-PR-Tracked-Commit-Id: 8ebf15e9c869e764b3aab4928938ee68c0e2bd6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 351c8a09b00b5c51c8f58b016fffe51f87e2d820
Message-Id: <156936992423.955.6087749704237172959.pr-tracker-bot@kernel.org>
Date:   Wed, 25 Sep 2019 00:05:24 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Tue, 24 Sep 2019 21:31:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/351c8a09b00b5c51c8f58b016fffe51f87e2d820

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
