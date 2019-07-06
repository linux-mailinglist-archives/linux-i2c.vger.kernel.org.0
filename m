Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5CCF360E81
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2019 04:35:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726743AbfGFCfG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 5 Jul 2019 22:35:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:48440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726005AbfGFCfF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 5 Jul 2019 22:35:05 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1562380505;
        bh=/KZE5e+kASwtfqTgESP4/y3eBBJ5/a50Adxp6iByfxE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=jE/QVLTWV7gupWfR0/cyXdUtiFBOyfPwNXaunbN9NaqMpqPFjI87dMshfT8OXwUZj
         9XG2WFc8boguLZMEQPmPWESJiO7JfrnQ+anpibfYSdhylWmb2VLgTOFg8UJnJOkdxt
         7oczVFKwd8hMqdu0lSPrXyRzZ82iHVmCNkEsQmUE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190705192126.GA13751@kunai>
References: <20190705192126.GA13751@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190705192126.GA13751@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: f3a3ea28edd9a17588fede4ff53bc02d986cf4d1
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 881ed91f7db58fcbe8fdca056907991c3c9d8f2d
Message-Id: <156238050532.5324.15801403473839481290.pr-tracker-bot@kernel.org>
Date:   Sat, 06 Jul 2019 02:35:05 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 5 Jul 2019 21:21:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/881ed91f7db58fcbe8fdca056907991c3c9d8f2d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
