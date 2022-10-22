Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44EC760905E
	for <lists+linux-i2c@lfdr.de>; Sun, 23 Oct 2022 01:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230210AbiJVXJO (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 22 Oct 2022 19:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230204AbiJVXJC (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 22 Oct 2022 19:09:02 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E8BED7E14;
        Sat, 22 Oct 2022 16:09:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2B143B80BFB;
        Sat, 22 Oct 2022 23:09:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CCBE8C433D6;
        Sat, 22 Oct 2022 23:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1666480138;
        bh=Nwu1UZMWF4zFItHnZRkC7DxLFiTDTK+dXVEUfDHD8Ao=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=DcX/IRRp5/gJQ85NEB+KGLWEgRwIM6DnBKidFfJwYLtshUrSZtYkX8ywHWdwS6ry0
         bOCQ/fpsJ70kdo0DSMgVbCs+mLhycvmExLfBJcUMurXlHdozMKZlLAKaqvlQPzVOtt
         +eGMr7PAlVT45wJYp/DbvfJmZmrIAlUN6YsVytyTnb7XyC/fSP+q2FgUV7cnsX+8rb
         /yZgKaPVH5NOo4N0t2RAWq+mjpS3uRrWNbQPzA0wbPPZKwVP+JlWyzM6jqpEd2nBfw
         qUUxytyAXfE6Kq5qnULUn90AfjAjR/FBYr+ZD7O6vm9sRG+yBqbEKGJK02CTEFLMDo
         kL5seTNnTaxrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BB52CE270E1;
        Sat, 22 Oct 2022 23:08:58 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.1-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y1ORTh8CnCi7flAW@shikoro>
References: <Y1ORTh8CnCi7flAW@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y1ORTh8CnCi7flAW@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc2
X-PR-Tracked-Commit-Id: 65d78b8d0405fcda02b69fd3c34327e4af5cd465
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cda5d920545c0f81554bfd241b190d3cb5c5da14
Message-Id: <166648013876.24083.17206890394943002360.pr-tracker-bot@kernel.org>
Date:   Sat, 22 Oct 2022 23:08:58 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 22 Oct 2022 08:44:30 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cda5d920545c0f81554bfd241b190d3cb5c5da14

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
