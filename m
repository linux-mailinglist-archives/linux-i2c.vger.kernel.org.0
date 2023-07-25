Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72B2A76248B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Jul 2023 23:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230375AbjGYVeK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Jul 2023 17:34:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230256AbjGYVeJ (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 25 Jul 2023 17:34:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E096F1BE2;
        Tue, 25 Jul 2023 14:34:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 73C0E61901;
        Tue, 25 Jul 2023 21:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80885C433C7;
        Tue, 25 Jul 2023 21:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690320847;
        bh=0S+vyA18Gti+iM4v5Tym76t3LDmPWoYfJYutqpSWjN0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hCNoGAhqNpaisaSkRxI9ivb8vWqZGz1HBIFUt5j1G7J/wqvswoLKRat9wWe44HoGM
         iGP4RJnki4zcdcsGsOluUo9p7/zFzuMAQXQtDcdJvUXoW9/+otk7i/JjlTG5aRye3T
         vDPbJw8j1jMg4U4jKZkt05HAanqKH4zwKYKOfTaymD0hSazOXjFcUVH5tXCTeOv6u3
         cEwglc47VTObUYqfzaXuIKIU/YVi+T5dnacWnBtpOB8Qdt2KkkQ0bpsWgjJSBWV0Cp
         HCkw98nfETEDlEjB+/f5EHOEO9rGdiQSgUQtMXa7Iiu5L+Gcp+Mmt73/wsyEpy+cOM
         70LTrUbDiD+IA==
Date:   Tue, 25 Jul 2023 23:34:04 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Wolfram Sang <wsa@kernel.org>, Jon Hunter <jonathanh@nvidia.com>,
        linux-i2c@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] i2c: tegra: Fix failure during probe deferral cleanup
Message-ID: <20230725213404.gj3fjiuz3wh4ak2i@intel.intel>
References: <20230707132619.2998382-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230707132619.2998382-1-thierry.reding@gmail.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Thierry,

On Fri, Jul 07, 2023 at 03:26:19PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> If the driver fails to obtain a DMA channel, it will initiate cleanup
> and try to release the DMA channel that couldn't be retrieved. This will
> cause a crash because the cleanup will try to dereference an ERR_PTR()-
> encoded error code.

while this is a valid solution I think the best thing here is to
clear the exit path by adding another goto label.

By setting dma_chan = NULL you would go through some extra checks
that are not needed.

I guess that by doing this we could even remove the

	if (i2c_dev->dma_buf)
	if (i2c_dev->dma_chan)

in tegra_i2c_release_dma(). However you see it cleaner. I'm not
going to be picky, though. Let me know if you are up for some
more clean up, otherwise I can give you an r-b... after a little
clarification...

> However, there's nothing to clean up at this point yet, so we can avoid
> this by simply resetting the DMA channel to NULL instead of storing the
> error code.
> 
> Fixes: fcc8a89a1c83 ("i2c: tegra: Share same DMA channel for RX and TX")

... is this the correct commit that is getting fixed? I think
it's this one:

Fixes: 86c92b9965ff ("i2c: tegra: Add DMA support")
Cc: <stable@vger.kernel.org> # v5.1+

Thanks,
Andi

> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
> Changes in v2:
> - simplify patch by setting dma_chan = NULL on channel request failure
> 
>  drivers/i2c/busses/i2c-tegra.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/i2c/busses/i2c-tegra.c b/drivers/i2c/busses/i2c-tegra.c
> index f155e9028f94..2a13f11edfd1 100644
> --- a/drivers/i2c/busses/i2c-tegra.c
> +++ b/drivers/i2c/busses/i2c-tegra.c
> @@ -460,6 +460,7 @@ static int tegra_i2c_init_dma(struct tegra_i2c_dev *i2c_dev)
>  	i2c_dev->dma_chan = dma_request_chan(i2c_dev->dev, "tx");
>  	if (IS_ERR(i2c_dev->dma_chan)) {
>  		err = PTR_ERR(i2c_dev->dma_chan);
> +		i2c_dev->dma_chan = NULL;
>  		goto err_out;
>  	}
>  
> -- 
> 2.41.0
> 
