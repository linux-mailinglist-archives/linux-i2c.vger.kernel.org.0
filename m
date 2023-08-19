Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A8CC5781AA4
	for <lists+linux-i2c@lfdr.de>; Sat, 19 Aug 2023 19:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233884AbjHSRaW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 19 Aug 2023 13:30:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbjHSRaV (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 19 Aug 2023 13:30:21 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 697FFE6A;
        Sat, 19 Aug 2023 10:30:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F212E60A4A;
        Sat, 19 Aug 2023 17:30:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 55A13C433C7;
        Sat, 19 Aug 2023 17:30:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692466219;
        bh=OlNTMdaQSWY8PfpJscZhUOXVyztLvlW7jE3AzMp+uFo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=AAm20DYsr0DaMFxvynNVk7lpc58xSQTCHdN+JjeL6LsvHLj6AyqTfYR/Miq3WCgqU
         rtrDR/5/LGS3z2bDD5pI6kGYrjoO+5ysELgvAPa6iE78A4j66ek5s38L7pvnxJNM3W
         0SYy5fstRxgAYvwdUqeyYOpr3Ds87oU1pmaWBf5JYj7jpuayhesLx2VqLMuOyj6b2c
         UihRwxVIPG2QhRgEY+KbsZQpLdL0pWVP7ZObdAIA4UpNBx5aB1jeWZkNGGFWV1SKmp
         4QC8YjfUHGytccUbPhK11ZHABH+X8kVnNVjIunvrEuhvf3Pd6MkuW4K/WUjGonNOH2
         mkIdgT22l78tw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 3ECA2C59A4C;
        Sat, 19 Aug 2023 17:30:19 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.5-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZODtsyZ2g1EX8C0X@shikoro>
References: <ZODtsyZ2g1EX8C0X@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZODtsyZ2g1EX8C0X@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.5-rc7
X-PR-Tracked-Commit-Id: 4caf4cb1eaed469742ef719f2cc024b1ec3fa9e6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9e6c269de404bef2fb50b9407e988083a0805e3b
Message-Id: <169246621923.23997.4832059481901560386.pr-tracker-bot@kernel.org>
Date:   Sat, 19 Aug 2023 17:30:19 +0000
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

The pull request you sent on Sat, 19 Aug 2023 18:28:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.5-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9e6c269de404bef2fb50b9407e988083a0805e3b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
