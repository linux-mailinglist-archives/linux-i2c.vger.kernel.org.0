Return-Path: <linux-i2c+bounces-13996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F1DC3B7F3
	for <lists+linux-i2c@lfdr.de>; Thu, 06 Nov 2025 14:58:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0D1D64F1327
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Nov 2025 13:51:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA25C304BAF;
	Thu,  6 Nov 2025 13:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="Jn+RHmqL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx-relay13-hz2.antispameurope.com (mx-relay13-hz2.antispameurope.com [83.246.65.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BEF23A564
	for <linux-i2c@vger.kernel.org>; Thu,  6 Nov 2025 13:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=83.246.65.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762437088; cv=pass; b=REaau4M/noW72to2Co/obY4+edxSouiFdvmMfFY448w39f/SCDZXsbpJe4F9OnBIXlbw+7N7ugOrn+68dvRfBaxzhYk7f/AQoNp7pzMYqS3sz7CEZ6g4nLcFsM75o7LZncXvWX+7w3mDwpttfp559M9PAZTdIMnZvATeZjxOhhQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762437088; c=relaxed/simple;
	bh=ng+tlkTa9/IGpedkQ9xdMe0MFEG5OEYbeJQ/H5hkQyU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PNF+98qOvB5OQ7IvobYpcEwQSwFe1AfLuo96Q+byIygWMfgnU51DAFQwBYU7zBsBrDiITpcc9jj+Vy7afPptOoJNsjt1c5OOVU6zThfU+OnRw9/aCINdwqPUoMXQfhWTvMwnXNDphivFSR3V7hWwOkMB6mbtnMZu6qe3c6DwjqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=Jn+RHmqL; arc=pass smtp.client-ip=83.246.65.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
ARC-Authentication-Results: i=1; mx-gate13-hz2.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=wDPCS0sIToSANB5h1HYj6fRXoRaMfslIE6mv/majMnI=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1762437072;
 b=HasL12hlPrRgNRbCvL+gdmtgXCFnK08bw+lK5BPpSlX4kEGCvupKNwWrCgz3qW8OtDJNerg6
 s1Kcrfa6Byld+pRDH9QTCBh9E8AWOP8rPGkZsFPX8rVbLTuUaPy4p3HvbDXF1WL7kxuWlCzJuC1
 Wm++dhmedHZdNAZxs03osYtynpw/dDzHKMwo/48nul9Da8BYqHUtBfTQAxaIRCS6Zv5efccKae8
 lSZerFeaZMDJAL8UlczG8yfL4eHWN62A6+xxARg48GS+hQGiBR5ZiMtnO0Vm/SgigaIaA4km632
 5NmREyrGL0eB/ckwcrJNo+wWY152ut2Nf3kcCVFt0zRoA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1762437072;
 b=BZhu5amD1fuI0IfytyWuzK+pzAsHFPAot/gxowhKLVskTTaGLH0qzl5MsJDKPSaYtTvpxGH4
 E1FxpCBpN226xAaql8q2ojz1hAKZFZIFb4PinDMJCgfEL+RW0SfbrP9E47ed2CtEGDwKpwtCPsv
 +/KJExftwmi9Uu87udMwtsotRHfj6s1GKO5c7F1Wyyp1RnMvaC9SBeyD2p9DsyQZRBOL+Y1rzd1
 vCCiUfj5Wn3/HtZy1S/smeGaoxLIl7qf1LvF9y8pMbZwtAm/TuRu1yqZVC6nsigIO+WObzFeBmS
 t5IUipBYN/d6t7ymja52fodqgseK+CY0J1MqDdhF2tWpw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay13-hz2.antispameurope.com;
 Thu, 06 Nov 2025 14:51:12 +0100
