Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DDF7F19CDE3
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Apr 2020 02:40:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390511AbgDCAkh (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Apr 2020 20:40:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:39068 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390431AbgDCAkT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 2 Apr 2020 20:40:19 -0400
Subject: Re: [PULL REQUEST] i2c for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585874419;
        bh=NwF0phCbiYdOD88pZvDvdSU+V/tyYvt4lh2/SiBpYjA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Lgsm5vTiTvzsSE/P0n44GDOelCSg42GpsBubvA8fszT2Pl1+pGBOIDQ0apiuZjpY9
         nsUZ0em1NBmFYpQhjW7/JVzlkviGRupyVK2Hu/IS8h/FV1iLqOUZzLqUXlH5ebxNPN
         /ZaMW1ggjDn6mNg7vsgDBrisx8EEZeh2P4qxA5ZQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200402095948.GA2414@ninjato>
References: <20200402095948.GA2414@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200402095948.GA2414@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.7
X-PR-Tracked-Commit-Id: df576beee53ac97fe0a413430e623e658805891d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5c8db3eb381745c010ba746373a279e92502bdc8
Message-Id: <158587441905.31624.16830080488714978048.pr-tracker-bot@kernel.org>
Date:   Fri, 03 Apr 2020 00:40:19 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Thu, 2 Apr 2020 11:59:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5c8db3eb381745c010ba746373a279e92502bdc8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
