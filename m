Return-Path: <linux-i2c+bounces-14005-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD83C3C8D4
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 17:46:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0448418896CF
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 16:43:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457FD2D6E53;
	Thu,  6 Nov 2025 16:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sTB9pWOU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E9726F2AA;
	Thu,  6 Nov 2025 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762447365; cv=none; b=hLLXgfBdsVwkWtlcxhyFbRkTLBfthOz6e42qxrXVQERbOFMROSIFcws+gG1nNWmcxBUe7nCeUIJXTKtIapf7YkUYLxVc+lB3bQT4JqS5XWhGJbCWTm72P/RxFcZqw5RwKrBzdav2nfXAPIMaXmRhDEyDnvfAcokIVUhLGjQPr44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762447365; c=relaxed/simple;
	bh=SpeVu426/WkvU4V04i2YQbDyRo+Q5S/+ReTMbj/44jY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbIBqEzwWLn1MBicZ2fjpSlDcavv4HZdOywccGGj1k9Ld2hI3k/0J5h+QhUHHS+ceYXmJOgWGh3ZZ8bUKiLiajKw+aYgcVifzzKmySbedMnTrBQ+DfuYftutFgKSCzxR899Pt5BPt0HY0oPl6/C74SMt4j08E+PhBFs4Jqm8u8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sTB9pWOU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CB19C116C6;
	Thu,  6 Nov 2025 16:42:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762447364;
	bh=SpeVu426/WkvU4V04i2YQbDyRo+Q5S/+ReTMbj/44jY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sTB9pWOU6SlUQaXG8s5lq5F+7OO7QHlYrYaTNbFrAXxi6byliTu7t04qThNTSVZ8G
	 WHjdbQnkU+ReOqrFxEdCJg5aSp0emBlaM1T38ul3Cax75ChyVUAMqi80hE2VXyhw4t
	 xd9AXDXqLVqEPrtaEbW3BCEpERppmPG61GCcUftUcMYzIxzHOU+81T9aCtsCgRZoca
	 sMe4W0FprvW0swDFPgCs78LPqdLS6uMajyBIxkSBDws37fHqWIdC6u3i8y/eYoQQEx
	 o2Z3mc0FOphql1qJs0PqJYsApyBVDb9Afc/b5kPGYqXfLbjGqFS7lBqbIlWPXcH31N
	 MtYBgsRLsCZkQ==
Date: Thu, 6 Nov 2025 16:42:40 +0000
From: Lee Jones <lee@kernel.org>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Subject: Re: [PATCH v3 2/4] mfd: tqmx86: refactor I2C setup
Message-ID: <20251106164240.GW8064@google.com>
References: <bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
 <999718e052b5e600813cefc3ec19ba3028afa034.1761123080.git.matthias.schiffer@ew.tq-group.com>
 <20251106133848.GL8064@google.com>
 <eb1b752b3584d27e4d5e38544e54d7d1b5faf4ab.camel@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <eb1b752b3584d27e4d5e38544e54d7d1b5faf4ab.camel@ew.tq-group.com>

On Thu, 06 Nov 2025, Matthias Schiffer wrote:

