Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 877CD72AEE3
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Jun 2023 22:55:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232907AbjFJUy7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Jun 2023 16:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232396AbjFJUy6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 10 Jun 2023 16:54:58 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0826B2D4A;
        Sat, 10 Jun 2023 13:54:58 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7BB9E618D3;
        Sat, 10 Jun 2023 20:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D174AC4339C;
        Sat, 10 Jun 2023 20:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686430496;
        bh=d9anqngGyvy/7Uc6RIFt3f4NSOkWvopQIqV+tyIqUQQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=bxSx0M3c1ww2+vPH/jUBiQdx2WlawfFdAgPjmkiMJ1Rk8s/4AUD7YF/azkAKRuTEU
         3B9k97dOR+uu70xTqGUXQVuuiLY5rPY88gLvV1f8nVQk6nLWZKbhJVAalt9lkV/3uN
         7MTDRwrRcc3QRxAsz0JL53G0eaH1KTCAq5ZcaxdE6bm8SxFWiSIvOvHwKGpkUwwxuH
         z0P8Zdmf4zCWolW6ls3jQ8xAucriM1Es6ipk2df6eR6Uqvs0tWWzBocof1b7nrswgm
         9Maxt6k0hCiGJwkaJCimsy5nB1nrGHOxSsHFOjCNHSw+sm8CJDlN7eyOE0NTrCtKcu
         6xyJ0A1SiKmzQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BBCC4E87232;
        Sat, 10 Jun 2023 20:54:56 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.4-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZITXbyXsKRMZtIaT@shikoro>
References: <ZITXbyXsKRMZtIaT@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZITXbyXsKRMZtIaT@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc6
X-PR-Tracked-Commit-Id: 33f36147be36c5fa0919d32d20d501ca97981d9a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 022ce8862dff83c859089cd14bc4dca0733e2f90
Message-Id: <168643049676.9094.6593140794131909107.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Jun 2023 20:54:56 +0000
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

The pull request you sent on Sat, 10 Jun 2023 22:05:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/022ce8862dff83c859089cd14bc4dca0733e2f90

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
