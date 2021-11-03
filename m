Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8110A443EA4
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Nov 2021 09:51:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231959AbhKCIxv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Nov 2021 04:53:51 -0400
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:58426
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232012AbhKCIxo (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Wed, 3 Nov 2021 04:53:44 -0400
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com [209.85.208.199])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C988F3F1B4
        for <linux-i2c@vger.kernel.org>; Wed,  3 Nov 2021 08:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1635929467;
        bh=TVrLljg8qJqVapwA4b8BraZn0Ft9v5DUj6xKEJBDVBc=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=mzUMYdA6oOHsNRtZIewmSoGgKiGpkMnI87t4hTvm6JM/mZdq0Y8r2ALKy1mrIy042
         Q3opc6JeoKMcpGuYQovxr5oyg3N0nKYuezj+qqhctLQ4bYTuYLI1gGBUxRJFCO1JnD
         dzOnuymu/1x4A5Z0Ua3KfcYrb1eqdbgx4q6oO9JW43D1xC9wzf7ojf7K4YIaVKNPw2
         Ub3Hzzs0w/BXuA6lT+NpSx3MT8XOfb+nREMEBQBVw9wysMpunp7VB9ClDMkLHVEXr2
         j3LUHTIDfimVtZmG5ZGO9HjTfaOlidtjCPYinC263hpDZl5zhLMq35GCUTpdDXVwDW
         zDllDQbcG4xbw==
Received: by mail-lj1-f199.google.com with SMTP id f9-20020a05651c160900b00217e6a3ec32so815197ljq.1
        for <linux-i2c@vger.kernel.org>; Wed, 03 Nov 2021 01:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TVrLljg8qJqVapwA4b8BraZn0Ft9v5DUj6xKEJBDVBc=;
        b=3jdmjhDGjA4bPJCmbiCxKNqdXVZdCRy6YaOtPu6H8VDV/pspYLDkF4ML/N3yFNUVlh
         Z6cKsgAVtPcGYTUpJ3qu1rVtTpr2Lj7z7xBEon17qfLYuwQfugw2M9zO3pcn7F54E1P6
         a+nRHxwCfhS0y73idFLzugD2+4LBrwDAxe+Xlj8aUEInnj6gnphFxZvL+nOEmFWBFHoW
         ilXcZl/8ruHWxP7uI3NdbJJ5RfLcjlm4Fetnzgwiirl869mM5nLaIilieGJzEqLb6reQ
         DWVQVcD+uunN1LVxlgoVfbxeO7oz/5a8mk/TecXN1xUdWlA3MOCKR4jvTa5oyFkfp7Z3
         l3ZA==
X-Gm-Message-State: AOAM531uXXg8ir/WBvfJOVCAXg38NnIBYayXVBgLKlqifEEa1kpdWENJ
        x3PquEJmraiiretGT9nqNDuYE7BScOcOFW1FRt5j1Pt7guwxtpXUP1XTE9g8MkkkzDyNNS2prEy
        J+9rPcQYZ5cNDI/qQf1Q442+w2/CHeLoMBp5e8A==
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr18515706ljf.434.1635929467084;
        Wed, 03 Nov 2021 01:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZSFd1FYXFxVHMICYFxMjl50UQfJVrEnvMD/6CDgEL6LvXMbUyxZUdCk1q8MyFhaHl25Zfkg==
X-Received: by 2002:a2e:bc19:: with SMTP id b25mr18515682ljf.434.1635929466837;
        Wed, 03 Nov 2021 01:51:06 -0700 (PDT)
Received: from [192.168.3.67] (89-77-68-124.dynamic.chello.pl. [89.77.68.124])
        by smtp.gmail.com with ESMTPSA id c24sm122383lfc.155.2021.11.03.01.51.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Nov 2021 01:51:06 -0700 (PDT)
