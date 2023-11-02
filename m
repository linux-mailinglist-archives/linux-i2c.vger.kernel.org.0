Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7AB7DFD4D
	for <lists+linux-i2c@lfdr.de>; Fri,  3 Nov 2023 00:39:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229570AbjKBXjT (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 2 Nov 2023 19:39:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjKBXjS (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Thu, 2 Nov 2023 19:39:18 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20515136;
        Thu,  2 Nov 2023 16:39:16 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CC77C433C8;
        Thu,  2 Nov 2023 23:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1698968355;
        bh=UFmY9yLXRwF5BP26oxbhOMr2Xh8L0Mgpbgcy1toyyMk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bQmuaAyFg8ZPJHnzpSp6LMqL5Ygz9cj1DMvXiaLjUfqmqbjNNEP1UQ1sX6WAZ0mWK
         fcrafnsGYhcVmJo0RjlVhl50ahP0eng06T/u4zu0QgQl5BFa/ga2gUL3qx+Xu0hugN
         uEee/9EmKPuzPQpzkniwXtz3shta2xVpCl8Ok4rk0+Spu95wEagN5MhEQMsWT5xD9b
         FF905BVjWvzyCI+ZHfLgS8DsH3hfJ9guhJQ24a07/tqPuPthFNOD+qwHkp3nC2UyGI
         l1Ceg4ZXa9wa6KO2onNBNanKrTYZAuuUJTwveb4oATqcU723vgujEVGX9XmjByienB
         Y8SK1kjiHhB9g==
Date:   Fri, 3 Nov 2023 00:39:09 +0100
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>,
        Chanho Park <chanho61.park@samsung.com>
Subject: Re: [PATCH v3 1/3] i2c: s3c24xx: fix read transfers in polling mode
Message-ID: <20231102233909.xkruckpbvhdxu22q@zenone.zhora.eu>
References: <20231031144252.2112593-1-m.szyprowski@samsung.com>
 <CGME20231031144300eucas1p2c7d05a247469cec1bf3aec978bbd58d1@eucas1p2.samsung.com>
 <20231031144252.2112593-2-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231031144252.2112593-2-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

On Tue, Oct 31, 2023 at 03:42:50PM +0100, Marek Szyprowski wrote:
> To properly handle read transfers in polling mode, no waiting for the ACK
> state is needed as it will never come. Just wait a bit to ensure start
> state is on the bus and continue processing next bytes.
> 
> Fixes: 117053f77a5a ("i2c: s3c2410: Add polling mode support")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> Reviewed-by: Chanho Park <chanho61.park@samsung.com>
> ---
>  drivers/i2c/busses/i2c-s3c2410.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-s3c2410.c b/drivers/i2c/busses/i2c-s3c2410.c
> index c56886af724e..bcc6afe2ccb5 100644
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

even though there are some obscure points here, I trust you have
got here by doing some proper testing and, knowing you, I guess
it was a thorough testing.

I'm going to ack it, however, I think this driver needs some
proper cleanup. I have all the hardware, fortunately, I just need
to find some time to do it.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

I will appreciate if you also add a comment on how you managed to
get the 100-200 us sleeping range.

Andi

> +		}
> +		if (tmp & S3C2410_IICCON_IRQPEND) {
>  			if (!(readl(i2c->regs + S3C2410_IICSTAT)
>  				& S3C2410_IICSTAT_LASTBIT))
>  				return true;
> -- 
> 2.34.1
> 
