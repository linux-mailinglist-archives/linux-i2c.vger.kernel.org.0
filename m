Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 42B537642FD
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Jul 2023 02:35:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229639AbjG0Af5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 26 Jul 2023 20:35:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229954AbjG0Af4 (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 26 Jul 2023 20:35:56 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A4AC268B;
        Wed, 26 Jul 2023 17:35:55 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1FCF561CE2;
        Thu, 27 Jul 2023 00:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 288A3C433C8;
        Thu, 27 Jul 2023 00:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690418154;
        bh=asGQMrcLTGnqdLEv4v7h7MunHSk6hn+xQskVyzD00EI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KX/GU4x5ISX6eCdyK9NiseW4INm7QCa1E6gqTkMaJlrasrY6D9UzfMbLKEtoYGky6
         qbUSZ5OCCkRUDACuVWL0uwyDJ47s52VDav03kw3bxkKI6jS+L1wp5jjOqZfJx4uAVr
         mXX9G2lNhpRBgyUzIavpmq0W5HdbXWaNcU1ivKwuLFAEVMRiT3A4cya5Fohz8w+pUA
         UAL2dEjEru2u2acsZ2OFMUArUokuXxZu6UJbpBSh5DiUs2FgXTiA1xh8hKH3IFeWIp
         VJl0f7FwVTGRzVdra/U7qjviX/fgWHzolZ1Jg8x7f2U7nlM7UwZ/9QmNVZ0cUF96Us
         elrTHN+6Rk5kQ==
Date:   Thu, 27 Jul 2023 02:35:51 +0200
From:   Andi Shyti <andi.shyti@kernel.org>
To:     Samuel Holland <samuel.holland@sifive.com>
Cc:     Peter Korsgaard <peter@korsgaard.com>,
        Andrew Lunn <andrew@lunn.ch>, linux-i2c@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: ocores: Move system PM hooks to the NOIRQ phase
Message-ID: <20230727003551.dtjx3shwpjs3le6x@intel.intel>
References: <20230717203857.2626773-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230717203857.2626773-1-samuel.holland@sifive.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi Samuel,

On Mon, Jul 17, 2023 at 01:38:57PM -0700, Samuel Holland wrote:
> When an I2C device contains a wake IRQ subordinate to a regmap-irq chip,
> the regmap-irq code must be able to perform I2C transactions during
> suspend_device_irqs() and resume_device_irqs(). Therefore, the bus must
> be suspended/resumed during the NOIRQ phase.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>

it's OK for me.

Peter, any comment on this?

Andi

> ---
> 
>  drivers/i2c/busses/i2c-ocores.c | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-ocores.c b/drivers/i2c/busses/i2c-ocores.c
> index 4ac77e57bbbf..b1f621d42910 100644
> --- a/drivers/i2c/busses/i2c-ocores.c
> +++ b/drivers/i2c/busses/i2c-ocores.c
> @@ -743,7 +743,6 @@ static void ocores_i2c_remove(struct platform_device *pdev)
>  	i2c_del_adapter(&i2c->adap);
>  }
>  
> -#ifdef CONFIG_PM_SLEEP
>  static int ocores_i2c_suspend(struct device *dev)
>  {
>  	struct ocores_i2c *i2c = dev_get_drvdata(dev);
> @@ -772,11 +771,9 @@ static int ocores_i2c_resume(struct device *dev)
>  	return ocores_init(dev, i2c);
>  }
>  
> -static SIMPLE_DEV_PM_OPS(ocores_i2c_pm, ocores_i2c_suspend, ocores_i2c_resume);
> -#define OCORES_I2C_PM	(&ocores_i2c_pm)
> -#else
> -#define OCORES_I2C_PM	NULL
> -#endif
> +static const struct dev_pm_ops ocores_i2c_pm_ops = {
> +	NOIRQ_SYSTEM_SLEEP_PM_OPS(ocores_i2c_suspend, ocores_i2c_resume)
> +};
>  
>  static struct platform_driver ocores_i2c_driver = {
>  	.probe   = ocores_i2c_probe,
> @@ -784,7 +781,7 @@ static struct platform_driver ocores_i2c_driver = {
>  	.driver  = {
>  		.name = "ocores-i2c",
>  		.of_match_table = ocores_i2c_match,
> -		.pm = OCORES_I2C_PM,
> +		.pm = &ocores_i2c_pm_ops,
>  	},
>  };
>  
> -- 
> 2.40.1
> 
