Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 430F1791EF9
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Sep 2023 23:13:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240342AbjIDVNm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 4 Sep 2023 17:13:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233615AbjIDVNm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Mon, 4 Sep 2023 17:13:42 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06CDFAB;
        Mon,  4 Sep 2023 14:13:39 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id A9085B80EF6;
        Mon,  4 Sep 2023 21:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 454D2C433CA;
        Mon,  4 Sep 2023 21:13:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693862016;
        bh=MKkQe2mrC0c3a3qmRPBLK404an5D9IiVa3ZIgPlmCdc=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=O8mOrkaicg25Kr0CWIgawg0hWzypNDYUuOGHbMF3UHRvq4ZAynfEVsfTbpFLwlJrQ
         kH3ZAe0rmIjxzjboVl94dxS3x8RJIp0gAq4g0E4CqUojF+yNrwbm6XDq145unqv/tU
         2TJ/4KSI3yKuQGUTiy5NY32pqqFIptj+LyPlH2P4MWDoVR1uqWkFLlEgCcP5QF6iPm
         6fa0H5Yegou/2ewmSYI9G5CbUF3xIU4//OXjqPC/QeHr1wfkytBCmJ/8wgj0JWh/AP
         p60ean6TrkzmUxaZgH85r5qAeDuwbpjzBUXgDsmke6+ps2ZsbPSoj8oYGgRPMym7Rx
         +1b3w1kpU5lkQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 2FFECC0C3FD;
        Mon,  4 Sep 2023 21:13:36 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.6-rc1
From:   pr-tracker-bot@kernel.org
In-Reply-To: <ZPXA0wtQYlRZSCEw@shikoro>
References: <ZPXA0wtQYlRZSCEw@shikoro>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <ZPXA0wtQYlRZSCEw@shikoro>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc1
X-PR-Tracked-Commit-Id: 0ab4bcf0e9471c1a3f5e4721ee486f6ed1a76bac
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e3b85b07650c0c9d4d2fab82a21fa3dfbfbb9b63
Message-Id: <169386201618.29740.10386476971957581020.pr-tracker-bot@kernel.org>
Date:   Mon, 04 Sep 2023 21:13:36 +0000
To:     Wolfram Sang <wsa@kernel.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Rosin <peda@axentia.se>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Andi Shyti <andi.shyti@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

The pull request you sent on Mon, 4 Sep 2023 13:34:43 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.6-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e3b85b07650c0c9d4d2fab82a21fa3dfbfbb9b63

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
