Return-Path: <linux-i2c+bounces-15001-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE72AD040C3
	for <lists+linux-i2c@lfdr.de>; Thu, 08 Jan 2026 16:52:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 01B2434078F9
	for <lists+linux-i2c@lfdr.de>; Thu,  8 Jan 2026 15:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C84E48DA28;
	Thu,  8 Jan 2026 11:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nppWjnvk"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E420A4921B0;
	Thu,  8 Jan 2026 11:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767873354; cv=none; b=o96pjuqXx+QQntW3sH9VawMYkjpVJ3vWWhe/fNKs+uQ+9MtUiqzNVinvQcJFpfyu2C3+nmR4g5ZMUmEH9l1pKT1fXGFyQDVb2c78YbP2mYAvPsYgbo8foukzTYXMpcCD2oEsrNtd7cZszWzYgtoi5mMgwrrfDI+vV5Kp1MhMYT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767873354; c=relaxed/simple;
	bh=9nB/nfR3DAZutm4SMGK5rfxvMsnjiDOGAE6gDz1sBRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKtk8C9NI0weHgpre6Nnu96v/xwK0iINTTwW5c+Taf06EcaRnwE/b+wa8PciZLie6URWV0Krlc3NKDRXjyd4FrtzjoBUoKbRYgphg5yqNqEBSc2GiWBS7KAG8VbopwqzAEF5l9+YTVOQf/ZtnFckDfh9K0K9fIR5uRaNExT5SBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nppWjnvk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64002C116C6;
	Thu,  8 Jan 2026 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767873352;
	bh=9nB/nfR3DAZutm4SMGK5rfxvMsnjiDOGAE6gDz1sBRg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nppWjnvkC6TeG/CqQjpu5P/VXPpNYlYDVqya5i3s2F42HDEYIaa5HTqVnlR0JDi0p
	 tdHaK/vOYYQ+PY54TDbCidSdWE0I4VA3nezaOeLwQnVd6wDF9KspBv/ED+hsO1ZP0y
	 60fiPeQb7HmQqLr/3cxT887YTyHobQH/Y2jQaNqh0M8dpYnViNyvksGoYcx5wpgASf
	 5caJuBOSt5Kodzw0aK2Q+3GgVhPhX7/hTNoqR5CnyVfTnEensO5Q+t2fUHb455jnaK
	 ugqa7zmNOyZE3d2rmS15dR/kyP7kJsVA2Lcnvsl7sOi0jQJWgwoVPlcOcy/J4x30Zf
	 zPZzZHvxxD6xA==
Date: Thu, 8 Jan 2026 11:55:48 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v4 4/4] mfd: tqmx86: add detection for MachXO2 I2C
 controller
Message-ID: <20260108115548.GF302752@google.com>
References: <128cfc422f60d674f5ced8e8350b794945c8fa59.1765373900.git.matthias.schiffer@ew.tq-group.com>
 <8d275757b7544fe81e5cec4a1a5d4524e9b6967b.1765373900.git.matthias.schiffer@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d275757b7544fe81e5cec4a1a5d4524e9b6967b.1765373900.git.matthias.schiffer@ew.tq-group.com>

On Wed, 10 Dec 2025, Matthias Schiffer wrote:

> The TQMx86 PLD may contain two kinds of I2C controllers as its secondary
> instance: the previously supported OpenCores I2C, or the MachXO2 I2C. Add
> support for the latter.
> 
> Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> ---
> 
> v2: no changes
> 
> v3: no changes
> 
> v4:
> - Reorder patch (was 3/4) - the new order makes more sense with the changed (less generic) approach
> - Platform data and mfd_cell are toplevel variables now
> - With the new less generic approach i2c-machxo2 detection is only done for the secondary I2C controller
>   (as the primary one is always i2c-ocores anyways)
> 
> 
>  drivers/mfd/tqmx86.c | 44 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 39 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> index 708b33c3e5724..a4e3ecfccb8ab 100644
> --- a/drivers/mfd/tqmx86.c
> +++ b/drivers/mfd/tqmx86.c
> @@ -13,6 +13,7 @@
>  #include <linux/io.h>
>  #include <linux/mfd/core.h>
>  #include <linux/module.h>
> +#include <linux/platform_data/i2c-machxo2.h>
>  #include <linux/platform_data/i2c-ocores.h>
>  #include <linux/platform_device.h>
>  
> @@ -61,6 +62,8 @@
>  #define TQMX86_REG_I2C_DETECT	0x7
>  #define TQMX86_REG_I2C_DETECT_OCORES	0xa5
>  
> +#define TQMX86_REG_I2C_IEN	0x9
> +
>  static uint gpio_irq;
>  module_param(gpio_irq, uint, 0);
>  MODULE_PARM_DESC(gpio_irq, "GPIO IRQ number (valid parameters: 7, 9, 12)");
> @@ -130,6 +133,8 @@ static const struct mfd_cell tqmx86_i2c1_dev_ocores = {
>  	.num_resources = ARRAY_SIZE(tqmx_i2c1_resources),
>  };
>  
> +/* Only one of the tqmx86_i2c2_* instances is registered, depending on which is detected */
> +
>  static struct ocores_i2c_platform_data tqmx86_i2c2_platform_data_ocores = {};
>  
>  static const struct mfd_cell tqmx86_i2c2_dev_ocores = {
> @@ -140,6 +145,18 @@ static const struct mfd_cell tqmx86_i2c2_dev_ocores = {
>  	.num_resources = ARRAY_SIZE(tqmx_i2c2_resources),
>  };
>  
> +struct machxo2_i2c_platform_data tqmx86_i2c2_platform_data_machxo2 = {
> +	.bus_khz = 100,
> +};
> +
> +static const struct mfd_cell tqmx86_i2c2_dev_machxo2 = {
> +	.name = "i2c-machxo2",
> +	.platform_data = &tqmx86_i2c2_platform_data_machxo2,
> +	.pdata_size = sizeof(tqmx86_i2c2_platform_data_machxo2),
> +	.resources = tqmx_i2c2_resources,
> +	.num_resources = ARRAY_SIZE(tqmx_i2c2_resources),
> +};
> +
>  static const struct mfd_cell tqmx86_devs[] = {
>  	{
>  		.name = "tqmx86-wdt",
> @@ -282,9 +299,9 @@ static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clo
>  	}
>  
>  	/*
> -	 * The I2C_DETECT register is in the range assigned to the I2C driver
> -	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
> -	 * access instead of ioport_map + unmap.
> +	 * These registers are in the range assigned to the I2C driver
> +	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for these one-off
> +	 * accesses instead of ioport_map + unmap.
>  	 */
>  	i2c_det = inb(TQMX86_IOBASE_I2C1 + TQMX86_REG_I2C_DETECT);
>  
> @@ -300,7 +317,7 @@ static int tqmx86_detect_i2c1(struct device *dev, void __iomem *io_base, int clo
>  
>  static int tqmx86_detect_i2c2(struct device *dev, void __iomem *io_base, int clock_khz)
>  {
> -	u8 i2c_det;
> +	u8 i2c_det, i2c_ien;
>  
>  	if (i2c2_irq) {
>  		if (!tqmx86_setup_irq(dev, "I2C2", i2c2_irq, io_base,
> @@ -312,16 +329,33 @@ static int tqmx86_detect_i2c2(struct device *dev, void __iomem *io_base, int clo
>  	 * The I2C_DETECT register is in the range assigned to the I2C driver
>  	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-off
>  	 * access instead of ioport_map + unmap.
> +	 *
> +	 * There are 3 cases to distinguish for the secondary controller:
> +	 *
> +	 * - ocores: i2c_det is a TQMx86-specific register that always contains
> +	 *   the value 0xa5. i2c_ien is unused and reads as 0xff.
> +	 * - machxo2: i2c_det is the data register can read as any value.
> +	 *   i2c_ien is the interrupt enable register; the upper nibble is
> +	 *   reserved and always reads as 0.
> +	 * - none: both i2c_det and i2c_ien read as 0xff if no I2C controller
> +	 *   exists at a given base address.
>  	 */
>  	i2c_det = inb(TQMX86_IOBASE_I2C2 + TQMX86_REG_I2C_DETECT);
> +	i2c_ien = inb(TQMX86_IOBASE_I2C2 + TQMX86_REG_I2C_IEN);
>  
> -	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES) {
> +	if (i2c_det == TQMX86_REG_I2C_DETECT_OCORES && i2c_ien == 0xff) {

What is 0xff?  No magic numbers - please define.

>  		tqmx86_i2c2_platform_data_ocores.clock_khz = clock_khz;
>  		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
>  					    &tqmx86_i2c2_dev_ocores, 1, NULL, 0,
>  					    NULL);
> +	} else if ((i2c_ien & 0xf0) == 0x00) {

As above - 0x00 means nothing to me.

> +		tqmx86_i2c2_platform_data_machxo2.clock_khz = clock_khz;
> +		return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> +					    &tqmx86_i2c2_dev_machxo2, 1, NULL, 0,
> +					    NULL);
>  	}
>  
> +
>  	return 0;
>  }
>  
> -- 
> TQ-Systems GmbH | Mühlstraße 2, Gut Delling | 82229 Seefeld, Germany
> Amtsgericht München, HRB 105018
> Geschäftsführer: Detlef Schneider, Rüdiger Stahl, Stefan Schneider
> https://www.tq-group.com/
> 

-- 
Lee Jones [李琼斯]

