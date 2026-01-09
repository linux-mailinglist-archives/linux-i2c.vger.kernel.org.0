Return-Path: <linux-i2c+bounces-15008-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E95ED0A83A
	for <lists+linux-i2c@lfdr.de>; Fri, 09 Jan 2026 14:56:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 30930303D140
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Jan 2026 13:53:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A302035C1BB;
	Fri,  9 Jan 2026 13:53:21 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B944642A80
	for <linux-i2c@vger.kernel.org>; Fri,  9 Jan 2026 13:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767966801; cv=none; b=tTX73NWjBBeQYe7MQWuKYxRWXoDFbr5vx8ToubXOdt/LGjL/c07Fz/RYJ8cumRl4RHu0sKFJ3+xxCrDl2EKXmmWYDXGUqCFTbX+0Eqx2feDJlf85RbwRncGL7EURlQET6rVt6w8cbJB02a5B3UgkBpDFyKWpk+6SdDgrMakfreU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767966801; c=relaxed/simple;
	bh=x2RwCfE8caCZakfV3n0gfY1hLe3bFpg//16nsvYQEqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwRPog/y9LIWHSQRicoNE03J/rucijGgAmg+K3pvZj1L/oj7HwNbxbKYIM9MUgdlqJVwAA6eOvLIun4kKJwXLZ38eMVBRHOi0NqZCh5/PclQx1YCslMx3F4d6cME+SER6lXW8B1UpOHCDIHFDd0HGKtb1LZJvcyn2D8i3Bo3dDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvM-0002aa-F0; Fri, 09 Jan 2026 14:53:08 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvL-009r4F-2k;
	Fri, 09 Jan 2026 14:53:07 +0100
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1veCvL-002G7w-2I;
	Fri, 09 Jan 2026 14:53:07 +0100
Date: Fri, 9 Jan 2026 14:53:07 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: kernel@pengutronix.de, andi.shyti@kernel.org, shawnguo@kernel.org,
	s.hauer@pengutronix.de, festevam@gmail.com,
	linux-i2c@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aWEIQ2X9nWbuJpeH@pengutronix.de>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

Hi,

On Mon, Dec 29, 2025 at 08:16:29AM +0000, LI Qingwu wrote:
> SMBus block read transfers encode the payload length in the first data
> byte. When this first byte is zero, there is no payload and the
> transaction should terminate immediately.
> 
> On i.MX, if the first byte of an SMBus block read is zero, the driver
> unconditionally overwrites the state with IMX_I2C_STATE_READ_CONTINUE.
> This causes the state machine to enter an endless read loop, eventually
> overrunning internal buffers and leading to a crash.
> 
> At the same time, the controller remains in master receive mode and
> never generates a proper STOP condition, leaving the I2C bus permanently
> busy and preventing any further transfers on the bus.
> 
> Fix this by handling the zero-length case explicitly: when the first
> byte is zero, ensure that a clean STOP is generated. In this situation
> the controller is in master receive mode, so it must be switched to
> master transmit mode before stopping. This is done by draining the
> pending received byte from I2DR, setting I2CR_MTX to enter transmit
> mode, waiting briefly for the mode change, and then proceeding with the
> normal STOP sequence.
> 
> This change has been tested on i.MX 8M Plus platform.
> 
> Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>

Sorry for delay and thank you for your work.

> ---
>  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-imx.c b/drivers/i2c/busses/i2c-imx.c
> index dcce882f3eba..f40deecf0f66 100644
> --- a/drivers/i2c/busses/i2c-imx.c
> +++ b/drivers/i2c/busses/i2c-imx.c
> @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct *i2c_imx, bool atomic)
>  		temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
>  		if (!(temp & I2CR_MSTA))
>  			i2c_imx->stopped = 1;

I would love to have more comments, so I'll add some. Otherwise it is hard
to recall everything needed with my cold cache :)

        /*
         * Condition: We are in Master Mode (MSTA=1) AND Receive Mode (MTX=0).
         *
         * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.3 I2Cx_I2CR:
         * - Bit 5 (MSTA): 1 = Master Mode.
         * - Bit 4 (MTX):  0 = Receive.
         */

> +		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {

            /*
             * Dummy read of I2C Data Register (I2DR).
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.5 I2C Data I/O Register (I2Cx_I2DR):
             * "Reading the data register... initiates the next byte to be received."
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.4 I2C Status Register (I2Cx_I2SR) -> ICF (Bit 7):
             * "The data transferring bit (ICF) is cleared... by reading from I2C_I2DR in Receive mode."
             *
             * This dummy read is essential to clear the 'Transfer Complete' (ICF)
             * flag and release the SCL line if the hardware
             * was stretching the clock waiting for a read.
             */


> +			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);

            /*
             * Force the controller into Master Transmit Mode (MTX=1).
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.3 I2Cx_I2CR -> MTX (Bit 4):
             * "1 = Transmit"
             *
             * We cannot safely STOP while waiting for data (RX). By switching to TX,
             * the Master asserts control over SDA to generate the STOP condition
             * without the ambiguity of an expected incoming byte.
             */
> +			temp |= I2CR_MTX;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);

            /*
             * Wait for the mode switch to settle.
             *
             * Ref: IMX8MPRM Rev. 1, 06/2021: 17.1.6.4 Note on Timeout:
             * "The minimum timeout... is 25 us".
             *
             * The state machine needs time to latch the new mode (TX) before
             * we immediately command it to STOP. 25us is the documented safe lower bound
             * for I2C bus event processing at 400kHz.
             * T_min = 10/F_SCL
             * T_min = 10 / 400000 Hz = 0,00002 Sec
             */

             I would recommend here to calculate delay based on current clock,
             probably i2c_imx->cur_clk is the right variable.
             May be i2c_imx->disable_delay should be used? Cirrently it is used only
             for imx1.

             I'm still not sure about impact of this delay withing this context.

> +			if (atomic)
> +				udelay(25);
> +			else
> +				usleep_range(25, 50);

            /*
             * Read back the control register to ensure the write persisted and
             * to have the freshest state for the final STOP command?
             */

> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> +		}
>  		temp &= ~(I2CR_MSTA | I2CR_MTX);
>  		if (i2c_imx->dma)
>  			temp &= ~I2CR_DMAEN;
> @@ -1103,7 +1113,8 @@ static irqreturn_t i2c_imx_master_isr(struct imx_i2c_struct *i2c_imx, unsigned i
>  
>  	case IMX_I2C_STATE_READ_BLOCK_DATA_LEN:
>  		i2c_imx_isr_read_block_data_len(i2c_imx);
> -		i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;

I ques, this part can go as separate directly upstream to the stable.

> +		if (i2c_imx->state == IMX_I2C_STATE_READ_BLOCK_DATA_LEN)
> +			i2c_imx->state = IMX_I2C_STATE_READ_CONTINUE;
>  		break;
>  
>  	case IMX_I2C_STATE_WRITE:
> -- 
> 2.43.0
> 
> 

Best Regards,
Oleksij
-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

