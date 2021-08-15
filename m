Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6ED1F3EC797
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Aug 2021 07:30:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229633AbhHOFa4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 15 Aug 2021 01:30:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:49694 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229452AbhHOFa4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 15 Aug 2021 01:30:56 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id D79B56103B;
        Sun, 15 Aug 2021 05:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629005426;
        bh=keBFh39K+mMqIgJdlbPjTuIuVVeCE7UXxU0ADbeG5R0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mgforp9TuEPn+13DqOkr2ZrY0Su0Lvvwl1p3HBb+iQBbOHQ7NIOVQ/KTdpcVZlBil
         rvxYs2lm+/UKPN7Vt3iRtd2UywMnnoWW3X+dI2cH/oyGvgwfSubI9XLBRKLPeF3k1X
         zVNBEmwhYquw9wqgv0ROxuitDDoJjzzTqg6LudV/vwy6q1QSJbIpDCird3Y358X8hZ
         30IMqKSjD+DIRRrf8WnuFmYCcT/H8lB9STJvGx39JSBpboo7RurlQmfX40TiDbv4vG
         rXXcaOnng1hgZQjIWJ6cVFWomC2QgR58Ffqf+21ciCrfu1rRZ7DMnnvPmBTYTlSdFZ
         lq9uYNbOmiGqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id C563960BC7;
        Sun, 15 Aug 2021 05:30:26 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YRfvMnQHHRN/6REq@kunai>
References: <YRfvMnQHHRN/6REq@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YRfvMnQHHRN/6REq@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 3f12cc4bb0a4d7b542af43b6f1b7175f13015629
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 76c9e465dd529cfe1e49ed975563fa0c44aa2bdc
Message-Id: <162900542675.9665.14695478851990732892.pr-tracker-bot@kernel.org>
Date:   Sun, 15 Aug 2021 05:30:26 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 14 Aug 2021 18:28:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/76c9e465dd529cfe1e49ed975563fa0c44aa2bdc

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
