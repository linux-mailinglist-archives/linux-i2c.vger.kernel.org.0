Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BFCED3FCF43
	for <lists+linux-i2c@lfdr.de>; Tue, 31 Aug 2021 23:48:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241367AbhHaVtf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 31 Aug 2021 17:49:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52590 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233686AbhHaVte (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 31 Aug 2021 17:49:34 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EFE9160F25;
        Tue, 31 Aug 2021 21:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1630446518;
        bh=00q+KmZyrl3IgZJd1lJzBhh1oDjbX1qZ0gkjdn+XLKs=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=qXEHTd23j6wPaCfrZIQuOtb0VUJJFTJ6BwstVTo50jpgijYu6RrVT7y1OTa5puQLX
         W/XCInEjymzK9ntsFSHDdt6rZ4mi+C3o80K+1GQGn1jF83yZaBF45roBf90j0dMMS3
         BgupvPe3f2e98tuDU6wCeGRtACcGC+o2SDbNsaqKmugtUDm4QVCTU+DUutDtMSZv34
         jzw6WcMv43v1PGPbUiicEv8tLdVt+YTKak9vUTbSyWT6D6rshbyI1hZCbf76iq32Lw
         b35vgwYPXv5FcSernRq2soR+MjADKMt5eQDzYUcK6Sk7jklzFeKkfy6glNxJ3f+Ihs
         MPZhCyv1clXqw==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id EAF3260A6C;
        Tue, 31 Aug 2021 21:48:37 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.15
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YS0yUtFCdybL+A43@kunai>
References: <YS0yUtFCdybL+A43@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <YS0yUtFCdybL+A43@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow
X-PR-Tracked-Commit-Id: 8b51a8e64443b95fb9fec9f76f1c93777b35310a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 871dda463c6f2c2a4a660937e2f57616146f42de
Message-Id: <163044651795.1462.16030472640664210134.pr-tracker-bot@kernel.org>
Date:   Tue, 31 Aug 2021 21:48:37 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 30 Aug 2021 21:32:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-mergewindow

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/871dda463c6f2c2a4a660937e2f57616146f42de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
