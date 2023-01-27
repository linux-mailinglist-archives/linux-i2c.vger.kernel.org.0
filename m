Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D7E9767F0BA
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Jan 2023 22:58:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232254AbjA0V6h (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Jan 2023 16:58:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232256AbjA0V6g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Jan 2023 16:58:36 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70A237E6B0;
        Fri, 27 Jan 2023 13:58:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0EBDC61DB5;
        Fri, 27 Jan 2023 21:58:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6DCF0C433D2;
        Fri, 27 Jan 2023 21:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1674856713;
        bh=1dkrbDf5rRJ/Z3fOm1l1hDGZrDHV8fG5LIAK2bRZUTQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=mtjdj9v7bQum9ZxOVEAliPJ+750cGfUe3bNoasKWFbTKZcFxb1psgxDI/2gBRORYE
         GFHWUMjmjJsERPGaHmkMOQE29Yv9rdkCqoHCPIV8OdmHNYHqu7VkXH1Wu00zVTIdKw
         EeuE59C+quaKtLaMnBJiXYrGw56EaSKQREnt3iudKDnqOi3SD9SE5tMIuWgudxnC7Q
         gfm9nMF4if7FPxH7LOEeE+9WT5tZVHd7SNQCaeQXxhP2hWjNCtyfGU3xhk2PLrrDVj
         RsMq5Qxaos2FsQE7PXTKIdYfZRNPF/oQFb7p+mdZfa9bJLviNoJ7c/SgoyjUFN0br3
         l6UqeONlCkaiw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5615AE52504;
        Fri, 27 Jan 2023 21:58:33 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.2-rc6
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y9Q9746CiVerOtHS@ninjato>
References: <Y9Q9746CiVerOtHS@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y9Q9746CiVerOtHS@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.2-rc6
X-PR-Tracked-Commit-Id: 0582d984793d30442da88fe458674502bad1ad29
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e6f2f6ac500c67164f6f6b47299aece579277c14
Message-Id: <167485671334.1722.5345292977939454637.pr-tracker-bot@kernel.org>
Date:   Fri, 27 Jan 2023 21:58:33 +0000
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

The pull request you sent on Fri, 27 Jan 2023 22:11:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.2-rc6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e6f2f6ac500c67164f6f6b47299aece579277c14

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
