Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CCE916B5ECA
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Mar 2023 18:28:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbjCKR2p (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Mar 2023 12:28:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229945AbjCKR2n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 11 Mar 2023 12:28:43 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B14192B2BF;
        Sat, 11 Mar 2023 09:28:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4D6E360D14;
        Sat, 11 Mar 2023 17:28:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F089C433D2;
        Sat, 11 Mar 2023 17:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1678555722;
        bh=Y9+lXXAIh+pa1sBk8U5fMTT8lpvSzohNui6lRAijsUQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=OLA4zCzIJcHFaIcWA6uVnXL4PdSJaORyunXPQoHAeLCdKhDxv1ZIN937xI8xqF2wO
         0RgcC0pJQYfFoyCODY7NDJeqVz1g/RrVQ9HlWsC0xgMeC/DvLu2ygnCrTf09LiUnk5
         6hbRo32PIwhiA7tpAQvyy3FVcNEMYLJ71BZQxhOI41MvCYnorVGPRxZhadc0Z3SOKX
         uAxObblAsRjw5YkM3caCec2U2GhqAkXCnnVqWkFoUGUAAgGJqHJaF+Kqrb22hNQvzS
         7OOgtqpJAKmuT+kmjviQqvKHyjuaTxh7kRzgfza46XxyP4JmV/wby7ASOHFvEXxdyj
         pcH4D/qNgk7sg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0D17CE61B65;
        Sat, 11 Mar 2023 17:28:42 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZAwrxZSj84gsb7Ev@sai>
References: <ZAwrxZSj84gsb7Ev@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZAwrxZSj84gsb7Ev@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc2
X-PR-Tracked-Commit-Id: 9e5f81f9a6e78ba411117146ecf324d0145ae89a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 81ff855485a366a391dc3aed3942715e676ed132
Message-Id: <167855572204.4209.12406224882305476226.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Mar 2023 17:28:42 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>, ukl@pengutronix.de
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 11 Mar 2023 08:20:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/81ff855485a366a391dc3aed3942715e676ed132

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
