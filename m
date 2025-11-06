Return-Path: <linux-i2c+bounces-13995-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE5EC3B70F
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 14:50:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 3B8804FA0E2
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 13:45:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB54930E83C;
	Thu,  6 Nov 2025 13:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEK1O99U"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535C346FA9;
	Thu,  6 Nov 2025 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762436333; cv=none; b=YXkIs2Xd8/O0MnxpJt3iMF2N6/HBW7mMjFZzQFNRbRgHj3ulqvg2RDf6BuOp6IW6m7TWmyUJkip1UMuwJn9US28tVW0HgOUTDBE/ZCdMt7t5P4CCOC0SsZfwzlEupfFIycv7DzMo/4GKj7ojm7CUj92iwuNDC6TIhrAPhKKJSXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762436333; c=relaxed/simple;
	bh=PUbGlGve1OY97wLizHOn9zCbOJdRe7DMrLqxKa0Ve94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KACtr0x43tUm6TthvCi5lZ1zaL2i3SiLxSGcDEYuJ+rPT6sDqufJmqr2HZqRO+P6zMsGrfIa1TErkKp+Kyk9XYzZt+oKQ2LGjo73i5q+NXl+kcQw7WEI8S+du6PPT/wPnVkxd2bxbdpbUoUCURwJFA9RpSpSSdW6dUYTydAF3kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEK1O99U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1262C4AF09;
	Thu,  6 Nov 2025 13:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762436332;
	bh=PUbGlGve1OY97wLizHOn9zCbOJdRe7DMrLqxKa0Ve94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IEK1O99UrYtzBgNj3leFq0xzeFnUTs+Wd/5V2vC2h4AAkZkC09mDodC0bs0CNkslV
	 09F8yVn85/8hVzA1OEddy/q77khoj6MGwp0uaRGbCxI9OP8toQiOviKmxq5GaHdNGT
	 cj59IXeNwpvmMx+uhaGk4/jfQnXiYsio+9pC3/VSqd/rJUfdyLjG2T/HBSF2yByFY+
	 YZ4wPKCMKna2oQdPlwOrWAuDaW6EMB789JPavli82X5zkgAdB9GjLtfCpvaumHv0Yf
	 LOjnk3AN0BxNrhLSkZMpTLxrIVqCAZQEbGzSVThgvGjzsIroJFozMtllAoYjtdWvji
	 Uk0SFBzGVxNFQ==
Date: Thu, 6 Nov 2025 13:38:48 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 2/4] mfd: tqmx86: refactor I2C setup
Message-ID: <20251106133848.GL8064@google.com>
References: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
 <999718e052b5e600813cefc3ec19ba3028afa034.1761123080.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <999718e052b5e600813cefc3ec19ba3028afa034.1761123080.git.matthias.schiffer@ew.tq-group.com>

On Wed, 22 Oct 2025, Matthias Schiffer wrote:

