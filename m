Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 455AE5398FD
	for <lists+linux-i2c@lfdr.de>; Tue, 31 May 2022 23:50:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348109AbiEaVuR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 May 2022 17:50:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348125AbiEaVuP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 31 May 2022 17:50:15 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 047E58D69D;
        Tue, 31 May 2022 14:50:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A8ACBB816D8;
        Tue, 31 May 2022 21:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C8E7C385A9;
        Tue, 31 May 2022 21:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1654033812;
        bh=K6dGceNuyiZZo4IrjV7+OhlZjmG7tEZEIhuBwFQTwwI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HklglZCPY2lhqywK+osH448koucYrgsn3WjWFnI+0oD+kwvTshsRC6bv73adio0zf
         zcEs/2e63i/yOAtsUAzAU0CUcF+VbK+s2AsDMiLfGSFDoeIUVkUKy8rTwY3l1pICth
         taXNe3y2Jp0daFOCh3EdwXQnagb1ma5MyyuEm1owqTy0QlR9kHHgc1gJRUOh+22Y1A
         ScQxo23zV+OY60vEuHYShfAkuZ4Fr6znmpaSLFDadc+YPAfx7JiSdbykyjFgxT5Spu
         J8uhNl09oUP8gEccSKheHdbYvcQRnxGJi+sBfu8LQyDGu9+eXrLhIfcPGjUzg0y8so
         GRmjodvICnT4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 1BF49F03944;
        Tue, 31 May 2022 21:50:12 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.19
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YpZB/KoqwZJxvzv4@shikoro>
References: <YpZB/KoqwZJxvzv4@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YpZB/KoqwZJxvzv4@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19
X-PR-Tracked-Commit-Id: 3cd4030da3a9b54ee1ffb8397aba857397c703e4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f8a52af9d00d59fd887d8ad1fa0c2c88a5d775b9
Message-Id: <165403381201.9010.78429960678591762.pr-tracker-bot@kernel.org>
Date:   Tue, 31 May 2022 21:50:12 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Tue, 31 May 2022 18:27:40 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f8a52af9d00d59fd887d8ad1fa0c2c88a5d775b9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
