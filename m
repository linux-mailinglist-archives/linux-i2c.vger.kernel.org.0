Return-Path: <linux-i2c+bounces-12200-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 46640B1F967
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 10:55:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4BC121897761
	for <lists+linux-i2c@lfdr.de>; Sun, 10 Aug 2025 08:55:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 112B723BD02;
	Sun, 10 Aug 2025 08:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="kpZJ//Nf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC49235BE2;
	Sun, 10 Aug 2025 08:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754816092; cv=none; b=VJTpvWagMzlFY62t7dnfOirsLs5BHb+M1qkgZYWapWN4bNoDjh8kIEFTGEAnkFVZMhbgZCEr7SNCpFHjMLdu8/cRSHwZvMX8pYQUtXAcoQTsECy8+F9DnAwN0xtTACB21h8LRRaw6HUY/vmXXZh+UO+kg3mUrnpxY9EPz06PAAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754816092; c=relaxed/simple;
	bh=Dt1W/uhVBj5k/h/4FPtRgQFk2MdZtT1zE3kCyHnDRHM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hMcAHDY55drZsUjEcDoS0WZdsUgPStPVWQtanX+jdav3tXEMkOfAg9Etd3i4W5fW38ABH2QWtDx5CMG0/FkIssK6MDyMjBrjCf1SlyhOEhox0SzRXJxQ1UVhbV81ATbyRevPLs/6bHNMIczWjuIfYrKQuMAg/pZgLDYT7zgbtt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=kpZJ//Nf; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1754816087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1Np7qhgdc9BV5F4rBnSIdIhY8CLUVnby0PBFIlucYzc=;
	b=kpZJ//NfJWlspLaHoGoMhCtLtJiC84JlkgAuYaNaUGRAjRWJy2r8KfauB96YxOSnXwihz4
	/lIzWAtxSjChwiXW7Ad1jZSjBgGUyoTuAeK/edIK2z/v748MIRWMgFNOxtbL2rh88LGpzq
	QSil6/ASO2Tt37vsCyOS/PoGMXQC/10=
From: Sven Eckelmann <sven@narfation.org>
To: Jonas Jelonek <jelonek.jonas@gmail.com>, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Markus Elfring <Markus.Elfring@web.de>
Cc: LKML <linux-kernel@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Harshal Gohel <hg@simonwunderlich.de>,
 Markus Stockhausen <markus.stockhausen@gmx.de>
Subject:
 Re: [PATCH v5 07/11] i2c: rtl9300: move setting SCL frequency to config_io
Date: Sun, 10 Aug 2025 10:54:44 +0200
Message-ID: <3005245.mvXUDI8C0e@sven-desktop>
In-Reply-To: <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
References:
 <20250809220713.1038947-8-jelonek.jonas@gmail.com>
 <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart12931453.O9o76ZdvQC";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart12931453.O9o76ZdvQC
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
Date: Sun, 10 Aug 2025 10:54:44 +0200
Message-ID: <3005245.mvXUDI8C0e@sven-desktop>
In-Reply-To: <9a1616dc-34b2-42fd-8f64-9d46fa3bb92f@web.de>
MIME-Version: 1.0

On Sunday, 10 August 2025 10:49:02 CEST Markus Elfring wrote:
> =E2=80=A6
> > +++ b/drivers/i2c/busses/i2c-rtl9300.c
> =E2=80=A6
> > +static int mshv_vtl_sint_ioctl_set_eventfd(struct mshv_vtl_set_eventfd=
 __user *arg)
> > +{
> =E2=80=A6
> > @@ -244,7 +245,7 @@ static int rtl9300_i2c_smbus_xfer(struct i2c_adapte=
r *adap, u16 addr, unsigned s
> > =20
> >  	mutex_lock(&i2c->lock);
> >  	if (chan->sda_num !=3D i2c->sda_num) {
> > -		ret =3D rtl9300_i2c_config_io(i2c, chan->sda_pin);
> > +		ret =3D rtl9300_i2c_config_io(i2c, chan);
> >  		if (ret)
> >  			goto out_unlock;
> =E2=80=A6
>=20
> Under which circumstances would you become interested to apply a statement
> like =E2=80=9Cguard(mutex)(&i2c->lock);=E2=80=9D?
> https://elixir.bootlin.com/linux/v6.16/source/include/linux/mutex.h#L225

https://lwn.net/Articles/934679/ ("From cleanup functions to classes")

Kind regards,
	Sven
--nextPart12931453.O9o76ZdvQC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaJheVAAKCRBND3cr0xT1
y0KuAQCH0PL37J21g+odOqRuxkI1ajvZ5pG1tx6CauFUmxJ/yAEAlDdo42Q9S1iV
dBWWq6MEIxQGbs/vE7vPeku1VcqFxA0=
=JMXI
-----END PGP SIGNATURE-----

--nextPart12931453.O9o76ZdvQC--




