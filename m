Return-Path: <linux-i2c+bounces-590-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AE6802447
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 14:37:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 405FA280E8F
	for <lists+linux-i2c@lfdr.de>; Sun,  3 Dec 2023 13:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71342F9C4;
	Sun,  3 Dec 2023 13:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JjxMu+Q7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E840C2EE
	for <linux-i2c@vger.kernel.org>; Sun,  3 Dec 2023 13:37:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2935BC433C7;
	Sun,  3 Dec 2023 13:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701610657;
	bh=g6VF/OawWYAUDmEECQlX5bMPHLfMffyKwRch+Y1hphI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JjxMu+Q75WHV/aMFVXU3gJ9a2JXzUIcX82TQk84XWQKEXEGIgNhzWL4IKvetxx06d
	 ecDoecFR9FqIAYW2tMslc4NL1GjxE0Oc5h02D7AYk7f0KoEGyVAtSczpBpCWkULln1
	 k3HD9MPfgGz+76fTYlKfn8qtezeMc0oo3G6NM1ONXZ1eKHX7XsKte03TfxQKhyQzeR
	 a5tXoujlG1kxXt0Fvh3etMnOkT6gBKmnkJQ56LkNGw2k5wE73yunRH9al+NGwGWKgl
	 5JnZVjCA6U4TW33YSQS0w94jWQQ34OMiqt4Z1uq5KGu4CVSHnyESY+C4N+WPeNGvQI
	 GIMQEQIVEhudw==
Date: Sun, 3 Dec 2023 14:37:33 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Elad Nachman <enachman@marvell.com>
Cc: gregory.clement@bootlin.com, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, cyuval@marvell.com
Subject: Re: [PATCH] i2c: busses: i2c-mv64xxx: fix arb-loss i2c lock
Message-ID: <20231203133733.eatne2i6eycbiomi@zenone.zhora.eu>
References: <20231130162522.3306136-1-enachman@marvell.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130162522.3306136-1-enachman@marvell.com>

Hi Elad,

On Thu, Nov 30, 2023 at 06:25:22PM +0200, Elad Nachman wrote:
> From: Elad Nachman <enachman@marvell.com>
> 
> Some i2c slaves, mainly SFPs, might cause the bus to lose arbitration
> while slave is in the middle of responding.

Can you be more specific about how this is happening?

