Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214B029FDB8
	for <lists+linux-i2c@lfdr.de>; Fri, 30 Oct 2020 07:15:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725815AbgJ3GPD convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-i2c@lfdr.de>); Fri, 30 Oct 2020 02:15:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725779AbgJ3GPD (ORCPT
        <rfc822;linux-i2c@vger.kernel.org>); Fri, 30 Oct 2020 02:15:03 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A492C0613D2
        for <linux-i2c@vger.kernel.org>; Thu, 29 Oct 2020 23:15:03 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ore@pengutronix.de>)
        id 1kYNgd-0007X0-8s; Fri, 30 Oct 2020 07:14:55 +0100
Received: from ore by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ore@pengutronix.de>)
        id 1kYNgb-0003A7-1c; Fri, 30 Oct 2020 07:14:53 +0100
Date:   Fri, 30 Oct 2020 07:14:52 +0100
From:   Oleksij Rempel <o.rempel@pengutronix.de>
To:     Biwen Li <biwen.li@oss.nxp.com>
Cc:     leoyang.li@nxp.com, linux@rempel-privat.de, kernel@pengutronix.de,
        wsa@the-dreams.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
        festevam@gmail.com, aisheng.dong@nxp.com, xiaoning.wang@nxp.com,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        jiafei.pan@nxp.com, xiaobo.xie@nxp.com,
        linux-arm-kernel@lists.infradead.org, Biwen Li <biwen.li@nxp.com>
Subject: Re: [v8] i2c: imx: support slave mode for imx I2C driver
Message-ID: <20201030061452.ledc3ayd5dvdhhzo@pengutronix.de>
References: <20201026100514.6760-1-biwen.li@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8BIT
In-Reply-To: <20201026100514.6760-1-biwen.li@oss.nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL:  http://www.pengutronix.de/
X-IRC:  #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 07:08:13 up 349 days, 21:26, 367 users,  load average: 0.12, 0.09,
 0.08
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org

Hi

On Mon, Oct 26, 2020 at 06:05:14PM +0800, Biwen Li wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> The patch supports slave mode for imx I2C driver
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v8:
> 	- fix build issue
> 
> Change in v7:
> 	- support auto switch mode between master and slave
> 	- enable interrupt when idle in slave mode
> 	- remove #ifdef
> 
> Change in v6:
> 	- delete robust logs and comments
> 	- not read status register again in master isr.
> 
> Change in v5:
> 	- fix a bug that cannot determine in what mode(master mode or
> 	  slave mode)
> 
> Change in v4:
> 	- add MACRO CONFIG_I2C_SLAVE to fix compilation issue
> 
> Change in v3:
> 	- support layerscape and i.mx platform
> 
> Change in v2:
> 	- remove MACRO CONFIG_I2C_SLAVE
> 
> 
>  drivers/i2c/busses/i2c-imx.c | 227 ++++++++++++++++++++++++++++++++---
>  1 file changed, 213 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index 0ab5381aa012..9721ef8649ad 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -17,6 +17,7 @@
>   *	Copyright (C) 2008 Darius Augulis <darius.augulis at teltonika.lt>
>   *
>   *	Copyright 2013 Freescale Semiconductor, Inc.
> + *	Copyright 2020 NXP
>   *
>   */
>  
> @@ -72,6 +73,7 @@
>  #define IMX_I2C_I2CR	0x02	/* i2c control */
>  #define IMX_I2C_I2SR	0x03	/* i2c status */
>  #define IMX_I2C_I2DR	0x04	/* i2c transfer data */
> +#define IMX_I2C_IBIC	0x05    /* i2c transfer data */
>  
>  #define IMX_I2C_REGSHIFT	2
>  #define VF610_I2C_REGSHIFT	0
> @@ -91,6 +93,7 @@
>  #define I2CR_MSTA	0x20
>  #define I2CR_IIEN	0x40
>  #define I2CR_IEN	0x80
> +#define IBIC_BIIE	0x80 // Bus idle interrupt enable
>  
>  /* register bits different operating codes definition:
>   * 1) I2SR: Interrupt flags clear operation differ between SoCs:
> @@ -201,6 +204,7 @@ struct imx_i2c_struct {
>  	struct pinctrl_state *pinctrl_pins_gpio;
>  
>  	struct imx_i2c_dma	*dma;
> +	struct i2c_client	*slave;
>  };
>  
>  static const struct imx_i2c_hwdata imx1_i2c_hwdata = {
> @@ -277,6 +281,14 @@ static inline unsigned char imx_i2c_read_reg(struct imx_i2c_struct *i2c_imx,
>  	return readb(i2c_imx->base + (reg << i2c_imx->hwdata->regshift));
>  }
>  
> +/* Set up i2c controller register and i2c status register to default value. */
> +static void i2c_imx_reset_regs(struct imx_i2c_struct *i2c_imx)
> +{
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> +			i2c_imx, IMX_I2C_I2CR);
> +	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
> +}
> +
>  /* Functions for DMA support */
>  static void i2c_imx_dma_request(struct imx_i2c_struct *i2c_imx,
>  						dma_addr_t phy_addr)
> @@ -614,20 +626,200 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
>  	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
>  }
>  
> +/*
> + * Enable bus idle interrupts
> + * Note: IBIC register will be cleared after disabled i2c module.
> + */
> +static void i2c_imx_enable_bus_idle(struct imx_i2c_struct *i2c_imx)
> +{
> +	unsigned int temp;
> +
> +	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_IBIC);
> +	temp |= IBIC_BIIE;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_IBIC);
> +}
> +
> +static void i2c_imx_clr_if_bit(unsigned int status, struct imx_i2c_struct *i2c_imx)
> +{
> +	status &= ~I2SR_IIF;
> +	status |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
> +}
> +
> +/* Clear arbitration lost bit */
> +static void i2c_imx_clr_al_bit(unsigned int status, struct imx_i2c_struct *i2c_imx)
> +{
> +	status &= ~I2SR_IAL;
> +	status |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IAL);
> +	imx_i2c_write_reg(status, i2c_imx, IMX_I2C_I2SR);
> +}
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)

