Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B46D33631ED
	for <lists+linux-i2c@lfdr.de>; Sat, 17 Apr 2021 21:08:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236718AbhDQTIb (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 17 Apr 2021 15:08:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:50478 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230064AbhDQTIa (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 17 Apr 2021 15:08:30 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id E8F4061207;
        Sat, 17 Apr 2021 19:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618686484;
        bh=kGIsuEOL0tIK/gggkEtmAQVxxue4fmSiu1dGV4JWYac=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=PfuXf3eLMfupi33BtQK6CJeMADfTbra/Q3Ush+VcLDGPLUMsqjcKsemV2i/cY9T94
         pPTvmA/OJBrmlSCmAevVgxiuXKE/rJnNUZI4+MONas4csR/Lhvq8WQemzCOeEDGta9
         +3m3igJHpMzeUJ4512eyy9aUhwNOA8+Qnn0gkBzh1Ka0rigWgFTY1y31M2UDLy8Tb5
         mat+96rQCajE9emq8y200NUREPQ5DoZSAJAfNxdbeAO/H3kczvWoomXtza9URgwGeB
         vAUdLDY925MgoSVl4FN6Tx2PZ8iy2l7HC+M7cBf1u4MfPqR7Ue+vz+JdWiwPh7zdma
         86Lwep0zMFuEA==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id D5CBB60CD4;
        Sat, 17 Apr 2021 19:08:03 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for 5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210417171816.GA2369@kunai>
References: <20210417171816.GA2369@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210417171816.GA2369@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 39930213e7779b9c4257499972b8afb8858f1a2d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 194cf4825638256e9afe1d360831aa5379b3517a
Message-Id: <161868648381.21506.2314956200551785910.pr-tracker-bot@kernel.org>
Date:   Sat, 17 Apr 2021 19:08:03 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 17 Apr 2021 19:18:16 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/194cf4825638256e9afe1d360831aa5379b3517a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
