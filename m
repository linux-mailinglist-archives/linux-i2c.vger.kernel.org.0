Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 791821AFA27
	for <lists+linux-i2c@lfdr.de>; Sun, 19 Apr 2020 14:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgDSMuo (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 19 Apr 2020 08:50:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38572 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725910AbgDSMuo (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 19 Apr 2020 08:50:44 -0400
Received: from ROU-LT-M43218B.mchp-main.com (amontpellier-556-1-155-96.w109-210.abo.wanadoo.fr [109.210.131.96])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A844F2137B;
        Sun, 19 Apr 2020 12:50:34 +0000 (UTC)
Date:   Sun, 19 Apr 2020 14:50:58 +0200
From:   ludovic.desroches@microchip.com
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com,
        kamel.bouhara@bootlin.com, linux@armlinux.org.uk,
        linus.walleij@linaro.org, alan@softiron.com, wsa@the-dreams.de
Subject: Re: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for bus
 recovery
Message-ID: <20200419125058.ldueh7fdswgxocgf@ROU-LT-M43218B.mchp-main.com>
References: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
User-Agent: NeoMutt/20180716
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, Apr 15, 2020 at 10:06:43AM +0300, Codrin Ciubotariu wrote:
> devm_gpiod_get() usually calls gpio_request_enable() for non-strict pinmux
> drivers. These puts the pins in GPIO mode, whithout notifying the pinctrl
> driver. At this point, the I2C bus no longer owns the pins. To mux the
> pins back to the I2C bus, we use the pinctrl driver to change the state
> of the pins to GPIO, before using devm_gpiod_get(). After the pins are
> received as GPIOs, we switch theer pinctrl state back to the default
> one,
> 
> Fixes: d3d3fdcc4c90 ("i2c: at91: implement i2c bus recovery")
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

At the moment, I don't see another way to deal with this issue.

Link to the discussion:
https://lore.kernel.org/linux-arm-kernel/20191206173343.GX25745@shell.armlinux.org.uk/

Acked-by: Ludovic Desroches <ludovic.desroches@microchip.com>

> ---
>  drivers/i2c/busses/i2c-at91-master.c | 19 ++++++++++++++++---
>  1 file changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-at91-master.c b/drivers/i2c/busses/i2c-at91-master.c
> index 0aba51a7df32..43d85845c897 100644
> --- a/drivers/i2c/busses/i2c-at91-master.c
> +++ b/drivers/i2c/busses/i2c-at91-master.c
> @@ -845,6 +845,18 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
>  							 PINCTRL_STATE_DEFAULT);
>  	dev->pinctrl_pins_gpio = pinctrl_lookup_state(dev->pinctrl,
>  						      "gpio");
> +	if (IS_ERR(dev->pinctrl_pins_default) ||
> +	    IS_ERR(dev->pinctrl_pins_gpio)) {
> +		dev_info(&pdev->dev, "pinctrl states incomplete for recovery\n");
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * pins will be taken as GPIO, so we might as well inform pinctrl about
> +	 * this and move the state to GPIO
> +	 */
> +	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_gpio);
> +
>  	rinfo->sda_gpiod = devm_gpiod_get(&pdev->dev, "sda", GPIOD_IN);
>  	if (PTR_ERR(rinfo->sda_gpiod) == -EPROBE_DEFER)
>  		return -EPROBE_DEFER;
> @@ -855,9 +867,7 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
>  		return -EPROBE_DEFER;
>  
>  	if (IS_ERR(rinfo->sda_gpiod) ||
> -	    IS_ERR(rinfo->scl_gpiod) ||
> -	    IS_ERR(dev->pinctrl_pins_default) ||
> -	    IS_ERR(dev->pinctrl_pins_gpio)) {
> +	    IS_ERR(rinfo->scl_gpiod)) {
>  		dev_info(&pdev->dev, "recovery information incomplete\n");
>  		if (!IS_ERR(rinfo->sda_gpiod)) {
>  			gpiod_put(rinfo->sda_gpiod);
> @@ -870,6 +880,9 @@ static int at91_init_twi_recovery_info(struct platform_device *pdev,
>  		return -EINVAL;
>  	}
>  
> +	/* change the state of the pins back to their default state */
> +	pinctrl_select_state(dev->pinctrl, dev->pinctrl_pins_default);
> +
>  	dev_info(&pdev->dev, "using scl, sda for recovery\n");
>  
>  	rinfo->prepare_recovery = at91_prepare_twi_recovery;
> -- 
> 2.20.1
> 
