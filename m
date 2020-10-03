Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A42528267C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Oct 2020 21:58:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725937AbgJCT6W (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Oct 2020 15:58:22 -0400
Received: from mail.kernel.org ([198.145.29.99]:40666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725913AbgJCT6T (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 3 Oct 2020 15:58:19 -0400
Subject: Re: [PULL REQUEST] i2c for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601755099;
        bh=ujejCs3u5wkHIJ/ZLZ3SaJnLQbUMoCkTsTV1fwwBfII=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=TfgYjHQzOJJ+U8qQUPnZxx21K4OkyD48ZVPAqMdKwui/cKlY+HjdXDRtd/B+4iRRq
         JKQETieaacz6QAr4Xugy4TY3x/orTpSSqrQ9YcpIthf/QxA+Uf6+CFcg5Mpodee4wx
         6htT+1pYjZmWGnjR9ki/7cn26nCfTzWhUJ97yR+w=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201003053234.GA2550@kunai>
References: <20201003053234.GA2550@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201003053234.GA2550@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 8947efc077168c53b84d039881a7c967086a248a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: f35c08e0bb9dfab1bb5b9c244149bcb150bebf67
Message-Id: <160175509949.27812.253948320662255198.pr-tracker-bot@kernel.org>
Date:   Sat, 03 Oct 2020 19:58:19 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 3 Oct 2020 07:32:34 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/f35c08e0bb9dfab1bb5b9c244149bcb150bebf67

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
