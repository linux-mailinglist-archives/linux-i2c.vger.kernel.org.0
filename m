Return-Path: <linux-i2c+bounces-15000-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 87356D0299B
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 13:24:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5D5923098DF3
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 12:21:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1B763B8D6D;
	Thu,  8 Jan 2026 11:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mlCHr1JE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66BB52F90DB;
	Thu,  8 Jan 2026 11:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873158; cv=none; b=OUzFGz9W8SQat4pLlVbbQvUkRCQX2/jPZa3K2J6vzD7QRbgZrH8rDY5icehzxzFwe1hH/Znmk2eSCK8VNmYkLAjjxTutzInRioLYfRk2lH4UtM0YqCfVnKDH+aVuw8v9y9T81PjV4AGts7AiQc51OFzheyMrmasGuo+6oNvz1HU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873158; c=relaxed/simple;
	bh=8QoSYkVLBwroXnzarKjIhE7rb8wWzPH85WnNXrC+EKA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UbObsxkvWdWOcqBxLGBKBtQIofEJbLS8qUWxhHmgAHAajbNSMtYzblBTZJ9okA7ROuV6OF/qvXmVYy4Qc8tzIijQfUXWA0Rce/vDpc19yzcSbNONEaOn2rUyf37fhozT8kQWQi4gJGh0W4g5tC0vADlsd1BEV7etII4f13vie6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mlCHr1JE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B86A6C116C6;
	Thu,  8 Jan 2026 11:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873158;
	bh=8QoSYkVLBwroXnzarKjIhE7rb8wWzPH85WnNXrC+EKA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mlCHr1JEzc4YAPOnkVb7FYQsWA+xTYvRrr6y9sDrBjWcLZuQtZxL9s6fNwo2sflX0
	 FM06SHGjublj29giBFmbzmupU24SC2VjUlX3+SKZxDGsYQgljY3UzW356FTQheM5fF
	 HCHqb/P5KqLsDnxNO9DeTYEiQyAmNHZgj+Ia0GnwHgpucGtBKg/SP7BQUofNaU1+/0
	 MLsZP15Xuxv9dJnKMFndfaykUsWTfVCTIvsV8rfMr5forcYtqiLZluMhso5r7fZ+An
	 6XNx2gRPTXNtLhP2AxKn5mSf0Gmp/+1Ia34hfYbbnnPyAqYwupc7EqPniiOYiikaKp
	 69lCzqUcf+TSw==
Date: Thu, 8 Jan 2026 11:52:33 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v4 2/4] mfd: tqmx86: refactor I2C setup
Message-ID: <20260108115233.GE302752@google.com>
References: <128cfc422f60d674f5ced8e8350b794945c8fa59.1765373900.git.matthias.schiffer@ew.tq-group.com>
 <10b68f0c46a68d9b946d6cedfacb5a9efb476e37.1765373900.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10b68f0c46a68d9b946d6cedfacb5a9efb476e37.1765373900.git.matthias.schiffer@ew.tq-group.com>

On Wed, 10 Dec 2025, Matthias Schiffer wrote:

> Preparation for supporting the second I2C controller, and detecting both
> ocores and machxo2 controllers.
> 
> - Introduce tqmx86_detect_i2c1()
> - Avoid the confusing "soft" I2C controller term - just call it the
>   ocores I2C
> - Define TQMX86_REG_I2C_DETECT relative to I2C base register
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes
> 
> v3: no changes
> 
> v4:
> - Keep resource and mfd_cell definitions at the toplevel
> - The very generic tqmx86_detect_i2c() of the previous version is replaced with
>   tqmx86_detect_i2c1(), so we don't need to pass so many arguments around
> 
>  drivers/mfd/tqmx86.c | 92 +++++++++++++++++++++++---------------------
>  1 file changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 1c2fe3f912389..6d304741f8989 100644
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
> @@ -56,8 +56,8 @@
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
> @@ -72,8 +72,8 @@ enum tqmx86_i2c1_resource_type {
>  	TQMX86_I2C1_IRQ,
>  };
>  
> -static struct resource tqmx_i2c_soft_resources[] = {
> -	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I2C),
> +static struct resource tqmx_i2c1_resources[] = {
> +	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C1, TQMX86_IOSIZE_I2C),
>  	/* Placeholder for IRQ resource */
>  	[TQMX86_I2C1_IRQ] = {},
>  };
> @@ -93,26 +93,24 @@ static struct resource tqmx_gpio_resources[] = {
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
> +static struct ocores_i2c_platform_data tqmx86_i2c1_platform_data_ocores = {
> +	.num_devices = ARRAY_SIZE(tqmx86_i2c1_devices),
> +	.devices = tqmx86_i2c1_devices,
>  };
>  
> -static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
> -	{
> -		.name = "ocores-i2c",
> -		.platform_data = &ocores_platform_data,
> -		.pdata_size = sizeof(ocores_platform_data),
> -		.resources = tqmx_i2c_soft_resources,
> -		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
> -	},
> +static const struct mfd_cell tqmx86_i2c1_dev_ocores = {
> +	.name = "ocores-i2c",
> +	.platform_data = &tqmx86_i2c1_platform_data_ocores,
> +	.pdata_size = sizeof(tqmx86_i2c1_platform_data_ocores),
> +	.resources = tqmx_i2c1_resources,
> +	.num_resources = ARRAY_SIZE(tqmx_i2c1_resources),
>  };
>  
>  static const struct mfd_cell tqmx86_devs[] = {
> @@ -246,13 +244,40 @@ static int tqmx86_setup_irq(struct device *dev, const char *label, u8 irq,
>  	return 0;
>  }
>  
> +static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clock_khz)
> +{
> +	u8 i2c_det;
> +
> +	if (i2c1_irq) {
> +		if (!tqmx86_setup_irq(dev, "I2C1", i2c1_irq, io_base,

It was better before.

Please place the return value into a local variable and compare that.

Function calls inside if () statements hurts readability.

> +				      TQMX86_REG_IO_EXT_INT_I2C1_SHIFT))
> +			tqmx_i2c1_resources[TQMX86_I2C1_IRQ] = DEFINE_RES_IRQ(i2c1_irq);
> +	}
> +
> +	/*
> +	 * The I2C_DETECT register is in the range assigned to the I2C driver
> +	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
> +	 * access instead of ioport_map + unmap.
> +	 */
> +	i2c_det = inb(TQMX86_IOBASE_I2C1 + TQMX86_REG_I2C_DETECT);
> +
> +	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES) {

Reverse the logic and return early instead.

> +		tqmx86_i2c1_platform_data_ocores.clock_khz = clock_khz;
> +		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +					    &tqmx86_i2c1_dev_ocores, 1, NULL, 0,
> +					    NULL);
> +	}
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
> @@ -267,13 +292,6 @@ static int tqmx86_probe(struct platform_device *pdev)
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
> @@ -281,23 +299,11 @@ static int tqmx86_probe(struct platform_device *pdev)
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

Move this into the new functions and only call it if required.

> +
> +	err = tqmx86_detect_i2c1(dev, io_base, clock_khz);
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
> 

-- 
Lee Jones [李琼斯]

