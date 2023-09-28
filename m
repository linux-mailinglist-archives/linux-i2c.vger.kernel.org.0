Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 930237B2025
	for <lists+linux-i2c@lfdr.de>; Thu, 28 Sep 2023 16:51:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231294AbjI1Ovn (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 28 Sep 2023 10:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231388AbjI1Ovm (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 28 Sep 2023 10:51:42 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854061BF;
        Thu, 28 Sep 2023 07:51:35 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42EA2C433C8;
        Thu, 28 Sep 2023 14:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695912695;
        bh=ngdTCrwOUwR55XWtCbHA962yNGY14Ep1dAAyBjjxwQ4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gTVgTYHSZ/4DohPeRJvnKEz4QGDirx/RUKg7f9vzVf96KqcyIsGEzI/+ijF9AUthp
         bWD2MMbUokoHk21y8A1E16Tctsy0lD0crrPFEucksYdsdb4zcxjAU42/8ZRYod34oV
         c1w1ke6DiVaSfK+6TEivFYAAGhCwwjM/cORRpSF9yWICf+mWnk5aBVRyVREIgiXAYf
         GEyU0yCuWA8Mqr9JPNWnVqOIG1/L6+iANcWKPALPRDjieFmYGj7CQ2p7sU3OeT4GEM
         jJ+6LrLbCaaPHqzypENARfRuokM3hUwwj1Xo30YVJqWB17R8n94sXj9KPwfccAsRAI
         hlLjYjW+wJeTw==
Date:   Thu, 28 Sep 2023 16:51:28 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Jian Zhang <zhangjian.3032@bytedance.com>
Cc:     brendan.higgins@linux.dev, benh@kernel.crashing.org,
        joel@jms.id.au, andrew@aj.id.au, zhangjian3032@gmail.com,
        yulei.sh@bytedance.com, xiexinnan@bytedance.com,
        Tommy Huang <tommy_huang@aspeedtech.com>,
        Wolfram Sang <wsa@kernel.org>,
        "open list:ARM/ASPEED I2C DRIVER" <linux-i2c@vger.kernel.org>,
        "moderated list:ARM/ASPEED I2C DRIVER" <openbmc@lists.ozlabs.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-arm-kernel@lists.infradead.org>,
        "moderated list:ARM/ASPEED MACHINE SUPPORT" 
        <linux-aspeed@lists.ozlabs.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] i2c: aspeed: Fix i2c bus hang in slave read
Message-ID: <20230928145128.tjflbgvena4apivs@zenone.zhora.eu>
References: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927154244.3774670-1-zhangjian.3032@bytedance.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Jian,

On Wed, Sep 27, 2023 at 11:42:43PM +0800, Jian Zhang wrote:
> When the `CONFIG_I2C_SLAVE` option is enabled and the device operates
> as a slave, a situation arises where the master sends a START signal
> without the accompanying STOP signal. This action results in a
> persistent I2C bus timeout. The core issue stems from the fact that
> the i2c controller remains in a slave read state without a timeout
> mechanism. As a consequence, the bus perpetually experiences timeouts.
> 
> In this case, the i2c bus will be reset, but the slave_state reset is
> missing.
> 
> Fixes: fee465150b45 ("i2c: aspeed: Reset the i2c controller when timeout occurs")
> Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>

Why I'm failing to find your v1 patch? And where is the
changelog?

Andi
