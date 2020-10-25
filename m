Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 142B0298319
	for <lists+linux-i2c@lfdr.de>; Sun, 25 Oct 2020 19:35:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1418127AbgJYSfS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 25 Oct 2020 14:35:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:46356 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1418125AbgJYSfR (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 25 Oct 2020 14:35:17 -0400
Subject: Re: [PULL REQUEST] i2c for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603650917;
        bh=KZ5ResFc3TX17CSixMNMQYfEVf7Hgj+gHEC053DADow=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=vipcxaiBIXJWl1WoX2pvVk5GzswCRMQ7ubPycSlcMAzED6WCwgIWsEXId1J8hlrSS
         9q20RnF+rycvnoJu9GBTrAPkfI22T2Z3Lim9akl253xl1JoC4W4p7To2p2S1iPdO+s
         ri2RBQqAoo6jjCiafMs2n0Rk0tA3pE/1GEcSagHI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201025123745.GA7614@kunai>
References: <20201025123745.GA7614@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201025123745.GA7614@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.10
X-PR-Tracked-Commit-Id: 8058d69905058ec8f467a120b5ec5bb831ea67f3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0746c4a9f3d37caf73fb93420bcf34a841019a40
Message-Id: <160365091742.20889.3464918674388994884.pr-tracker-bot@kernel.org>
Date:   Sun, 25 Oct 2020 18:35:17 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 25 Oct 2020 13:37:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.10

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0746c4a9f3d37caf73fb93420bcf34a841019a40

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
