Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C72F2550B4A
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jun 2022 17:01:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236262AbiFSPBf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jun 2022 11:01:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236169AbiFSPB3 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 19 Jun 2022 11:01:29 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4CE6541;
        Sun, 19 Jun 2022 08:01:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8F343B80BA9;
        Sun, 19 Jun 2022 15:01:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38EC8C341C5;
        Sun, 19 Jun 2022 15:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1655650886;
        bh=XigiBCyVLru1Wnv3T3i5bTWfoIkEYpCkz+yXxo4o5Ug=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=WlOwIUGpAGM+rfLtBtQ0H8OXujBGLTfaCWkhi6J9ifHss7ybcrENaoe1fkFLWCa+o
         49Pp6Vl0cn6zb68Au009XOp/qoeaRuHRdnBieyqJIRoPF5zgbIwb09DgHVioeEVROT
         gED1jSLPOmDr73Lwra/mbHoKaWWmmm1c1r5OQkNkq+KalFRN7MiF8j/pT2tQE/hmqo
         IdGXDKOzTBsnnr5RMsldsjhPfOu3i4zu6QEyQLZWtQKK6iImEmRW7ApXwNVfd6upIo
         a/3tkJBQemZXxtib14afnPwPae78qU6f5mxQzaTJ91gj/6xeOdp/jN2H9tRBHv4LJH
         1pA+PMDwNKVng==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 24DF5FD99FB;
        Sun, 19 Jun 2022 15:01:26 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-5.19-rc3
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Yq7hDqjsFlxifNIl@shikoro>
References: <Yq7hDqjsFlxifNIl@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yq7hDqjsFlxifNIl@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc3
X-PR-Tracked-Commit-Id: de87b603b0919e31578c8fa312a3541f1fb37e1c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ee4eb6eeaf1468f2524cceef92906a378dd3df7e
Message-Id: <165565088614.16911.955703026633615403.pr-tracker-bot@kernel.org>
Date:   Sun, 19 Jun 2022 15:01:26 +0000
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

The pull request you sent on Sun, 19 Jun 2022 10:40:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-5.19-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ee4eb6eeaf1468f2524cceef92906a378dd3df7e

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
