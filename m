Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C6EC196929
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Mar 2020 21:25:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727485AbgC1UZI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Mar 2020 16:25:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:55914 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726604AbgC1UZH (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Mar 2020 16:25:07 -0400
Subject: Re: [PULL REQUEST] i2c for 5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1585427107;
        bh=aXLLyKMKzNzz6BZhOc5+8xGHh2188GiTSS71dD6zMOg=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=ulMTegLmqfvVzS8grIZdNrZ2KHM0uulnNjgRLW6mO6PsTGKP584H4uf8eCydmOWXe
         b0JdZEwLHKx3VTac+ynxn97oL7ooiu0EHwEkOxnIXLjIUCwO5u1cNdrt8l4b6/SdFt
         QlkkGBapJ+zlkxoYsDaFhSZgNicl2oLmXRHIEiiE=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200328194059.GA1632@kunai>
References: <20200328194059.GA1632@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200328194059.GA1632@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 14c1fe699cad9cb0acda4559c584f136d18fea50
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 906c40438bb669b253d0daeaf5f37a9f78a81b41
Message-Id: <158542710731.31099.4235816086457834705.pr-tracker-bot@kernel.org>
Date:   Sat, 28 Mar 2020 20:25:07 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 28 Mar 2020 20:41:03 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/906c40438bb669b253d0daeaf5f37a9f78a81b41

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
