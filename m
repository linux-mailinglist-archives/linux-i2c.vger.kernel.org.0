Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6C87A76C119
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Aug 2023 01:36:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229537AbjHAXgL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 1 Aug 2023 19:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229652AbjHAXgK (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Tue, 1 Aug 2023 19:36:10 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FD77CC
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 16:36:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4851161761
        for <linux-i2c@vger.kernel.org>; Tue,  1 Aug 2023 23:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47BEDC433C9;
        Tue,  1 Aug 2023 23:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690932966;
        bh=6uy6+AkDtuDOqT81p4pPLlv+19pwovDNi5W+vTBt4rc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YFcX1joZfLL2I0CQNAbI2fqLSJD/qkdQTlT3L6obsgAZ5ocO6s4LZ4dyhyKl18g/G
         k3Fc0fTxZGStHfURbtPnGQXY+m4cq4lJdMvny95yLD6wM4njzYF61dNRxbPS1Ihfc8
         BRJt54GkPYVh87z0cWzhNAN4w7sVf2J3pz/3MC8z7euiSqPxR+96V3Qt8m2R06t7Ag
         GYON1fJ1wN40YxBfiaCUnBq9w89rBSuJ+50Uif//ogPq3DR09Pkwqi861v55NGwpEB
         us5ehLbqKuJuhJVVpvdE1w7TcSxeZo1olo2ZK2XxkMP8HV6nIKnjbR9mitM0Fzfvdr
         d+LzEkhVHpf2Q==
Date:   Wed, 2 Aug 2023 01:36:03 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Ruan Jinjie <ruanjinjie@huawei.com>
Cc:     pierre-yves.mordret@foss.st.com, alain.volmat@foss.st.com,
        mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH -next] i2c: stm32: fix the return value handle for
 platform_get_irq()
Message-ID: <20230801233603.iztyd2wqhcogr72r@intel.intel>
References: <20230731112755.1943630-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230731112755.1943630-1-ruanjinjie@huawei.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Ruan,

On Mon, Jul 31, 2023 at 07:27:55PM +0800, Ruan Jinjie wrote:
> There is no possible for platform_get_irq() to return 0,
> and the return value of platform_get_irq() is more sensible
> to show the error reason.
> 
> Signed-off-by: Ruan Jinjie <ruanjinjie@huawei.com>
> ---
>  drivers/i2c/busses/i2c-stm32f7.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-stm32f7.c b/drivers/i2c/busses/i2c-stm32f7.c
> index e897d9101434..579b30581725 100644
> --- a/drivers/i2c/busses/i2c-stm32f7.c
> +++ b/drivers/i2c/busses/i2c-stm32f7.c
> @@ -2121,12 +2121,12 @@ static int stm32f7_i2c_probe(struct platform_device *pdev)
>  	phy_addr = (dma_addr_t)res->start;
>  
>  	irq_event = platform_get_irq(pdev, 0);
> -	if (irq_event <= 0)
> -		return irq_event ? : -ENOENT;
> +	if (irq_event < 0)
> +		return irq_event;
>  
>  	irq_error = platform_get_irq(pdev, 1);
> -	if (irq_error <= 0)
> -		return irq_error ? : -ENOENT;
> +	if (irq_error < 0)
> +		return irq_error;

Correct, from patch ce753ad1549cbe ("platform: finally disallow
IRQ0 in platform_get_irq() and its ilk") this check is already
done inside platform_get_irq();

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

>  
>  	i2c_dev->wakeup_src = of_property_read_bool(pdev->dev.of_node,
>  						    "wakeup-source");
> -- 
> 2.34.1
> 
