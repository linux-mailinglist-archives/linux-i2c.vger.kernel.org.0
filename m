Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F273482C8E
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jan 2022 19:38:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229608AbiABSiZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jan 2022 13:38:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiABSiZ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jan 2022 13:38:25 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75863C061761;
        Sun,  2 Jan 2022 10:38:25 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1773260F66;
        Sun,  2 Jan 2022 18:38:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7E09AC36AEB;
        Sun,  2 Jan 2022 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641148704;
        bh=qDa43lMNQV264Gxv5B1pxua5JsE/INsxs7BOAlwDOpw=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=Q7eLhNb1E/pJPOa8SpOtfEoGo5Y0CbDMuwy7JQrpi1zCLUH25X7hMK+o9LLfFTeY9
         xo29PKMcp7Wy/vBhVcJQQCwSoASxIbhfcIDc8evTDpN9SZ66cXFG8s2+lvGlcgwd4r
         PDlpwljKl9Aa5x2DVq+nYhXvxx5O9YPYj/ZcJ7Ru6tJbkIfc6lhyWUuGo12/IA1x9f
         FLB0BWbiIqCiTWWWy3E+ZAxj+O2ehHd3dbfHtk/YTHCQXeasKm6ap0bAReGDmzrAnL
         3UgdFeo7aOLOkEWzXsC+nbGZBDEY/OuNE6TzepvcZ3riTOz+WQ6Nvz30gMdOVFzCFy
         3JiFv+GWFRcnQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 6D91AC32795;
        Sun,  2 Jan 2022 18:38:24 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.16
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YdDQQRos0o8i9nFF@kunai>
References: <YdDQQRos0o8i9nFF@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YdDQQRos0o8i9nFF@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: c116fe1e1883ad3eda0a1938a9e3275a98aa51a5
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 859431ac11aef9b4cd7ffa75e94a92a6a41c8623
Message-Id: <164114870444.12628.11773526119962150122.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Jan 2022 18:38:24 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 1 Jan 2022 23:05:53 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/859431ac11aef9b4cd7ffa75e94a92a6a41c8623

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
