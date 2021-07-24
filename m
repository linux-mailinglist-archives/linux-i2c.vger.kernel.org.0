Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EADC83D49C1
	for <lists+linux-i2c@lfdr.de>; Sat, 24 Jul 2021 22:16:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229682AbhGXTgG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 24 Jul 2021 15:36:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:52558 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229549AbhGXTgF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 24 Jul 2021 15:36:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 1CCC160E96;
        Sat, 24 Jul 2021 20:16:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1627157797;
        bh=0tuTu9SyqVjNrsShR1nRD8G8erhEGh/oWKWHsBRXWJw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=CIjb7rpnUxnSWKK3LF1tMhccJYBh9XTAkruaTzx6aDBLhFrLyUjT5lU2LOomAF0XT
         ZvmYsW+Q5/ZgQ8yTkaqZIRPtV6eZIoq/kbtljSIlfEUhVFPwmxWkF/qERQUvze7bdc
         J/RxWJudSonWRmrwhlbL915/w7llpE2VX4XPbRuNEaLWwNVLXD+iDo5Rju52mUY/ID
         v8PalOt1VxEa/B4W0zoNUoqG3cmYRyZLIVL701oiz2CRWFs9p14iyeit2hsjz0F0M0
         NidiM1RDX5gUlcnRWHN4B32LK8Fg1ZSiAUiqyXTitHq661BK1gEdIzQ1izwBhY1XmE
         UyGASPBYMgGzg==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 0A48560972;
        Sat, 24 Jul 2021 20:16:37 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.14
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YPvtwtk3wPtFnB8L@kunai>
References: <YPvtwtk3wPtFnB8L@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YPvtwtk3wPtFnB8L@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 4a8ac5e45cdaa88884b4ce05303e304cbabeb367
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0823baef164686c98d084b16877f271681e2377f
Message-Id: <162715779698.1145.13051763326172483180.pr-tracker-bot@kernel.org>
Date:   Sat, 24 Jul 2021 20:16:36 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 24 Jul 2021 12:38:58 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0823baef164686c98d084b16877f271681e2377f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
