Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18CA819512
	for <lists+linux-i2c@lfdr.de>; Fri, 10 May 2019 00:15:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727256AbfEIWPQ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 May 2019 18:15:16 -0400
Received: from mail.kernel.org ([198.145.29.99]:42386 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbfEIWPP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 9 May 2019 18:15:15 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557440115;
        bh=qgyq7+yLpLnKg1MIv7N9dI3jFfUpFYJPDgorlRE2EYs=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=RokjB1+Ntin/7xx2vnGBtx6GTUFwN91fbDGbAlOVgMsZhejdZjFy0smhOuKZQ6So4
         7fxAO+bI/hS0mp9GkCNZ6rJg0JPiRH5YZutsMzvqNQxnYYct/Fk2Q+1+VoNzLW7jEW
         1LJLO/UxhjRRy5l8Z/pE/9DSRnEjY3xVMMQ0Of30=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190509191132.GA9306@kunai>
References: <20190509191132.GA9306@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190509191132.GA9306@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.2
X-PR-Tracked-Commit-Id: e6ae3ca27477226eae77cc00d5fad89d7ce64aea
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 45182e4e1f8ac04708ca7508c51d9103f07d81ab
Message-Id: <155744011521.23477.7035277562607237397.pr-tracker-bot@kernel.org>
Date:   Thu, 09 May 2019 22:15:15 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Thu, 9 May 2019 21:11:55 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-5.2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/45182e4e1f8ac04708ca7508c51d9103f07d81ab

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
