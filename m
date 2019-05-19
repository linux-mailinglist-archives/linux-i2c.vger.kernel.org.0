Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0C61A2287D
	for <lists+linux-i2c@lfdr.de>; Sun, 19 May 2019 21:15:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727848AbfESTPW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 May 2019 15:15:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:39802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726622AbfESTPW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 May 2019 15:15:22 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1558293321;
        bh=cdoS4jhaSaN2PKHWUIgEcVvEzctc6XllgRQPoE5L9+Y=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=cSYBugrvxY3RKzu4cPpEh0fgjA9y8M0UDoDnqSsCVCUKe0G59VcEBoGEGmNo17hyr
         ssYU3kSMuOjUy64BKtjrS+vNKzrZ95T+rQmoL0MCsovlTTFspmqEW7ad8NHjrjgGZ8
         hpSY9aDeCJ/LJo6UNJVicF2DpHQebiZGnjzty3lA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190518110057.GA8674@kunai>
References: <20190518110057.GA8674@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190518110057.GA8674@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
X-PR-Tracked-Commit-Id: b8f5fe3bc5b9318d95770a09a480c31aced20cd2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f23d8719e76fd32828ae6f1b55e4659144467742
Message-Id: <155829332175.24875.6358770579395958283.pr-tracker-bot@kernel.org>
Date:   Sun, 19 May 2019 19:15:21 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 18 May 2019 13:01:01 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f23d8719e76fd32828ae6f1b55e4659144467742

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
