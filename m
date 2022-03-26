Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAFE4E8419
	for <lists+linux-i2c@lfdr.de>; Sat, 26 Mar 2022 21:18:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235401AbiCZUTk (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 26 Mar 2022 16:19:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235397AbiCZUTk (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 26 Mar 2022 16:19:40 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53DD01EEDA;
        Sat, 26 Mar 2022 13:18:03 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 08D36B80973;
        Sat, 26 Mar 2022 20:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6F25C340E8;
        Sat, 26 Mar 2022 20:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1648325880;
        bh=4xGtRmWhCWiuryTgYztVhyhwrlRFXjQQeyx45YoyvL4=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=FOhnFWfV5VgbNjn3hZLJ+8cRCsxgMICSdU/5Or3eqmcXQz5GGOW8XE7K0anQ5c+ZN
         WPHyQyMfbTdYB9IZ+Hp3uO1+Xa23It0DNWj61EguO5N72iS6TkrthI2+5mGbhpzL96
         sdxitoPmpLqhqVL4+J9Ukbox7jsYJoEqxSyKIz4D7199m7y7JGxrmUc6RYqIlcE1oN
         Tu2q7MhU/hkOFEvwgjQHrjTr2eZSjCrcB9EaYiT/rIRH7baVkCk6dBaqoMkkbf8VFJ
         Q6gBq0yB8yrd9zU+1/TB6BP3wOYH2mkluW8h9xe8HgP/5pxO54n9ZwC0mb0FvwAIfv
         onHFIOc+XJ0dA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B4E35E6D44B;
        Sat, 26 Mar 2022 20:18:00 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Yj19RH3qpzQsIV/O@shikoro>
References: <Yj19RH3qpzQsIV/O@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yj19RH3qpzQsIV/O@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow
X-PR-Tracked-Commit-Id: 1a22aabf20adf89cb216f566913196128766f25b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5627ecb8374a00163d90bc92c33f829ac27895b2
Message-Id: <164832588073.7233.16033588274790007629.pr-tracker-bot@kernel.org>
Date:   Sat, 26 Mar 2022 20:18:00 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 25 Mar 2022 09:28:52 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5627ecb8374a00163d90bc92c33f829ac27895b2

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
