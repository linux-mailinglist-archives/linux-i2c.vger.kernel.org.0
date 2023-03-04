Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 684EB6AAD09
	for <lists+linux-i2c@lfdr.de>; Sat,  4 Mar 2023 23:55:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjCDWzR (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 4 Mar 2023 17:55:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229534AbjCDWzQ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 4 Mar 2023 17:55:16 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 543EB11E94;
        Sat,  4 Mar 2023 14:55:15 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 076ABB80946;
        Sat,  4 Mar 2023 22:55:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8244AC433EF;
        Sat,  4 Mar 2023 22:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677970512;
        bh=JM+A7JTpVeg2xZau+fcvBwkhuupdd8BJ0fEvGcFeNPQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=ZDQFCijeh1oDB+9ngyY0RTQ55pS22P8gW40ZYZaw5NjyNeu1EUgJswxqTFroQvDgC
         YWBuEAPRgqP67hzJ8zapZqFsRFYZAj/ZHSz/45yxsWyS/krPskYANEc19CiC5pTjpl
         4Q06xqhIgrOzbmhfolYg5n/C/ArGH7nnBSHaxdRADkSYN7v6GFEgAF+RhqfOtS7CFE
         /AcF5oQJy7yYjAL/gMxfSibxbx2aFtRY1CHzLzM1NZN4yS/Tn4O5CtKafNsanbyIcr
         VwA4AxBK4NZd1xtS9gDLTr5i+o573oqFARmofeXMRMT6Pz1ufEqpmb0PEWY95cxY4j
         ERfJ8XyAbFhHw==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6ED8FE68D5C;
        Sat,  4 Mar 2023 22:55:12 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc1-part2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZAO/txYiFrl9y6T0@shikoro>
References: <ZAO/txYiFrl9y6T0@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZAO/txYiFrl9y6T0@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1-part2
X-PR-Tracked-Commit-Id: 65609d3206f784489eb1ebd6fce64b84a42cc63c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b01fe98d34f3bed944a93bd8119fed80c856fad8
Message-Id: <167797051244.11009.2295725672105717127.pr-tracker-bot@kernel.org>
Date:   Sat, 04 Mar 2023 22:55:12 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 4 Mar 2023 23:01:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b01fe98d34f3bed944a93bd8119fed80c856fad8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