Message-ID: <a571af00-8ac1-f1a5-3240-2c93f823c995@canonical.com>
Date:   Wed, 3 Nov 2021 09:51:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.2
Subject: Re: [PATCH 1/2] i2c: exynos5: support USI(Universal Serial Interface)
Content-Language: en-US
To:     Jaewon Kim <jaewon02.kim@samsung.com>,
        Wolfram Sang <wsa@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc:     Chanho Park <chanho61.park@samsung.com>, linux-i2c@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <CGME20211101114158epcas2p1d0762d52029b1b09912fd99665dd66f5@epcas2p1.samsung.com>
 <20211101113819.50651-1-jaewon02.kim@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20211101113819.50651-1-jaewon02.kim@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On 01/11/2021 12:38, Jaewon Kim wrote:
> Serial IPs(UART, I2C, SPI) are integrated into New IP-Core
> called USI(Universal Serial Interface).
> 
> As it is integrated into USI, there are additinal HW changes.
> Registers to control USI and sysreg to set serial IPs have been added.
> Also, some timing registres have been changed.
> 
> Signed-off-by: Jaewon Kim <jaewon02.kim@samsung.com>
> ---
>  drivers/i2c/busses/i2c-exynos5.c | 120 ++++++++++++++++++++++++++++---
>  1 file changed, 110 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-exynos5.c b/drivers/i2c/busses/i2c-exynos5.c
> index 97d4f3ac0abd..f2dc7848f840 100644
> --- a/drivers/i2c/busses/i2c-exynos5.c
> +++ b/drivers/i2c/busses/i2c-exynos5.c
> @@ -22,6 +22,8 @@
>  #include <linux/of_device.h>
>  #include <linux/of_irq.h>
>  #include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/regmap.h>
>  
>  /*
>   * HSI2C controller from Samsung supports 2 modes of operation
> @@ -166,9 +168,21 @@
>  
>  #define EXYNOS5_I2C_TIMEOUT (msecs_to_jiffies(100))
>  
> +/* USI(Universal Serial Interface) Register map */
> +#define USI_CON					0xc4
> +#define USI_OPTION				0xc8
> +
> +/* USI(Universal Serial Interface) Register bits */
> +#define USI_CON_RESET				(1 << 0)

BIT()

> +
> +/* SYSREG Register bit */
> +#define SYSREG_USI_SW_CONF_MASK			(0x7 << 0)
> +#define SYSREG_I2C_SW_CONF			(1u << 2)

BIT()

