Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFB458967B
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Aug 2022 05:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237620AbiHDDS3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Aug 2022 23:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236716AbiHDDSK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Aug 2022 23:18:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D14EA5F113;
        Wed,  3 Aug 2022 20:17:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6E639617E4;
        Thu,  4 Aug 2022 03:17:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C5993C433C1;
        Thu,  4 Aug 2022 03:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1659583071;
        bh=Tz4NKc8/eSKL4MyArZKrqG2yjGN3MvQigcXBmxigrhU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=FfJKXy+FoxCfhVo1R98uQqIdurcoFK6UB03hQZ2f5+4L5Tg/+Uwdm9CODIT8c6PP+
         tL76dMh0dOAax1r6QEQjnpajX/fYscZcw7qAgiIm6CqN5PUUnn8Es4lc5OeCrAKWZp
         m7W/ER6I+1nB2H8qirYR2ZpSR05sVjXJ0zuqz221XlPiMGKvnlbIGTt3FyJqZO0PCE
         reppdqnTYLxptljiizgY/LLRiYwQeWfErP6pZiGgGedh8Da3nk0oadJOywOQu5f95R
         Cs+tVATIyeE5lRij2gco7uaaM4cXdtBoFeTkOkGrPdJG3NihxbLfVkH5VsngNKeedB
         lcGExdPcXYeRg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4879C43142;
        Thu,  4 Aug 2022 03:17:51 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.20-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YukwCEIqWyIZmMza@shikoro>
References: <YukwCEIqWyIZmMza@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YukwCEIqWyIZmMza@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.20-rc1
X-PR-Tracked-Commit-Id: a11821495fd4d9b5c97945db929e02c473b7a5d9
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80dc75932ff231b05e0adbf5054bf4c9f0fb468c
Message-Id: <165958307173.6841.9421639941334444877.pr-tracker-bot@kernel.org>
Date:   Thu, 04 Aug 2022 03:17:51 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Tue, 2 Aug 2022 16:09:12 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.20-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80dc75932ff231b05e0adbf5054bf4c9f0fb468c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
