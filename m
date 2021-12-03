Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B862D467D8D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Dec 2021 19:54:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236257AbhLCS5Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 Dec 2021 13:57:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234981AbhLCS5W (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 3 Dec 2021 13:57:22 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86D9FC061751;
        Fri,  3 Dec 2021 10:53:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 252DC62CAA;
        Fri,  3 Dec 2021 18:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 867FBC53FCD;
        Fri,  3 Dec 2021 18:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638557637;
        bh=Dj3UgovYtc08Lx5pulZb/nz0mOCPJHhKAEON54LkdiM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dhROiAHs0bUgJiD4TkAlqBa4vUZLHv1p/0paEnXcDVuiZqdjY2JskpnSfcl9F3nBb
         ENDV4YsYJV5CbjifUvwZ+C4H7UHTSLz1j7PawQFqPLPpN8npDa1eELOl6vtUFjOw7P
         gdTckAzPY8HFMrQR4hiFgk6pWu3UgUt9Lmz1yk/kPGDKF8rYpMou+Lb3kx/rmPJ/Nt
         p9ikZJ7s+ddzC9sm2v1cwsX6mYvwZErPtK1afmrvP0hm3GcVVG4aNQcXIRYc8LOceg
         kH1Zf/hI+hQErjOwbXdiRzTiiaNrJNPmq6SSpA8wSgRWxsYmv7j7HNnGsqt+4UoLBX
         7bEX8V4v5xGuA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 54E0960A50;
        Fri,  3 Dec 2021 18:53:57 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YapJpi/BNwQ3VOR/@kunai>
References: <YapJpi/BNwQ3VOR/@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YapJpi/BNwQ3VOR/@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 02fe0fbd8a21e183687925c3a266ae27dda9840f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f66062c7491b0f861ba1ee9c767c860fd615b2c3
Message-Id: <163855763728.17226.4484747444946640069.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Dec 2021 18:53:57 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 3 Dec 2021 17:45:26 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f66062c7491b0f861ba1ee9c767c860fd615b2c3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
