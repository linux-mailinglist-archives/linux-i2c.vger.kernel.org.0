Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11303B486E
	for <lists+linux-i2c@lfdr.de>; Fri, 25 Jun 2021 19:49:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230304AbhFYRvb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 25 Jun 2021 13:51:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:36648 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230236AbhFYRv3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 25 Jun 2021 13:51:29 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 27EEA61960;
        Fri, 25 Jun 2021 17:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1624643348;
        bh=/E+wUt683cQYtaQIcI5IhpiVwmB/gvMJDEtDrCI6waA=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=vMDfHszTcYqGqqOKiUOs077OWdOSEvakBtE2EaZIGOCXkmxnnw2lDEnk2FxZ3UIRh
         UQH7lHRO3SC3sPuwFUZm/8NPpAEnJv/Doxx8RpWGUrxZ2+5oamEKxohy+Z+tZLLL4D
         CXSYoTXQNTN2aKCa2E3QVuQevcvIXNg/U8Dm/NMom1EJ8pqPeP+y2wUWo8W+Qz878+
         dkruuNaXJLGTj8snHOClbO6ITbr/kB2Z3Y1yQu09aaIUpTLNMtnzbmwTbq4C9gsNrR
         8rYuDlv82a2zLBcMwY4FQF7IEfw/wC3Ju69NWv9XwVT4yykBqOTTIZghjn/LgRiPEb
         26cWbzov4qrMw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id 2213B60A37;
        Fri, 25 Jun 2021 17:49:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.13
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YNX3G9fQKWX+45gJ@shikoro>
References: <YNX3G9fQKWX+45gJ@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YNX3G9fQKWX+45gJ@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 4ca070ef0dd885616ef294d269a9bf8e3b258e1a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 55fcd4493da5ac8a0f7a0b3b5ae8448aee2041bb
Message-Id: <162464334813.2214.5459677175527044020.pr-tracker-bot@kernel.org>
Date:   Fri, 25 Jun 2021 17:49:08 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 25 Jun 2021 17:32:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/55fcd4493da5ac8a0f7a0b3b5ae8448aee2041bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
