Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A75945F51A
	for <lists+linux-i2c@lfdr.de>; Fri, 26 Nov 2021 20:18:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235425AbhKZTVz (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 26 Nov 2021 14:21:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233255AbhKZTTz (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 26 Nov 2021 14:19:55 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C318C061A24;
        Fri, 26 Nov 2021 10:41:31 -0800 (PST)
Received: from mail.kernel.org (unknown [198.145.29.99])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AAB6C62338;
        Fri, 26 Nov 2021 18:35:15 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPS id 2423C6008E;
        Fri, 26 Nov 2021 18:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637951715;
        bh=90Pew1VjM3fxxyuTXSlJJwIU0g0YhylRQJIYJZBsgBs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=sjOz+8EG8jj4XHNSRpqCSf6BxwEQP+5Ubhhp/IPQ7pjSeJYAxprit1T68vltizQq3
         GXg+bYrw2XL+D8X62jrlTNxcBjv971ReKYyEd6x5u9ZFDk5VpqM7M+xy800gCauJrm
         MyVQR+IeLfNhsZIujWnhnCxNf4uXrOSHNQtugchy+VdqdBLZGj6r1rpppg8yWhgxe6
         1+yaFld0SoB2NErobHVe2HBy0OY83KxSWle7YH4kb3DZ79sKEZuV7gNhV4wgJKk1nQ
         Lo3VbC/c/WMA0PqVaZtr6NSBHpZ9yM1MhZe6xhhasxHxY++hADu8o6TM+LMil2IHRE
         6i51xjDZ6HUsA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 1DB1D60A3E;
        Fri, 26 Nov 2021 18:35:15 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YaC5FYorV4yyQnaE@kunai>
References: <YaC5FYorV4yyQnaE@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YaC5FYorV4yyQnaE@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: bed68f4f4db429a0bf544887e64dc710e5a690ea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 80d75202f033f51581020a5ac06699d4dff89e73
Message-Id: <163795171511.22939.11310940243320684912.pr-tracker-bot@kernel.org>
Date:   Fri, 26 Nov 2021 18:35:15 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 26 Nov 2021 11:38:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/80d75202f033f51581020a5ac06699d4dff89e73

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
