Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E61516F8DE5
	for <lists+linux-i2c@lfdr.de>; Sat,  6 May 2023 04:20:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233205AbjEFCUJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 May 2023 22:20:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232241AbjEFCUH (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 5 May 2023 22:20:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8745772BA;
        Fri,  5 May 2023 19:20:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 166F76420B;
        Sat,  6 May 2023 02:20:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 70625C4339C;
        Sat,  6 May 2023 02:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683339605;
        bh=cP5tn6dwHXwqLLid5wOgmvDAUn88NO8du54T5IyHD9w=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Cw5vGO9qPtH2Mo21biWKAL9oDryzNG9mUJfDSj7yEZHgalPG3TRONpQ8zTxqEigGe
         vGsjhdR7TRA5zqiedJ+zs7kyZ+pr5Vst0Ul3LkPTEkG0qL1jeNdOWFyl5El8C0mkPe
         4DXcEBY5JLDbcJGqYtcy6G7fEgpbAVSKCjF0t2jCENHE8DWOS2SNNut7j4y6qhuIU9
         gIKAxw/ae8Bkb1ABRbgxHfzTuCKjzRKRsiNwnsoPk+/ma0VsmY93Xq/HDLe3r2Wr1E
         AKv9339YV55I6JCJMWgalKg+MoKoF6znTP1fu/9Zu+Orfwqckyc4Wp1B7+EmIlxT/P
         DPyRGr3nfLv1A==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5E973E5FFCE;
        Sat,  6 May 2023 02:20:05 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.4-rc1-part2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZFVunzGXNMNUErVn@sai>
References: <ZFVunzGXNMNUErVn@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZFVunzGXNMNUErVn@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc1-part2
X-PR-Tracked-Commit-Id: 1bd922877a084c1c6c1d0cb1bb9c3700fa0f6c61
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a5e219005aeaf52cb10f9999a61c07a140db7097
Message-Id: <168333960538.28237.17348147376790696298.pr-tracker-bot@kernel.org>
Date:   Sat, 06 May 2023 02:20:05 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 5 May 2023 23:01:19 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a5e219005aeaf52cb10f9999a61c07a140db7097

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
