Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 159DB133D5
	for <lists+linux-i2c@lfdr.de>; Fri,  3 May 2019 21:05:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726846AbfECTFE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 3 May 2019 15:05:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:59248 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726755AbfECTFE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 3 May 2019 15:05:04 -0400
Subject: Re: [PULL REQUEST] i2c for 5.1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556910303;
        bh=Gsh8RpP3mlGpu7c9JmVJW1HXfhaCc8nkocADJKtHlWw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jOXyhfPzHsJV/OqMRxln53js/5XiXtwad9fMm3zCq2OJLJprtz7o9aZg3rviyPVHj
         /qMVU+RUD7mSJBH2WBn90T8MdGvHnNVzOdQRIYpegWspMs6DVMSRW70hevBjBSDfLF
         uzzeP9gPeLxq5ltJDbe0u1zSNUd5qd9bAs2A2g4M=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190503162138.GA7676@kunai>
References: <20190503162138.GA7676@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190503162138.GA7676@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 i2c/for-current-fixed
X-PR-Tracked-Commit-Id: 72bfcee11cf89509795c56b0e40a3785ab00bbdd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 82463436a7fa40345c6febf0baa4c954af506ca6
Message-Id: <155691030371.24034.10570742928000347312.pr-tracker-bot@kernel.org>
Date:   Fri, 03 May 2019 19:05:03 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 3 May 2019 18:21:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/82463436a7fa40345c6febf0baa4c954af506ca6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
