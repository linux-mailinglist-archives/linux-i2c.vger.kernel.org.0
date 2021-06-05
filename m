Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A73F39CB87
	for <lists+linux-i2c@lfdr.de>; Sun,  6 Jun 2021 00:52:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230075AbhFEWxr (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 5 Jun 2021 18:53:47 -0400
Received: from mail.kernel.org ([198.145.29.99]:43894 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229998AbhFEWxq (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 5 Jun 2021 18:53:46 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 5F46561241;
        Sat,  5 Jun 2021 22:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622933518;
        bh=2+nYdxYEM/SZuBVb7f0E7/u/5dlYum6nqgc56d1RTVM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=iHtdSMXD6bQgI/h12xkjEsvYaxtF5TWk87gQXJlPhkovGUl0g6vIR8DRuSJXFqhh2
         +mjZmmAavHpARRsFns3rbZcjlXzN4auElrN97gTAFoJXvlf5LRTQ/L7mKV6kwRhnrQ
         c8Gz7VdrjqJTDxd9mdoASW1o9cnPPPa9ML8Vszp3obXwmJEjcv9fiihuTfLjebHAKn
         0F3Ppzxv7Q6z9flKnc90ihPJUGB/TU6pVowRXUs/8lvWwJ2HfZqJ8HPrvjRo9FOcWO
         9j9exGk7+wiCILFkj7h77fD4WrObf1D2qc6oCPtqH/TUiL4xaQ6vTuEO+4oi2O8NUs
         d5L/usxflQ8Kw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 4BAB5609EF;
        Sat,  5 Jun 2021 22:51:58 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.13-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YLvwtW3JuDU0MC8E@kunai>
References: <YLvwtW3JuDU0MC8E@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YLvwtW3JuDU0MC8E@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 57648e860485de39c800a89f849fdd03c2d31d15
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f5b6eb1e018203913dfefcf6fa988649ad11ad6e
Message-Id: <162293351824.10457.7133650316542401322.pr-tracker-bot@kernel.org>
Date:   Sat, 05 Jun 2021 22:51:58 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 5 Jun 2021 23:46:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f5b6eb1e018203913dfefcf6fa988649ad11ad6e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