> The solution is to change the I2C mode from mpps to gpios, and toggle
> the i2c_scl gpio to emulate bus clock toggling, so slave will finish
> its transmission, driven by the manual clock toggling, and will release
> the i2c bus.
> 
> Signed-off-by: Elad Nachman <enachman@marvell.com>
> ---
>  drivers/i2c/busses/i2c-mv64xxx.c | 81 ++++++++++++++++++++++++++++++++
>  1 file changed, 81 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mv64xxx.c b/drivers/i2c/busses/i2c-mv64xxx.c
> index dc160cbc3155..21715f31dc29 100644
> --- a/drivers/i2c/busses/i2c-mv64xxx.c
> +++ b/drivers/i2c/busses/i2c-mv64xxx.c
> @@ -26,6 +26,7 @@
>  #include <linux/clk.h>
>  #include <linux/err.h>
>  #include <linux/delay.h>
> +#include <linux/of_gpio.h>
>  
>  #define MV64XXX_I2C_ADDR_ADDR(val)			((val & 0x7f) << 1)
>  #define MV64XXX_I2C_BAUD_DIV_N(val)			(val & 0x7)
> @@ -104,6 +105,7 @@ enum {
>  	MV64XXX_I2C_ACTION_RCV_DATA,
>  	MV64XXX_I2C_ACTION_RCV_DATA_STOP,
>  	MV64XXX_I2C_ACTION_SEND_STOP,
> +	MV64XXX_I2C_ACTION_UNLOCK_BUS
>  };
>  
>  struct mv64xxx_i2c_regs {
> @@ -150,6 +152,11 @@ struct mv64xxx_i2c_data {
>  	bool			clk_n_base_0;
>  	struct i2c_bus_recovery_info	rinfo;
>  	bool			atomic;
> +	/* I2C mpp states & gpios needed for arbitration lost recovery */
> +	int			scl_gpio, sda_gpio;
> +	bool			arb_lost_recovery_ena;

mmhhh... this name here looks quite ugly, something like
"soft_reset" or "clock_stretch"?

> +	struct pinctrl_state *i2c_mpp_state;
> +	struct pinctrl_state *i2c_gpio_state;
>  };
>  
>  static struct mv64xxx_i2c_regs mv64xxx_i2c_regs_mv64xxx = {
> @@ -318,6 +325,11 @@ mv64xxx_i2c_fsm(struct mv64xxx_i2c_data *drv_data, u32 status)
>  		drv_data->state = MV64XXX_I2C_STATE_IDLE;
>  		break;
>  
> +	case MV64XXX_I2C_STATUS_MAST_LOST_ARB: /*0x38*/

Please, leave a space between the comments: /* 0x38 */

> +		drv_data->action = MV64XXX_I2C_ACTION_UNLOCK_BUS;
> +		drv_data->state = MV64XXX_I2C_STATE_IDLE;
> +		break;
> +
>  	case MV64XXX_I2C_STATUS_MAST_WR_ADDR_NO_ACK: /* 0x20 */
>  	case MV64XXX_I2C_STATUS_MAST_WR_NO_ACK: /* 30 */
>  	case MV64XXX_I2C_STATUS_MAST_RD_ADDR_NO_ACK: /* 48 */
> @@ -356,6 +368,9 @@ static void mv64xxx_i2c_send_start(struct mv64xxx_i2c_data *drv_data)
>  static void
>  mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>  {
> +	struct pinctrl *pc;
> +	int i, ret;
> +
>  	switch(drv_data->action) {
>  	case MV64XXX_I2C_ACTION_SEND_RESTART:
>  		/* We should only get here if we have further messages */
> @@ -409,6 +424,48 @@ mv64xxx_i2c_do_action(struct mv64xxx_i2c_data *drv_data)
>  			drv_data->reg_base + drv_data->reg_offsets.control);
>  		break;
>  
> +	case MV64XXX_I2C_ACTION_UNLOCK_BUS:
> +

for consistency, don't add a blank line here.

> +		if (!drv_data->arb_lost_recovery_ena)
> +			break;
> +
> +		pc = devm_pinctrl_get(drv_data->adapter.dev.parent);
> +		if (IS_ERR(pc))
> +			break;

I would add here some error message

> +
> +		/* Change i2c MPPs state to act as GPIOs: */
> +		if (pinctrl_select_state(pc, drv_data->i2c_gpio_state) >= 0) {
> +			ret = devm_gpio_request_one(drv_data->adapter.dev.parent,
> +					 drv_data->scl_gpio, GPIOF_DIR_OUT, NULL);
> +			ret |= devm_gpio_request_one(drv_data->adapter.dev.parent,
> +					 drv_data->sda_gpio, GPIOF_DIR_OUT, NULL);

mmhhh... these are requested everytime we do an UNLOCK_BUS and
freed only when the driver exits.

Why don't you request them in the probe()?

> +			if (!ret) {
> +				/* Toggle i2c scl (serial clock) 10 times.
> +				 * This allows the slave that occupies
> +				 * the bus to transmit its remaining data,
> +				 * so it can release the i2c bus:
> +				 */

The proper commenting style is:

	/*
	 * Toggle i2c scl (serial clock) 10 times.
	 * This allows the slave that occupies
	 * the bus to transmit its remaining data,
	 * so it can release the i2c bus:
	 */

Why 10 times? What is the requested time?

> +				for (i = 0; i < 10; i++) {
> +					gpio_set_value(drv_data->scl_gpio, 1);
> +					mdelay(1);

Please, no mdelay!

> +					gpio_set_value(drv_data->scl_gpio, 0);
> +				};
> +
> +				devm_gpiod_put(drv_data->adapter.dev.parent,
> +					gpio_to_desc(drv_data->scl_gpio));
> +				devm_gpiod_put(drv_data->adapter.dev.parent,
> +					gpio_to_desc(drv_data->sda_gpio));
> +			}
> +
> +			/* restore i2c pin state to MPPs: */
> +			pinctrl_select_state(pc, drv_data->i2c_mpp_state);
> +		}
> +
> +		/* Trigger controller soft reset: */
> +		writel(0x1, drv_data->reg_base + drv_data->reg_offsets.soft_reset);

0x1 stands for... ?

> +		mdelay(1);

Please, no mdelay and if there is a need to wait explain it in a
comment.

I need a very strong reason for using mdelay() at this point.

> +		fallthrough;

What is the rationale behind this fallthrough? Are we moving to
get a data stop later on?

> +
>  	case MV64XXX_I2C_ACTION_RCV_DATA_STOP:
>  		drv_data->msg->buf[drv_data->byte_posn++] =
>  			readl(drv_data->reg_base + drv_data->reg_offsets.data);
> @@ -985,6 +1042,7 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  {
>  	struct mv64xxx_i2c_data		*drv_data;
>  	struct mv64xxx_i2c_pdata	*pdata = dev_get_platdata(&pd->dev);
> +	struct pinctrl *pc;
>  	int	rc;
>  
>  	if ((!pdata && !pd->dev.of_node))
> @@ -1040,6 +1098,29 @@ mv64xxx_i2c_probe(struct platform_device *pd)
>  	if (rc == -EPROBE_DEFER)
>  		return rc;
>  
> +	drv_data->arb_lost_recovery_ena = false;
> +	pc = devm_pinctrl_get(&pd->dev);
> +	if (!IS_ERR(pc)) {

Is this optional? Please consider using
"i2c-scl-clk-low-timeout-us" in the devicetree.

Andi

