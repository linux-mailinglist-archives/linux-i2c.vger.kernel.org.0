Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6C3C3A45BE
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 20:15:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbfHaSPJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 14:15:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:33142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726705AbfHaSPJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 14:15:09 -0400
Subject: Re: [PULL REQUEST] i2c for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1567275308;
        bh=hAIkI84/1n2/zir4+qrFe1nGwmWDuOmyJaRHVJJCSfw=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=aVzXkwz3hYIf31oGhHnfXOIjZ+OqTSH75fI5NFDLL3VIzI4G1Ik/imysMZqIUspFz
         GFlr1+flXZXIoh+2/nLdl5KeUezUbvizRVoIAN5K0Nbr8mpE0iXVh1Yx8AmhbWaYmA
         t2GCZXC0pYv/+YMOnHWaZk2ulUoFyFe/CdrjlSic=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190831112948.GA1230@ninjato>
References: <20190831112948.GA1230@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190831112948.GA1230@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: abf4923e97c3abbbd1e59f0e13c7c214c93c6aaa
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: eea173097dfbb44855e3cf03c09eb5a665c20438
Message-Id: <156727530825.8461.17872081864467553668.pr-tracker-bot@kernel.org>
Date:   Sat, 31 Aug 2019 18:15:08 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 31 Aug 2019 13:29:51 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/eea173097dfbb44855e3cf03c09eb5a665c20438

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
