Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 25A6C48ED1B
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jan 2022 16:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbiANPZj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jan 2022 10:25:39 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:60586 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243495AbiANPZc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 14 Jan 2022 10:25:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 538B0B8262A;
        Fri, 14 Jan 2022 15:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 039C2C36AEA;
        Fri, 14 Jan 2022 15:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1642173930;
        bh=rD5NHOMz1fPD0u+TQzXoNu4F4mR75dk7ItndCrC90LM=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=l+oI1gPUSeeX4lNYkQwxoKonGKo+no87XvfOUb7pq17mILFy7/djMk/43NK0d1Kl7
         XBUq8PwsoPxnzXTY07IOS2/LNRNrFeLsPetvaN3Pd9TFZigffgPNHa3hUz8yZKEOra
         NBH/4ZJIxPqyJUGV8RbYbWLkX8C+oATBXp7wzA5S6PvPXMWVW0oHfD7KDlCS32NgBJ
         P6icRjrYzaR0LaLmr59Wj9Ktoxz8M8jNAr/M05MUarxu0ydgXw2MP3yyOwHxGZ4u4K
         oSscH25r79KNzsiqWFUkze8we4oFJUaTv9bkr9tIY0FPobR0L5IAwKbaJSI5YDFWPa
         YOBD4IvKBNWsQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E6CD8F60794;
        Fri, 14 Jan 2022 15:25:29 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.17
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YeFNz6pdiGvVTPLh@kunai>
References: <YeFNz6pdiGvVTPLh@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YeFNz6pdiGvVTPLh@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow
X-PR-Tracked-Commit-Id: bf3c39f5da43499c52d4127b7f2f495b69dfeebf
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 112450df61b7373529b0fe4c122ad13b89d80a8a
Message-Id: <164217392993.6456.9900069742517740030.pr-tracker-bot@kernel.org>
Date:   Fri, 14 Jan 2022 15:25:29 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 14 Jan 2022 11:17:51 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/112450df61b7373529b0fe4c122ad13b89d80a8a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
