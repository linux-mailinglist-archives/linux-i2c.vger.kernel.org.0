Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3EEA5E9435
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Sep 2022 18:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232806AbiIYQI7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Sep 2022 12:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232789AbiIYQI6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 25 Sep 2022 12:08:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AA082B1AA;
        Sun, 25 Sep 2022 09:08:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 32D03B80D62;
        Sun, 25 Sep 2022 16:08:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E6CF2C433D6;
        Sun, 25 Sep 2022 16:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664122136;
        bh=EExKq06+Xu8Og6b1VYqQgdz9IBT8yqMp7/Dzsb3Fv1Y=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=S/O9FtYbyGE0diC+1UgLvLOhhh2EPSkEbyY8lY5FctJa0Ru9SF1cIBMf5zs3Eh92h
         wzmQ6Uvq4r6c8YEjoMK8NUyDEvI2XfZTns3vy6GX9KXnxf+SminBoSrcCpjgWNVWU5
         KvBNVXSfZykivKtwCPWh+dPHb1/U/n8MPWBYjaDKzKIW83Zo6pzwJcAz49mFgdRVLN
         LvTUrt2GNvFC3A/9vFZH5F8+S9dmCSyz5hn024xQc+TxZ6jq2k+X+/uUJjAlp69HW3
         QrmvzC+srmvoTzOrQlk6kTv9oiwapAu+vuVb5Sk1/R6Lcev1MZJ5vZAxOPT0J05mI8
         Q1yPUrQUySkYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id D524DE21ECF;
        Sun, 25 Sep 2022 16:08:55 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.0-rc7
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Yy9sbyqEvO8OqESO@shikoro>
References: <Yy9sbyqEvO8OqESO@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yy9sbyqEvO8OqESO@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc7
X-PR-Tracked-Commit-Id: b7af938f4379a884f15713319648a7653497a907
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f0cc7c00089bf923259370fefc1d4f48d7252fc5
Message-Id: <166412213586.26660.14806689509915149558.pr-tracker-bot@kernel.org>
Date:   Sun, 25 Sep 2022 16:08:55 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 24 Sep 2022 22:45:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f0cc7c00089bf923259370fefc1d4f48d7252fc5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
