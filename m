Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 19680141FF5
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Jan 2020 21:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728709AbgASUUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Jan 2020 15:20:04 -0500
Received: from mail.kernel.org ([198.145.29.99]:32902 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727138AbgASUUE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 Jan 2020 15:20:04 -0500
Subject: Re: [PULL REQUEST] i2c for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579465203;
        bh=5MUXYjeCeLYwBtoEdJoVcVvP8wa7SslZN1h/bsxHe/Q=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=MWWYIFVvI/YXhP6nAOytCK4Z+kbgisFpHfMw5yJerFs4MOQrHnoTrh4EFQMTKt5jo
         TpG2ZYV/6qaZ1c7ruwTHqgkQOqyoZt8YywOkvmLEL2Qy1Ai4C5uapT8EnTHxPbEcDN
         PXHNMyM0NOs1d5Iizp91httSKNGA2u+8+wOmbt4o=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200119141343.GA1191@ninjato>
References: <20200119141343.GA1191@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200119141343.GA1191@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: e64175776d06a8ceebbfd349d7e66a4a46ca39ef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5f43644394a96a8bcd8fc29a8bbd9c40b4465b54
Message-Id: <157946520336.8493.5607126799780981801.pr-tracker-bot@kernel.org>
Date:   Sun, 19 Jan 2020 20:20:03 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 19 Jan 2020 15:14:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5f43644394a96a8bcd8fc29a8bbd9c40b4465b54

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
