Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09CE65F243B
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Oct 2022 19:20:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiJBRUe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Oct 2022 13:20:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230017AbiJBRUc (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Oct 2022 13:20:32 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC89220CF;
        Sun,  2 Oct 2022 10:20:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 5F300CE0A36;
        Sun,  2 Oct 2022 17:20:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90B47C433D7;
        Sun,  2 Oct 2022 17:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664731227;
        bh=bts8Hm7HXJftFwod5FYYylfO8nOvH4+xLTwZv68yHI8=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=hBiyMgPzHhXaGalALscKQqYuBxD4MNnvKTkAhqpW8r9s5UAOcNgsLuc6RL2FADBbX
         KxIJY0cE2m8r7h+KhjMBUbFYPy1XHfW8EocklMyOPjiD1bgvBl9lU5uFLnbEuXUEWG
         misxqfoja97tFhCY6vjD72SqSMBE3EomfNrkTfqnrCA7hsG2ID1bvyGtuyWiOwrw4g
         0zM8/Z3vlO4zTCY35uC4tKbaAP6GyQcUVNOSfVarPICLx7SMpMyItfwOSr+8WwaNZD
         h10c7ei+UpY3x8y49DEHVEYrJJGdXT8BmnGvYOqnqjTFGORAk0ugVaS6w0/w3POmf+
         zn4Nl9wIIJNGg==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 7CA77E524CE;
        Sun,  2 Oct 2022 17:20:27 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.0-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Yzl2GRW4tCyFUJHl@shikoro>
References: <Yzl2GRW4tCyFUJHl@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Yzl2GRW4tCyFUJHl@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc8
X-PR-Tracked-Commit-Id: e2062df704dea47efe16edcaa2316d7b5ecca64f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: a962b54e162c2977ff37905726cab29728380835
Message-Id: <166473122750.23668.2691273807416967067.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Oct 2022 17:20:27 +0000
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

The pull request you sent on Sun, 2 Oct 2022 13:29:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.0-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/a962b54e162c2977ff37905726cab29728380835

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
