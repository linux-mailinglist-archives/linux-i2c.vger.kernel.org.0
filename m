Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C699A6A2692
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Feb 2023 02:38:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjBYBh6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Feb 2023 20:37:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230154AbjBYBh6 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 24 Feb 2023 20:37:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0E54EB41;
        Fri, 24 Feb 2023 17:37:56 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 63C7BB81D74;
        Sat, 25 Feb 2023 01:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2187CC433A4;
        Sat, 25 Feb 2023 01:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1677289074;
        bh=v9MdzpeAjMEEPkLripOmcFPHLnqS+F9I05ZPn37sOhc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=uIxZmaS7KGcH1VeJgtZPnXGgOUKraIVsbvPzW/DAopyfmZY3HIvUxGegiNUIhFhFj
         Lk+I83M7Mi2AgzRx9ePJe4ymjfW4QuBVyKERagV/2BWoJ5lcEvKxnwGNYcNJtWmqhW
         aixM4RgZuaFtC+Wt1G4loJvEDrABayEHBV7nrUSTKhTXLXcISQOCyRWuIytR4YO+4B
         0bDhW/UEzc2hnHQRHO9tSIh7TdZz/AK+nGrNmYhS49PloMrxmu8OdFsAnE/Ga5lxC2
         LTwy66AlbxgoVfxOW8AYh6PpV1kKrAskli875q4UY1YozvpD1OTwVStUf4Ve8EIIYY
         iySyn0eQOUnDA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 0F94AC43151;
        Sat, 25 Feb 2023 01:37:54 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.3-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y/esAfKcQpM77Gql@sai>
References: <Y/esAfKcQpM77Gql@sai>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y/esAfKcQpM77Gql@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1
X-PR-Tracked-Commit-Id: e8444bb9fd77f153adcc263eab28e3c2bc1cf540
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 008128cd5948bd3589a9c300e426af4d834029bb
Message-Id: <167728907406.28954.1102156334079437629.pr-tracker-bot@kernel.org>
Date:   Sat, 25 Feb 2023 01:37:54 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Thu, 23 Feb 2023 19:10:09 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/008128cd5948bd3589a9c300e426af4d834029bb

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