> On Thu, 2025-11-06 at 13:38 +0000, Lee Jones wrote:
> > On Wed, 22 Oct 2025, Matthias Schiffer wrote:
> > 
> > > Preparation for supporting the second I2C controller, and detecting both
> > > ocores and machxo2 controllers.
> > > 
> > > - Avoid the confusing "soft" I2C controller term - just call it the
> > >   ocores I2C
> > > - All non-const parts of the MFD cell are moved from global variables
> > >   into new functions tqmx86_setup_i2c_ocores() and tqmx86_setup_i2c()
> > > - Define TQMX86_REG_I2C_DETECT relative to I2C base register
> > > 
> > > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > ---
> > > 
> > > v2: no changes
> > > v3: no changes
> > > 
> > >  drivers/mfd/tqmx86.c | 130 ++++++++++++++++++++++++-------------------
> > >  1 file changed, 74 insertions(+), 56 deletions(-)
> > > 
> > > diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> > > index 1cba3b67b0fb9..3c6f158bf1a45 100644
> > > --- a/drivers/mfd/tqmx86.c
> > > +++ b/drivers/mfd/tqmx86.c
> > > @@ -18,7 +18,7 @@
> > >  
> > >  #define TQMX86_IOBASE	0x180
> > >  #define TQMX86_IOSIZE	0x20
> > > -#define TQMX86_IOBASE_I2C	0x1a0
> > > +#define TQMX86_IOBASE_I2C1	0x1a0
> > >  #define TQMX86_IOSIZE_I2C	0xa
> > >  #define TQMX86_IOBASE_WATCHDOG	0x18b
> > >  #define TQMX86_IOSIZE_WATCHDOG	0x2
> > > @@ -54,8 +54,8 @@
> > >  #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
> > >  #define TQMX86_REG_SAUC		0x17
> > >  
> > > -#define TQMX86_REG_I2C_DETECT	0x1a7
> > > -#define TQMX86_REG_I2C_DETECT_SOFT		0xa5
> > > +#define TQMX86_REG_I2C_DETECT	0x7
> > > +#define TQMX86_REG_I2C_DETECT_OCORES	0xa5
> > >  
> > >  static uint gpio_irq;
> > >  module_param(gpio_irq, uint, 0);
> > > @@ -65,17 +65,6 @@ static uint i2c1_irq;
> > >  module_param(i2c1_irq, uint, 0);
> > >  MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 12)");
> > >  
> > > -enum tqmx86_i2c1_resource_type {
> > > -	TQMX86_I2C1_IO,
> > > -	TQMX86_I2C1_IRQ,
> > > -};
> > > -
> > > -static struct resource tqmx_i2c_soft_resources[] = {
> > > -	[TQMX86_I2C1_IO] = DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I2C),
> > > -	/* Placeholder for IRQ resource */
> > > -	[TQMX86_I2C1_IRQ] = {},
> > > -};
> > > -
> > >  static const struct resource tqmx_watchdog_resources[] = {
> > >  	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
> > >  };
> > > @@ -91,28 +80,13 @@ static struct resource tqmx_gpio_resources[] = {
> > >  	[TQMX86_GPIO_IRQ] = {},
> > >  };
> > >  
> > > -static struct i2c_board_info tqmx86_i2c_devices[] = {
> > > +static const struct i2c_board_info tqmx86_i2c1_devices[] = {
> > >  	{
> > >  		/* 4K EEPROM at 0x50 */
> > >  		I2C_BOARD_INFO("24c32", 0x50),
> > >  	},
> > >  };
> > >  
> > > -static struct ocores_i2c_platform_data ocores_platform_data = {
> > > -	.num_devices = ARRAY_SIZE(tqmx86_i2c_devices),
> > > -	.devices = tqmx86_i2c_devices,
> > > -};
> > > -
> > > -static const struct mfd_cell tqmx86_i2c_soft_dev[] = {
> > > -	{
> > > -		.name = "ocores-i2c",
> > > -		.platform_data = &ocores_platform_data,
> > > -		.pdata_size = sizeof(ocores_platform_data),
> > > -		.resources = tqmx_i2c_soft_resources,
> > > -		.num_resources = ARRAY_SIZE(tqmx_i2c_soft_resources),
> > > -	},
> > > -};
> > > -
> > >  static const struct mfd_cell tqmx86_devs[] = {
> > >  	{
> > >  		.name = "tqmx86-wdt",
> > > @@ -238,13 +212,74 @@ static int tqmx86_setup_irq(struct device *dev, const char *label, u8 irq,
> > >  	return 0;
> > >  }
> > >  
> > > +static int tqmx86_setup_i2c(struct device *dev, const char *name,
> > > +			    unsigned long i2c_base, const void *platform_data,
> > > +			    size_t pdata_size, u8 irq)
> > > +{
> > > +	const struct resource resources[] = {
> > > +		DEFINE_RES_IO(i2c_base, TQMX86_IOSIZE_I2C),
> > > +		irq ? DEFINE_RES_IRQ(irq) : (struct resource) {},
> > > +	};
> > > +	const struct mfd_cell i2c_dev = {
> > > +		.name = name,
> > > +		.platform_data = platform_data,
> > > +		.pdata_size = pdata_size,
> > > +		.resources = resources,
> > > +		.num_resources = ARRAY_SIZE(resources),
> > > +	};
> > 
> > No, please don't do it this way.
> > 
> > Keep as much information as you can in easy to read, easy to reference,
> > easy to find, easy to follow, etc static data.  If you have to add a
> > couple more static structs above, sobeit, but all of this parameter
> > passing through abstracted functions is a regression in readability and
> > maintainability IMHO.
> 
> Hmm, my reasoning for this change was that non-const static data always feels
> yucky (and it can't be const because of the dynamic irq field); but course you
> could argue that it's fine for a platform driver because there can only be a
> single instance.
> 
> Maybe have a const static at the toplevel, and copy that to a stack variable to
> fill in the resources?

It's okay not to be const.  We have a bunch of drivers that dynamically
add platform_data and the like.  It's the lesser of 2 evils.  Adding all
of this cruft dynamically "at the stack level" is suboptimal.

-- 
Lee Jones [李琼斯]

