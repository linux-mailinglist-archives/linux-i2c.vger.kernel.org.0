Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7657AF62D
	for <lists+linux-i2c@lfdr.de>; Wed, 27 Sep 2023 00:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjIZWMA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 26 Sep 2023 18:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236048AbjIZWJ7 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 26 Sep 2023 18:09:59 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92CD923129
        for <linux-i2c@vger.kernel.org>; Tue, 26 Sep 2023 15:07:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E12AAC4167D;
        Tue, 26 Sep 2023 21:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695763646;
        bh=PekjjYiIfOhHvL93kEmfc6P0W58OMfhHb2J60sNUljQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SwZ/WNFPVqnD+BWvtqkPiZvHRqTHoXp4qELAYpgnNObyA2m/AwxK8Q781iHBx2SMN
         rixMCm7rXKVqxKqH3olOo0tXJrkOTmmzRvxgnB8aFh/DGhuDB3aSbNtk6Ve7otgjDS
         oq+vqlHOQdQzO96Gt6VLHkF5311n4tiHIR+DyXBtw4zrGUsoWkUqBWVt3gt36byGL0
         4Iy59epXQSfFMGoHJgIFW9tgbQ5FzoPg2OB/+VvLT3g2dz3DVJiX71TDQP3SE8CA1S
         VQ70rj4V4t1CLwuTOPQ/XuRKMuZit5XJ6EckD5OsUA+N4fbGqb6FjoMZl+hpYeEtGf
         AvS3HMVapjuGA==
Date:   Tue, 26 Sep 2023 23:27:20 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Linux I2C <linux-i2c@vger.kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>
Subject: Re: [PATCH] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <20230926212720.adcn42akrnj72oxl@zenone.zhora.eu>
References: <20230926133725.5c3fb96e@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230926133725.5c3fb96e@endymion.delvare>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jean,

On Tue, Sep 26, 2023 at 01:37:25PM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
> 
> These Tyan server boards are 18 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.

do you have such devices?

I'm somewhat conflicted, on one hand I like the cleanup. But on
the other I think that they don't do any harm if they stay where
they are. There are lots of drivers that look outdated and need
maintenance, we can't just remove them... right?

Thanks,
Andi

> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' was not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' was not declared. Should it be static?
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>
