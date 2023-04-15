Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 323E86E330A
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Apr 2023 20:11:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229841AbjDOSL2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 15 Apr 2023 14:11:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjDOSL1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 15 Apr 2023 14:11:27 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 295DF2107;
        Sat, 15 Apr 2023 11:11:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B808660B8F;
        Sat, 15 Apr 2023 18:11:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F842C433D2;
        Sat, 15 Apr 2023 18:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681582286;
        bh=RSpUl2WRlS0eYtC+/Ks4il4MzK9qiGWdebLYIf+ggRc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=cFuweKiReqF3J3Vrf7aPNFlsj5WpzQ3Kb29NtOKIvwNHBqFHZH2t2i/1KTa849UvS
         NCetUaFGTqBXSq4ibSQFicwFXnozBk7nGu4sLs2uXtpGQJzHAxjZDlS5TwHKwLBD+q
         KUB36ZHBOSur71n/GXmGVJsYjHlK8n6JiHnjRk75FoNHV5uECJhdcn31PT/Lomlni/
         iHNA2fx6Iq0AeW2L+bGLWCMANsZ7tUQs9cYb0JCo4/qMQ2CKYxnL013d9mbzuBIV8C
         5exvEF5Bn+Q0p596dKd5QOGzNYhKb3gp7s4oJdZJmYOfRScykE2sOczrY3Qa09aeTa
         p+tkpIrUETdng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D984E5244F;
        Sat, 15 Apr 2023 18:11:26 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZDpvcE2jMBPqlxgF@sai>
References: <ZDpvcE2jMBPqlxgF@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZDpvcE2jMBPqlxgF@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc7
X-PR-Tracked-Commit-Id: f8160d3b35fc94491bb0cb974dbda310ef96c0e2
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a7a55e27ad72fb0dc9281d6211cffeebef8dde65
Message-Id: <168158228604.18559.6978567720936930610.pr-tracker-bot@kernel.org>
Date:   Sat, 15 Apr 2023 18:11:26 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 15 Apr 2023 11:33:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a7a55e27ad72fb0dc9281d6211cffeebef8dde65

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
