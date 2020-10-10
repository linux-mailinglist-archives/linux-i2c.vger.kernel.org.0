Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2885B28A45F
	for <lists+linux-i2c@lfdr.de>; Sun, 11 Oct 2020 01:17:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726473AbgJJXR4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Oct 2020 19:17:56 -0400
Received: from mail.kernel.org ([198.145.29.99]:39462 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJJXRz (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Oct 2020 19:17:55 -0400
Subject: Re: [PULL REQUEST] i2c for v5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602371876;
        bh=bPy/xd1WAJZhHaPeXI8lu9KCQbvf3vJuzV2EZcqd6HE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=gAInfVCJt5XZwMz8Xgtk606v7CDoiZ+hIvHYrhum8SEAwJ2OhS54pkgPYk33fL6nb
         3rh4CVuA0YjCN7uDjClNOGaaQiumlVAz57wr//DmHkKH8Z9eLpQAYDUG3rxP/jmxNL
         3SeiEoO1ne2kcEjQUIX0recDL56o2lkfzBsNIdNo=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201010182852.GA16937@ninjato>
References: <20201010182852.GA16937@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201010182852.GA16937@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: f5b3f433641c543ebe5171285a42aa6adcdb2d22
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: da690031a5d6d50a361e3f19f3eeabd086a6f20d
Message-Id: <160237187595.31923.351118446999566487.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Oct 2020 23:17:55 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 10 Oct 2020 20:28:52 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/da690031a5d6d50a361e3f19f3eeabd086a6f20d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
