Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B0ED8504882
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Apr 2022 18:59:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234511AbiDQRBg (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Apr 2022 13:01:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234545AbiDQRBf (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 17 Apr 2022 13:01:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF5CE1A384;
        Sun, 17 Apr 2022 09:58:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4BDEC61237;
        Sun, 17 Apr 2022 16:58:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9653C385A7;
        Sun, 17 Apr 2022 16:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1650214738;
        bh=maS8PER39nxEFZ/UepbRV7FFyDACFepFA3QfD1M9CNc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=rKcLr2i40RD4tn8UpvEfMa7QbOzi17or5kNErP8v6bNXXpB8tmHmU32mhm2cDTh8e
         wKBW50epN0HxWC9IhSWrMcwFoCifAHmbqwYykD/hoZb6HzsI44xMm49+ofJNQrbjue
         jCTO8/0aZ/WbR++TQp6zDQHj4c2sDLffdynN19tNeb4ClTRkqQ1pnK+mbS0v7YSt36
         YXWCy7dojj89+LgrlTvzp5YQNMu240dxgdF2tKt9GUIpL24cURvRk/O1OmtzoPj/vz
         6x9T7wzVOpfCJjdBe5HzNHsUiTVrLtqF0URRE0MxN1tpIl2Pzcmsvunh2s+Nz6rK8M
         bbGxDNfdAj9tQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 92F04E7399D;
        Sun, 17 Apr 2022 16:58:58 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YluC7rAj5syHOYWi@shikoro>
References: <YluC7rAj5syHOYWi@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YluC7rAj5syHOYWi@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: e35c93695c742b88f5fe32063674551440c63d08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: bd0c7d755bf3bad8ef075a899c10f192858c01d4
Message-Id: <165021473859.4330.4426497223334208694.pr-tracker-bot@kernel.org>
Date:   Sun, 17 Apr 2022 16:58:58 +0000
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

The pull request you sent on Sun, 17 Apr 2022 05:01:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/bd0c7d755bf3bad8ef075a899c10f192858c01d4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
