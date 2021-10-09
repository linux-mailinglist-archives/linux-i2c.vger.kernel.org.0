Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8404F427DCC
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Oct 2021 00:05:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230308AbhJIWHV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Oct 2021 18:07:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:43672 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230296AbhJIWHV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Oct 2021 18:07:21 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id A584360E95;
        Sat,  9 Oct 2021 22:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1633817123;
        bh=bDNo0VJlQS0GDlS71ips1AwowPiEwimL2iIUSjm7O+s=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=R14N+SMTjchD7h/fE/EP0T9zgDXi5wqZ3mbVTVtYQTNvqMm2zKNgbQrlDSRUCXjnI
         vN/NrLKYJobut5jQ0Rk6K5umtn2DeDPvbqwvNMQi55whqsjGVLAs6dB6l/CTIg44un
         l/5f8hozYWBYsQcHCg4NLckQX6ey7W/F+Ku1ecIuTXTzUO6D07IhH6q6BVbhfIpKQ1
         s+C1w9gpQpvzeFnprKS554ODEyxpurFWEx/+ZOdhCDaWTKzJJsSXl0QMB7aEKZ2RFw
         SPFhZEHtoT8O4LneJZTEO9JLn0npPKYDSwiQyln5j4eZTG3ms0QX5qRqd08wyRQDE1
         cDhqatM8wJ6xA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 914C760A38;
        Sat,  9 Oct 2021 22:05:23 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YWHyUMqxa5giAJTJ@kunai>
References: <YWHyUMqxa5giAJTJ@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YWHyUMqxa5giAJTJ@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed
X-PR-Tracked-Commit-Id: fa1049135c15b4930ce7ea757a81b1b78908f304
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7fd2bf83d59a2d32e0d596c5d3e623b9a0e7e2d5
Message-Id: <163381712353.3348.9315706150947568165.pr-tracker-bot@kernel.org>
Date:   Sat, 09 Oct 2021 22:05:23 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 9 Oct 2021 21:49:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7fd2bf83d59a2d32e0d596c5d3e623b9a0e7e2d5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