> Preparation for supporting the second I2C controller, and detecting both
> ocores and machxo2 controllers.
> 
> - Avoid the confusing "soft" I2C controller term - just call it the
>   ocores I2C
> - All non-const parts of the MFD cell are moved from global variables
>   into new functions tqmx86_setup_i2c_ocores() and tqmx86_setup_i2c()
> - Define TQMX86_REG_I2C_DETECT relative to I2C base register
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes
> v3: no changes
> 
>  drivers/mfd/tqmx86.c | 130 ++++++++++++++++++++++++-------------------
>  1 file changed, 74 insertions(+), 56 deletions(-)
> 
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 1cba3b67b0fb9..3c6f158bf1a45 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c
> @@ -18,7 +18,7 @@
>  
>  #define TQMX86_IOBASE	0x180
>  #define TQMX86_IOSIZE	0x20
> -#define TQMX86_IOBASE_I2C	0x1a0
> +#define TQMX86_IOBASE_I2C1	0x1a0
>  #define TQMX86_IOSIZE_I2C	0xa
>  #define TQMX86_IOBASE_WATCHDOG	0x18b
>  #define TQMX86_IOSIZE_WATCHDOG	0x2
> @@ -54,8 +54,8 @@
>  #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
>  #define TQMX86_REG_SAUC		0x17
>  
> -#define TQMX86_REG_I2C_DETECT	0x1a7
> -#define TQMX86_REG_I2C_DETECT_SOFT		0xa5
> +#define TQMX86_REG_I2C_DETECT	0x7
> +#define TQMX86_REG_I2C_DETECT_OCORES	0xa5
>  
>  static uint gpio_irq;
>  module_param(gpio_irq, uint, 0);
> @@ -65,17 +65,6 @@ static uint i2c1_irq;
>  module_param(i2c1_irq, uint, 0);
>  MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 12)");
>  
> -enum tqmx86_i2c1_resource_type {
> -	TQMX86_I2C1_IO,
> -	TQMX86_I2C1_IRQ,
> -};
> -
> -static struct resource tqmx_i2c_soft_resources[] = {
> -	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I2C),
> -	/* Placeholder for IRQ resource */
> -	[TQMX86_I2C1_IRQ] = {},
> -};
> -
>  static const struct resource tqmx_watchdog_resources[] = {
>  	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
>  };
> @@ -91,28 +80,13 @@ static struct resource tqmx_gpio_resources[] = {
>  	[TQMX86_GPIO_IRQ] = {},
>  };
>  
> -static struct i2c_board_info tqmx86_i2c_devices[] = {
> +static const struct i2c_board_info tqmx86_i2c1_devices[] = {
>  	{
>  		/* 4K EEPROM at 0x50 */
>  		I2C_BOARD_INFO("24c32", 0x50),
>  	},
>  };
>  
> -static struct ocores_i2c_platform_data ocores_platform_data = {
> -	.num_devices = ARRAY_SIZE(tqmx86_i2c_devices),
> -	.devices = tqmx86_i2c_devices,
> -};
> -
> -static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
> -	{
> -		.name = "ocores-i2c",
> -		.platform_data = &ocores_platform_data,
> -		.pdata_size = sizeof(ocores_platform_data),
> -		.resources = tqmx_i2c_soft_resources,
> -		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
> -	},
> -};
> -
>  static const struct mfd_cell tqmx86_devs[] = {
>  	{
>  		.name = "tqmx86-wdt",
> @@ -238,13 +212,74 @@ static int tqmx86_setup_irq(struct device *dev, const char *label, u8 irq,
>  	return 0;
>  }
>  
> +static int tqmx86_setup_i2c(struct device *dev, const char *name,
> +			    unsigned long i2c_base, const void *platform_data,
> +			    size_t pdata_size, u8 irq)
> +{
> +	const struct resource resources[] = {
> +		DEFINE_RES_IO(i2c_base, TQMX86_IOSIZE_I2C),
> +		irq ? DEFINE_RES_IRQ(irq) : (struct resource) {},
> +	};
> +	const struct mfd_cell i2c_dev = {
> +		.name = name,
> +		.platform_data = platform_data,
> +		.pdata_size = pdata_size,
> +		.resources = resources,
> +		.num_resources = ARRAY_SIZE(resources),
> +	};

No, please don't do it this way.

Keep as much information as you can in easy to read, easy to reference,
easy to find, easy to follow, etc static data.  If you have to add a
couple more static structs above, sobeit, but all of this parameter
passing through abstracted functions is a regression in readability and
maintainability IMHO.

> +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, &i2c_dev, 1,
> +				    NULL, 0, NULL);
> +
> +}
> +
> +static int tqmx86_setup_i2c_ocores(struct device *dev, const char *label,
> +				   unsigned long i2c_base, int clock_khz, u8 irq,
> +				   const struct i2c_board_info *devices,
> +				   size_t num_devices)
> +{
> +	const struct ocores_i2c_platform_data platform_data = {
> +		.clock_khz = clock_khz,
> +		.num_devices = num_devices,
> +		.devices = devices,
> +	};
> +
> +	return tqmx86_setup_i2c(dev, "ocores-i2c", i2c_base, &platform_data,
> +				sizeof(platform_data), irq);
> +}
> +
> +static int tqmx86_detect_i2c(struct device *dev, const char *label,
> +			     unsigned long i2c_base, int clock_khz, u8 irq,
> +			     const struct i2c_board_info *devices,
> +			     size_t num_devices, void __iomem *io_base,
> +			     u8 irq_reg_shift)
> +{
> +	u8 i2c_det;
> +
> +	if (tqmx86_setup_irq(dev, label, irq, io_base, irq_reg_shift))
> +		irq = 0;
> +
> +	/*
> +	 * The I2C_DETECT register is in the range assigned to the I2C driver
> +	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
> +	 * access instead of ioport_map + unmap.
> +	 */
> +	i2c_det = inb(i2c_base + TQMX86_REG_I2C_DETECT);
> +
> +	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES)
> +		return tqmx86_setup_i2c_ocores(dev, label, i2c_base, clock_khz,
> +					       irq, devices, num_devices);
> +
> +	return 0;
> +}
> +
>  static int tqmx86_probe(struct platform_device *pdev)
>  {
> -	u8 board_id, sauc, rev, i2c_det;
> +	u8 board_id, sauc, rev;
>  	struct device *dev = &pdev->dev;
>  	const char *board_name;
>  	void __iomem *io_base;
> -	int err;
> +	int err, clock_khz;
>  
>  	io_base = devm_ioport_map(dev, TQMX86_IOBASE, TQMX86_IOSIZE);
>  	if (!io_base)
> @@ -259,13 +294,6 @@ static int tqmx86_probe(struct platform_device *pdev)
>  		 "Found %s - Board ID %d, PCB Revision %d, PLD Revision %d\n",
>  		 board_name, board_id, rev >> 4, rev & 0xf);
>  
> -	/*
> -	 * The I2C_DETECT register is in the range assigned to the I2C driver
> -	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
> -	 * access instead of ioport_map + unmap.
> -	 */
> -	i2c_det = inb(TQMX86_REG_I2C_DETECT);
> -
>  	if (gpio_irq) {
>  		err = tqmx86_setup_irq(dev, "GPIO", gpio_irq, io_base,
>  				       TQMX86_REG_IO_EXT_INT_GPIO_SHIFT);
> @@ -273,23 +301,13 @@ static int tqmx86_probe(struct platform_device *pdev)
>  			tqmx_gpio_resources[TQMX86_GPIO_IRQ] = DEFINE_RES_IRQ(gpio_irq);
>  	}
>  
> -	ocores_platform_data.clock_khz = tqmx86_board_id_to_clk_rate(dev, board_id);
> -
> -	if (i2c_det == TQMX86_REG_I2C_DETECT_SOFT) {
> -		if (i2c1_irq) {
> -			err = tqmx86_setup_irq(dev, "I2C1", i2c1_irq, io_base,
> -					       TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
> -			if (!err)
> -				tqmx_i2c_soft_resources[TQMX86_I2C1_IRQ] = DEFINE_RES_IRQ(i2c1_irq);
> -		}
> -
> -		err = devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> -					   tqmx86_i2c_soft_dev,
> -					   ARRAY_SIZE(tqmx86_i2c_soft_dev),
> -					   NULL, 0, NULL);
> -		if (err)
> -			return err;
> -	}
> +	clock_khz = tqmx86_board_id_to_clk_rate(dev, board_id);
> +
> +	err = tqmx86_detect_i2c(dev, "I2C1", TQMX86_IOBASE_I2C1, clock_khz, i2c1_irq,
> +				tqmx86_i2c1_devices, ARRAY_SIZE(tqmx86_i2c1_devices),
> +				io_base, TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
> +	if (err)
> +		return err;
>  
>  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>  				    tqmx86_devs,
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/

-- 
Lee Jones [李琼斯]