> +
>  enum i2c_type_exynos {
>  	I2C_TYPE_EXYNOS5,
>  	I2C_TYPE_EXYNOS7,
> +	I2C_TYPE_USI,
>  };
>  
>  struct exynos5_i2c {
> @@ -199,6 +213,10 @@ struct exynos5_i2c {
>  
>  	/* Version of HS-I2C Hardware */
>  	const struct exynos_hsi2c_variant *variant;
> +
> +	/* USI sysreg info */
> +	struct regmap		*usi_sysreg;
> +	unsigned int		usi_offset;
>  };
>  
>  /**
> @@ -230,6 +248,11 @@ static const struct exynos_hsi2c_variant exynos7_hsi2c_data = {
>  	.hw		= I2C_TYPE_EXYNOS7,
>  };
>  
> +static const struct exynos_hsi2c_variant exynos_usi_hsi2c_data = {
> +	.fifo_depth	= 64,
> +	.hw		= I2C_TYPE_USI,
> +};
> +
>  static const struct of_device_id exynos5_i2c_match[] = {
>  	{
>  		.compatible = "samsung,exynos5-hsi2c",
> @@ -243,6 +266,9 @@ static const struct of_device_id exynos5_i2c_match[] = {
>  	}, {
>  		.compatible = "samsung,exynos7-hsi2c",
>  		.data = &exynos7_hsi2c_data
> +	}, {
> +		.compatible = "samsung,exynos-usi-hsi2c",
> +		.data = &exynos_usi_hsi2c_data
>  	}, {},
>  };
>  MODULE_DEVICE_TABLE(of, exynos5_i2c_match);
> @@ -281,6 +307,31 @@ static int exynos5_i2c_set_timing(struct exynos5_i2c *i2c, bool hs_timings)
>  		i2c->op_clock;
>  	int div, clk_cycle, temp;
>  
> +	/* In case of HSI2C controllers in USI
> +	 * timing control formula changed.
> +	 *
> +	 * FSCL = IPCLK / ((CLK_DIV + 1) * 16)
> +	 * T_SCL_LOW = IPCLK * (CLK_DIV + 1) * (N + M)
> +	 *  [N : number of 0's in the TSCL_H_HS]
> +	 *  [M : number of 0's in the TSCL_L_HS]
> +	 * T_SCL_HIGH = IPCLK * (CLK_DIV + 1) * (N + M)
> +	 *  [N : number of 1's in the TSCL_H_HS]
> +	 *  [M : number of 1's in the TSCL_L_HS]
> +	 *
> +	 *  result of (N + M) is always 8.
> +	 *  In genaral case, we don`t need to control timing_s1, timing_s2.

s/genaral/general/
(please run spellcheck)
s/don`t/don't/

> +	 */
> +	if (i2c->variant->hw == I2C_TYPE_USI) {
> +		div = ((clkin / (16 * i2c->op_clock)) - 1);
> +		i2c_timing_s3 = div << 16;
> +		if (hs_timings)
> +			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_HS3);
> +		else
> +			writel(i2c_timing_s3, i2c->regs + HSI2C_TIMING_FS3);
> +
> +		return 0;
> +	}
> +
>  	/*
>  	 * In case of HSI2C controller in Exynos5 series
>  	 * FPCLK / FI2C =
> @@ -355,6 +406,16 @@ static int exynos5_hsi2c_clock_setup(struct exynos5_i2c *i2c)
>  	return exynos5_i2c_set_timing(i2c, true);
>  }
>  
> +static void exynos_usi_reset(struct exynos5_i2c *i2c)

The name of function suggests you are performing a reset but the code
looks like it is only clearing the reset flag. How about calling the
function exynos_usi_clear_reset()?

> +{
> +	u32 val;
> +
> +	/* Clear the software reset of USI block (it's set at startup) */
> +	val = readl(i2c->regs + USI_CON);
> +	val &= ~USI_CON_RESET;
> +	writel(val, i2c->regs + USI_CON);
> +}
> +
>  /*
>   * exynos5_i2c_init: configures the controller for I2C functionality
>   * Programs I2C controller for Master mode operation
> @@ -385,6 +446,9 @@ static void exynos5_i2c_reset(struct exynos5_i2c *i2c)
>  {
>  	u32 i2c_ctl;
>  
> +	if (i2c->variant->hw == I2C_TYPE_USI)
> +		exynos_usi_reset(i2c);
> +
>  	/* Set and clear the bit for reset */
>  	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
>  	i2c_ctl |= HSI2C_SW_RST;
> @@ -422,7 +486,8 @@ static irqreturn_t exynos5_i2c_irq(int irqno, void *dev_id)
>  	writel(int_status, i2c->regs + HSI2C_INT_STATUS);
>  
>  	/* handle interrupt related to the transfer status */
> -	if (i2c->variant->hw == I2C_TYPE_EXYNOS7) {
> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS7 ||
> +			i2c->variant->hw == I2C_TYPE_USI) {
>  		if (int_status & HSI2C_INT_TRANS_DONE) {
>  			i2c->trans_done = 1;
>  			i2c->state = 0;
> @@ -569,13 +634,13 @@ static void exynos5_i2c_bus_check(struct exynos5_i2c *i2c)
>  {
>  	unsigned long timeout;
>  
> -	if (i2c->variant->hw != I2C_TYPE_EXYNOS7)
> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
>  		return;
>  
>  	/*
> -	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 variant before transaction
> -	 * indicates that bus is stuck (SDA is low). In such case bus recovery
> -	 * can be performed.
> +	 * HSI2C_MASTER_ST_LOSE state in EXYNOS7 or EXYNOS_USI variant before
> +	 * transaction indicates that bus is stuck (SDA is low).
> +	 * In such case bus recovery can be performed.
>  	 */
>  	timeout = jiffies + msecs_to_jiffies(100);
>  	for (;;) {
> @@ -611,10 +676,10 @@ static void exynos5_i2c_message_start(struct exynos5_i2c *i2c, int stop)
>  	unsigned long flags;
>  	unsigned short trig_lvl;
>  
> -	if (i2c->variant->hw == I2C_TYPE_EXYNOS7)
> -		int_en |= HSI2C_INT_I2C_TRANS;
> -	else
> +	if (i2c->variant->hw == I2C_TYPE_EXYNOS5)
>  		int_en |= HSI2C_INT_I2C;
> +	else
> +		int_en |= HSI2C_INT_I2C_TRANS;
>  
>  	i2c_ctl = readl(i2c->regs + HSI2C_CTL);
>  	i2c_ctl &= ~(HSI2C_TXCHON | HSI2C_RXCHON);
> @@ -738,6 +803,37 @@ static const struct i2c_algorithm exynos5_i2c_algorithm = {
>  	.functionality		= exynos5_i2c_func,
>  };
>  
> +static int exynos_usi_init(struct exynos5_i2c *i2c)
> +{
> +	struct device *dev = i2c->dev;
> +	int ret;
> +
> +	if (i2c->variant->hw != I2C_TYPE_USI)
> +		return 0;
> +
> +	/* USI regmap control */

Drop the comment, it's obvious. What is missing here, is a comment
explaining what are you initializing exactly in the USI. Please add it.

> +	i2c->usi_sysreg = syscon_regmap_lookup_by_phandle(
> +			dev->of_node, "samsung,usi-sysreg");

Align the lines to opening parenthesis.

> +	if (IS_ERR(i2c->usi_sysreg)) {
> +		dev_err(dev, "Cannot find usi-sysreg\n");
> +		return PTR_ERR(i2c->usi_sysreg);
> +	}
> +
> +	ret = of_property_read_u32_index(dev->of_node,
> +				"samsung,usi-sysreg", 1, &i2c->usi_offset);

Align the lines to opening parenthesis.

Offset is not described in the bindings.

> +	if (ret) {
> +		dev_err(dev, "usi-sysreg offset is not specified\n");
> +		return ret;
> +	}
> +
> +	regmap_update_bits(i2c->usi_sysreg, i2c->usi_offset,
> +			SYSREG_USI_SW_CONF_MASK, SYSREG_I2C_SW_CONF);
> +
> +	exynos_usi_reset(i2c);

You are clearing the reset flag, but not setting it back on probe
failure. What happens if the probe fails after this clear()? E.g.
because of deferred probe? The next probe try will start on a not-reset
controller. Will it work?

> +
> +	return 0;
> +}
> +
>  static int exynos5_i2c_probe(struct platform_device *pdev)
>  {
>  	struct device_node *np = pdev->dev.of_node;
> @@ -777,6 +873,12 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  	i2c->adap.algo_data = i2c;
>  	i2c->adap.dev.parent = &pdev->dev;
>  
> +	i2c->variant = of_device_get_match_data(&pdev->dev);
> +
> +	ret = exynos_usi_init(i2c);
> +	if (ret)
> +		return ret;
> +
>  	/* Clear pending interrupts from u-boot or misc causes */
>  	exynos5_i2c_clr_pend_irq(i2c);
>  
> @@ -794,8 +896,6 @@ static int exynos5_i2c_probe(struct platform_device *pdev)
>  		goto err_clk;
>  	}
>  
> -	i2c->variant = of_device_get_match_data(&pdev->dev);
> -
>  	ret = exynos5_hsi2c_clock_setup(i2c);
>  	if (ret)
>  		goto err_clk;
> 


Best regards,
Krzysztof
