Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0166B447534
	for <lists+linux-i2c@lfdr.de>; Sun,  7 Nov 2021 20:14:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236279AbhKGTQz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 7 Nov 2021 14:16:55 -0500
Received: from mail.kernel.org ([198.145.29.99]:38156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229846AbhKGTQz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 7 Nov 2021 14:16:55 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 3D35D60F70;
        Sun,  7 Nov 2021 19:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636312452;
        bh=mMqmZqgC3XNLmdsXofP5f3+CFr2qBZElzsW2vaGjLDU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=gjYkzBWENEw2k5BGu9uqnaucJ3pDyH8WGWqlxEYbcVWAbbU0ah+LSiDP/w3zSB69/
         1mdD+ByQaOTETl8FeKCh5nwfDoUXblT8RhqgYPtouWrtqq8ZQsE/1WtJAkSFif0BWh
         9/uTkTzS/Lw53nNFHN82BfzVqt2e+U2w90gSCdtmrxu7mezn9t61x8aiJWNConBaz5
         qSCS5Lc9FY4snieS42Z9bxZaQzGsO+n2MImu3IlLa1W5fMKEWRvFekEq5+PRnW6+di
         jOu1Glr0PozO2sgpiWp+seAbvUd/fx7EVzzKzeH1p7YND6jyhWNci0nrYfAMNM35vd
         54WhNNmgcXC4w==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 27F2D60A2E;
        Sun,  7 Nov 2021 19:14:12 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YYb0pFqpL113nWdX@kunai>
References: <YYb0pFqpL113nWdX@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYb0pFqpL113nWdX@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: c80be257a4cd0f72c083e6056ff0ce2da871e9dc
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b75d88fa81b122cce37ebf17428a849ccd3d0f1
Message-Id: <163631245210.5338.5302737279761858730.pr-tracker-bot@kernel.org>
Date:   Sun, 07 Nov 2021 19:14:12 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 6 Nov 2021 22:33:24 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b75d88fa81b122cce37ebf17428a849ccd3d0f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
