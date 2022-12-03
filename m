Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1B3064199C
	for <lists+linux-i2c@lfdr.de>; Sat,  3 Dec 2022 23:56:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbiLCW4l (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 3 Dec 2022 17:56:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229755AbiLCW4h (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Sat, 3 Dec 2022 17:56:37 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0FF31DF21;
        Sat,  3 Dec 2022 14:56:36 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4E0A860C51;
        Sat,  3 Dec 2022 22:56:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA8B2C433B5;
        Sat,  3 Dec 2022 22:56:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670108195;
        bh=5Xuwy5Z6b1ZeWyqvL2DysgWIMDrdLo2MCkebPXg5HC0=;
        h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
        b=B5rwZ5MnlqqREztNxhwY00XbBfqnbzRe6VIg9/5PXuZn4cH5xCECaFIWInJECvySF
         QxsvsUX4B9X709E1pbarF8zhaUgjRYkxN7DQMpBtIzUTrw0gfR7B4l364bJ0QZgARS
         xlqDwORqC0GM4dWDTcZ/BB5YgRofKmooYitBI0kof7NIyx4RjgquylM4aMC4/BiQjw
         C3dkaWtKNDJNc6lSjsjuf1DN9BnJOEaejaeu/jHpAaov9BQMktXc+gG5BYtETDeYI1
         ovYXvnI0B4DoeYM+TfqSMLEBLjbkzFj2UO8vCHc7dUukxu+gHccnXE3YAMCY781Z7S
         9e/EXmQBuLxcA==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 9792DC41622;
        Sat,  3 Dec 2022 22:56:35 +0000 (UTC)
Subject: Re: [PULL REQUEST] i2c-for-6.1-rc8
From:   pr-tracker-bot@kernel.org
In-Reply-To: <Y4treE3qPigo618I@ninjato>
References: <Y4treE3qPigo618I@ninjato>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <Y4treE3qPigo618I@ninjato>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc8
X-PR-Tracked-Commit-Id: d36678f7905cbd1dc55a8a96e066dafd749d4600
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c2bf05db6c78f53ca5cd4b48f3b9b71f78d215f1
Message-Id: <167010819561.27892.12582724934843015325.pr-tracker-bot@kernel.org>
Date:   Sat, 03 Dec 2022 22:56:35 +0000
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

The pull request you sent on Sat, 3 Dec 2022 16:30:00 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git tags/i2c-for-6.1-rc8

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c2bf05db6c78f53ca5cd4b48f3b9b71f78d215f1

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
