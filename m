Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A08661DA027
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 21:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726161AbgESTAE (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 15:00:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:54966 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726059AbgESTAE (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 15:00:04 -0400
Subject: Re: [PULL REQUEST] i2c for v5.8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589914803;
        bh=nmuWKCopX3Yra6zdphvzt5EcfliCIgDXl5S77q+8lBU=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=elnC3JD5ML6dcCa3+5sWkwprsdKDCiKK9APTxbc6/V2Y54csacJHSeC5NWgT3vc8H
         D0cTcyb4kIu2DAnN7BqOUcNGSvCcfeNBhujoAXVQpxVIdb4V34gXYGwmpGvGoXSlhW
         gWIQ2oKHBjF8flmyISwJ1GvruVzdLWoRQ423Cl5A=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200519063609.GA2141@ninjato>
References: <20200519063609.GA2141@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200519063609.GA2141@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 i2c/for-current-fixed
X-PR-Tracked-Commit-Id: efa7fb4c6c8e4171fd29a5935a9dc7a28e363278
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 03fb3acae4be8a6b680ffedb220a8b6c07260b40
Message-Id: <158991480368.4218.11601943122155089206.pr-tracker-bot@kernel.org>
Date:   Tue, 19 May 2020 19:00:03 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Tue, 19 May 2020 08:36:13 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/03fb3acae4be8a6b680ffedb220a8b6c07260b40

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
