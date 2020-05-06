Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DFCB11C7257
	for <lists+linux-i2c@lfdr.de>; Wed,  6 May 2020 16:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728739AbgEFOA4 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 6 May 2020 10:00:56 -0400
Received: from vps0.lunn.ch ([185.16.172.187]:45080 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728667AbgEFOA4 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 6 May 2020 10:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
        Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=sb+91cRUqctrQDuRfc/AByV+/UWxszvXrjsevRQrhv4=; b=0Q+tEQnsus3iTyVs3ZcR1dknGX
        qEHB8ZuETn5ygPjcB2R+UdZMB5YzTQnHzgQ4gEcDez7IlrS8PH5lWv9JS7d4pxHxowjDUGk5GXUjH
        btDWhbeIsmiQzYdUKY6IERNicTQ995gVQVNQB2N37r/IyBrQr9u74Vd43qdAwJQH7xG0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.93)
        (envelope-from <andrew@lunn.ch>)
        id 1jWKbW-0015kK-7J; Wed, 06 May 2020 16:00:54 +0200
Date:   Wed, 6 May 2020 16:00:54 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Russell King <rmk+kernel@armlinux.org.uk>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Gregory Clement <gregory.clement@bootlin.com>,
        Jason Cooper <jason@lakedaemon.net>,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Vladimir Vid <vladimir.vid@sartura.hr>
Subject: Re: [PATCH 1/2] i2c: pxa: implement generic i2c bus recovery
Message-ID: <20200506140054.GG224913@lunn.ch>
References: <20200506094001.GP1551@shell.armlinux.org.uk>
 <E1jWGXX-0000Yx-UL@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1jWGXX-0000Yx-UL@rmk-PC.armlinux.org.uk>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

On Wed, May 06, 2020 at 10:40:31AM +0100, Russell King wrote:
> Implement generic GPIO-based I2C bus recovery for the PXA I2C driver.
> 
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>
> ---
>  drivers/i2c/busses/i2c-pxa.c | 176 +++++++++++++++++++++++++++++++----
>  1 file changed, 159 insertions(+), 17 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-pxa.c b/drivers/i2c/busses/i2c-pxa.c
> index 0e194d6cd1b5..da15ab2a519e 100644
> --- a/drivers/i2c/busses/i2c-pxa.c
> +++ b/drivers/i2c/busses/i2c-pxa.c
> @@ -20,6 +20,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/errno.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/interrupt.h>
> @@ -28,6 +29,7 @@
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
> +#include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
>  #include <linux/platform_data/i2c-pxa.h>
>  #include <linux/slab.h>
> @@ -260,6 +262,11 @@ struct pxa_i2c {
>  	bool			highmode_enter;
>  	u32			fm_mask;
>  	u32			hs_mask;
> +
> +	struct i2c_bus_recovery_info recovery;
> +	struct pinctrl		*pinctrl;
> +	struct pinctrl_state	*pinctrl_default;
> +	struct pinctrl_state	*pinctrl_recovery;
>  };
>  
>  #define _IBMR(i2c)	((i2c)->reg_ibmr)
> @@ -559,13 +566,8 @@ static void i2c_pxa_set_slave(struct pxa_i2c *i2c, int errcode)
>  #define i2c_pxa_set_slave(i2c, err)	do { } while (0)
>  #endif
>  
> -static void i2c_pxa_reset(struct pxa_i2c *i2c)
> +static void i2c_pxa_do_reset(struct pxa_i2c *i2c)
>  {
> -	pr_debug("Resetting I2C Controller Unit\n");
> -
> -	/* abort any transfer currently under way */
> -	i2c_pxa_abort(i2c);
> -
>  	/* reset according to 9.8 */
>  	writel(ICR_UR, _ICR(i2c));
>  	writel(I2C_ISR_INIT, _ISR(i2c));
> @@ -584,12 +586,25 @@ static void i2c_pxa_reset(struct pxa_i2c *i2c)
>  #endif
>  
>  	i2c_pxa_set_slave(i2c, 0);
> +}
>  
> +static void i2c_pxa_enable(struct pxa_i2c *i2c)
> +{
>  	/* enable unit */
>  	writel(readl(_ICR(i2c)) | ICR_IUE, _ICR(i2c));
>  	udelay(100);
>  }
>  
> +static void i2c_pxa_reset(struct pxa_i2c *i2c)
> +{
> +	pr_debug("Resetting I2C Controller Unit\n");

Hi Russell

I know you are just moving code around, but maybe pr_debug() could be
cleaned up to dev_debug()? 

> +	/*
> +	 * Claiming GPIOs can change the pinmux state, which confuses the
> +	 * pinctrl since since pinctrl's idea of the current setting is

since since

I don't know too much about this hardware, but for what it is worth,

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
