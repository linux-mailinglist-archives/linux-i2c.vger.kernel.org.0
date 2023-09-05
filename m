Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A46CD793266
	for <lists+linux-i2c@lfdr.de>; Wed,  6 Sep 2023 01:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238111AbjIEXTY (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Sep 2023 19:19:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59908 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235535AbjIEXTX (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 5 Sep 2023 19:19:23 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA2BB0;
        Tue,  5 Sep 2023 16:19:20 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1757BC433C8;
        Tue,  5 Sep 2023 23:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1693955959;
        bh=tkLbpV5CYYO3vwi6utL6T6ePfooLRu8OIzUvsyy5lUw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u6NcJsYZn2RyIAvQigeFmahcfloKDTk7xZoLkOrk1UmsjkW6yHUSfdAEiGeOa8BQO
         usPjt9dvhzbV5AnjFq/p1CyiZdZl8vzXfS+ZLM0HDi3zdsDNAmbzFp7xz0Kg7f1fEx
         TRD9p/tvbbyIw8kmHYcEDCX/JhDDVkjbvoH4jn34Y3U/TKpOCNq4PoDbOO6329Yf4G
         N4yDzef4zY/eg4Tr4jpkG90tHwY4AoK03DZBhFcgYPDTpJiO9+x7ui1RcyVvRHjV3h
         /9R+PI2dI6qobu60856oGC1ytxE4XZ0EkqdrS4zBtGrkDgQxdwBXEDeL1dfgtWm4lB
         qtBXT/gKuedFg==
Date:   Wed, 6 Sep 2023 01:19:15 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Tommy Huang <tommy_huang@aspeedtech.com>
Cc:     brendan.higgins@linux.dev, p.zabel@pengutronix.de,
        linux-i2c@vger.kernel.org, openbmc@lists.ozlabs.org,
        benh@kernel.crashing.org, joel@jms.id.au, andrew@aj.id.au,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, jae.hyun.yoo@linux.intel.com,
        linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
        stable@vger.kernel.org
Subject: Re: [PATCH] i2c: aspeed: Reset the i2c controller when timeout occurs
Message-ID: <20230905231915.rv2ysvxa3bshekjq@zenone.zhora.eu>
References: <20230904012505.340455-1-tommy_huang@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230904012505.340455-1-tommy_huang@aspeedtech.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Tommy,

Thanks for fixing what I asked, I'm going to review here:

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

But still there are 3 things I will ask you for your next
patches:

  1. Please add a version to the patch, this is patch version 2,
     so that the title should be "[PATCH v2] i2c...."

     You can have that with git-format-patch:

        git format-patch -v 2 ....

On Mon, Sep 04, 2023 at 09:25:05AM +0800, Tommy Huang wrote:
> Reset the i2c controller when an i2c transfer timeout occurs.
> The remaining interrupts and device should be reset to avoid
> unpredictable controller behavior.
> 
> Fixes: 2e57b7cebb98 ("i2c: aspeed: Add multi-master use case support")
> Cc: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Cc: <stable@vger.kernel.org> # v5.1+
> 
> Signed-off-by: Tommy Huang <tommy_huang@aspeedtech.com>

  2. Don't leave blank lines between tags. But I think Wolfram
     can fix this before pushing.

> ---

  3. After the '---' it comes the freedom of speach section where
     you can write anything. Please add the changelog, something
     like:

       v1 -> v2
        - Fixed comment...
	- Fixed commit log...
	- etc.

     This is important for reviewers in order to understand what
     has changed from patch v1 to patch v2.

Please, before your next patch, read first the
Documentation/process/submitting-patches.rst document.

Thanks,
Andi

>  drivers/i2c/busses/i2c-aspeed.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-aspeed.c b/drivers/i2c/busses/i2c-aspeed.c
> index 2e5acfeb76c8..5a416b39b818 100644
> --- a/drivers/i2c/busses/i2c-aspeed.c
> +++ b/drivers/i2c/busses/i2c-aspeed.c
> @@ -698,13 +698,16 @@ static int aspeed_i2c_master_xfer(struct i2c_adapter *adap,
>  
>  	if (time_left == 0) {
>  		/*
> -		 * If timed out and bus is still busy in a multi master
> -		 * environment, attempt recovery at here.
> +		 * In a multi-master setup, if a timeout occurs, attempt
> +		 * recovery. But if the bus is idle, we still need to reset the
> +		 * i2c controller to clear the remaining interrupts.
>  		 */
>  		if (bus->multi_master &&
>  		    (readl(bus->base + ASPEED_I2C_CMD_REG) &
>  		     ASPEED_I2CD_BUS_BUSY_STS))
>  			aspeed_i2c_recover_bus(bus);
> +		else
> +			aspeed_i2c_reset(bus);
>  
>  		/*
>  		 * If timed out and the state is still pending, drop the pending
> -- 
> 2.25.1
> 
