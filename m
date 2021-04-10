Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 666B935AF2C
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Apr 2021 19:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234916AbhDJRDt (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 10 Apr 2021 13:03:49 -0400
Received: from mail.kernel.org ([198.145.29.99]:53446 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234898AbhDJRDr (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 10 Apr 2021 13:03:47 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id DF670611AE;
        Sat, 10 Apr 2021 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618074211;
        bh=C+tuvCV313xfdpUMvLxGC87XuFpxy9cRtqvUZJvrBr8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=YvIsupbeQZSAz+YyvWcnQ9n0uEMdKp7tdT82fLjdqQzgQ1Mq5kh0a5nuyOz1QaFRq
         fzU1ypAW7amaGxMNgzuKlqyl8ogOB/oNhKwRHLYvwmsUHtM+Kqb3K59xADGhBvcla/
         bJ0mwztWeoIVwUC/V3yplM8lqk4WrY93L6vO4W/TVhtODuRxgkqnbudN1hrM6WIZcc
         aESdLaOmuIiqJgwK2D+hCDC86jeioS6qiYnJuAkgmI0kuvp0BlhCRZIBCUymEsJa1O
         9xLYIpfai6X6HUwWh74TKYsvkFnWLSRYCCFyN9SO820SH/MGIGjlc+wD06rKgcs/XW
         /8BEzS4uXOzDQ==
Received: from pdx-korg-docbuild-2.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by pdx-korg-docbuild-2.ci.codeaurora.org (Postfix) with ESMTP id DA6E460727;
        Sat, 10 Apr 2021 17:03:31 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for 5.12
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20210410110024.GA1323@kunai>
References: <20210410110024.GA1323@kunai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20210410110024.GA1323@kunai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: df8a39f2911a4c7769e0f760509f556a9e9d37af
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 12a0cf7241f9ee6b9b62e4c5aad53c43f46817a4
Message-Id: <161807421188.30985.16643099820731503596.pr-tracker-bot@kernel.org>
Date:   Sat, 10 Apr 2021 17:03:31 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 10 Apr 2021 13:00:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/12a0cf7241f9ee6b9b62e4c5aad53c43f46817a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
