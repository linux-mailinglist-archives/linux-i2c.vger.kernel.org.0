Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87B447E15EA
	for <lists+linux-i2c@lfdr.de>; Sun,  5 Nov 2023 19:53:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjKESxj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 5 Nov 2023 13:53:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjKESxj (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 5 Nov 2023 13:53:39 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8D55D8;
        Sun,  5 Nov 2023 10:53:36 -0800 (PST)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C253C433C7;
        Sun,  5 Nov 2023 18:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1699210416;
        bh=olhZQdGWpjrKgwe43+rUEadOhhAQ7sZ323HmZVz8yLE=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=DC+It8v7m5tRBCE8vEBnsLgN1F5FBBezGV+erVGFTyF6GMPzCOABaM7iRiD5tNRls
         Uct34wbIzM9ohaEB/VQ0CcxSFjPhlVxUwu8vuEyHqTE0QyKmHTbh20gbrccVQUKsHa
         HAyhjwBz60+M8tjcW9eBCrKwQit21w8GM7Fc6igbs8AUynXuwmnIrkUbpQosxEtXBU
         LgYw0+dvg/hElY+7TVJeBxLlKU/H2dJnxkt/1JKynATvyCuDBMyUTqFctg1UH0pMvP
         TKZOFnh0REvTKWh3Oy1JyTO/hB9ykSBeAd92IlzYxz8D0q+vMlntVwI/zlXBDDmtL8
         h3p+aSvIJak+g==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 38462C395FC;
        Sun,  5 Nov 2023 18:53:36 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.7-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZUec6zftAPNR+dsb@ninjato>
References: <ZUec6zftAPNR+dsb@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZUec6zftAPNR+dsb@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc1
X-PR-Tracked-Commit-Id: 10e806d39d304f837ed2921f36499f17a774a220
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 3d05e493e461c4469a9b73e00e59ea16e1d8a416
Message-Id: <169921041622.20864.13361583743889122197.pr-tracker-bot@kernel.org>
Date:   Sun, 05 Nov 2023 18:53:36 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 5 Nov 2023 14:47:23 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.7-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/3d05e493e461c4469a9b73e00e59ea16e1d8a416

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
