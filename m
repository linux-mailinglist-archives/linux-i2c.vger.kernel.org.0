Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E94220C4BA
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jun 2020 00:45:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726796AbgF0WpN (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 27 Jun 2020 18:45:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:43156 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726750AbgF0WpN (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 27 Jun 2020 18:45:13 -0400
Subject: Re: [PULL REQUEST] i2c for 5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593297913;
        bh=ViFmLMs9O+kdtRW4Dmq4NpDIt1mT/Qc9N9/aABRBQIs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=CYfNNHpNxppmBGgqWrdmvDonN/QdgN1Xe82P0SAzgGV2TeARH4mKJR08N42hnKkkm
         3xifYinWcB0DaEg5+qDYrTpINuJ5CLoMR9AuPUb+3yIuqP92eJl81DeGJ5q6CbXDV2
         zFF5vH61D4lliZPffzRjPBAg+mVYR3oXMRW3YZQs=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200627182057.GA4356@kunai>
References: <20200627182057.GA4356@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200627182057.GA4356@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next
X-PR-Tracked-Commit-Id: 40e05200593af06633f64ab0effff052eee6f076
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8bf9865187f6c3130b5c748a3212d591c9d563de
Message-Id: <159329791311.3578.13019801677364668328.pr-tracker-bot@kernel.org>
Date:   Sat, 27 Jun 2020 22:45:13 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 27 Jun 2020 20:20:57 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-next

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8bf9865187f6c3130b5c748a3212d591c9d563de

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
