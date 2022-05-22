Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 87DE0530517
	for <lists+linux-i2c@lfdr.de>; Sun, 22 May 2022 20:08:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348533AbiEVSI3 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 22 May 2022 14:08:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235686AbiEVSI1 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 22 May 2022 14:08:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95A8C39699;
        Sun, 22 May 2022 11:08:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3F040B80CBD;
        Sun, 22 May 2022 18:08:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA563C385B8;
        Sun, 22 May 2022 18:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1653242903;
        bh=egYcx/PYkze8hHb4ynJdqbS4HEL0KyHoTQhcztF1+o0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=GmFGZjfe0rBWOWA8JuLNvMGUnoU4nQSNpv+KnmMZddi40GyTg7ILwGZT6TY6qj4FH
         xii5zVqIYJQVVEd5kjoI8Ef8wCPpFTQa5Z84Nc7KG+/LJrFTSB/6O/DxEzBSU3VbaT
         JBoLFkgHXHVd1etk1v/4rhXgn1iwBY9KQiIdfasAWPotQ/1zdP0ukgvFADGtYylA9U
         QdHz/6hF2fsVVM4FSPoppNtU23PjqqqpUGb9+6GXYP0j364EBjBQW3KbRMsB75QEQz
         xMVI3xSf9XBGPlC7t6q9jjRuE8rRJtFEzIAdM6eAZezb8K6rKiy9lsfj9RqPxrOlG1
         bKyyqelj7CGIA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id C458CE8DBDA;
        Sun, 22 May 2022 18:08:23 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c for v5.18
From:   pr-tracker-bot@kernel.org
In-Reply-To: <YopVgt6ACGuAQfR0@shikoro>
References: <YopVgt6ACGuAQfR0@shikoro>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <YopVgt6ACGuAQfR0@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current
X-PR-Tracked-Commit-Id: 03a35bc856ddc09f2cc1f4701adecfbf3b464cb3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 978df3e158467ae09be635b27e9e1eb990704e0b
Message-Id: <165324290379.16734.13195452603526255648.pr-tracker-bot@kernel.org>
Date:   Sun, 22 May 2022 18:08:23 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 22 May 2022 17:23:46 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/for-current

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/978df3e158467ae09be635b27e9e1eb990704e0b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
