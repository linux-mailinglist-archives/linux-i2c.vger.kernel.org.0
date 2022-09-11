Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 865445B50E0
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Sep 2022 21:37:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbiIKThB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 11 Sep 2022 15:37:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbiIKTg7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 11 Sep 2022 15:36:59 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B379324BC8;
        Sun, 11 Sep 2022 12:36:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 5076261048;
        Sun, 11 Sep 2022 19:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACBC7C433C1;
        Sun, 11 Sep 2022 19:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662925017;
        bh=J9dd4DTVh3qnObsGxUZuD4o03ZXDcKjh6Pm8NEsPhWo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PqVYKpopuuH3P2+UbL+dEKcXbsT233nmV5AZcVEvRSw9aYJU4iSV2rYqMjSfjL17e
         WFugVUdD95HX6wyizTWaPlrB5UqxA8P3qc3E4GtnuoHaClL9ZkBMkgK5pkIZxzzUu2
         1S4VC/1pgEQ2aH736soPVdWKel/6Ub0sLbehjh6xa+RbVYCYS6LYF69H7PZ/ZEmPvf
         lqviVheUcI1cf6xNKqTeqlI7Q/sFrxjyhmttDmeocwREnZg9fPx8tnxo2pl0i1NvQI
         p/vxcPitScLc9mnjrLBcc1AB74qj42PjK6JgYMtOLR3b9aVq87Vo9mQjCYU3+qAMgQ
         ga7XXpN4sM4UA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9ACEEC04E59;
        Sun, 11 Sep 2022 19:36:57 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.0-rc5
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Yx0Ll5QJtBf348l0@shikoro>
References: <Yx0Ll5QJtBf348l0@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yx0Ll5QJtBf348l0@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc5
X-PR-Tracked-Commit-Id: 4e2a2ed96adcb6151a15ea40db933d97f2ae7aaa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6429883ab1cab70464ed806ba18c1da0692017e9
Message-Id: <166292501763.24843.12560590150413470888.pr-tracker-bot@kernel.org>
Date:   Sun, 11 Sep 2022 19:36:57 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 11 Sep 2022 00:11:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6429883ab1cab70464ed806ba18c1da0692017e9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
