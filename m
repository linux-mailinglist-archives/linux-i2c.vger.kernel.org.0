Return-Path: <linux-i2c+bounces-9442-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 745B9A3496D
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 17:17:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 775457A3E19
	for <lists+linux-i2c@lfdr.de>; Thu, 13 Feb 2025 16:16:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 124C91FE473;
	Thu, 13 Feb 2025 16:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bmOGSEgv"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC00824169A
	for <linux-i2c@vger.kernel.org>; Thu, 13 Feb 2025 16:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739463313; cv=none; b=Y+gA5gkMZI8Ftiufjr/X4rna+NdoPCawFMPn5rwJG9o77PlcvkHSA4+o+a5XGCxuXfHGcIYrA1MzBv3Yf41gF2LxRI9y3+MtIPQndCuJIrYWiQlKxn1AMSD4r3jgKkFiYRxbtqWJX7klVoGSGMYgFSeaVMVHO9JPbUqP3TL653U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739463313; c=relaxed/simple;
	bh=Xtu8WDPQHFE0nfu8De7jzGkDApIs7LU+ui80j8p9qmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WE65TLOJUnuJiV2x1vwABEYSFreWERkpICKzukSQsCCCQUc1KuzqbF4kFU60wkSuahD6cg87IBw0kl/fv88UjIyb7gz23Zcayx8fUyIYDGUER7Wky9jI2X48qzGc7Z8FdcOYhethFCluh758SR8au+zbwfkSPC+B5my1qiQkukE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bmOGSEgv; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=C51i
	iAHVT3vDNfkeqXUJtAutZGCOhAHahDQm3Gape3k=; b=bmOGSEgvInf30Ab23XEB
	ZSvM8t2hj+wuVYy+0VNcnl2Oqzij9O9BDcizEid1xrPe7k69gHAyEm2scxbZqtY5
	iHCIgL/rNquBKNnhD92Qp+/pw6Hzbme+/ha9sgDBuO/vfR0cE3ZhdidUjsSzzGBi
	HH/AYcXyAlBSg5R1KHj0DnwdeyUYE6LChTeciXONrf/E9LCdoh8E8WN3p5ywLVf3
	MaQsIqeSFs0UoYq8E3Kgjh25qSBKuBMmO29zVpKBOFlauXvSZAv76qAIjRYbM4Rb
	z4cdCofFbykqrJ9wRQmS+zEJwB5kRX6VxkbmGtX3F7C0gwESETI4YGk8Vq0hoQq3
	AA==
Received: (qmail 1940101 invoked from network); 13 Feb 2025 17:15:09 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Feb 2025 17:15:09 +0100
X-UD-Smtp-Session: l3s3148p1@TtimXAguZMtehh99
Date: Thu, 13 Feb 2025 17:15:09 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
Subject: Re: [PATCH v2 06/10] i2c: kempld: Use i2c_10bit_addr_*_from_msg()
 helpers
Message-ID: <Z64ajR7CSIDNmIKz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Krzysztof Adamski <krzysztof.adamski@nokia.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Kamal Dasu <kamal.dasu@broadcom.com>, Stefan Roese <sr@denx.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>
References: <20250213141045.2716943-1-andriy.shevchenko@linux.intel.com>
 <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lJSRca1oCsfvYLnD"
Content-Disposition: inline
In-Reply-To: <20250213141045.2716943-7-andriy.shevchenko@linux.intel.com>


--lJSRca1oCsfvYLnD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> @@ -132,10 +130,12 @@ static int kempld_i2c_process(struct kempld_i2c_dat=
a *i2c)
> =20
>  	/* Second part of 10 bit addressing */
>  	if (i2c->state =3D=3D STATE_ADDR10) {
> -		kempld_write8(pld, KEMPLD_I2C_DATA, i2c->msg->addr & 0xff);
> +		addr =3D i2c_10bit_addr_lo_from_msg(msg);
> +		i2c->state =3D STATE_START;

Any reason you moved this?

> +
> +		kempld_write8(pld, KEMPLD_I2C_DATA, addr);

Maybe we could skip using 'addr' here?

>  		kempld_write8(pld, KEMPLD_I2C_CMD, I2C_CMD_WRITE);
> =20
> -		i2c->state =3D STATE_START;
>  		return 0;
>  	}

--lJSRca1oCsfvYLnD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeuGokACgkQFA3kzBSg
KbZulg/+J22rNnR6Yu2i8QVlWFeEaAZKIv1ksHQrj0QpkW1k7ZiMG1gPZad043ax
Dn4VnOCgTDfMGM0tRO+RslfP8QwFNhi7vj6SNHq1b5AAzArl0EJMQJbxOku03Uw6
Rs6FZyjJd/9mdS64pjXBGpIrEqA032jxL0CgmMNZN8WXB4iJo4cUDkRnNHv8gY9Y
W0EPAKWpLDbDIHge/zTd+x547y7qQUsp8pV5+h2z6Nfgbd5/k27rE87/yxcTG443
nx0BtBAfODwujcrAhNXHyl/Q7eX4sImUOpz7wetHHAtIEioH3OOG4/D1Ggk1rtJT
eL3nlGxlIPJH0P1yZtvj++PTL5HYwXbCD7oTD6JEdy3+Lt9MXEpsKpTX6X9NNB3S
Fqz3Puo+Hd/2nPmJEIGuX30fKup7UO1a0b2e/AUoedNZGT1PpX8v/JIoqOvNU6I5
htn1IeaHh16BvSSZZQ57wbAXbv2Z52xRVH/bjO+HWT3TJ5yCIMeY1SWdfw1tZ6ri
palSy7QZgrvN7M2K+iymB+rhHrkDdHGh+NlgaEkW/kN2gDo/izjmQVFoXnH2vpMM
bADn9rxmbM6u3vVfJESnbE6sik3kSbykAj1E6JqWq9huA+vnGXmvbJL+jxTQNP8G
2G+F4nPACxsxrkJQIXA3m/1QZ6yZxp9KuKIcgGswsZpOLOlK5gs=
=eGZz
-----END PGP SIGNATURE-----

--lJSRca1oCsfvYLnD--

