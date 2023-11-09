Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFDFB7E745A
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Nov 2023 23:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345370AbjKIW2X (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 9 Nov 2023 17:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345363AbjKIW2U (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 9 Nov 2023 17:28:20 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4995386A;
        Thu,  9 Nov 2023 14:28:18 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4AD08C433CC;
        Thu,  9 Nov 2023 22:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699568898;
        bh=Khjk76jTIvykFuVi3YpF5NmTs5utjy/adYhe/+K4BqI=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=kiQiohvV0/q+zc11R6AJoIcMXTgmFkLmInvgR98rnSLXbpKUdGn9O/nKbMl2KIcqf
         l9ATJKLkkK/BLQTKLguG50NKl8G+T2rcwbE2V/BkzAtCwqS9/C7Ku8uIY9oM+EpEdx
         hCfQkE89YZB0HjpbGuQbxPj4s77RCkax9JvcTeezfSvgXPdGRhTLRexrUUgH2zUu0a
         7KRn06kE8jUG4JarI8x9450MlSWm7HPdSYSedaM78mzP7LB1uaBRy51jTmdf9V1Glv
         tCCeQZ/67Di1oDihSUbNnwi/SLIZQnCO7d/8PQ8sGmBPH6+9JmL6hNHvwNdhpR9MRJ
         uEl/iG2vARiTA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37C7FC3274C;
        Thu,  9 Nov 2023 22:28:18 +0000 (UTC)
Subject: Re: [PULL REQUEST] for-6.7-rc1-part2
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZUyDTXUSNgMQFNAh@ninjato>
References: <ZUyDTXUSNgMQFNAh@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZUyDTXUSNgMQFNAh@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/for-6.7-rc1-part2
X-PR-Tracked-Commit-Id: bdba49cbba41f0bea54fc93529bbef4d6ceaa3cd
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: ace92fd98475c15c860855b53aad3413e28399c8
Message-Id: <169956889822.16549.13525494078490772455.pr-tracker-bot@kernel.org>
Date:   Thu, 09 Nov 2023 22:28:18 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Thu, 9 Nov 2023 07:59:25 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/for-6.7-rc1-part2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/ace92fd98475c15c860855b53aad3413e28399c8

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
