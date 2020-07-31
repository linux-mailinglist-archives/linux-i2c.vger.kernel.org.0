Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89C6234C1D
	for <lists+linux-i2c@lfdr.de>; Fri, 31 Jul 2020 22:20:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726872AbgGaUUE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 31 Jul 2020 16:20:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:50136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgGaUUE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 31 Jul 2020 16:20:04 -0400
Subject: Re: [PULL REQUEST] i2c for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596226803;
        bh=I1TPz0XQydxlBok8B+ja1rRjeWIqankINkeRN/5Chy8=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=CEbcuU8pFFzT5FD9sLv/aWqH1jDwrtAmXVVND8QhTTuDAyl0mQGFf+0H4aul83Xdk
         Utz8y/AOWHmShXUp6Jp9po3B3dySGUbjWYatXsJiq84v9uOgPi2Wp7P9sFkCAVNavQ
         +yD7lOSEAjlvoC5SFHVYVxcn/QoTaYCuy7Z/VKyY=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200731191654.GA14800@kunai>
References: <20200731191654.GA14800@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200731191654.GA14800@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 8808981baf96e1b3dea1f08461e4d958aa0dbde1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7dc6fd0f3b8404542718039f5de19fe56e474578
Message-Id: <159622680374.12078.470166708687940267.pr-tracker-bot@kernel.org>
Date:   Fri, 31 Jul 2020 20:20:03 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 31 Jul 2020 21:16:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7dc6fd0f3b8404542718039f5de19fe56e474578

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
