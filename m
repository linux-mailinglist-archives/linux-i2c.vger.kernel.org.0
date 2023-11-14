Return-Path: <linux-i2c+bounces-146-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3137EAFD2
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 13:27:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D43A12811AD
	for <lists+linux-i2c@lfdr.de>; Tue, 14 Nov 2023 12:27:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E930A3FB0B;
	Tue, 14 Nov 2023 12:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="khfz9Qdj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 824243B282
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 12:27:12 +0000 (UTC)
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F1BED1
	for <linux-i2c@vger.kernel.org>; Tue, 14 Nov 2023 04:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1699964831; x=1731500831;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JZctFU5m/dXUIFR7HKC2+eJt3NNeiLinqCxMe3AvGR0=;
  b=khfz9Qdj1cmVtFHLWROYYKBejEUVukQn4crGTklpXw8uMQEAsj6DDIY5
   aKHPNz2EdrHoNZfGuVNAmKbEyYZm1MN2XfZdRBCWlqxCoEEVsKmViQdLb
   0fHENGiuR9vTwS6EaaKwuZn0P7F1OAhU7fKgGavWg+FJL9amGHifhmKds
   HNwkliufzp6DPziywBjshTHVhjV/y/oUzwHj+OczpFjgfbcwD8oztJfXI
   UNH1v+/JsIua2wYaHCcVaiPKB67omIDZeVoFEdo985xWffsYKGkW/lNkf
   ezYZH+mPQfryocE2ZBhQmkzaI9ODds5qaEE06WckEOtOd5rYLWGEWgCoX
   g==;
X-IronPort-AV: E=Sophos;i="6.03,302,1694728800"; 
   d="scan'208";a="33970392"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 14 Nov 2023 13:27:09 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id D602828007F;
	Tue, 14 Nov 2023 13:27:07 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Wolfram Sang <wsa@kernel.org>, Alexander Sverdlin <alexander.sverdlin@siemens.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v7 1/1] i2c: lpi2c: use clk notifier for rate changes
Date: Tue, 14 Nov 2023 13:27:11 +0100
Message-ID: <2912069.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20231110122720.cyxtnpj5k6bip3ok@zenone.zhora.eu>
References: <20231107141201.623482-1-alexander.stein@ew.tq-group.com> <20231109091046.4hrvxr7g5imfrykq@zenone.zhora.eu> <20231110122720.cyxtnpj5k6bip3ok@zenone.zhora.eu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Andi,

Am Freitag, 10. November 2023, 13:27:20 CET schrieb Andi Shyti:
> Alexander,
>=20
> if you...
>=20
> On Thu, Nov 09, 2023 at 10:10:46AM +0100, Andi Shyti wrote:
> > On Thu, Nov 09, 2023 at 08:54:51AM +0100, Alexander Stein wrote:
> > > Am Donnerstag, 9. November 2023, 00:38:09 CET schrieb Andi Shyti:
> > > > On Tue, Nov 07, 2023 at 03:12:01PM +0100, Alexander Stein wrote:
> > > > > Instead of repeatedly calling clk_get_rate for each transfer,
> > > > > register
> > > > > a clock notifier to update the cached divider value each time the
> > > > > clock
> > > > > rate actually changes.
> > > > > There is also a lockdep splat if a I2C based clock provider needs=
 to
> > > > > access the i2c bus while in recalc_rate(). "prepare_lock" is about
> > > > > to
> > > > > be locked recursively.
> > > > >=20
> > > > > Fixes: a55fa9d0e42e ("i2c: imx-lpi2c: add low power i2c bus drive=
r")
> > > >=20
> > > > What's the exact fix here? Is it the lockdep warning? Is it
> > > > actually causing a real deadlock?
> > >=20
> > > We've seen actual deadlocks on our imx8qxp based hardware using a
> > > downstream kernel, so we have implemented as similar fix [1]. This
> > > happened using tlv320aic32x4 audio codec.
> > > The backtrace is similar, a i2c based clock provider is trying t issue
> > > an i2c transfer while adding the clock, thus 'prepare_lock' is already
> > > locked. Lockdep raises an error both for downstream kernel as well as
> > > mainline, both for tlv320aic32x4 or pcf85063.
> >=20
> > yes, if the clock is using the same controller then it's likely
> > that you might end up in a deadlock. This is why I like this
> > patch and I believe this shouild go in the library at some point.
> >=20
> > But the deadlock is not mentioned in the commit log and lockdep
> > doesn't always mean deadlock.
>=20
> ... improve the commit message, reporting the real deadlock case
> instead of a lockdep warning and...

I've improved the commit message about an actual deadlock.

> [...]
>=20
> > > > > @@ -207,7 +224,7 @@ static int lpi2c_imx_config(struct
> > > > > lpi2c_imx_struct
> > > > > *lpi2c_imx)>
> > > > >=20
> > > > >  	lpi2c_imx_set_mode(lpi2c_imx);
> > > > >=20
> > > > > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > > > > +	clk_rate =3D atomic_read(&lpi2c_imx->rate_per);
> > > > >=20
> > > > >  	if (!clk_rate)
> > > > >  =09
> > > > >  		return -EINVAL;
> > > >=20
> > > > Doesn't seem like EINVAL, defined as "Invalid argument", is the
> > > > correct number here. As we are failing to read the clock rate, do
> > > > you think EIO is better?
> > >=20
> > > Well, this is already the current error code. In both the old and new
> > > code I would consider this error case as 'no clock rate provided'
> > > rather than failing to read. I would reject EIO as there is no IO
> > > transfer for retrieving the clock rate.
> >=20
> > It's definitely not EINVAL as we are failing not because of
> > invalid arguments. I thought of EIO because at some point the
> > clock rate has been retrieved (or set, thus i/o) and "rate_per"
> > updated accordingly. But I agree that's not the perfect value
> > either.
> >=20
> > I couldn't think of a better error value, though.
>=20
> ... find a more appropriate error number, I will ack this patch.

Thinking about this again, I think EINVAL is an appropriate error code.
The parent clock frequency is also an input for the i2c transfer. So if, fo=
r=20
whatever reason, that clock frequency is 0, it is an invalid value (argumen=
t).
I've checked other drivers what they do if that clock is 0. Unfortunately m=
ost=20
don't consider this case at all. But some do, so e.g. i2c_lpc2k_probe() or=
=20
dc_i2c_init_hw() both return EINVAL if the clk or a calculated divider is 0.

> If the deadlock you mentioned is a warning from the lockdep, then
> please remove the "Fixes:" tag.

It's not just a lockdep warning, the deadlock actually happened.

Best regards,
Alexander

> Andi


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



