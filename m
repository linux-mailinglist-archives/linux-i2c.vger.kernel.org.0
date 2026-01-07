Return-Path: <linux-i2c+bounces-14985-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E0898CFFF2F
	for <lists+linux-i2c@lfdr.de>; Wed, 07 Jan 2026 21:13:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5992330042B5
	for <lists+linux-i2c@lfdr.de>; Wed,  7 Jan 2026 20:13:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B66CA3370ED;
	Wed,  7 Jan 2026 20:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEA76Ubp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7827334C3D;
	Wed,  7 Jan 2026 20:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767816810; cv=none; b=DWItzHKHKP1AItOvEEGHJvuCs0v68VGMEYj5elFc0GTEzaX5jioz2lFAs8jN9Cb4DFcGytCHCtVOmnUNZan3ZakRAc9wniBP7V0Z8J6gDkUbc1buvFq7F+lUrCUAeg6A9I9Mljclo+EQ8C3KSoDR1qczlRUAngXo5iZIgr0v3OM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767816810; c=relaxed/simple;
	bh=4PmyOcjuUAuQC00TXSZnc4NpP7+naircmS/+sn6yl+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ut40DUSgI2ue0S8kdPy1Taiez4RkMAb0uFeRVw8coU6YTeKjwqpwACFwSWVgBKIruyA9WNHE7UlE0N1YibKjFsSwpDFAY4/0Fg/Og831BTnKKYavQuinyhQiKALiPfhEwKn5pk5gE2jI+4qWc9wo/UBd2HSfAwkTxGMFVutX/rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEA76Ubp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 75230C4CEF1;
	Wed,  7 Jan 2026 20:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767816809;
	bh=4PmyOcjuUAuQC00TXSZnc4NpP7+naircmS/+sn6yl+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dEA76UbpBU7G8jX+YypizwPSzE8/5gK1vFTwb6Yxm0U+SrDVCUFl/6+32NMSgZZwd
	 j4YAmfJ5uX++anOG7IBfMxkQaX7dNN0GZvr1pzqLHl0nRsI2tmnT7vCl4ag2mbs6AN
	 DlvXhl4uLBVBRIgSCmX7kr9gfLPoKn7rUXz6fzdmpV4TnkLzHYGNZJZg5h3GEU9IcL
	 M3KVZwDvd/8yVZ3Dk68citmHrEZFM6CNhN+/6xIK+fH/DQIFzYp9O8WPpUG30gauUV
	 xsoblF0pYpuHYrsrpJVKTikO9czCRM1q94VbaLsTqpSJvKqv0mJ1SrEvmvgk8BR6IY
	 qwcy1kyG82gQw==
Date: Wed, 7 Jan 2026 21:13:24 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: o.rempel@pengutronix.de, kernel@pengutronix.de, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, festevam@gmail.com, linux-i2c@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>

Hi,

Can anyone from Pengutronix give this patch a look and possibly a
try? Oleksij?

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

Is this a fix?

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
> +		if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> +			(void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);

why do we need a cast here?

> +			temp |= I2CR_MTX;
> +			imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> +			if (atomic)
> +				udelay(25);

where is this 25 coming from?

> +			else
> +				usleep_range(25, 50);
> +			temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);

Thanks,
Andi

