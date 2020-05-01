Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 505B01C1D44
	for <lists+linux-i2c@lfdr.de>; Fri,  1 May 2020 20:35:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730285AbgEASfN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 1 May 2020 14:35:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:47742 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730189AbgEASfM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 1 May 2020 14:35:12 -0400
Subject: Re: [PULL REQUEST] i2c for v5.7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588358112;
        bh=2WT6aiHZPuq2kVjyUjT09gDN6JPwEFNG4Npx11qayos=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=mfa9OwJn4J8fmDWRwxqqB8DMAgF7rxMBwwDT8OsDEHjdW+bqrWJtmsdXckMGAYedy
         3aF24rA8yRIbpYkLwteciHiPnemGzCKqvSb0J4Yk5WAOpbpnD3Nf/pzf3qUnDV+qBT
         1MiO0vohmQPcKWlJUP/zMDlUYnToSZXmNrm/GZ1A=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200501145014.GA24395@ninjato>
References: <20200501145014.GA24395@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200501145014.GA24395@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 i2c/for-current-fixed
X-PR-Tracked-Commit-Id: c926c87b8e36dcc0ea5c2a0a0227ed4f32d0516a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ab386c46e44eae70e2c23f27fea70014758cbbac
Message-Id: <158835811239.18489.9681586703398147281.pr-tracker-bot@kernel.org>
Date:   Fri, 01 May 2020 18:35:12 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 1 May 2020 16:50:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ab386c46e44eae70e2c23f27fea70014758cbbac

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
