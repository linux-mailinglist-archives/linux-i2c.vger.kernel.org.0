Return-Path: <linux-i2c+bounces-15165-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A40FCD1FFFB
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 16:58:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 885F03069FDA
	for <lists+linux-i2c@lfdr.de>; Wed, 14 Jan 2026 15:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFCF35E551;
	Wed, 14 Jan 2026 15:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ffa+VvUf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CB286D7C;
	Wed, 14 Jan 2026 15:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768405962; cv=none; b=UkoBV+Ba6qWlqOzUEdnie3mttiWTe66HIpypnuSe2owMyBXTsQ9oQCby/FySnvJPn20b9j0a4uGdyQrFdlRBp6lO5UDsTJXLVgaEFNjXlCuI3PpAm6gi6P7V3UBOT3AsV/e8rbGOZLfSyoiqjTIvD9zQCff06uvI1C9wBHDRG7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768405962; c=relaxed/simple;
	bh=OthrFbf3AcnFfU3HddSkXJCX7vPg/N2z4Kz8DN7djFo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GS/Kk343CuTzFlAuf350k58PD5hsPoghYXFjfRtDu0SKQkebtja45n6hhbuS7TRBl6VhmuZbNiGgfkd8a+o5O/LM1qxz6adciNA7oiFaasqoG662Ybgh7WkAjzWNEUhBohgv6lAqrVfmHd6p6SbUG3OHJjOYCWH+XzkGrwOsT6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ffa+VvUf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17042C4CEF7;
	Wed, 14 Jan 2026 15:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768405961;
	bh=OthrFbf3AcnFfU3HddSkXJCX7vPg/N2z4Kz8DN7djFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ffa+VvUfWRpIW6BV4lAmxGSlB/HXb/mpvk/xSuAMsPewI6A6nqLRc9UmqkE2LBW46
	 +E7S2LLSrrvQnvTDVVd/MUVz/UV5KjyB919Uzk6Gf48kjD1X+U1TYQ8p33FIU6RgzO
	 MWOj3fQu8DYTDt2Fj6lMBAZ/aeW2XBFAoiNW3h/AwWan9jTKEyc9feiSiM50/q+Nsy
	 IHt7/jiko8RVlevkOcjzjHYzSnIuAJMleTNBK1AhQN0zN4+a5qkt3NWfGYyZDlFWNU
	 Jtb3XlBbGnq1bfYQg6SPLXpgzcgA4yMRkzOlt11qeIo3nOWL8hoxpq+DuinmNKbHpU
	 MsT/yrKt/7Jbw==
Date: Wed, 14 Jan 2026 16:52:38 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
Cc: "o.rempel@pengutronix.de" <o.rempel@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "shawnguo@kernel.org" <shawnguo@kernel.org>, 
	"s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	GEO-CHHER-bsp-development <bsp-development.geo@leica-geosystems.com>
Subject: Re: [PATCH V1] i2c: imx: Fix SMBus block read hang on zero length
Message-ID: <aWe7e_guDDAJdCA6@zenone.zhora.eu>
References: <20251229081629.4081452-1-Qing-wu.Li@leica-geosystems.com.cn>
 <aV60-Wm0c_Oo0zWF@zenone.zhora.eu>
 <GV2PR06MB10809C9AF32F95388E8DBF519D785A@GV2PR06MB10809.eurprd06.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <GV2PR06MB10809C9AF32F95388E8DBF519D785A@GV2PR06MB10809.eurprd06.prod.outlook.com>

Hi,

...

> > > master transmit mode before stopping. This is done by draining the
> > > pending received byte from I2DR, setting I2CR_MTX to enter transmit
> > > mode, waiting briefly for the mode change, and then proceeding with
> > > the normal STOP sequence.
> > >
> > > This change has been tested on i.MX 8M Plus platform.
> > >
> > > Signed-off-by: LI Qingwu <Qing-wu.Li@leica-geosystems.com.cn>
> > 
> > Is this a fix?
> 
> Yes, this is a fix. Without this patch, zero-length SMBus block reads cause a system crash 
> and permanent bus lockup on i.MX 8M Plus. The fix ensures proper STOP generation and 
> prevents buffer overruns.

Then, please add the Fixes tag.

> > > ---
> > >  drivers/i2c/busses/i2c-imx.c | 13 ++++++++++++-
> > >  1 file changed, 12 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/i2c/busses/i2c-imx.c
> > > b/drivers/i2c/busses/i2c-imx.c index dcce882f3eba..f40deecf0f66 100644
> > > --- a/drivers/i2c/busses/i2c-imx.c
> > > +++ b/drivers/i2c/busses/i2c-imx.c
> > > @@ -735,6 +735,16 @@ static void i2c_imx_stop(struct imx_i2c_struct
> > *i2c_imx, bool atomic)
> > >               temp = imx_i2c_read_reg(i2c_imx, IMX_I2C_I2CR);
> > >               if (!(temp & I2CR_MSTA))
> > >                       i2c_imx->stopped = 1;
> > > +             if ((temp & I2CR_MSTA) && !(temp & I2CR_MTX)) {
> > > +                     (void)imx_i2c_read_reg(i2c_imx, IMX_I2C_I2DR);
> > 
> > why do we need a cast here?
> 
> The void cast explicitly marks this as a dummy read. We're reading I2DR solely to drain the
> receive buffer (a required side effect before mode switching), not because we need the value.
> This makes the intent clear to both the compiler and code reviewers.

Please drop it.

> > > +                     temp |= I2CR_MTX;
> > > +                     imx_i2c_write_reg(temp, i2c_imx, IMX_I2C_I2CR);
> > > +                     if (atomic)
> > > +                             udelay(25);
> > 
> > where is this 25 coming from?
> 
> It's a conservative value derived from practical testing. at standard mode (100kHz),
> this equals ~2.5 I2C clock periods; at fast mode (400kHz), ~10 periods

Please add a comment.

Andi

