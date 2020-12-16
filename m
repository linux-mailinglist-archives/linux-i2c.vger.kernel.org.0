Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFD032DB81C
	for <lists+linux-i2c@lfdr.de>; Wed, 16 Dec 2020 02:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgLPBBZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 15 Dec 2020 20:01:25 -0500
Received: from mail.kernel.org ([198.145.29.99]:51028 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726188AbgLPBBZ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 15 Dec 2020 20:01:25 -0500
Subject: Re: [PULL REQUEST] i2c for 5.11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1608080406;
        bh=dh57t8ycMg1BldQpqYnhVXBzF9bbHjhvlNHEy8QoaBs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=PXx3OMww0f40VXtd8P5eI0aaSAjEWdzRZxl2b7L1C9oleJQ4CLQncDofwQADAK7D1
         lGbJQ7S2ZGYElyXWp8AUWR/J2Jc+JNq0+eWrYNP/N+cfAMDnpav1mPtnR9SNT14+/0
         wdO0ERiZhIgZAtAxS1gHfmV12EhqA+uDAZShg/cTtruFAzyGNpomsuT67k+CTXRrHj
         97rKw2J9csHX9RQseeQLRbbAhKpD/3R5epSAnYRwTFja5S9NFNCBa22A8S1sWnuhTw
         V4fKjPaaRB3A/FS0TIJ9bT0KD6dtxhJPmgJS9xy7S8dUHbU/wiE2+6zufuDMOMcFbp
         GJK8PqNm3N+ZQ==
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20201214215335.GA4651@kunai>
References: <20201214215335.GA4651@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20201214215335.GA4651@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.11
X-PR-Tracked-Commit-Id: 4e970a0ada5299d017a4263074f725227c2d2852
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9d0d886799e49e0f6d51e70c823416919544fdb7
Message-Id: <160808040670.29502.5434390905614605187.pr-tracker-bot@kernel.org>
Date:   Wed, 16 Dec 2020 01:00:06 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 14 Dec 2020 22:53:35 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.11

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9d0d886799e49e0f6d51e70c823416919544fdb7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
