Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2E72D2027F9
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Jun 2020 04:30:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729117AbgFUCaZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 20 Jun 2020 22:30:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:43772 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728992AbgFUCaZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 20 Jun 2020 22:30:25 -0400
Subject: Re: [PULL REQUEST] i2c for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592706625;
        bh=ps+Ob9O00oNteyh03C6SjL6ioYYkY47O5d74B5uMYhM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=djakDrIzjq+HtXOp6rWAkzFhvB8VvYFArxtvf0fZsTz5N++sO3K2HUWeEiIeVIckJ
         R593nAk7WOeUPnMKhL+c8D1A8ajokRtS5SAY2HSOBdW9zrYs65GYHy1xP0wqG/V3h5
         Th1BsrfSgwOVV7yjCUrRDR7SQbf8tTsxwIdsoRDM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200620171624.GA9805@kunai>
References: <20200620171624.GA9805@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200620171624.GA9805@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 28f9f8fb4f405ade488058f817b6cbd108e45e4e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5c6a1f0fe1d182489864b708fa472d0333b39d4
Message-Id: <159270662525.3975.1993250401444445604.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Jun 2020 02:30:25 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 20 Jun 2020 19:16:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5c6a1f0fe1d182489864b708fa472d0333b39d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
