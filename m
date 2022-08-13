Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F525591CCB
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Aug 2022 23:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239755AbiHMVsL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Aug 2022 17:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240124AbiHMVsJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 13 Aug 2022 17:48:09 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6186E25C44;
        Sat, 13 Aug 2022 14:48:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1E148B80ACA;
        Sat, 13 Aug 2022 21:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFA0BC433D6;
        Sat, 13 Aug 2022 21:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1660427286;
        bh=Hnyg17C4t7FdpsEZ22GP6Xnx/A+n/AOUlBYRHRmMX4E=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=QmvFWJUqcSB3ygGcip6ytzOdsh9tfNWBaJblnnG2Lyd5MhKN3/YF21eac5SwhKZil
         miA35qrneyzFXK0DULHcTngmbD8mp446o2Pw98nq6bHisKk+ixfmIHDvuU2eRuU9Se
         o5gB0Ci6r8YVoI30j7K7MOsN6jLfLg/jLL0x8NOcivCjw4Eg8+NAd4jCPmm+cFxg01
         i7816mDY7v1ld0erisiJZXQHpAwBxzGnEKIU68chwAs9ay0X60mONjzF+SmEogG5Q6
         k6RJfXrKdhr66HWqIhT1Puj2BF9iuitgv7OHH5FZB6mUaHjdtifBOW2flxJOm3gPpR
         BEga5LfxyG6Mg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id ADC8AC43142;
        Sat, 13 Aug 2022 21:48:06 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.20-part2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YvfGY2qnl2YXrUgX@shikoro>
References: <YvfGY2qnl2YXrUgX@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YvfGY2qnl2YXrUgX@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.20-part2
X-PR-Tracked-Commit-Id: fe99b819487dba848cddd3d4bf4beb8e653d7e9c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 04734361953b8cc30d5552c1abe907ccfc8bc0fa
Message-Id: <166042728670.29926.4726195216529951945.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Aug 2022 21:48:06 +0000
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

The pull request you sent on Sat, 13 Aug 2022 17:42:27 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.20-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/04734361953b8cc30d5552c1abe907ccfc8bc0fa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
