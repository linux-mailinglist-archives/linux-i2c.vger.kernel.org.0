Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 718ED32477
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jun 2019 19:26:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726818AbfFBRZb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jun 2019 13:25:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:35214 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726587AbfFBRZO (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 2 Jun 2019 13:25:14 -0400
Subject: Re: [PULL REQUEST] i2c for 5.2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1559496314;
        bh=9FWIEqhrbY65cbvWohqbtGpeD8HmsgvvclVV/yNsBaE=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=IgxmATjjakXwSBHVRr2gKOmWpEePfjkmq3Ko9TfBM3xHwKrTIUVnM5TILDLRx9fyX
         SHAYLM5yGxdJHPFqd1+rVrDQA7iTd2ON/IH3hiKKQ4QUPgAjhXm8W26tp4PYhnHMG8
         yeOdxiLbODyEYaUEdxKMdHet7BKJgjUSUkTQpFEw=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190602062356.GA1616@kunai>
References: <20190602062356.GA1616@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190602062356.GA1616@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: c8552db31d5e70f0311be031b22292bf256791da
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 38baf0bb79f51b4fcbf6df8fd181441d7b5c7913
Message-Id: <155949631397.24242.15334043470129943507.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Jun 2019 17:25:13 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 2 Jun 2019 08:24:02 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/38baf0bb79f51b4fcbf6df8fd181441d7b5c7913

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