Last year (to be more precise Date: Fri, 6 Dec 2019 08:38:20 +0100),
Sascha asked you to make I2C_SLAVE support not optional.
In the V7 of this patch you even tried to do so...
Please, patch drivers/i2c/busses/Kconfig
and add "select I2C_SLAVE" to the I2C_IMX node.

> +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
> +				     unsigned int status, unsigned int ctl)
> +{
> +	u8 value;
> +
> +	if (status & I2SR_IAL) { /* Arbitration lost */
> +		i2c_imx_clr_al_bit(status | I2SR_IIF, i2c_imx);
> +	} else if (status & I2SR_IAAS) { /* Addressed as a slave */
> +		if (status & I2SR_SRW) { /* Master wants to read from us*/
> +			dev_dbg(&i2c_imx->adapter.dev, "read requested");
> +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_READ_REQUESTED, &value);
> +
> +			/* Slave transmit */
> +			ctl |= I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +			/* Send data */
> +			imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +		} else { /* Master wants to write to us */
> +			dev_dbg(&i2c_imx->adapter.dev, "write requested");
> +			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_REQUESTED, &value);
> +
> +			/* Slave receive */
> +			ctl &= ~I2CR_MTX;
> +			imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +			/* Dummy read */
> +			imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +		}
> +	} else if (!(ctl & I2CR_MTX)) { /* Receive mode */
> +		if (status & I2SR_IBB) { /* No STOP signal detected */
> +			value = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +			i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_WRITE_RECEIVED, &value);
> +		} else { /* STOP signal is detected */
> +			dev_dbg(&i2c_imx->adapter.dev,
> +				"STOP signal detected");
> +			i2c_slave_event(i2c_imx->slave, I2C_SLAVE_STOP, &value);
> +		}
> +	} else if (!(status & I2SR_RXAK)) { /* Transmit mode received ACK */
> +		ctl |= I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +
> +		i2c_slave_event(i2c_imx->slave,	I2C_SLAVE_READ_PROCESSED, &value);
> +
> +		imx_i2c_write_reg(value, i2c_imx, IMX_I2C_I2DR);
> +	} else { /* Transmit mode received NAK */
> +		ctl &= ~I2CR_MTX;
> +		imx_i2c_write_reg(ctl, i2c_imx, IMX_I2C_I2CR);
> +		imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> +	}
> +
> +	return IRQ_HANDLED;
> +}
> +
> +static int i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
> +{
> +	int temp;
> +
> +	/* Resume */
> +	temp = pm_runtime_get_sync(i2c_imx->adapter.dev.parent);
> +	if (temp < 0) {
> +		dev_err(&i2c_imx->adapter.dev, "failed to resume i2c controller");
> +		return temp;
> +	}
> +
> +	/* Set slave addr. */
> +	imx_i2c_write_reg((i2c_imx->slave->addr << 1), i2c_imx, IMX_I2C_IADR);
> +
> +	i2c_imx_reset_regs(i2c_imx);
> +
> +	/* Enable module */
> +	temp = i2c_imx->hwdata->i2cr_ien_opcode;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	/* Enable interrupt from i2c module */
> +	temp |= I2CR_IIEN;
> +	imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +
> +	i2c_imx_enable_bus_idle(i2c_imx);
> +
> +	/* Wait controller to be stable */
> +	usleep_range(50, 150);
> +
> +	return 0;
> +}
> +
> +static int i2c_imx_reg_slave(struct i2c_client *client)
> +{
> +	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> +		return -EINVAL;
> +
> +	if (i2c_imx->slave)
> +		return -EBUSY;
> +
> +	i2c_imx->slave = client;
> +
> +	ret = i2c_imx_slave_init(i2c_imx);
> +	if (ret < 0)
> +		dev_err(&i2c_imx->adapter.dev, "failed to switch to slave mode");
> +
> +	return ret;
> +}
> +
> +static int i2c_imx_unreg_slave(struct i2c_client *client)
> +{
> +	struct imx_i2c_struct *i2c_imx = i2c_get_adapdata(client->adapter);
> +	int ret;
> +
> +	if (!IS_ENABLED(CONFIG_I2C_SLAVE))
> +		return -EINVAL;
> +
> +	if (!i2c_imx->slave)
> +		return -EINVAL;
> +
> +	/* Reset slave address. */
> +	imx_i2c_write_reg(0, i2c_imx, IMX_I2C_IADR);
> +
> +	i2c_imx_reset_regs(i2c_imx);
> +
> +	i2c_imx->slave = NULL;
> +
> +	/* Suspend */
> +	ret = pm_runtime_put_sync(i2c_imx->adapter.dev.parent);
> +	if (ret < 0)
> +		dev_err(&i2c_imx->adapter.dev, "failed to suspend i2c controller");
> +
> +	return ret;
> +}
> +#else
> +static irqreturn_t i2c_imx_slave_isr(struct imx_i2c_struct *i2c_imx,
> +				     unsigned int status, unsigned int ctl)
> +{
> +
> +}
> +static int i2c_imx_slave_init(struct imx_i2c_struct *i2c_imx)
> +{
> +
> +}
> +#endif
> +
> +static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned int status)
> +{
> +	/* Save status register */
> +	i2c_imx->i2csr = status | I2SR_IIF;
> +	wake_up(&i2c_imx->queue);
> +
> +	return IRQ_HANDLED;
> +}
> +
>  static irqreturn_t i2c_imx_isr(int irq, void *dev_id)
>  {
>  	struct imx_i2c_struct *i2c_imx = dev_id;
> -	unsigned int temp;
> +	unsigned int ctl, status;
>  
> -	temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> -	if (temp & I2SR_IIF) {
> -		/* save status register */
> -		i2c_imx->i2csr = temp;
> -		temp &= ~I2SR_IIF;
> -		temp |= (i2c_imx->hwdata->i2sr_clr_opcode & I2SR_IIF);
> -		imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2SR);
> -		wake_up(&i2c_imx->queue);
> -		return IRQ_HANDLED;
> +	status = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2SR);
> +	ctl = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +
> +	if (status & I2SR_IIF) {
> +		i2c_imx_clr_if_bit(status, i2c_imx);
> +		if (IS_ENABLED(CONFIG_I2C_SLAVE) && i2c_imx->slave && !(ctl & I2CR_MSTA))
> +			return i2c_imx_slave_isr(i2c_imx, status, ctl);
> +
> +		return i2c_imx_master_isr(i2c_imx, status);
>  	}
>  
>  	return IRQ_NONE;
> @@ -999,6 +1191,12 @@ static int i2c_imx_xfer_common(struct i2c_adapter *adapter,
>  	dev_dbg(&i2c_imx->adapter.dev, "<%s> exit with: %s: %d\n", __func__,
>  		(result < 0) ? "error" : "success msg",
>  			(result < 0) ? result : num);
> +	/* After data is transferred, switch to slave mode(as a receiver) */
> +	if (IS_ENABLED(CONFIG_I2C_SLAVE) && i2c_imx->slave) {
> +		if (i2c_imx_slave_init(i2c_imx) < 0)
> +			dev_err(&i2c_imx->adapter.dev, "failed to switch to slave mode");
> +	}
> +
>  	return (result < 0) ? result : num;
>  }
>  
> @@ -1112,6 +1310,10 @@ static const struct i2c_algorithm i2c_imx_algo = {
>  	.master_xfer = i2c_imx_xfer,
>  	.master_xfer_atomic = i2c_imx_xfer_atomic,
>  	.functionality = i2c_imx_func,
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +	.reg_slave	= i2c_imx_reg_slave,
> +	.unreg_slave	= i2c_imx_unreg_slave,
> +#endif
>  };
>  
>  static int i2c_imx_probe(struct platform_device *pdev)
> @@ -1207,10 +1409,7 @@ static int i2c_imx_probe(struct platform_device *pdev)
>  	clk_notifier_register(i2c_imx->clk, &i2c_imx->clk_change_nb);
>  	i2c_imx_set_clk(i2c_imx, clk_get_rate(i2c_imx->clk));
>  
> -	/* Set up chip registers to defaults */
> -	imx_i2c_write_reg(i2c_imx->hwdata->i2cr_ien_opcode ^ I2CR_IEN,
> -			i2c_imx, IMX_I2C_I2CR);
> -	imx_i2c_write_reg(i2c_imx->hwdata->i2sr_clr_opcode, i2c_imx, IMX_I2C_I2SR);
> +	i2c_imx_reset_regs(i2c_imx);
>  
>  	/* Init optional bus recovery function */
>  	ret = i2c_imx_init_recovery_info(i2c_imx, pdev);
> -- 
> 2.17.1
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |
