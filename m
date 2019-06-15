Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED7FC46DA6
	for <lists+linux-i2c@lfdr.de>; Sat, 15 Jun 2019 03:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725825AbfFOBzG (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 21:55:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:37730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFOBzF (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 21:55:05 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1560563705;
        bh=5X6lG+aweYd3ld01vEg3aXWOFE3AOs2/v/c8/zBSmtQ=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=G+QxVlaQh62h4DhRUogr3DUrGGr8brIVkd/+blGVjQkZ9wnkVqZB1RVnZsoP//MAb
         KuUP3NXniiJN6e9DXwv4/0n+R47EsL2nWzjY7Qwlz3mDxvJctqdUEj5on8a8GY2CId
         +kt2gwW7jKBkxzEpWos2e6aXKWiP+HZFp3HMX42w=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190614164549.GA6067@kunai>
References: <20190614164549.GA6067@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190614164549.GA6067@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: a0cac264a86fbf4d6cb201fbbb73c1d335e3248a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5dcedf4600f8708150b89485d25cead88bff08a4
Message-Id: <156056370528.9443.16281348104646164725.pr-tracker-bot@kernel.org>
Date:   Sat, 15 Jun 2019 01:55:05 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 14 Jun 2019 18:45:53 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5dcedf4600f8708150b89485d25cead88bff08a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
