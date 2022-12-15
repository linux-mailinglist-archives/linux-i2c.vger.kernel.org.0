Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9345564E3FE
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Dec 2022 23:51:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiLOWvY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 15 Dec 2022 17:51:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230082AbiLOWvT (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 15 Dec 2022 17:51:19 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D1074387E;
        Thu, 15 Dec 2022 14:51:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E5AC4B81CC1;
        Thu, 15 Dec 2022 22:51:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A370DC433D2;
        Thu, 15 Dec 2022 22:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1671144676;
        bh=Gmt+o6MMc+08X4GwEBh3PldF4ewnlmKaHPNkUCGbMgg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sH/f4sqQ2229boha1yC7pRIyERbHxA8MGBtUeqVJ1ay63uKH2vwaCNXLOfA9wWn0l
         jCiMVRzhAYYInjFv+SOYjZbhipJIxvTHZ9PxiqwjlTCs/8Jjvd6p4uPk2DHHYtdxqA
         rZwXH5iF9cidPPzLU6WvzVShMnDzjGQklfVx8s0sP5IlOJZKOHaopm/0T3CKPuulbF
         QtDgGViV3MBORhm8/du5rQQ+/TfXoo031klUrSlTE2QGfBqqz9WbCFfwMOnfSL4qTy
         7NtOuHT25ZY5PJp/ga2MJBbnP2H13mMJU22XKol+xdi3jqPRyhsfq80uzXMT5kw/ZO
         kE4HGDjbwyu4g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 910E8E4D00F;
        Thu, 15 Dec 2022 22:51:16 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.2-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y5uVrz8YuuWDpAzR@shikoro>
References: <Y5uVrz8YuuWDpAzR@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y5uVrz8YuuWDpAzR@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.2-rc1
X-PR-Tracked-Commit-Id: 39244cc754829bf707dccd12e2ce37510f5b1f8d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ec9187ecea142593c54cf7a73ef2e1a3d517495a
Message-Id: <167114467658.30455.14608282477717905029.pr-tracker-bot@kernel.org>
Date:   Thu, 15 Dec 2022 22:51:16 +0000
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

The pull request you sent on Thu, 15 Dec 2022 22:46:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ec9187ecea142593c54cf7a73ef2e1a3d517495a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
