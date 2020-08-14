Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13A812442C9
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Aug 2020 03:44:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726604AbgHNBoU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 13 Aug 2020 21:44:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:60910 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726564AbgHNBoT (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 13 Aug 2020 21:44:19 -0400
Subject: Re: [PULL REQUEST] i2c for 5.9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1597369459;
        bh=aRbm11SZ+ak0VAOoWsO3Wzb88MmOnMnrD8Re5MaDRJk=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Pn653ROdWt8JL/fxzOsV+qciDg4/5r60bVMqRw+obvP4t5EYjXbtEXnh24r/ohewQ
         +WmUmUitD+wHAQqpCt8BAQDjM6/qEskkCP3JNhNszG0WHANmYWWzgbUpJ6GuHVpU44
         ERq3+OnaS36aec5GRzlRz+eoQ+i3JdqxL5fQyMkA=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200813210906.GA4855@kunai>
References: <20200813210906.GA4855@kunai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200813210906.GA4855@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.9
X-PR-Tracked-Commit-Id: b1eef236f50ba6afea680da039ef3a2ca9c43d11
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e764a1e32337aaf325fc5b14a5bbd06eabba4699
Message-Id: <159736945956.20401.2970445735817036786.pr-tracker-bot@kernel.org>
Date:   Fri, 14 Aug 2020 01:44:19 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Thu, 13 Aug 2020 23:09:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.9

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e764a1e32337aaf325fc5b14a5bbd06eabba4699

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