Received: from [192.168.153.128] (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: matthias.schiffer@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 4CD51CC0CCF;
	Thu,  6 Nov 2025 14:51:05 +0100 (CET)
Message-ID: <eb1b752b3584d27e4d5e38544e54d7d1b5faf4ab.camel@ew.tq-group.com>
Subject: Re: [PATCH v3 2/4] mfd: tqmx86: refactor I2C setup
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Lee Jones <lee@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com
Date: Thu, 06 Nov 2025 14:51:04 +0100
In-Reply-To: <20251106133848.GL8064@google.com>
References: 
	<bc9ce42883d10d54bc0954024d7e2312ff45fdb6.1761123080.git.matthias.schiffer@ew.tq-group.com>
	 <999718e052b5e600813cefc3ec19ba3028afa034.1761123080.git.matthias.schiffer@ew.tq-group.com>
	 <20251106133848.GL8064@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-cloud-security-sender:matthias.schiffer@ew.tq-group.com
X-cloud-security-recipient:linux-i2c@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: matthias.schiffer@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay13-hz2.antispameurope.com with 4d2NrT4tHbz3sbdL
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:a0068ae271c376fdad0f6208d39548df
X-cloud-security:scantime:1.917
DKIM-Signature: a=rsa-sha256;
 bh=wDPCS0sIToSANB5h1HYj6fRXoRaMfslIE6mv/majMnI=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1762437072; v=1;
 b=Jn+RHmqLRt2FqWblxq2xEU7IdKNLUctUJxRbNtflvy6iZ4K+GlQnayFTaT0y6P/+TUdFcIAB
 NNWJRt/Zmk5Xn7od1DAJVJCR2DGt3a/sR9vsYb7qkhm3uDI4VSZbiRGyfFZm9Wve1FKzHtB47A0
 aF8WW3VxuEcw6RUI/9O79XYiej25aC3/wauKQjWQ5vniZOcXXcoF4hpa4k23EXYV85uHYaFljMC
 DRc1PNL9b1ytmCYVaqtSt8+mnewaWW5x3aL/EHFboRE5Hpk364medVPtxz2Ves+eis5+Lgt+eNA
 VF4nLk3xwej/E2YacJsOEac522IylicLa/jC9V9qRgZWA==

On Thu, 2025-11-06 at 13:38 +0000, Lee Jones wrote:
> On Wed, 22 Oct 2025, Matthias Schiffer wrote:
>=20
> > Preparation for supporting the second I2C controller, and detecting bot=
h
> > ocores and machxo2 controllers.
> >=20
> > - Avoid the confusing "soft" I2C controller term - just call it the
> >   ocores I2C
> > - All non-const parts of the MFD cell are moved from global variables
> >   into new functions tqmx86_setup_i2c_ocores() and tqmx86_setup_i2c()
> > - Define TQMX86_REG_I2C_DETECT relative to I2C base register
> >=20
> > Signed-off-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > ---
> >=20
> > v2: no changes
> > v3: no changes
> >=20
> >  drivers/mfd/tqmx86.c | 130 ++++++++++++++++++++++++-------------------
> >  1 file changed, 74 insertions(+), 56 deletions(-)
> >=20
> > diff --git a/drivers/mfd/tqmx86.c b/drivers/mfd/tqmx86.c
> > index 1cba3b67b0fb9..3c6f158bf1a45 100644
> > --- a/drivers/mfd/tqmx86.c
> > +++ b/drivers/mfd/tqmx86.c
> > @@ -18,7 +18,7 @@
> > =20
> >  #define TQMX86_IOBASE	0x180
> >  #define TQMX86_IOSIZE	0x20
> > -#define TQMX86_IOBASE_I2C	0x1a0
> > +#define TQMX86_IOBASE_I2C1	0x1a0
> >  #define TQMX86_IOSIZE_I2C	0xa
> >  #define TQMX86_IOBASE_WATCHDOG	0x18b
> >  #define TQMX86_IOSIZE_WATCHDOG	0x2
> > @@ -54,8 +54,8 @@
> >  #define TQMX86_REG_IO_EXT_INT_GPIO_SHIFT	4
> >  #define TQMX86_REG_SAUC		0x17
> > =20
> > -#define TQMX86_REG_I2C_DETECT	0x1a7
> > -#define TQMX86_REG_I2C_DETECT_SOFT		0xa5
> > +#define TQMX86_REG_I2C_DETECT	0x7
> > +#define TQMX86_REG_I2C_DETECT_OCORES	0xa5
> > =20
> >  static uint gpio_irq;
> >  module_param(gpio_irq, uint, 0);
> > @@ -65,17 +65,6 @@ static uint i2c1_irq;
> >  module_param(i2c1_irq, uint, 0);
> >  MODULE_PARM_DESC(i2c1_irq, "I2C1 IRQ number (valid parameters: 7, 9, 1=
2)");
> > =20
> > -enum tqmx86_i2c1_resource_type {
> > -	TQMX86_I2C1_IO,
> > -	TQMX86_I2C1_IRQ,
> > -};
> > -
> > -static struct resource tqmx_i2c_soft_resources[] =3D {
> > -	[TQMX86_I2C1_IO] =3D DEFINE_RES_IO(TQMX86_IOBASE_I2C, TQMX86_IOSIZE_I=
2C),
> > -	/* Placeholder for IRQ resource */
> > -	[TQMX86_I2C1_IRQ] =3D {},
> > -};
> > -
> >  static const struct resource tqmx_watchdog_resources[] =3D {
> >  	DEFINE_RES_IO(TQMX86_IOBASE_WATCHDOG, TQMX86_IOSIZE_WATCHDOG),
> >  };
> > @@ -91,28 +80,13 @@ static struct resource tqmx_gpio_resources[] =3D {
> >  	[TQMX86_GPIO_IRQ] =3D {},
> >  };
> > =20
> > -static struct i2c_board_info tqmx86_i2c_devices[] =3D {
> > +static const struct i2c_board_info tqmx86_i2c1_devices[] =3D {
> >  	{
> >  		/* 4K EEPROM at 0x50 */
> >  		I2C_BOARD_INFO("24c32", 0x50),
> >  	},
> >  };
> > =20
> > -static struct ocores_i2c_platform_data ocores_platform_data =3D {
> > -	.num_devices =3D ARRAY_SIZE(tqmx86_i2c_devices),
> > -	.devices =3D tqmx86_i2c_devices,
> > -};
> > -
> > -static const struct mfd_cell tqmx86_i2c_soft_dev[] =3D {
> > -	{
> > -		.name =3D "ocores-i2c",
> > -		.platform_data =3D &ocores_platform_data,
> > -		.pdata_size =3D sizeof(ocores_platform_data),
> > -		.resources =3D tqmx_i2c_soft_resources,
> > -		.num_resources =3D ARRAY_SIZE(tqmx_i2c_soft_resources),
> > -	},
> > -};
> > -
> >  static const struct mfd_cell tqmx86_devs[] =3D {
> >  	{
> >  		.name =3D "tqmx86-wdt",
> > @@ -238,13 +212,74 @@ static int tqmx86_setup_irq(struct device *dev, c=
onst char *label, u8 irq,
> >  	return 0;
> >  }
> > =20
> > +static int tqmx86_setup_i2c(struct device *dev, const char *name,
> > +			    unsigned long i2c_base, const void *platform_data,
> > +			    size_t pdata_size, u8 irq)
> > +{
> > +	const struct resource resources[] =3D {
> > +		DEFINE_RES_IO(i2c_base, TQMX86_IOSIZE_I2C),
> > +		irq ? DEFINE_RES_IRQ(irq) : (struct resource) {},
> > +	};
> > +	const struct mfd_cell i2c_dev =3D {
> > +		.name =3D name,
> > +		.platform_data =3D platform_data,
> > +		.pdata_size =3D pdata_size,
> > +		.resources =3D resources,
> > +		.num_resources =3D ARRAY_SIZE(resources),
> > +	};
>=20
> No, please don't do it this way.
>=20
> Keep as much information as you can in easy to read, easy to reference,
> easy to find, easy to follow, etc static data.  If you have to add a
> couple more static structs above, sobeit, but all of this parameter
> passing through abstracted functions is a regression in readability and
> maintainability IMHO.

Hmm, my reasoning for this change was that non-const static data always fee=
ls
yucky (and it can't be const because of the dynamic irq field); but course =
you
could argue that it's fine for a platform driver because there can only be =
a
single instance.

Maybe have a const static at the toplevel, and copy that to a stack variabl=
e to
fill in the resources?

Best,
Matthias



>=20
> > +	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE, &i2c_dev, 1,
> > +				    NULL, 0, NULL);
> > +
> > +}
> > +
> > +static int tqmx86_setup_i2c_ocores(struct device *dev, const char *lab=
el,
> > +				   unsigned long i2c_base, int clock_khz, u8 irq,
> > +				   const struct i2c_board_info *devices,
> > +				   size_t num_devices)
> > +{
> > +	const struct ocores_i2c_platform_data platform_data =3D {
> > +		.clock_khz =3D clock_khz,
> > +		.num_devices =3D num_devices,
> > +		.devices =3D devices,
> > +	};
> > +
> > +	return tqmx86_setup_i2c(dev, "ocores-i2c", i2c_base, &platform_data,
> > +				sizeof(platform_data), irq);
> > +}
> > +
> > +static int tqmx86_detect_i2c(struct device *dev, const char *label,
> > +			     unsigned long i2c_base, int clock_khz, u8 irq,
> > +			     const struct i2c_board_info *devices,
> > +			     size_t num_devices, void __iomem *io_base,
> > +			     u8 irq_reg_shift)
> > +{
> > +	u8 i2c_det;
> > +
> > +	if (tqmx86_setup_irq(dev, label, irq, io_base, irq_reg_shift))
> > +		irq =3D 0;
> > +
> > +	/*
> > +	 * The I2C_DETECT register is in the range assigned to the I2C driver
> > +	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-of=
f
> > +	 * access instead of ioport_map + unmap.
> > +	 */
> > +	i2c_det =3D inb(i2c_base + TQMX86_REG_I2C_DETECT);
> > +
> > +	if (i2c_det =3D=3D TQMX86_REG_I2C_DETECT_OCORES)
> > +		return tqmx86_setup_i2c_ocores(dev, label, i2c_base, clock_khz,
> > +					       irq, devices, num_devices);
> > +
> > +	return 0;
> > +}
> > +
> >  static int tqmx86_probe(struct platform_device *pdev)
> >  {
> > -	u8 board_id, sauc, rev, i2c_det;
> > +	u8 board_id, sauc, rev;
> >  	struct device *dev =3D &pdev->dev;
> >  	const char *board_name;
> >  	void __iomem *io_base;
> > -	int err;
> > +	int err, clock_khz;
> > =20
> >  	io_base =3D devm_ioport_map(dev, TQMX86_IOBASE, TQMX86_IOSIZE);
> >  	if (!io_base)
> > @@ -259,13 +294,6 @@ static int tqmx86_probe(struct platform_device *pd=
ev)
> >  		 "Found %s - Board ID %d, PCB Revision %d, PLD Revision %d\n",
> >  		 board_name, board_id, rev >> 4, rev & 0xf);
> > =20
> > -	/*
> > -	 * The I2C_DETECT register is in the range assigned to the I2C driver
> > -	 * later, so we don't extend TQMX86_IOSIZE. Use inb() for this one-of=
f
> > -	 * access instead of ioport_map + unmap.
> > -	 */
> > -	i2c_det =3D inb(TQMX86_REG_I2C_DETECT);
> > -
> >  	if (gpio_irq) {
> >  		err =3D tqmx86_setup_irq(dev, "GPIO", gpio_irq, io_base,
> >  				       TQMX86_REG_IO_EXT_INT_GPIO_SHIFT);
> > @@ -273,23 +301,13 @@ static int tqmx86_probe(struct platform_device *p=
dev)
> >  			tqmx_gpio_resources[TQMX86_GPIO_IRQ] =3D DEFINE_RES_IRQ(gpio_irq);
> >  	}
> > =20
> > -	ocores_platform_data.clock_khz =3D tqmx86_board_id_to_clk_rate(dev, b=
oard_id);
> > -
> > -	if (i2c_det =3D=3D TQMX86_REG_I2C_DETECT_SOFT) {
> > -		if (i2c1_irq) {
> > -			err =3D tqmx86_setup_irq(dev, "I2C1", i2c1_irq, io_base,
> > -					       TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
> > -			if (!err)
> > -				tqmx_i2c_soft_resources[TQMX86_I2C1_IRQ] =3D DEFINE_RES_IRQ(i2c1_i=
rq);
> > -		}
> > -
> > -		err =3D devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> > -					   tqmx86_i2c_soft_dev,
> > -					   ARRAY_SIZE(tqmx86_i2c_soft_dev),
> > -					   NULL, 0, NULL);
> > -		if (err)
> > -			return err;
> > -	}
> > +	clock_khz =3D tqmx86_board_id_to_clk_rate(dev, board_id);
> > +
> > +	err =3D tqmx86_detect_i2c(dev, "I2C1", TQMX86_IOBASE_I2C1, clock_khz,=
 i2c1_irq,
> > +				tqmx86_i2c1_devices, ARRAY_SIZE(tqmx86_i2c1_devices),
> > +				io_base, TQMX86_REG_IO_EXT_INT_I2C1_SHIFT);
> > +	if (err)
> > +		return err;
> > =20
> >  	return devm_mfd_add_devices(dev, PLATFORM_DEVID_NONE,
> >  				    tqmx86_devs,
> > --=20
> > TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, =
Germany
> > Amtsgericht M=C3=BCnchen, HRB 105018
> > Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan=
 Schneider
> > https://www.tq-group.com/
>=20

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

