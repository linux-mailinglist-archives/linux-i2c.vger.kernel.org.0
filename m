Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3965573D54D
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Jun 2023 01:31:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229612AbjFYXb1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Jun 2023 19:31:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbjFYXb0 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Jun 2023 19:31:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92EBF188;
        Sun, 25 Jun 2023 16:31:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 149B460C4E;
        Sun, 25 Jun 2023 23:31:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 63AD0C433C0;
        Sun, 25 Jun 2023 23:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687735884;
        bh=mxUq8WovS8ZZ3u+lM2dAy5M1ffSkqILEuFQtM2QrQ54=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=iT3s0SbwrfiYY6qPc6+p+nFVRgiiOXzj6xc/gpqLYl3ooVKMXc8gdrJQ2eK5DpEhg
         mKh7yNDJtBBSui2wFWmYNBlo2a8eFMi9RVes9eNiQMOf8Oi8/MEaQEzD58zQ9ooJa4
         IreVvQDcNt8Aj+d1gETzaRCowpkT7aQsaHHjIbZZLopmCzwZdDsWW41ltfhjL78rmH
         NUqIOe3nWEyPnLp1QYu0HAzRfUx3V/wWh7O5sHYHZn60iDHpXKDEU7xdL70yuQk3vu
         RxuQFybGQuQy73nt/SGrnpOb8DlBcFOssBsMC0gxctfNcmHfSNKjJldXjfkPLBLs3d
         kF2IeaSB+d7TA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 44BE8C43157;
        Sun, 25 Jun 2023 23:31:24 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.4-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZJgjl6fXM50EofPk@sai>
References: <ZJgjl6fXM50EofPk@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZJgjl6fXM50EofPk@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc8
X-PR-Tracked-Commit-Id: e69b9bc170c6d93ee375a5cbfd15f74c0fb59bdd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3b2e2c14bcc12da2c463a7179db39139f682573
Message-Id: <168773588425.30120.10081636079791641297.pr-tracker-bot@kernel.org>
Date:   Sun, 25 Jun 2023 23:31:24 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 25 Jun 2023 13:23:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3b2e2c14bcc12da2c463a7179db39139f682573

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
