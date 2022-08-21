Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EA47C59B60D
	for <lists+linux-i2c@lfdr.de>; Sun, 21 Aug 2022 20:43:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231328AbiHUSmm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 21 Aug 2022 14:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiHUSml (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 21 Aug 2022 14:42:41 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17839175BE;
        Sun, 21 Aug 2022 11:42:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A203160DF3;
        Sun, 21 Aug 2022 18:42:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07481C433D6;
        Sun, 21 Aug 2022 18:42:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1661107360;
        bh=+PQLsyDAXob1E15XmCv0ecOQSqFl3hmGib3vQGqXXOU=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=jzCvomzFdG4K/4fw3DlkSaam866hrcQTb3CO+NB54w1dW6POBOR4Ct6FWcjbgb1SG
         GXzAuELItXNEXyOdOtJyKTt+Q1a2qx8OFBHgfbiKQrxtp2YlwqAiQ/2rTEWH8nyqgw
         H6K15EBctIHUOdewycVHGYFMco1uzucfStLLZFUf7+wubKhgYYc5V6S8uJHpCbHqcJ
         psG3wfhygvGvw9vE9c2Igvzcqq/Lsrf4yZwU0vp6IxYEbbXqJwosXuTeHxHNA9ukKd
         sXNpprigZ39ioMW+OV6rXE3mu79iV7dU5VEumlp7eBDiHCbMp1g8qdxu7PDZkLYw+w
         +JmZDzeoDEBFQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id E94D9C43142;
        Sun, 21 Aug 2022 18:42:39 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.0-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YwHwOwkBOAeoRuci@shikoro>
References: <YwHwOwkBOAeoRuci@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YwHwOwkBOAeoRuci@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc2
X-PR-Tracked-Commit-Id: d98bdd3a5b50446d8e010be5b04ce81c4eabf728
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3f259d33c0ebae1b6e4922c7cdb50e864c81928
Message-Id: <166110735994.1794.8763061236101520717.pr-tracker-bot@kernel.org>
Date:   Sun, 21 Aug 2022 18:42:39 +0000
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

The pull request you sent on Sun, 21 Aug 2022 10:43:39 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3f259d33c0ebae1b6e4922c7cdb50e864c81928

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
