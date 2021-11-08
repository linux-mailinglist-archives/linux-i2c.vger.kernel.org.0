Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B2D3449D10
	for <lists+linux-i2c@lfdr.de>; Mon,  8 Nov 2021 21:27:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230243AbhKHUaH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 8 Nov 2021 15:30:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:41900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236349AbhKHUaH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 8 Nov 2021 15:30:07 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id B8E0D610A0;
        Mon,  8 Nov 2021 20:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636403242;
        bh=Cyj8+E4a/i2GQxGBRu5O79r+7BKKyMbeXXI2M/rYch0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dp2A0c6t/uQDgA9OZlBkiT7rAXCcAOiHObHaeb1eqskP/zGgsCRxBWhi5zjtwtT+e
         zb0Hj3kiAmiD7/KWqIwstcBpuOf6B21U2AgM8ppYfxDmRsu+XWiBdAaiKvMBz6BE3U
         GxZOGbbsY4uIDSLopaX7rd4Ysz63fP1/QLOtOQ8hfCwJB2tKmfdp8otZ8WB1X1MJEL
         Ly/8NpfVV/v+WC/fJE8RVZFu9MztIIEizkS9pOQ6C9U2c41VWIyMb3o48QupVvCN0e
         4qWoyEa3DBB1WKg8lqzKKjx/Yst+mqdSNTveE/+IssotUOUX1Pnj7xeEKi388bnCKC
         ubg/zHMMOkDCQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id AE78960A23;
        Mon,  8 Nov 2021 20:27:22 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YYjfrZ69320no587@ninjato>
References: <YYjfrZ69320no587@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YYjfrZ69320no587@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow
X-PR-Tracked-Commit-Id: c6f49acb52c79f8e84af2eda4fc002a2068a6c9e
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dab334c98bf3563f57dc694242192f9e1cc95f96
Message-Id: <163640324270.16718.7238205578260798433.pr-tracker-bot@kernel.org>
Date:   Mon, 08 Nov 2021 20:27:22 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 8 Nov 2021 09:28:29 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dab334c98bf3563f57dc694242192f9e1cc95f96

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
