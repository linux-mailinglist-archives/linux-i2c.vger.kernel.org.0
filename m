Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BE7759121A
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Aug 2019 19:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbfHQRuG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Aug 2019 13:50:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:38052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726047AbfHQRuG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Aug 2019 13:50:06 -0400
Subject: Re: [PULL REQUEST] i2c for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1566064205;
        bh=2t+lyry5Y4wnoZlXTYl1k/o9u3/XqVTf6P+EmPonPn0=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=oM/i9Qfx5T6P4L4OYIPCsVp32lyZH4dY2/niJj4oSF6HHR/XHkHak7CXepgrGMvIQ
         PD//HuNrTe2hbIGt8ks00z5pdZPWxf75vXzRg7wzv74J9Y/i2jJ6k8kZWE+z7ZZyXl
         qmGFDD6fc0noI/WBFNakL/UUO3IE/aVsdYzV0aug=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190817141226.GA2867@kunai>
References: <20190817141226.GA2867@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190817141226.GA2867@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 90865a3dc597bd8463efacb749561095ba70b0aa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 05c525326957b504561d271f669d3b315930422f
Message-Id: <156606420535.15242.5094682270620790019.pr-tracker-bot@kernel.org>
Date:   Sat, 17 Aug 2019 17:50:05 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 17 Aug 2019 16:12:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/05c525326957b504561d271f669d3b315930422f

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
