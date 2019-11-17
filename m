Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 97462FFAC1
	for <lists+linux-i2c@lfdr.de>; Sun, 17 Nov 2019 17:35:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726151AbfKQQfF (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 17 Nov 2019 11:35:05 -0500
Received: from mail.kernel.org ([198.145.29.99]:41056 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726069AbfKQQfF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 17 Nov 2019 11:35:05 -0500
Subject: Re: [PULL REQUEST] i2c for 5.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1574008505;
        bh=7DML9Q3jxT2KrMtabpA4cmYVdkAuL0MIgZecgdds7hI=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ffNypmwMRCFHf/qaES2xrl9UQPnSB1tQGONq5JDJ25w4NaVFGQSJd3bGhtbkEICg0
         Y4gosBBgAOyd2QK96BESLASNFtTmNPyimPNARsKlU6SYvVHk31UaEsjcVhpfsPpwTh
         lG5ZgjDbfcgOVn+LyaGTGkm/LqZBRcuMGGMU39vo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20191117072838.GA1428@kunai>
References: <20191117072838.GA1428@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20191117072838.GA1428@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: a4c2fec16f5e6a5fee4865e6e0e91e2bc2d10f37
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6b27354cca8e9d9ab7c5bfb8a34101d52b5e48c4
Message-Id: <157400850501.10370.6617602374762785945.pr-tracker-bot@kernel.org>
Date:   Sun, 17 Nov 2019 16:35:05 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 17 Nov 2019 08:28:43 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6b27354cca8e9d9ab7c5bfb8a34101d52b5e48c4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
