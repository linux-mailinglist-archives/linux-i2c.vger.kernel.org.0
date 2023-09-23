Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A09467AC469
	for <lists+linux-i2c@lfdr.de>; Sat, 23 Sep 2023 20:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232262AbjIWSZY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 23 Sep 2023 14:25:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbjIWSZY (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 23 Sep 2023 14:25:24 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DAF5136;
        Sat, 23 Sep 2023 11:25:17 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3DD44C433C9;
        Sat, 23 Sep 2023 18:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695493517;
        bh=NjopDASN4cafaiLW9pGS79WWHRQSZiTWmD8J0qpmibw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PkBFLKgkolKXsETYsMOWXVpKp3eD5YgG0DFNyfqYwI5biWoNBd59waMMVnGT6iLxF
         wGe/Jld828cHpo+k25KpToRBbePAB64LxHEdyuHzxL/S6YjWW999R8Wo1JKrEPiQjV
         ZhucQXDCD1j3sV/0tZz8E13ybZvjkFExzJ+7nkFMG4E78l3AfomAT9MbLRXXittbXj
         tOJhPZzQWbu45HOgxnoV1+Ii0IdUK81eimhP1iAwktpO+COKal89pNwWUP/4XbW8GH
         lsqHNZ00pNuzeZVqQbCWAb8OihNZJ4y9G1xRs31Gn2KW9NKK7/G++jD9idlw4n4gf1
         SLLrvl94JWiYQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24CE1C595C0;
        Sat, 23 Sep 2023 18:25:17 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.6-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZQ8TEfqhMnEqv6rA@shikoro>
References: <ZQ8TEfqhMnEqv6rA@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZQ8TEfqhMnEqv6rA@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc3
X-PR-Tracked-Commit-Id: 59851fb05d759f13662be143eff0aae605815b0e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5a4de7dc9e77ca914bb050e6d661624a43db794c
Message-Id: <169549351714.14827.7839485789096942659.pr-tracker-bot@kernel.org>
Date:   Sat, 23 Sep 2023 18:25:17 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 23 Sep 2023 18:32:17 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5a4de7dc9e77ca914bb050e6d661624a43db794c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
