Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAA98326DDC
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Feb 2021 17:30:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230206AbhB0QaF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Feb 2021 11:30:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:59642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230153AbhB0Q3x (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Feb 2021 11:29:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B7D4F64E74;
        Sat, 27 Feb 2021 16:29:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614443351;
        bh=92YNm3i9ct5IHb+PacmgTlsBXvFj60YQ7RHhdYn+LHM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=cnW6DZgZqu3oud17k2WASj3T1e7yVcjZVy9PkhfuL/8P4UWQBZy60iuddxQQGJ2Ci
         vnCGpIHiUx7ZVN2F0dXUD6fQCVCfHPf3wguqgUgOyGlDiG5zm5lNxVbaORttZcDlgU
         JudFl0OW1/RJFzPPGbjbUozjtWJ3iL6HiBZh+gVgP8oT0eGamloBArK0y3tSlIbCOf
         1dAmCxgjcyzLFY8/ZrsL20PqwnVYWhiJoMYaJ9lp7abrUoVzvbSysrdybWiqWUUn3T
         WABVppZsoGOyLP5I9vdIIDh3SJuwcp6hWl+JSTdCQDx4OSTRU/C6RnEtBNIEEJ3fDH
         LkDpLP7Qeb7Cw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id B19DA60A24;
        Sat, 27 Feb 2021 16:29:11 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c fixes for v5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210227141223.GA3333@ninjato>
References: <20210227141223.GA3333@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210227141223.GA3333@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: f4ff0104d4c807a7f96aa3358c03d694895ee8ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 580cd7736f6b40dbe1d5514eb59744bc24328e4b
Message-Id: <161444335171.24634.18369925836226286225.pr-tracker-bot@kernel.org>
Date:   Sat, 27 Feb 2021 16:29:11 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 27 Feb 2021 15:12:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/580cd7736f6b40dbe1d5514eb59744bc24328e4b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
