Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2315A745018
	for <lists+linux-i2c@lfdr.de>; Sun,  2 Jul 2023 20:56:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbjGBS4Y (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 2 Jul 2023 14:56:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230157AbjGBS4X (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sun, 2 Jul 2023 14:56:23 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0188DC6;
        Sun,  2 Jul 2023 11:56:02 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4747260DDA;
        Sun,  2 Jul 2023 18:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB996C433C8;
        Sun,  2 Jul 2023 18:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688323981;
        bh=4Adse8C3SvGQMVKiLfwOhrOqgOGS7oHnNq6KbrrSBtQ=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=tVQPesappFIJltnhvjcMAKKfjEixsaEJGNT7elFjbn7N8CtE7ycDWegjhHVtWr8Fi
         oc05/6CZkiv0qlUSr+g/wzyBiIIXxCqxlR8XiP8psa9pC6zvHpM7uihrFleYHLfJlk
         ZZusq6d4CnmA79eK+Dm26goyEiZrxYatfSSt31PL5BQ/SND5/Im3kJJ4Xt3PpsGfeK
         maYv/LW7AMgj37WC0l+E570/dUziJSIiJcaeJIxTtlQK6D7jX8DDfJg4nwufaEdjdD
         TmueIhVpjrZsyNFxhXKBKIPWN/sd/5uGmk4qaes8ybZak627pp2Zo2KBpVpoSu6GqG
         p/dMbZ+HeXKfA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 97510C0C40E;
        Sun,  2 Jul 2023 18:53:01 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.5-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZKFlfZS3y0eBI63e@sai>
References: <ZKFlfZS3y0eBI63e@sai>
X-PR-Tracked-List-Id: <linux-i2c.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZKFlfZS3y0eBI63e@sai>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.5-rc1
X-PR-Tracked-Commit-Id: 6fb605c41d731d511b33045d0cd713d706970b6d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5def00ca25fa5697cfe352e675dc7c03116b2403
Message-Id: <168832398161.18363.11198634422500174686.pr-tracker-bot@kernel.org>
Date:   Sun, 02 Jul 2023 18:53:01 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Sun, 2 Jul 2023 13:54:37 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.5-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5def00ca25fa5697cfe352e675dc7c03116b2403

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
