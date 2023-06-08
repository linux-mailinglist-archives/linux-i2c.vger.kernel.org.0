Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1AC3E727A1C
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jun 2023 10:39:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233645AbjFHIjM (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 8 Jun 2023 04:39:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233158AbjFHIjK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 8 Jun 2023 04:39:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92E82106;
        Thu,  8 Jun 2023 01:39:09 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2EFCF60FE2;
        Thu,  8 Jun 2023 08:39:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24128C433D2;
        Thu,  8 Jun 2023 08:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686213548;
        bh=NIZop4+AV1Hej4fAByaybXPXuAlFsLjn2ujf7u8pOlk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VxUsW1XxbLmVOeJOAO9umWkV7zphA92ss0exCJGGr5sImRhWGhQrZ5rlpHBKiVVK4
         2mU8VzY0UgLc/1r3qAUcvVIJQPqh2cE79RD/cLvhdKHyJ/fyGSwV6CzqmCjVyZVCck
         /YXerGAy+bXGpELNjMFh6E36oc/f3TUHo02an/I9Ny3+/1taFIgI5HGzmMfwxkaZsA
         wbHTnpLFN4/lhudKAn1GMRZ6hXLL1DwJW6EqCejltRuTPc0sCW5JhVWR0gJMV3OH9G
         ZdZk5bMsVOZZNV5ScGr4XYXmj+rC/6x0Cyd0Go7ws2q5ekHmvsBfCk0VucPSF+x8oI
         OAAzAnQiJ4bzQ==
Date:   Thu, 8 Jun 2023 10:39:05 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        Akhil R <akhilrajeev@nvidia.com>, linux-i2c@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <20230608083905.youqz3wt27sqda2f@intel.intel>
References: <20230608075606.3590744-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608075606.3590744-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Thierry,

On Thu, Jun 08, 2023 at 09:56:06AM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the driver fails to obtain a DMA channel, it will initiate cleanup
> and try to release the DMA channel that couldn't be retrieved. This will
> cause a crash because the cleanup will try to dereference an ERR_PTR()-
> encoded error code.
> 
> However, there's nothing to clean up at this point yet, so we can avoid
> this by simply propagating the error code.
> 
> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/i2c/busses/i2c-tegra.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index f155e9028f94..0eab199900ae 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -458,10 +458,8 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	 * with existing devicetrees.
>  	 */
>  	i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
> -	if (IS_ERR(i2c_dev->dma_chan)) {
> -		err = PTR_ERR(i2c_dev->dma_chan);
> -		goto err_out;
> -	}
> +	if (IS_ERR(i2c_dev->dma_chan))
> +		return PTR_ERR(i2c_dev->dma_chan);

Actually you are ignoring the case when the driver would use
programmed i/o only as a backup plan.

I think a possible fix could be:

--- a/drivers/i2c/busses/i2c-tegra.c
+++ b/drivers/i2c/busses/i2c-tegra.c
@@ -460,7 +460,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
        i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
        if (IS_ERR(i2c_dev->dma_chan)) {
                err = PTR_ERR(i2c_dev->dma_chan);
-               goto err_out;
+               goto err_probe_defer;
        }
 
        i2c_dev->dma_dev = i2c_dev->dma_chan->device->dev;
@@ -482,6 +482,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
 
 err_out:
        tegra_i2c_release_dma(i2c_dev);
+err_probe_defer:
        if (err != -EPROBE_DEFER) {
                dev_err(i2c_dev->dev, "cannot use DMA: %d\n", err);
                dev_err(i2c_dev->dev, "falling back to PIO\n");

Thank you,
Andi

(BTW, those are not dev_err's but they should be either dev_info
or dev_warn())

>  
>  	i2c_dev->dma_dev = i2c_dev->dma_chan->device->dev;
>  	i2c_dev->dma_buf_size = i2c_dev->hw->quirks->max_write_len +
> -- 
> 2.40.1
> 
