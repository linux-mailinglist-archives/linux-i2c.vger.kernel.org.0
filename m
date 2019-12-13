Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AABE611EE42
	for <lists+linux-i2c@lfdr.de>; Sat, 14 Dec 2019 00:11:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726987AbfLMXKP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 13 Dec 2019 18:10:15 -0500
Received: from mail.kernel.org ([198.145.29.99]:38160 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbfLMXKO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 13 Dec 2019 18:10:14 -0500
Subject: Re: [PULL REQUEST] i2c for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576278614;
        bh=tLCLckygGkEJaSdG6BnREjScWOLvqw9T3znz+YP5cJU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Sqv/m2OOY+6yMduW/87DXOC7am0IzC3MBdwzQAkpQx+TC8X1XiMpEVThXdKThp1hT
         ArDtfty/5WGEXOhESQiQOxvRD7peQosYvvk/p8vlIeIlYPCXCbJ/ydMfAtsZHvYkWA
         0LsM2VPu2iGE9BHucANWVlTfUKsYW10daIQIewIk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191213153136.GA3396@kunai>
References: <20191213153136.GA3396@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191213153136.GA3396@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
X-PR-Tracked-Commit-Id: 8c9312a925ad859daefd0f443ef3b6dc7157d881
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3b2ee614cb4accb75080f00586bd762b0eab219c
Message-Id: <157627861440.1837.5378976398857101367.pr-tracker-bot@kernel.org>
Date:   Fri, 13 Dec 2019 23:10:14 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 13 Dec 2019 16:31:39 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3b2ee614cb4accb75080f00586bd762b0eab219c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
