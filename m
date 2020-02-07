Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E18B71560E2
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Feb 2020 22:55:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727740AbgBGVzU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Feb 2020 16:55:20 -0500
Received: from mail.kernel.org ([198.145.29.99]:42410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727697AbgBGVzU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Feb 2020 16:55:20 -0500
Subject: Re: [GIT PULL] Additional ACPI updates for v5.6-rc1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1581112519;
        bh=GmfHsAi2L8vVRWBdqdTqIK2X5WyLyDBPcOXaUgGhuG4=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=zhKjYnu7QePq2lyNj55j7gHMURu8nb50O4v3dCHdVdAaBsdfiOZSC7PepRtqMLPL9
         +QepvPY3XkDmri/ASsKJbk/c3ymVZuOPTO1J8iohH7oll1soIKXvNgtz2gV06Xl1Hj
         +wr4cqUEd41y1QihOfPNUI27dRfoHOKvaBatsjvI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <CAJZ5v0iWhN=pxnedntPn5kriN-uEULvTjHADtJj59a5W14a4sQ@mail.gmail.com>
References: <CAJZ5v0iWhN=pxnedntPn5kriN-uEULvTjHADtJj59a5W14a4sQ@mail.gmail.com>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <CAJZ5v0iWhN=pxnedntPn5kriN-uEULvTjHADtJj59a5W14a4sQ@mail.gmail.com>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git
 acpi-5.6-rc1-3
X-PR-Tracked-Commit-Id: dec0a81a7814c8a876e663e0627468e6b1a7d2fb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ed39ba0ec1156407040e7509cb19299b5dda3815
Message-Id: <158111251949.9631.11774276832242457428.pr-tracker-bot@kernel.org>
Date:   Fri, 07 Feb 2020 21:55:19 +0000
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Fri, 7 Feb 2020 11:36:02 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git acpi-5.6-rc1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ed39ba0ec1156407040e7509cb19299b5dda3815

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
