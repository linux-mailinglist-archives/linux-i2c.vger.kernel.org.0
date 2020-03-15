Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7E82E185845
	for <lists+linux-i2c@lfdr.de>; Sun, 15 Mar 2020 03:00:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgCOCAI (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 14 Mar 2020 22:00:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:33116 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727521AbgCOCAG (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 14 Mar 2020 22:00:06 -0400
Subject: Re: [PULL REQUEST] i2c for v5.6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584237606;
        bh=pIBCVKDT5OjVzX0Y/WdTtLU1ifXffFz1EZ6rK6v36tc=;
        h=From:In-Reply-To:References:Date:To:Cc:From;
        b=Wbm8XsHv1+ocjvw4W70H3KvY323AjcXJ4Qj8uwXNQCOq1DRGXpUSlV0qyRKPly4rm
         HxKv54TuzycOo9vJLDIeGCKYCJ5xoGurpAVxYT8PsFR/aAsik7Na1bw82MHHMBrmIo
         MLljiZ3wkqYOStoyTMuZ1M67FvDjha3VOEplx3TI=
From:   pr-tracker-bot@kernel.org
In-Reply-To: <20200314210830.GA1730@ninjato>
References: <20200314210830.GA1730@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <20200314210830.GA1730@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 92bd1f2e1eed493a73a19012a3a7f1feed0883ff
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d3dca69085e94e52a1d61a34b8e5f73a9f3d7eed
Message-Id: <158423760614.26381.11563014789632295912.pr-tracker-bot@kernel.org>
Date:   Sun, 15 Mar 2020 02:00:06 +0000
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sat, 14 Mar 2020 22:08:49 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d3dca69085e94e52a1d61a34b8e5f73a9f3d7eed

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/prtracker
