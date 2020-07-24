Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20DB22D147
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Jul 2020 23:41:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726998AbgGXVkP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Jul 2020 17:40:15 -0400
Received: from mail.kernel.org ([198.145.29.99]:48938 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727089AbgGXVkH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Jul 2020 17:40:07 -0400
Subject: Re: [PULL REQUEST] i2c for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595626807;
        bh=ul3A9i6c2cgnHAc2OhGmtexevtddBtftnofNrj5N2Hs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=syOErSabus3vvUJ9cR/C8zMRo0uM70yjf89tpAJXoSMpwqa8kXYeKuphKDY02IRv9
         XVpVkbSkZrwtHUygr304BSXG5KrSpW3WUzr50N/DluoAbJRjRJ502B9szROpRKFg5k
         dPtdxExoJnqE+nje4WAmEvhI/+ifTkAWEtA2mLVw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200724192728.GA1596@ninjato>
References: <20200724192728.GA1596@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200724192728.GA1596@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 02b9aec59243c6240fc42884acc958602146ddf6
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c615035b29c3628a35ece192046e0e6658d96ab3
Message-Id: <159562680748.3064.526680427624394440.pr-tracker-bot@kernel.org>
Date:   Fri, 24 Jul 2020 21:40:07 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 24 Jul 2020 21:27:32 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c615035b29c3628a35ece192046e0e6658d96ab3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
