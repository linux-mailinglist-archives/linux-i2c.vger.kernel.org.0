Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD605FBA40
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Oct 2022 20:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230416AbiJKSX1 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 11 Oct 2022 14:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbiJKSWg (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 11 Oct 2022 14:22:36 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E339C7B78A;
        Tue, 11 Oct 2022 11:22:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7FBFF61263;
        Tue, 11 Oct 2022 18:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D87A8C433D7;
        Tue, 11 Oct 2022 18:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1665512529;
        bh=cen52J8mgWlqH4RvvYgdcdyADYiOj3n4piEaWLvjx4g=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Vr3c47hx50GXoGBIRbh0r7wyo5AhO7qT/DYzFtqixTFltf6zIA96njCU4EwN7NwUo
         ORyTtD74uHkEfLs37f97zVjhaaQSCjcwbDMfGlT5pSFcj3py9w+AYb4BHUa/Vfn1Fh
         TZWUIRP/S++sn73ZI2hzt0DffNzcC8YUAGW7ukgHGhUsxySMsiColeD5ze4Ikhkm+r
         R0hlqgPnrMpJSbPMIfrcUrspFHQoAD+1lKJ1cBMjAum/JscqTQMGeGpmkVTjYg5iQm
         +/BrtZTJiCo+lzN1DQzYC8Oq1sOJorY27kBdyQHYg+peUzsoCf7LqSqPTYhowOToui
         BT1ZPkYyp3J+w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C64B1E29F33;
        Tue, 11 Oct 2022 18:22:09 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.1-rc1-batch2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y0MPT6Mso6cD0mfN@shikoro>
References: <Y0MPT6Mso6cD0mfN@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y0MPT6Mso6cD0mfN@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc1-batch2
X-PR-Tracked-Commit-Id: fd66bd74afe880de4f008f96a795fedee887ff44
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c440f99695236ceb610606e4b5c50e150981f6c5
Message-Id: <166551252980.20259.12184210056195139536.pr-tracker-bot@kernel.org>
Date:   Tue, 11 Oct 2022 18:22:09 +0000
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

The pull request you sent on Sun, 9 Oct 2022 20:13:35 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc1-batch2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c440f99695236ceb610606e4b5c50e150981f6c5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
