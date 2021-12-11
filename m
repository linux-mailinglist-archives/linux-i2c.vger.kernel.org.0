Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA06A4714EB
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Dec 2021 18:28:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230349AbhLKR2s (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Dec 2021 12:28:48 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:33024 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbhLKR2r (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Dec 2021 12:28:47 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BCFCEB80B2C;
        Sat, 11 Dec 2021 17:28:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72104C341CB;
        Sat, 11 Dec 2021 17:28:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1639243725;
        bh=JwPawLwtLdLL5s8PkaZ2msWw4naj7ceC0RbT95lhnyk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=o+qZ/6lYkKW6vKwDNGQu2wfpz4iKG62nceiRmwmzq8Z4+W3yaM6ZLN2DMmuE8ZcEF
         UHyjjxk/GPfRP2bmxFr40VY3ggU5ZW5oDOHpvY8OgewZnqgxCtt9ldQlzlUSY/Sqoz
         MER/1+dFjcAGktpDInuQvqYnKd+ZOBIPY5JHfW+n3ZU9ahoKkC4ZPH4/6sC4AJCqyI
         F4SpxmJFWyjyzxgZvcxQ5zXo+DRIJjLbYRe5uED4/yuaEHCem7JpQZN/nv+nvBj+Tk
         0C6Dw1K38/0PXWRsNIocgiamPmDLjp5yc6N2bKmnD5cVY8BC3a+0fj6zphIBewP4Mz
         YgoqODCEH6OqA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 5C0FC60A36;
        Sat, 11 Dec 2021 17:28:45 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YbRmbxcM9crWkl0y@ninjato>
References: <YbRmbxcM9crWkl0y@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YbRmbxcM9crWkl0y@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: a74c313aca266fab0d1d1a72becbb8b7b5286b6e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd66be54b92e66d6e27af4b57407052edbed7178
Message-Id: <163924372537.9148.1244666504123421700.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Dec 2021 17:28:45 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 11 Dec 2021 09:50:55 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd66be54b92e66d6e27af4b57407052edbed7178

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
