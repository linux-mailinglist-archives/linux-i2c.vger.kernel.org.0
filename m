Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C4DF17A3213
	for <lists+linux-i2c@lfdr.de>; Sat, 16 Sep 2023 21:00:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239422AbjIPTAb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 16 Sep 2023 15:00:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239298AbjIPTAU (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 16 Sep 2023 15:00:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15296CE8;
        Sat, 16 Sep 2023 12:00:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6A9EC433CA;
        Sat, 16 Sep 2023 19:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694890815;
        bh=wqLSU/Fxl8kE6SUM/vDFlDabenwY/KLczmDoDLPnPwo=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Refgsbcv7NXppu7sMwijImS9zcWIzx0gC4LVtR0sl+C8rSG54f8Keny4diCsnrKvm
         6kmamzwrupOqT+zwOOEHix3cInMJSuclpVHEx5y2Itrf/rLZM4U9hekPoZEMv1vttE
         uE9quNf9MJE/BQM98I+UGON6GUcEP/mzCxlcU0XqZTu3nBy014VOQYYCnH4COLCHzK
         /S2rCnFh+mvOXnXgR7fGULJ88e8wqsCTnRmO0Q2x9O6stNR+Q4IKGKgkpo5djulLe8
         DMyNEa31fax3VwgJurOZGoQMyxXUEymFSenV+PeRQ9OeGZycDqGzVvnBTuuKTHZcpG
         /0MfPStRGlysQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id BD183E26881;
        Sat, 16 Sep 2023 19:00:15 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.6-rc2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZQV6s4ScLByb/gkD@shikoro>
References: <ZQV6s4ScLByb/gkD@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZQV6s4ScLByb/gkD@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc2
X-PR-Tracked-Commit-Id: 637f33a4fe864ac8636e22766d67210e801fcd0d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c37f8efcbce1e03aaba5278cb8e291955754b020
Message-Id: <169489081575.3998.7096147347477465373.pr-tracker-bot@kernel.org>
Date:   Sat, 16 Sep 2023 19:00:15 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 16 Sep 2023 11:51:47 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c37f8efcbce1e03aaba5278cb8e291955754b020

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
