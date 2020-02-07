Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D84B31560E4
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2020 22:55:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbgBGVzX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Feb 2020 16:55:23 -0500
Received: from mail.kernel.org ([198.145.29.99]:42550 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727764AbgBGVzW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Feb 2020 16:55:22 -0500
Subject: Re: [PULL REQUEST] i2c for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581112522;
        bh=x4jVxI0ZMxL9jmduN8iNSalk/GJgxwf8ZGViWkqSW+o=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=1N9CBzMjd1PwwQGgrPWOrGVyoaV0+YifzCvd8LQttgqOerrMWPccmMgnripqwmNZ+
         hCpjwAII65fcpsFHq96F6yCQMe1pzfhwsd1dHtYPVPpL6HoZczM7g0AUrcot7yWVBw
         S+WwweJ3eShl6klipA0kvTiz2JKBi9Q9xryIEoWI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200207171923.GA9783@ninjato>
References: <20200207171923.GA9783@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200207171923.GA9783@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.6
X-PR-Tracked-Commit-Id: b49f8e0e7bd17b968129790e40f9e2566f4f95ec
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 11777ee8b04acab07c96959e9c6ac6a1603d0958
Message-Id: <158111252224.9631.1092673712656215961.pr-tracker-bot@kernel.org>
Date:   Fri, 07 Feb 2020 21:55:22 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 7 Feb 2020 18:19:27 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.6

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/11777ee8b04acab07c96959e9c6ac6a1603d0958

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
