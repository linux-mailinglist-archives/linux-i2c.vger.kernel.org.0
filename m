Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A5158083C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Aug 2019 22:05:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727585AbfHCUFL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Aug 2019 16:05:11 -0400
Received: from mail.kernel.org ([198.145.29.99]:59330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726409AbfHCUFL (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 3 Aug 2019 16:05:11 -0400
Subject: Re: [PULL REQUEST] i2c for 5.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1564862710;
        bh=FjyjyZ1Clfn22rPLS3gRsdKII6LdhChMG61ut9EZZ+E=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=YIYd0ddYlmqX4IlQXQQ3Go2OFVYmiJlSfTE2NCOLgnIrX/aXp3Sdh4GuopcpF08Be
         HCpI6AvaIDENk7CPKtgD6XAG0UEnD5ZfDJIEsUKSlyYwe2JndO4bomSpmdQX/rBUXC
         Wes3y2g0s8+/8SYl0Wg7+1hEKrRHzBwHOCkiOiuM=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20190803190200.GA1126@ninjato>
References: <20190803190200.GA1126@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20190803190200.GA1126@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git
 i2c/for-current-fixed
X-PR-Tracked-Commit-Id: 8eb9a2dff019055e4ff307bb7f8c64a7a20e79c8
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: cf6c8aef16cc0cd15e91a930befd8e312d5703f5
Message-Id: <156486271067.16255.969459821966791615.pr-tracker-bot@kernel.org>
Date:   Sat, 03 Aug 2019 20:05:10 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 3 Aug 2019 21:02:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current-fixed

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/cf6c8aef16cc0cd15e91a930befd8e312d5703f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
