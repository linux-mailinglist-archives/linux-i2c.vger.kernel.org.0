Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F7AE2669B2
	for <lists+linux-i2c@lfdr.de>; Fri, 11 Sep 2020 22:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725803AbgIKUpQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 11 Sep 2020 16:45:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:44826 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725811AbgIKUpM (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 11 Sep 2020 16:45:12 -0400
Subject: Re: [PULL REQUEST] i2c for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599857109;
        bh=+ae9pL6MDsmABCeIWITUP1MB0pRvn7cTrxKIFIBD0Og=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=2tP/O1k70QUnVlVZfPfTFpDFyRTXkyOdT0Tf5xReTR/k8i+4jftnqrdGu6k/0SfXF
         oRP29MfVemtqTslyn8qM1nIAHuBm00TfJBzycwPjjkAMb02e3fBm7E4ZsFjXh7IbmQ
         CKMTsBkQEiRMXOGHd76ADZr6pftj60A6wc+rFmZM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200911194333.GA2270@ninjato>
References: <20200911194333.GA2270@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200911194333.GA2270@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 0a355aeb24081e4538d4d424cd189f16c0bbd983
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e9287bd248160880ff9476eea705fa47f75c6136
Message-Id: <159985710939.5364.6419282383294820450.pr-tracker-bot@kernel.org>
Date:   Fri, 11 Sep 2020 20:45:09 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 11 Sep 2020 21:43:36 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e9287bd248160880ff9476eea705fa47f75c6136

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
