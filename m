Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0A33A7B3CD0
	for <lists+linux-i2c@lfdr.de>; Sat, 30 Sep 2023 00:57:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233809AbjI2W5g (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 29 Sep 2023 18:57:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229508AbjI2W5g (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 29 Sep 2023 18:57:36 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2D4EDD;
        Fri, 29 Sep 2023 15:57:34 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98ADFC433C7;
        Fri, 29 Sep 2023 22:57:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696028254;
        bh=fMo+CYSaDL4iXScdLYsbbHAA3MELdawJLPLByOOpjN4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pGk3CqiwrnZ5skvAgnxXgDQlvMm/107JQ3OErzqlYe60Q6SYewdWZ6HkPTKRTvKGU
         5nIcNMOL2NgkJyMJm0p92DRgCkXzT7v+4nKEdQK2tZaLo32MXEnSmfip5Fv2HhjvWy
         On0ExG3DMxDC458mkd7RmIoQxGY9DG6qy0METdkAdjHh+LS0LIJLwnSZdsVme1NCXH
         LNoj7luxn5SaBvnwI/wOanEBDAIoYy12llBbr0YGHylLB167T1+es1VFvG9FjbZSoy
         /1J3EMBRRaTOyQWaIIZ5oGmisWdiMUy9+o1K1R0zwy2hga2KfFuHS0EfuK8b5vujR5
         fBoepazVaKdOg==
Date:   Sat, 30 Sep 2023 00:57:28 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-i2c@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH] i2c: exynos5: add support for atomic transfers
Message-ID: <20230929225728.uuptlphev4tg7jnf@zenone.zhora.eu>
References: <CGME20230929113851eucas1p28d902fbb6054951d57314ff181985e30@eucas1p2.samsung.com>
 <20230929113841.1272625-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230929113841.1272625-1-m.szyprowski@samsung.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Marek,

> @@ -178,6 +179,7 @@ struct exynos5_i2c {
>  	unsigned int		msg_ptr;
>  
>  	unsigned int		irq;
> +	unsigned int		polled;

Is this supposed to be called polling?

>  	void __iomem		*regs;
>  	struct clk		*clk;		/* operating clock */
> @@ -711,6 +713,24 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  	spin_unlock_irqrestore(&i2c->lock, flags);
>  }
>  
> +static unsigned long exynos5_i2c_polled_irqs_timeout(struct exynos5_i2c *i2c,
> +						     unsigned long timeout_ms)
> +{
> +	ktime_t start, now;
> +
> +	start = now = ktime_get();
> +	while (ktime_ms_delta(now, start) < timeout_ms &&
> +	       !((i2c->trans_done && (i2c->msg->len == i2c->msg_ptr)) ||
> +	         (i2c->state < 0))) {
> +		while (readl(i2c->regs + HSI2C_INT_ENABLE) &
> +		       readl(i2c->regs + HSI2C_INT_STATUS))
> +			exynos5_i2c_irq(i2c->irq, i2c);
> +		usleep_range(100, 200);
> +		now = ktime_get();
> +	}
> +	return ktime_ms_delta(now, start) < timeout_ms;

what are you returning here?

Andi
