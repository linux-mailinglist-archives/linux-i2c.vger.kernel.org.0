Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 280246C825A
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Mar 2023 17:31:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231860AbjCXQbM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Mar 2023 12:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40294 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231857AbjCXQbL (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Mar 2023 12:31:11 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0456965B7;
        Fri, 24 Mar 2023 09:31:11 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id B36B8B8256B;
        Fri, 24 Mar 2023 16:31:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5CD57C433A1;
        Fri, 24 Mar 2023 16:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1679675468;
        bh=ZEi6YImQSeDAfohRV8QrpTK1pGX8zRF+e+HfHCcK/mA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=eTiFD8q1lfAQbOBzxbx+CB+3kBEyi0ULWk6EdkXfXMgHL/C8jt62CGna/a70jwf2Z
         /QPT1nf0HWVC3B9XWWzcUdxN6xpsTIEKSst4/SFjTOhTnoMVQkbHaUkkmE2YrnxLeU
         CY4zW0d7sxjXbWfWjZG6oYhJxmJLdNsJ1pqW25jUfCRXSvBYq46r2txqsmdhmBRLDw
         To8DhmK4IPzt6WNPIjDRiVDXvQQylHM4dxKh8oKZrs/9ZCXFmu0pdRFsOSa4QFbWZF
         L98QMm/auD+hp1vHVNY5TBMYzVP+O+Vzq+zIy8nRCZ1KO+suVLCVToFoKFiqguZby7
         9x472CS0yYPrQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 46AB3C41612;
        Fri, 24 Mar 2023 16:31:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc4
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZB1MCGRYs+W1cwG8@ninjato>
References: <ZB1MCGRYs+W1cwG8@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZB1MCGRYs+W1cwG8@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc4
X-PR-Tracked-Commit-Id: 92fbb6d1296f81f41f65effd7f5f8c0f74943d15
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed1407e7f7f906aed5afa851b0f409740c4bfea8
Message-Id: <167967546827.8924.2161418155214317430.pr-tracker-bot@kernel.org>
Date:   Fri, 24 Mar 2023 16:31:08 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 24 Mar 2023 08:06:48 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc4

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed1407e7f7f906aed5afa851b0f409740c4bfea8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
