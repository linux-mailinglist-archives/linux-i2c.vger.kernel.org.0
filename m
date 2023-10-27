Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B467D9A31
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Oct 2023 15:40:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345989AbjJ0Nj5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 27 Oct 2023 09:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345976AbjJ0Nj4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 27 Oct 2023 09:39:56 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA70FD6;
        Fri, 27 Oct 2023 06:39:54 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBFE0C433CA;
        Fri, 27 Oct 2023 13:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698413994;
        bh=txH5nrL7NdHO+GWvWn+139Hu1jj1aXH2akfnzHdvnro=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o87ZwCa9Swlo8dTL1IjPQA4WGsn20bgwHegsocyLJ73HLGX8Z1iBj9Do6Hh+kv58V
         owR7fb7xAzcWkWvZ1mNTu+80U5oVjx/PdmJ9XnDQjEAoxppOHMNXeZ3jMm3FVxPQdV
         fCMXM2lzCRhc67bXdC0o7jwbkgCbJuK/0+A3vPOd+0ayQqyMEhMEi0bIKr5geWzIbI
         ZuN7Xx9VfRpuxWKppAvgahT2fG8EB9qcbRXn65j/U6GoL7OEADxYV4m5yy0OKgWK1t
         Rjpybq298kkq5Rd2CacPMzC9h2CFDb9QnP6Bs0vaxHY6lVa2QpQ6wJ2MRiPthOS6ko
         xmBOaVrxUMIYQ==
Date:   Fri, 27 Oct 2023 15:39:50 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v2 1/3] i2c: s3c24xx: fix read transfers in polling mode
Message-ID: <20231027133950.kntkq6ddgifaor76@zenone.zhora.eu>
References: <20231025121725.46028-1-m.szyprowski@samsung.com>
 <CGME20231025121737eucas1p1b5f0db709d99f8004f6177591cce0c8f@eucas1p1.samsung.com>
 <20231025121725.46028-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231025121725.46028-2-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Wed, Oct 25, 2023 at 02:17:23PM +0200, Marek Szyprowski wrote:
> To properly handle read transfers in polling mode, no waiting for the ACK
> state is needed as it will never come. Just wait a bit to ensure start
> state is on the bus and continue processing next bytes.
> 
> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index 127eb3805fac..f9dcb1112a61 100644
> --- a/drivers/i2c/busses/i2c-s3c2410.c
> +++ b/drivers/i2c/busses/i2c-s3c2410.c
> @@ -216,8 +216,13 @@ static bool is_ack(struct s3c24xx_i2c *i2c)
>  	int tries;
>  
>  	for (tries = 50; tries; --tries) {
> -		if (readl(i2c->regs + S3C2410_IICCON)
> -			& S3C2410_IICCON_IRQPEND) {
> +		unsigned long tmp = readl(i2c->regs + S3C2410_IICCON);
> +
> +		if (!(tmp & S3C2410_IICCON_ACKEN)) {
> +			usleep_range(100, 200);
> +			return true;

What is the real issue here? Is the value of S3C2410_IICCON_ACKEN
enabling/disabling irq's?

Besides, if we use polling mode, shouldn't we disable the acks
already in probe (even though they are disabled by default),
never enable them before starting the message and avoid checking
here everytime?

Andi

> +		}
> +		if (tmp & S3C2410_IICCON_IRQPEND) {
>  			if (!(readl(i2c->regs + S3C2410_IICSTAT)
>  				& S3C2410_IICSTAT_LASTBIT))
>  				return true;
> -- 
> 2.34.1
> 
