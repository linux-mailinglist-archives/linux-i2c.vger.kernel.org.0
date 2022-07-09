Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0479B56CB39
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jul 2022 21:13:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbiGITNc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jul 2022 15:13:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229462AbiGITNc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 9 Jul 2022 15:13:32 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0A892BE;
        Sat,  9 Jul 2022 12:13:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4EB7960FC0;
        Sat,  9 Jul 2022 19:13:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A7188C3411C;
        Sat,  9 Jul 2022 19:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657394009;
        bh=J39sJHXm7VoJQ+GpKr1u5Cz2JMCT/93aGWmdFdVhV2o=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=DLaoDbJG5swCMZdj7XvPYuatXg9zM8d8PbevEutLqbsaDnwgYIWjTDh6EHh5SusyA
         /Zp7qBi2lYlBiC/EtAszxHxFYlbKivi+ZlP4lx6uQ0qYRd45O+dss0ZOu5Kn3Zpuqx
         SgD932J5+QiLRxC9Y+dCtJhz3CLmxkhzpr20TmG56vBYDEM/On/EP5usgKSgxa4Hbp
         VuqOsThHNN3lGtxBLFbgnRVBG0H5AH9vD0iKDnJyN3WECvAkwrRQPn0BmcIw8akNJC
         XNBQ0h+K4rgWsEDI2r091nEOirvrZBSum94/Mo8w45sfximIXN5sjDQwigfKfTe2zN
         oRO5qI1HuurjA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 919DFE45BD8;
        Sat,  9 Jul 2022 19:13:29 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.19-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YsnDMSqbVygxidsL@shikoro>
References: <YsnDMSqbVygxidsL@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YsnDMSqbVygxidsL@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc6
X-PR-Tracked-Commit-Id: 3501f0c663063513ad604fb1b3f06af637d3396d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f
Message-Id: <165739400958.22033.16011654731823034780.pr-tracker-bot@kernel.org>
Date:   Sat, 09 Jul 2022 19:13:29 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 9 Jul 2022 20:04:33 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b1c428b6c3684ee8ddf4137d68b3e8d51d2a700f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
