Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 439EB1F851F
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jun 2020 22:25:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbgFMUZt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 13 Jun 2020 16:25:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:38390 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726905AbgFMUZa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 13 Jun 2020 16:25:30 -0400
Subject: Re: [PULL REQUEST] i2c for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1592079930;
        bh=BeKjUx8FDHHmJP6uCGCIthRnl0HyKI9nbGe0GQeMLB4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ZJ4eYieVsDLx7PyBtMWK9A5Kp8LgLbUCwGEzckum6m96BvNtwDTVbn0tapGt+efRi
         5XEoeNv1Pl5/5wEubhsQdKqjc19y19AjJ2fsPisP0b9FXiWqvIa1oA0Jbmiwj1m9XO
         am5e7ybBxQrnVftbUV90NaSqQnkcycM6J+Fxyw9Q=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200613113328.GA5400@kunai>
References: <20200613113328.GA5400@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200613113328.GA5400@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.8
X-PR-Tracked-Commit-Id: d790eeb3db6aefac39ffa06e598eb31b7352ca4f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 91fa58840ae22cbf6d7c505ce6564c4c48f29af3
Message-Id: <159207993040.31508.10932145461914178452.pr-tracker-bot@kernel.org>
Date:   Sat, 13 Jun 2020 20:25:30 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 13 Jun 2020 13:33:28 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/91fa58840ae22cbf6d7c505ce6564c4c48f29af3

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
