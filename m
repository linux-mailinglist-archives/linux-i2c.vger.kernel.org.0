Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2350A3A1D9
	for <lists+linux-i2c@lfdr.de>; Sat,  8 Jun 2019 22:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbfFHUKK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 8 Jun 2019 16:10:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:55822 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727437AbfFHUKK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 8 Jun 2019 16:10:10 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560024609;
        bh=uAnYktIX1T3OonHcbnK78IcSVZstLp51nbaHPavhjSM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=fqBGo9RXXcVwVqnak8lh4eOYItmUtdV+6PUsU1osOjyTnze0RnR4NK4Yq+0awSFOM
         Hw6crBD88WvVbogt6Lz6LntwluzUPt/yh6wFNtbm6X4bBKgMy0xl0zOo7R9X1EowFg
         +1lndPx2OsmjutQlvCuX3rNIBtdXaeycnA19cyJI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190608085406.GA1746@kunai>
References: <20190608085406.GA1746@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190608085406.GA1746@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 8f77293cca1f5116edc98d7a0e36c6da3917fc08
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 902b2edfca34f88b04b86e605087e200e7e79880
Message-Id: <156002460939.1563.3540313464708044371.pr-tracker-bot@kernel.org>
Date:   Sat, 08 Jun 2019 20:10:09 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 8 Jun 2019 10:54:10 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/902b2edfca34f88b04b86e605087e200e7e79880

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
