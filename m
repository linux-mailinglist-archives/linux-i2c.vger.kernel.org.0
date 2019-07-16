Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 551346A18E
	for <lists+linux-i2c@lfdr.de>; Tue, 16 Jul 2019 06:35:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733289AbfGPEfX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 16 Jul 2019 00:35:23 -0400
Received: from mail.kernel.org ([198.145.29.99]:33210 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1733272AbfGPEfW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 16 Jul 2019 00:35:22 -0400
Subject: Re: [PULL REQUEST] i2c for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1563251721;
        bh=WxQ7vIex/LGserhSv35oUYCl0APxZdNK3czLWsSPsBY=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=DgZ57bGp2WRvk44LRVqTpyqNhLS67LtyObpilyAxiyaiMtHOA+Mtq9/d+xsfkpmmm
         ive2bSrXMN3Ln3MumW/hih2NoANXYjtgCiENW2VF0tkL5OIZI1HuBqL5XIlKJvN9/W
         3hQBInAEerI6pMQ2RMKRF86U+Br57pyZyKZfqAUs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190715213658.GA5361@kunai>
References: <20190715213658.GA5361@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190715213658.GA5361@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.3
X-PR-Tracked-Commit-Id: cc6b9dfb2c5769afeb3335048173c730bdf8dbe1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 273cbf61c3ddee9574ef1f4959b9bc6db5b24271
Message-Id: <156325172182.15429.614674477388118200.pr-tracker-bot@kernel.org>
Date:   Tue, 16 Jul 2019 04:35:21 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 15 Jul 2019 23:37:03 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/273cbf61c3ddee9574ef1f4959b9bc6db5b24271

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
