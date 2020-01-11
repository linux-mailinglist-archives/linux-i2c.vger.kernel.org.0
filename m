Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9912513841F
	for <lists+linux-i2c@lfdr.de>; Sun, 12 Jan 2020 00:50:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731737AbgAKXuH (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 11 Jan 2020 18:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:36540 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731722AbgAKXuE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 11 Jan 2020 18:50:04 -0500
Subject: Re: [PULL REQUEST] i2c for 5.5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1578786603;
        bh=0H4x/7iRB/IvL3h7QOI+RDOOXkuKUFe7AXRtVBf7I/E=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=h+xcqrnVneEF0lIYoK4HOdp4aZXk8pl2j5hSJCF+O7pmv0Uk2rA24YYuRenbkbBuU
         RoR8mB4xhav4eFPXr0oVj4NTuEM3DCR61n3HZbgdHLO2nkd6U9HawAB8wcokmeQIuV
         YyJCjTJrmDUiAXxQsRP4J+lKoNQT5rEhKbVYPtus=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200111200704.GA5308@kunai>
References: <20200111200704.GA5308@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200111200704.GA5308@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: cf8ce8b80f8bf9669f6ec4e71e16668430febdac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 6327edceb62bc4c91195e2dc6d5574a53005cb5a
Message-Id: <157878660393.3074.4059137287771008632.pr-tracker-bot@kernel.org>
Date:   Sat, 11 Jan 2020 23:50:03 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 11 Jan 2020 21:07:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/6327edceb62bc4c91195e2dc6d5574a53005cb5a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
