Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3616750D50
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Jul 2023 17:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231614AbjGLP7o (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 12 Jul 2023 11:59:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbjGLP7n (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 12 Jul 2023 11:59:43 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D996A2;
        Wed, 12 Jul 2023 08:59:42 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2CD3861873;
        Wed, 12 Jul 2023 15:59:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D707DC433C7;
        Wed, 12 Jul 2023 15:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689177581;
        bh=Asw7YIgmSTRjyc9HQuQrE/IrN9rP/aCIs3C9w8KIs5g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HbiZKxFpyM7FQnK6JaIw3dCIrJ1nFc1nbRXS1KfKFhCgiVdv1M7SLinTUggwym3e5
         phnT13/2Qrufo+9VzvFmrfEC5RVnf80nYZ+v/p8nFpj4JAaOHIBBlZS0MJLpEFc/oG
         xQXUHRAFth3t8Q6L0kmAy0d+Q474u/day7Otq2RgKWm5h2dMBRJVQiLUGk7aG7YvRE
         01BgmABFvr04TT4uYXErtUgiX0PIOTezMkpi4bOBO9S1naP4qw7DzteVGZ2+sU7TTF
         PtWIKCLu0p4Vb1jIkKUcWS+EhBCzYF3Du7fEZz1E+5APlBbbJ5Byqu3YQ7mWbtKHn+
         SfrRubyD2oM1Q==
Date:   Wed, 12 Jul 2023 17:59:37 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Yangtao Li <frank.li@vivo.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/11] i2c: pxa: Use
 devm_platform_get_and_ioremap_resource()
Message-ID: <20230712155937.xekbw7straoh5xor@intel.intel>
References: <20230710063351.17490-1-frank.li@vivo.com>
 <20230710063351.17490-10-frank.li@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230710063351.17490-10-frank.li@vivo.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Yangtao,

On Mon, Jul 10, 2023 at 02:33:49PM +0800, Yangtao Li wrote:
> Convert platform_get_resource(), devm_ioremap_resource() to a single
> call to devm_platform_get_and_ioremap_resource(), as this is exactly
> what this function does.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Andi

> ---
> v2:
> -s/devm_platform_get_and_ioremap_resource(pdev/devm_platform_get_and_ioremap_resource(dev
>  drivers/i2c/busses/i2c-pxa.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 937f7eebe906..b630bfeaeb85 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -1362,7 +1362,7 @@ static int i2c_pxa_probe(struct platform_device *dev)
>  	struct i2c_pxa_platform_data *plat = dev_get_platdata(&dev->dev);
>  	enum pxa_i2c_types i2c_type;
>  	struct pxa_i2c *i2c;
> -	struct resource *res = NULL;
> +	struct resource *res;
>  	int ret, irq;
>  
>  	i2c = devm_kzalloc(&dev->dev, sizeof(struct pxa_i2c), GFP_KERNEL);
> @@ -1379,8 +1379,7 @@ static int i2c_pxa_probe(struct platform_device *dev)
>  	i2c->adap.dev.of_node = dev->dev.of_node;
>  #endif
>  
> -	res = platform_get_resource(dev, IORESOURCE_MEM, 0);
> -	i2c->reg_base = devm_ioremap_resource(&dev->dev, res);
> +	i2c->reg_base = devm_platform_get_and_ioremap_resource(dev, 0, &res);
>  	if (IS_ERR(i2c->reg_base))
>  		return PTR_ERR(i2c->reg_base);
>  
> -- 
> 2.39.0
> 
