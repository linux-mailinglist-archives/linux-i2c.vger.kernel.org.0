Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 858D0321EEB
	for <lists+linux-i2c@lfdr.de>; Mon, 22 Feb 2021 19:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232006AbhBVSNZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 22 Feb 2021 13:13:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:37806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232000AbhBVSNY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 22 Feb 2021 13:13:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7F47064EC3;
        Mon, 22 Feb 2021 18:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614017523;
        bh=hmgPnNrj+JhlmbwQitagAKodIlBEaow4FoCDUpk7IUQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=duAEWneqxQOPtDBJdomq0hcNfUSEXvWRyYHTaVEBd5AmbTBhjy4Ru8vdjGIUKKTuU
         N5c6ijBWudwOj7hp3RrnqdRrS8fBh7xM1/f4iufQoQJeD0SYyPFte7a9IZTYMzXU7X
         qrVc5l1s+9OTzWyeCo1ZBpyjtwTBMfbdKyE6LtI0cmNrouAl59nvaRAp77PPQ/Xu3j
         eyWXOyZEUxFbcaQMGgySAT6Oweaq2v8MKyWHUSbF3s9VyDyR/+16EFdIoQ1i2q6IfF
         wDl9G6PKbn3zbXAGHYDW2z3fp5OOCBrx0XJjGoR8tqbs/PuptAMl+x3i6tyVVYtMM7
         0atEQK521aI2g==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 7AD0160963;
        Mon, 22 Feb 2021 18:12:03 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210215104527.GA8113@ninjato>
References: <20210215104527.GA8113@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210215104527.GA8113@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.12
X-PR-Tracked-Commit-Id: 0b16cfd9e660f59e396ab5f3af7d49e3677e3f9c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 32c080c4b5cfadeb1d1d5952840d696d5cda8bb8
Message-Id: <161401752349.943.16948058053999849604.pr-tracker-bot@kernel.org>
Date:   Mon, 22 Feb 2021 18:12:03 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 15 Feb 2021 11:45:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.12

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/32c080c4b5cfadeb1d1d5952840d696d5cda8bb8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
