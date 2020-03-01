Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9147B174AA6
	for <lists+linux-i2c@lfdr.de>; Sun,  1 Mar 2020 02:25:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727276AbgCABZG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 29 Feb 2020 20:25:06 -0500
Received: from mail.kernel.org ([198.145.29.99]:51994 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727228AbgCABZG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 29 Feb 2020 20:25:06 -0500
Subject: Re: [PULL REQUEST] i2c for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583025905;
        bh=rYsXurT4DNJvltnTF7xO+00kfQ3KGNns2BFrFHrnkmA=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=H9xgqQCPBWgW05yRabHfwognG5/Qz48hr36GvotY/uUKg1Fm5HbXALD09siN4Uag2
         w3RlG2wM5RoSJQvrE6hcbMiLLvIPI9tQb+eLxnYPBaH7BjRAF8urTY3nXHQkajxW0U
         U4tUFAD9rEKzWZRDurzlS5/VI8k/7N0sLht3ABqk=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200229201726.GA2089@ninjato>
References: <20200229201726.GA2089@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200229201726.GA2089@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 i2c/for-current-fixed
X-PR-Tracked-Commit-Id: 38b17afb0ebb9ecd41418d3c08bcf9198af4349d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: fb279f4e238617417b132a550f24c1e86d922558
Message-Id: <158302590559.1645.8749085952981671824.pr-tracker-bot@kernel.org>
Date:   Sun, 01 Mar 2020 01:25:05 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 29 Feb 2020 21:17:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/fb279f4e238617417b132a550f24c1e86d922558

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
