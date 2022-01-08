Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BCA4885D9
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jan 2022 21:19:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232736AbiAHUTy (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jan 2022 15:19:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbiAHUTx (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 8 Jan 2022 15:19:53 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF668C061401;
        Sat,  8 Jan 2022 12:19:53 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6390E60DF8;
        Sat,  8 Jan 2022 20:19:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C84ABC36AE3;
        Sat,  8 Jan 2022 20:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641673192;
        bh=cUR1feqTHEfDDj6QkrOIlVGA+Clqj5JBW/1hrw+FZnY=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PUJQaSANOYkcBfS5Pkz0e9fuYqTCniple1XO3WwQbWNUqPyv/wMvieoANFFLpaNsi
         CQd/srBh0xk+axtmVIGVBS8ngRIqKAoosQbYUEzXoPjFPhpZ9AesJS0OVG5EGzOVs2
         6k80NaLEmE2ZXVI0R34JrB83fnUz7S85rCdZ147grDTdkKBZZu7UwEitX+FOatLayz
         sKjf8Gkd0PGXBoLPo+uoKMvC1vBuLtOHJ3UyFpr4FKHI2Ql1XZgbul7o7KIt62NwYk
         /W3k6oj0YOequITJzvHYnw6juPmOKSWlv1KsKjGx3j2BSj5NmAUJbt9QHTdNyBSb5y
         GU3Pkjdj/IrYA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id B419CF7940C;
        Sat,  8 Jan 2022 20:19:52 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YdnToqh/UgE8NtXX@ninjato>
References: <YdnToqh/UgE8NtXX@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YdnToqh/UgE8NtXX@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: a19f75de73c220b4496d2aefb7a605dd032f7c01
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 21f35d2ca83e64603b9f543b537491d333b69c51
Message-Id: <164167319273.14130.1496524074439195759.pr-tracker-bot@kernel.org>
Date:   Sat, 08 Jan 2022 20:19:52 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 8 Jan 2022 19:10:42 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/21f35d2ca83e64603b9f543b537491d333b69c51

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
