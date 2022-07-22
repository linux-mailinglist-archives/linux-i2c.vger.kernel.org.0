Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 713E957E7E7
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Jul 2022 22:07:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236656AbiGVUHv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 22 Jul 2022 16:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236603AbiGVUHv (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 22 Jul 2022 16:07:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C68A68CCBB;
        Fri, 22 Jul 2022 13:07:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 653A761FB3;
        Fri, 22 Jul 2022 20:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C20CEC341CA;
        Fri, 22 Jul 2022 20:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1658520469;
        bh=U64Zg//PxuJ09sa4FOiOJIc5ijMp2M3jX7o9reSw6K8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=HZlpIcL+iNJ+JxaQMwUWOs0k+zCFqiL5aFcQRNLQNCuKxVUx3MmJWPqrBacV9L4ek
         dNQG+Z3kKVzAiQWwSiq7EXi70zUEg6cXmbU8sbBaOq+Jv8aZguhFPR/k/Jb1yN5D/p
         qBwsL/IJ6j6SiyL23B2T8WmtWz1OiWMAJD1uWs3DGfPVZgSV2Yl446otC5RdeaeDWJ
         +89ogfnuSVnKCBHLsQYZAtT3wNFTDDmrtwAPOGWU0FxjiaGXILxdDjOgbq6z+q7VMN
         UDNbCoPS/JYdsjzBVaVkuhTyZuW36ZxEyDEOhrx0yHy7HzJtbbn9A6A9IbcYjX+hCB
         CH0lAUFwZoStg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id AD5CCE451B3;
        Fri, 22 Jul 2022 20:07:49 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.19-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Ytr09aZMfeDU6M24@shikoro>
References: <Ytr09aZMfeDU6M24@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Ytr09aZMfeDU6M24@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc8
X-PR-Tracked-Commit-Id: 4ca8ca873d454635c20d508261bfc0081af75cf8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4a1dcf77f47ec45e4c66787b2cd47f8b768c74da
Message-Id: <165852046969.15752.10583150595185975986.pr-tracker-bot@kernel.org>
Date:   Fri, 22 Jul 2022 20:07:49 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 22 Jul 2022 21:05:25 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4a1dcf77f47ec45e4c66787b2cd47f8b768c74da

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
