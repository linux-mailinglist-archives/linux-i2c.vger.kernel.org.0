Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC98D5F4DDA
	for <lists+linux-i2c@lfdr.de>; Wed,  5 Oct 2022 04:43:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiJECn2 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 4 Oct 2022 22:43:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230143AbiJECnE (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 4 Oct 2022 22:43:04 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7192E71BF1;
        Tue,  4 Oct 2022 19:41:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id D5944B815CB;
        Wed,  5 Oct 2022 02:41:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 89878C433C1;
        Wed,  5 Oct 2022 02:41:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664937706;
        bh=MAEJUuIaSbPUcvJtzAApX9GuurJ2qQBm3lbQ/+AqYg0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=n5dw2nn07CDXE7gQgrybBe3w/sVESjRzunkLVF8C3IsPOOw4n79MpAAwCqenoqIdE
         xUVFJQYL2jyIGdIU7XK60+HcPX6rj2NcBzjEgFb4pdV+xTo9d0ifdo3NHIP3EZoZIo
         OggaFz80h88vbDJw8A7nSFv1FURB6SPeenZi9yXJ37xcbypaFi42E5c+rYcF7Tqc8v
         spzYyHKkFZ2bbIcD2mycSujBDqv1UWKqKbK/03dV8RSg6uwZatjFFTmRHDU4dr6iDw
         J9aZHq7monx70LKhE/gtPfnoxXaUSQkRfEDJXXZMYhi2q6avotzwUBEwoNRfyCldQB
         dORjEYqj2ZUgA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 768D3E21EC2;
        Wed,  5 Oct 2022 02:41:46 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.1-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YztP6CKxbM/oeNj7@shikoro>
References: <YztP6CKxbM/oeNj7@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YztP6CKxbM/oeNj7@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc1
X-PR-Tracked-Commit-Id: 228336f50711e9f0f47352483a8501e0c598845b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b86406d42ae3c41ae0ce332ea24350829b88af51
Message-Id: <166493770648.5416.12677458623993227747.pr-tracker-bot@kernel.org>
Date:   Wed, 05 Oct 2022 02:41:46 +0000
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

The pull request you sent on Mon, 3 Oct 2022 23:11:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b86406d42ae3c41ae0ce332ea24350829b88af51

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
