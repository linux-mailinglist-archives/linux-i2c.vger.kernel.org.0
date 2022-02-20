Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0B96A4BD119
	for <lists+linux-i2c@lfdr.de>; Sun, 20 Feb 2022 20:50:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244715AbiBTTuZ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 20 Feb 2022 14:50:25 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:43094 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244707AbiBTTuX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 20 Feb 2022 14:50:23 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D56C130F4D;
        Sun, 20 Feb 2022 11:50:02 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 7A92DB80DB6;
        Sun, 20 Feb 2022 19:50:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 488CFC340E8;
        Sun, 20 Feb 2022 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1645386601;
        bh=PsAplnaNwzySEhEIH9e6D7kchFuwpIx6ni46zFee3wg=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=dn4hSLJF+muNO4QexHewjFbtoYuSuFUlJM9iW+aQeX5B74y736rdWyJ/v6vDuDx/K
         O+bX5OZH70Q52uuZsXumej93II92EBErzxMtpqD/04uDKKxIf84e6F2Si4PaRDK+oG
         9UgagrHFD1Z2cOnqcAeis4QVTnIjXZgdd5SKKEVe92an75peJUGDSyBYTwkagcYOcm
         b3Ep1yiGJ7h6nVIn57o3AB1ni0z7SffnOHp7iFW9J0TrdYZO1UJtv06MK4DaYlQkg4
         6h3iVpiBu0agtg/djSotQ0Chb3qfIIUY4r0YJ/6CtuSNa2EXYSWgJj+fvDKRLvGiiO
         38Uk5KPTUh1DQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 37C58E5D07D;
        Sun, 20 Feb 2022 19:50:01 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.17
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YhJV69ApxgrGGBP6@ninjato>
References: <YhJV69ApxgrGGBP6@ninjato>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YhJV69ApxgrGGBP6@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 2428766e201565a5fa964d7461d9f6608eb04d7d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: dacec3e7b9bc59275b4c41319a9a52b0a1cacfa9
Message-Id: <164538660122.12071.7431399351915448531.pr-tracker-bot@kernel.org>
Date:   Sun, 20 Feb 2022 19:50:01 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 20 Feb 2022 15:53:31 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/dacec3e7b9bc59275b4c41319a9a52b0a1cacfa9

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
