Return-Path: <linux-i2c+bounces-14059-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC95C4E864
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 15:39:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D60683A633B
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Nov 2025 14:33:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DE5C28F948;
	Tue, 11 Nov 2025 14:33:41 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361B1248F78
	for <linux-i2c@vger.kernel.org>; Tue, 11 Nov 2025 14:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762871621; cv=none; b=RoCHRlDdPvzYN71KRfbudKvYJIFTTHuUdIMrlAAhAs4ggYrozoCxyosuXTk85b8Tcn45ZqIGlHToGxz8q64M/pG785BKPmxCfA+Np6e2f5x46kuvZCUcm3rgd2hU4XqaGtZ5bFYjr0y/MwG5hsNt5RZWFj57o8HJF1//vziSQMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762871621; c=relaxed/simple;
	bh=MrWP641Xm605bRx3lhl2q+KtNTn/GUfquxZD1MRCk1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cJdzcAzqgfZmaMomjBGkjWfuLSSvXK99iatNrJp+PI4x0qkyd90592fSkCGuxsshuyl1zSADgoOAPqHY/T3mF/pCkOOcftj0d2Rp3VaqpPF/Pv3uu7bG4fhwYHSvYJwBfOlPsrmjfS6BuDEmFk+thodZLyu3Xs/CypZ2RIVAEj0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpRA-0003tl-E7; Tue, 11 Nov 2025 15:33:36 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpRA-008DWQ-0G;
	Tue, 11 Nov 2025 15:33:36 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vIpRA-000000009Sb-01hh;
	Tue, 11 Nov 2025 15:33:36 +0100
Message-ID: <743a73399327e0f11825b1b50b4a0fc90948625d.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] i2c: designware-platdrv: complete reset control
 devm conversion
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Artem Shimko <a.shimko.dev@gmail.com>
Cc: andi.shyti@kernel.org, andriy.shevchenko@linux.intel.com,
 jsd@semihalf.com, 	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
 	mika.westerberg@linux.intel.com
Date: Tue, 11 Nov 2025 15:33:35 +0100
In-Reply-To: <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
References: <e3c2096459bdd0c1d48c00a837cc7f8c18044631.camel@pengutronix.de>
		 <20251111114559.3188740-1-a.shimko.dev@gmail.com>
		 <20251111114559.3188740-2-a.shimko.dev@gmail.com>
	 <3c3ece1a00c6e39d865c231e27508bdde0783070.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1+deb13u1 
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org

On Di, 2025-11-11 at 13:43 +0100, Philipp Zabel wrote:
> On Di, 2025-11-11 at 14:45 +0300, Artem Shimko wrote:
> > The driver still manually calls reset_control_assert() in error paths a=
nd
> > remove function. This creates inconsistent resource management and miss=
es
> > the benefits of full device-managed approach.
> >=20
> > Register devm_add_action_or_reset() callback after acquiring reset cont=
rol
> > to handle automatic assertion on probe errors and driver removal. This
> > eliminates all manual reset_control_assert() calls while maintaining
> > identical reset behavior through automatic devm resource management.
> >=20
> > Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-designware-platdrv.c | 34 ++++++++++++---------
> >  1 file changed, 19 insertions(+), 15 deletions(-)
> >=20
> > diff --git a/drivers/i2c/busses/i2c-designware-platdrv.c b/drivers/i2c/=
busses/i2c-designware-platdrv.c
> > index c77029e520dc..d334af1d7c6f 100644
> > --- a/drivers/i2c/busses/i2c-designware-platdrv.c
> > +++ b/drivers/i2c/busses/i2c-designware-platdrv.c
> > @@ -206,6 +206,13 @@ static void i2c_dw_remove_lock_support(struct dw_i=
2c_dev *dev)
> >  		i2c_dw_semaphore_cb_table[dev->semaphore_idx].remove(dev);
> >  }
> > =20
> > +static void dw_i2c_plat_assert_reset(void *data)
> > +{
> > +	struct dw_i2c_dev *dev =3D data;
> > +
> > +	reset_control_assert(dev->rst);
> > +}
> > +
> >  static int dw_i2c_plat_probe(struct platform_device *pdev)
> >  {
> >  	u32 flags =3D (uintptr_t)device_get_match_data(&pdev->dev);
> > @@ -240,34 +247,34 @@ static int dw_i2c_plat_probe(struct platform_devi=
ce *pdev)
> >  	if (IS_ERR(dev->rst))
> >  		return PTR_ERR(dev->rst);
> > =20
> > +	ret =3D devm_add_action_or_reset(device, dw_i2c_plat_assert_reset, de=
v);
> > +	if (ret)
> > +		return ret;
> > +
>=20
> This is already done by patch 1. Drop these hunks

See [1], _deasserted() already includes assert-on-detach.

[1] https://docs.kernel.org/driver-api/reset.html#c.devm_reset_control_get_=
optional_exclusive_deasserted

regards
Philipp

