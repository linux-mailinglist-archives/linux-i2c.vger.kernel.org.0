Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8772D2F033C
	for <lists+linux-i2c@lfdr.de>; Sat,  9 Jan 2021 20:52:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726001AbhAITvt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 9 Jan 2021 14:51:49 -0500
Received: from mail.kernel.org ([198.145.29.99]:52122 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725999AbhAITvt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 9 Jan 2021 14:51:49 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id A8E8323A7F;
        Sat,  9 Jan 2021 19:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1610221868;
        bh=rd4DEaE3f2znf46Y+qAonYrbgbvDASa8/hVJhb+VU0I=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=VjocK5rgYMESnqrZy+NQh8G3YqsIW9CtXWPde+v3SODx4WPUhJeFrgEc4HuicguCP
         76z+xbEN6UowGCk28vZ67pMUOorwnxcYqw+4YNOeCwcSq4IXDyfMiC1+tsV6vQoLLW
         4VfdQO4MO2gFUyKJrs2sQd7wQ5zTUyIYtSNvY6Hke21Cq9ALQ7WCinxMv7pzzumVr/
         Oi24LGTuxRyE1yMgZHnf2iaJuMsLR7pvY+wAWB92hKbQO9Ss5iAP4dQBLR2n9fF9eM
         DNEOrYK1eyAYyZoucP0NAGVCgoULzExK7W9NYJZwbF/bcJf4PFGUyXYtLC6M7LGSUm
         RwDI54jYmB3SQ==
Received: from pdx-korg-docbuild-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-1.ci.codeaurora.org (Postfix) with ESMTP id 989FE60508;
        Sat,  9 Jan 2021 19:51:08 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for 5.11
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210109083156.GA2924@kunai>
References: <20210109083156.GA2924@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210109083156.GA2924@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 05f6f7271a38c482c5021967433f7b698e102c45
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: caab314792aca89f327abc8b9f730526d3080366
Message-Id: <161022186853.8002.2175436833656146973.pr-tracker-bot@kernel.org>
Date:   Sat, 09 Jan 2021 19:51:08 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 9 Jan 2021 09:31:56 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/caab314792aca89f327abc8b9f730526d3080366

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
