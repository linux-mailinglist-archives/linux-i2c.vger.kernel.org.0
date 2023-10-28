Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66ADF7DA854
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Oct 2023 20:00:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229617AbjJ1SAs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Oct 2023 14:00:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjJ1SAs (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 28 Oct 2023 14:00:48 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE78C1;
        Sat, 28 Oct 2023 11:00:46 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2C7D3C433C8;
        Sat, 28 Oct 2023 18:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698516046;
        bh=bh4ZPWhvkxjK5TZxupGBRleEZPD7Fi1RC+/P4qg/9bk=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=nwRiPzh5hA5eTFlc6gkGIiWbJMwEAEb32M8MinJe/l2xhOUopLAhKasNa4YCPJIrN
         QIpo9jy4LxXks/ZCpiORsluPin6kUmB6Lc4PfoaL/wPjfcWSUuy+pWOU4RrO0sf+/p
         bk4i0SqI/SiRiSm/zeXj0rPnbl+9g9rVWRsE2whduyvMSCCo6y6LuhdjdVQoRoiRjJ
         ThdFgTt32MM7HZZejRX0WdDVz6r7ZW0H4RQvX7GEljoDcNBD1NrhC3LGGcqOkX84bX
         itXIYdrCZxQY8h759CHuRFL1X8YbEHK+HsBD+tQL+NRZFfMt81HSICiYKI0dzBhdhr
         9R8R3ZHmrz8MQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1BDFDC4316B;
        Sat, 28 Oct 2023 18:00:46 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.6-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZTypBKf7VqKqnTuG@shikoro>
References: <ZTypBKf7VqKqnTuG@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZTypBKf7VqKqnTuG@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc8
X-PR-Tracked-Commit-Id: c896ff2dd8f30a6b0a922c83a96f6d43f05f0e92
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8907bfd2b11ab0d09f2c408f82bff09e55d53a9a
Message-Id: <169851604610.21060.13776161409907157799.pr-tracker-bot@kernel.org>
Date:   Sat, 28 Oct 2023 18:00:46 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 28 Oct 2023 08:24:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8907bfd2b11ab0d09f2c408f82bff09e55d53a9a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
