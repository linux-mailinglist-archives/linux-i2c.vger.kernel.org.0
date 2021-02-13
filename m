Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 677B031ADDE
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Feb 2021 21:05:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229821AbhBMUE0 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Feb 2021 15:04:26 -0500
Received: from mail.kernel.org ([198.145.29.99]:54448 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229744AbhBMUEY (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Feb 2021 15:04:24 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 7B73464E39;
        Sat, 13 Feb 2021 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1613246624;
        bh=Pm+GpZqWBXmUVi7asqtVimVvfxEvO+4FxhfRc0Cb7Zo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sYy1LWmlqxFP5YHyy15MjUe24xpWiiegQd3xPU7K0KX6aVqmqCy4hFb1H4TznIVxb
         2F+ZhSTpMcyqwfwiAN+jT3ZLs4g6Q8piQjVbeBXik7QGvCrCp3MYFn5CdcAoa1GeFH
         lqNhwC6g9UYjyShUOKmVRTCmeOjvLMsKJWgJj2smRtQe6ZGcFUxoitiUpVp+QsyDjy
         4WpqH7HPDk4TPqHKplAuq5Zwl0qxI0AahAnxxosiujiRWmFl9YHNPhTiwfuylhkF8g
         /241Akfrpk0zjkwj+4iE5dvmdv0zyPMOGYlhwmX7yDVeCnAi3K76lYqX/TfmguzDYs
         IyuyK4FXhLffA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 6F2EF60A35;
        Sat, 13 Feb 2021 20:03:44 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210213104200.GA4086@ninjato>
References: <20210213104200.GA4086@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210213104200.GA4086@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 3d6a3d3a2a7a3a60a824e7c04e95fd50dec57812
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8cc8e6aaf27db47985f9e1c24ac2f7393390971e
Message-Id: <161324662445.16511.7852713843239671343.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Feb 2021 20:03:44 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 13 Feb 2021 11:42:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8cc8e6aaf27db47985f9e1c24ac2f7393390971e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
