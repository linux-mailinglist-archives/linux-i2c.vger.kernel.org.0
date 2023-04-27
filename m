Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A757C6F0C73
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Apr 2023 21:20:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245168AbjD0TUX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 27 Apr 2023 15:20:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245136AbjD0TUP (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 27 Apr 2023 15:20:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44F274488;
        Thu, 27 Apr 2023 12:20:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 265AD63F29;
        Thu, 27 Apr 2023 19:20:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB7CAC433D2;
        Thu, 27 Apr 2023 19:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1682623209;
        bh=NOb7FSKYfqbN6nh/C5z8O/yJb6vSbFHV7QMFrVmLveY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=H+KsntsyRcduVtDQF5r7dTyvzFN6k6Kv7aIS1nE4YRBIxZLhdU3RVO5JJCPxsUSnk
         JY6tI6vHGUaup3Vp+zDlhbdodELvt7o+FeZRVf+wKbzCM19rBevuvTK21jsKPuG2Bm
         UeUhF2fGr9IvByu7D9OJRp7ndoe4bqfXtz//PXqZtYiMumw1dL+grhXpuJUiUuh/px
         7Dmp24aR56h0UI3AHhuL1IN7FybIT1Sw21AY+mbQZXtHWImlQihkVpkBl6mkgiDR5C
         guVmt2La1cuJEz7uOerRDnWOQrhwi9LoYkR3n3ELrzJyfK7LNMJ4kfb2Wge7O0xFEw
         c3xnC7thNww7Q==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id DA46CC39562;
        Thu, 27 Apr 2023 19:20:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.4-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZEluZxJDhXKFj2qk@sai>
References: <ZEluZxJDhXKFj2qk@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZEluZxJDhXKFj2qk@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc1
X-PR-Tracked-Commit-Id: 38c87827ffd3c7e1dd61eee9a7dea13d487dc2ed
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 89555eebb9fb603ad43c0def8ab35e76c210002f
Message-Id: <168262320888.21394.2457322249673779102.pr-tracker-bot@kernel.org>
Date:   Thu, 27 Apr 2023 19:20:08 +0000
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

The pull request you sent on Wed, 26 Apr 2023 20:33:11 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/89555eebb9fb603ad43c0def8ab35e76c210002f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
