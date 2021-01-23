Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ACEF301838
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Jan 2021 21:10:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726223AbhAWUHT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Jan 2021 15:07:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:44380 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726485AbhAWUGW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 23 Jan 2021 15:06:22 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 8884822DFA;
        Sat, 23 Jan 2021 20:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611432341;
        bh=ZfdE28rh+eF9L5VHnwwmV96IhoPjKRqzkvd0VNo6LI0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=IL1q4ssXmt+XT0GsFSCM48RUdO9TL9V1m5NeMOiMykC+HtFc2O5m73SkrgUTHKPR2
         QmAwRUmZi1t6GAYbXoZR3UzZv8VR/48v/8Hc8Nx6mo3/RM9dxmBXZl4/3Fv0/rIRW5
         LFT5/ijoZA/GOwd1pFD6BIVfZT3IASadWPHohazXTpyyosMnCctoINcZDiUCMMsPPt
         Ha3ZA3Ci1gypn2icmpBobg4yHYU6F1m60+Lk7rDXyZIADmkptY1b7ydBr6mCBxY/ff
         jfyWo7MF/h1Er0SS0e8oI68iN2VlNlfFRMuLLIjQXUIHQ1hTXjoY+nrw+afJdBMgcK
         JrDZnGIJjmGRA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7F76E652E1;
        Sat, 23 Jan 2021 20:05:41 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for 5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210123124329.GA1022@kunai>
References: <20210123124329.GA1022@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210123124329.GA1022@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 9ecd1d2b302b600351fac50779f43fcb680c1a16
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 077e81d51d1fce056b361c27b6cddd41e1469b9d
Message-Id: <161143234150.8668.12987808934092517017.pr-tracker-bot@kernel.org>
Date:   Sat, 23 Jan 2021 20:05:41 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 23 Jan 2021 13:43:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/077e81d51d1fce056b361c27b6cddd41e1469b9d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
