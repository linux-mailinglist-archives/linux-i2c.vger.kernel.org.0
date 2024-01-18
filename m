Return-Path: <linux-i2c+bounces-1370-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A834383186E
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 12:26:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DA9981C225EE
	for <lists+linux-i2c@lfdr.de>; Thu, 18 Jan 2024 11:26:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7E3123777;
	Thu, 18 Jan 2024 11:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="qnP71G18"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1378F1170A
	for <linux-i2c@vger.kernel.org>; Thu, 18 Jan 2024 11:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705577205; cv=none; b=Jx2xn6bwcvL5LBi4SOGRMEBtuXBXRZDGaYTog1C/8yCIx1KXDUde63Trg5A+e60mdHG6500Ssi1gg8R8U1TX9sFUA9H/ZdZU+iYzwDqduRlq6VcLzh/om9ZHXGfF9hgGVPaJj+DB3mgJXLzyuJ/DohH0ZA2Q0RVX9FXcpfFTmlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705577205; c=relaxed/simple;
	bh=HhOs2/CxcjPd3HQgdU8JDdhCeGQtEPew7Zn+k2uXmLQ=;
	h=DKIM-Signature:X-IronPort-AV:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:Organization:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type; b=kb0B3YvE8WS1+OWD5wYNAj747ZvvoZ4niG3x7EgnfRU9fc7dGnemZ6UgSacPAdYEGFQBy2K5axEelG6VYPUxJJo0IAsZunLqlLjTrW11LmR7dJ39uUEtvK+h+FbA9S/XfrfE1s+PjwMepvWLFq08BXIe389dLkEcaqbN1ozPxcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=qnP71G18; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1705577202; x=1737113202;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DcjWUqr2313HUZ1/N3f1CvhGmkjnOc25KZIGgsn6d5U=;
  b=qnP71G18AmPLjkYm+w4K6xD3TB+QgUJCHdfmEngTr80+0U6353Tg4Bre
   8Zt9xDEww9d5rXvJm+HlLVMPc9br2AXQ9MwFxd2/1vtE2s8T9C+xzSMKW
   Asx0Ze1UoRWpzMiKsTU8mVPGwx/dz8TlKJF2tB0Pifnwh8bVPYJc7uyIV
   8UAtdTam5/smQjpxJKxZogMIFKOcPRhMHpIHaF6+oWU4a1YglvRXym6kC
   5IV5/uyslBBV40Na84uIjs7tu9xpFSdO46q5QuPaZj2pvrNYyxh6+qT4P
   CsJHIFJCJiWwna56j5AXWkhXI6PIY8Aj42EKeafBdwxzFdbjLkvtJMQC2
   w==;
X-IronPort-AV: E=Sophos;i="6.05,201,1701126000"; 
   d="scan'208";a="34960613"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 18 Jan 2024 12:26:39 +0100
Received: from steina-w.localnet (steina-w.tq-net.de [10.123.53.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 43972280075;
	Thu, 18 Jan 2024 12:26:39 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Uwe =?ISO-8859-1?Q?Kleine=2DK=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, Andi Shyti <andi.shyti@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/1] i2c: lpi2c: Avoid calling clk_get_rate during transfer
Date: Thu, 18 Jan 2024 12:26:39 +0100
Message-ID: <1976139.usQuhbGJ8B@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>
References: <20240118074332.3633533-1-alexander.stein@ew.tq-group.com> <ugdaycvznwcnlbwsgkakzkhnqrhwqloqablsmavngo5sgsalml@cfywhcglkctj>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Hi Uwe,

Am Donnerstag, 18. Januar 2024, 11:22:35 CET schrieb Uwe Kleine-K=F6nig:
> On Thu, Jan 18, 2024 at 08:43:32AM +0100, Alexander Stein wrote:
> > Instead of repeatedly calling clk_get_rate for each transfer, lock
> > the clock rate and cache the value.
> > A deadlock has been observed while adding tlv320aic32x4 audio codec to
> > the system. When this clock provider adds its clock, the clk mutex is
> > locked already, it needs to access i2c, which in return needs the mutex
> > for clk_get_rate as well.
> >=20
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > ---
> > This is an alternative, lightweight approach replacing the patch [1] and
> > depends on [2].
> > The issue to address is still removing the call to clk_get_rate() during
> > each transfer, which might reuslt in a deadlock. lockdep also complains
> > about this call chain.
> >=20
> > Instead of adding a clock notifier, lock the peripheral clock rate and
> > cache the peripheral clock rate.
> > Currently LPI2C is available in the following SoC:
> > * i.MX7ULP
> > * i.MX8ULP
> > * i.MX8DXL
> > * i.MX8X
> > * i.MX8
> > * i.MX93
> >=20
> > Additionally I expect both i.MX91 and i.MX95 to also use this driver.
> >=20
> > This patch assumes the parent clock rate never changes. This is apparen=
tly
> > true for i.MX93 as each I2C has it's own lpi2c*_root clock. On i.MX8 and
> > i.MX8X clocks are managed by SCU with it's own dedicated firmware. I
> > can't say if the clock never changes though. I have no idea about the
> > other SoC.
> >=20
> > Best regards,
> > Alexander
> >=20
> > [1]
> > https://lore.kernel.org/all/20240110120556.519800-1-alexander.stein@ew.=
tq
> > -group.com/ [2]
> > https://lore.kernel.org/all/20240104225512.1124519-2-u.kleine-koenig@pe=
ng
> > utronix.de/>=20
> >  drivers/i2c/busses/i2c-imx-lpi2c.c | 17 ++++++++++++++++-
> >  1 file changed, 16 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > b/drivers/i2c/busses/i2c-imx-lpi2c.c index 678b30e90492a..6cbcb27a3b280
> > 100644
> > --- a/drivers/i2c/busses/i2c-imx-lpi2c.c
> > +++ b/drivers/i2c/busses/i2c-imx-lpi2c.c
> > @@ -99,6 +99,7 @@ struct lpi2c_imx_struct {
> >=20
> >  	__u8			*rx_buf;
> >  	__u8			*tx_buf;
> >  	struct completion	complete;
> >=20
> > +	unsigned long		rate_per;
> >=20
> >  	unsigned int		msglen;
> >  	unsigned int		delivered;
> >  	unsigned int		block_data;
> >=20
> > @@ -207,7 +208,7 @@ static int lpi2c_imx_config(struct lpi2c_imx_struct
> > *lpi2c_imx)>=20
> >  	lpi2c_imx_set_mode(lpi2c_imx);
> >=20
> > -	clk_rate =3D clk_get_rate(lpi2c_imx->clks[0].clk);
> > +	clk_rate =3D lpi2c_imx->rate_per;
> >=20
> >  	if (!clk_rate)
> >  =09
> >  		return -EINVAL;
>=20
> After the things you did in lpi2c_imx_probe() you can assume that
> clk_rate is not zero, so you could drop the if here.

As in some cases the clock is not setup by Linux, but externally, I'd rathe=
r=20
keep that check to ensure it's enabled.

> Otherwise looks good to me (if you want even if you keep the if which is
> only a minor optimisation).
>=20
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks and best regards,
Alexander

> Best regards
> Uwe


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



