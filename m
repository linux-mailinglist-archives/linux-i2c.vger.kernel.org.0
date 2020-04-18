Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53431AF446
	for <lists+linux-i2c@lfdr.de>; Sat, 18 Apr 2020 21:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728134AbgDRTaV (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 18 Apr 2020 15:30:21 -0400
Received: from mail.kernel.org ([198.145.29.99]:44478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727907AbgDRTaV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 18 Apr 2020 15:30:21 -0400
Subject: Re: [PULL REQUEST] i2c for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587238220;
        bh=9sBG0TBFSt6I5+ZCmPPrYZfYsMw3sbn0EymneScj19s=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Ius+WVANyqFs6YnvStffK5RBy0XnuAUpvCX80tMmWFYbt59tp9q3ChsotvvR/4LG3
         rGFbsNWhvo4o1RbCIkMt+6AsRuAQCS2JFnF5+M9nGM9tPkrB3vbeWtH6KUdzV0F+LO
         PeAcbWVUTeLHhsYkqUGOvgmUlVkxgYrmIOqHHEys=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200418065344.GA1880@kunai>
References: <20200418065344.GA1880@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200418065344.GA1880@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 8814044fe0fa182abc9ff818d3da562de98bc9a7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: b484f3c3c6f1d56cd976351d6e1bb1a4944d7447
Message-Id: <158723822068.11589.10465455330200174636.pr-tracker-bot@kernel.org>
Date:   Sat, 18 Apr 2020 19:30:20 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 18 Apr 2020 08:53:48 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/b484f3c3c6f1d56cd976351d6e1bb1a4944d7447

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
