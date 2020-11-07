Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B2DB2AA7C3
	for <lists+linux-i2c@lfdr.de>; Sat,  7 Nov 2020 20:43:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728388AbgKGTn3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 7 Nov 2020 14:43:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:47850 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725911AbgKGTn3 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 7 Nov 2020 14:43:29 -0500
Subject: Re: [PULL REQUEST] i2c for 5.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604778209;
        bh=zLYtVnikH5b9crqAo7/4ml3X98q3Db58Guk/S6xDoHM=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1fNBTcH1B3IkB3f4cNEES38DU7VnS+NSd1TSy7WU0yEXQiZm30JUkDWC1F/7ElEoD
         sHwEx+S7LmKraeV9A6M26Ya++AZHBkjTU/bVTZ332lxcieQjz/QOzoRk4mkHzF9fLT
         XT2vXwtRalGmEYtTJl6psfccYLkkzsBksTOpUDBQ=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201107183957.GA1095@kunai>
References: <20201107183957.GA1095@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201107183957.GA1095@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 3b5f7f10ff6e6b66f553e12cc50d9bb751ce60ad
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: af6e7de0c7d1338c3e4224c764fbcb7e28064df9
Message-Id: <160477820925.15421.17359959485250252739.pr-tracker-bot@kernel.org>
Date:   Sat, 07 Nov 2020 19:43:29 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 7 Nov 2020 19:39:57 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/af6e7de0c7d1338c3e4224c764fbcb7e28064df9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
