Return-Path: <linux-i2c+bounces-9403-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F6BA32D04
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 18:11:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC6433A17F3
	for <lists+linux-i2c@lfdr.de>; Wed, 12 Feb 2025 17:09:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BC3620B1E5;
	Wed, 12 Feb 2025 17:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="EyMrtZpO"
X-Original-To: linux-i2c@vger.kernel.org
Received: from sender3-pp-f112.zoho.com (sender3-pp-f112.zoho.com [136.143.184.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C771F257AC4;
	Wed, 12 Feb 2025 17:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.184.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739380069; cv=pass; b=CpTazb3dCNiCOqiMmyOC1AYyfO3P8RByY8aOL2lQn2RmHxtRll3WEFhBroE+0PzEAcVgIXYoTj1aF4c/xCvaNYdwUOw5VVHQbpSkiS/x9MJ0oGejz1kcbRp+35sGTclMOtwGjfrsuK0M+XE8o4xc/6CIIxr603AhSK0CeECDhO4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739380069; c=relaxed/simple;
	bh=nhhahQOgZDxpp+QBhvRIURPIhgjWjCHcupTRpMriykY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8DwZZGiDNlLa/PhvtRFS0egUIgihLGzRo6wwShM4M/5jznNg1syO+URum6UsQo8VN11g2UoF9t3KXqFw5leiuG1S5oTVDHQG5Pgn4VAMRQueGLFd17d7HMXaOejAnpGB3BbbhLHqBIPRPiGh3jbNfjxu3VZBd0blkZbC95vHHc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b=EyMrtZpO; arc=pass smtp.client-ip=136.143.184.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1739380044; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DAkYrbYG6JOnxF9x2epwDkbVtFlxKX4+JowzFuD//wBUjr2V+qY3TKsCYBWiesuQj2V3CyVktnzy/EUa0PvOZmVcBZh0hToWmjzMgzQnMvklfV0ZZKe7nLCqR3zydavg2DasBGM3Ypht2m/InyvEZ1g77JSmmwp19YsiRsKH754=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1739380044; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=37KuZ1Zbs4nbeXoviq8dQ0cQlI5aaBPXUi7BgwxggTc=; 
	b=SMCYYQZUgo4VymRn1KOV5p5gDBMZfyyXiLRYwmbkdInTbzBp6qQQdfbO+CU3j/HuPn1P7eGMJKPSDEAK8R9JlBhk5zmDxuT+uzfKA6l6am/7dMFxz4nEETSn4hFKh1EosKwTH8zW0fG9qo5DzGWMiEj1cszDiAb8odkLvpWed8M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1739380044;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=37KuZ1Zbs4nbeXoviq8dQ0cQlI5aaBPXUi7BgwxggTc=;
	b=EyMrtZpOkmFYojm6PVbwkPpihec0f3ISZNW07VDk4R9UPXwrIbiuReAPaic6OOAG
	7l6HQnzFP3hySXSfLwMm17aPwgZe7DuhaY8NQc6vLT6RKGlsZ01kX5+sVD4TpgkIPqt
	+xsITVgfAjeugQCtVd/9czgvAZxJse8Yv/4FbJ+s=
Received: by mx.zohomail.com with SMTPS id 1739380042655954.4313143395905;
	Wed, 12 Feb 2025 09:07:22 -0800 (PST)
Received: by venus (Postfix, from userid 1000)
	id 818891807CA; Wed, 12 Feb 2025 18:07:19 +0100 (CET)
Date: Wed, 12 Feb 2025 18:07:19 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bence =?utf-8?B?Q3PDs2vDoXM=?= <csokas.bence@prolan.hu>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH v1 1/2] power: ip5xxx_power: Make use of
 i2c_get_match_data()
Message-ID: <hnfdjznbvqbstcqd7rgrukqqdv7uasexojnujz63qgjnv7pja3@z4lanwhk4i6b>
References: <20250212165012.2413079-1-andriy.shevchenko@linux.intel.com>
 <20250212165012.2413079-2-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxmyxe6cfjo5yecu"
Content-Disposition: inline
In-Reply-To: <20250212165012.2413079-2-andriy.shevchenko@linux.intel.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.4.2/239.366.89
X-ZohoMailClient: External


--kxmyxe6cfjo5yecu
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v1 1/2] power: ip5xxx_power: Make use of
 i2c_get_match_data()
MIME-Version: 1.0

Hi,

On Wed, Feb 12, 2025 at 06:46:23PM +0200, Andy Shevchenko wrote:
> Get matching data in one step by switching to use i2c_get_match_data().
>=20
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

>  drivers/power/supply/ip5xxx_power.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/power/supply/ip5xxx_power.c b/drivers/power/supply/i=
p5xxx_power.c
> index c448e0ac0dfa..717ec86c769b 100644
> --- a/drivers/power/supply/ip5xxx_power.c
> +++ b/drivers/power/supply/ip5xxx_power.c
> @@ -828,7 +828,7 @@ static void ip5xxx_setup_regs(struct device *dev, str=
uct ip5xxx *ip5xxx,
> =20
>  static int ip5xxx_power_probe(struct i2c_client *client)
>  {
> -	const struct ip5xxx_regfield_config *fields =3D &ip51xx_fields;
> +	const struct ip5xxx_regfield_config *fields;
>  	struct power_supply_config psy_cfg =3D {};
>  	struct device *dev =3D &client->dev;
>  	const struct of_device_id *of_id;
> @@ -843,9 +843,7 @@ static int ip5xxx_power_probe(struct i2c_client *clie=
nt)
>  	if (IS_ERR(ip5xxx->regmap))
>  		return PTR_ERR(ip5xxx->regmap);
> =20
> -	of_id =3D i2c_of_match_device(dev->driver->of_match_table, client);
> -	if (of_id)
> -		fields =3D (const struct ip5xxx_regfield_config *)of_id->data;
> +	fields =3D i2c_get_match_data(client) ?: &ip51xx_fields;
>  	ip5xxx_setup_regs(dev, ip5xxx, fields);
> =20
>  	psy_cfg.of_node =3D dev->of_node;
> --=20
> 2.45.1.3035.g276e886db78b
>=20

--kxmyxe6cfjo5yecu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmes1TsACgkQ2O7X88g7
+prvXw/+IS5011j3jLHnEFAOL+WcK3GZ8IOqt4pV/UXNLeHMZaCpKzWBERkIzbgo
Cy9rGs55BEE9mG2GnihcNerNCgV/i7hCMb3XRFE/nHWi5vS3M/IbPAN3AeDiDz3y
1RE3J3I1e9Ay0c2Cj49VE9hPibzzrNTQITZ+zIrIJaICYOnB1QGJuiV7tMaHTAxa
ASYULcyOJwbgiFHNOCvFa9cN10Xnpdm0xzunsuqIG9n+/uH4ogADmagsxzaQEsSE
rfxdF3WdjMi4utowcyyfCvcvlIHIGfWh6X1YbLu5IyZaLfE5XQUzaZo68T3ZM240
WGdBdtOsrfN5Ox8x3rhahmZGz7R6j6RVFN1ZKFDycKMWXgtDmqsAj/jHjHDmyl/4
mNk97kkjvJuvuLRdNT2MO1QEnwIv7Rb6fsrI+hEOyxfeAbQRtVrSoMItNwg3Y7vu
Ngji/29K33oL4vCZ7OF4nyMqFyEHr7Y8YKlTaWckcULqvGFoXs8g9QMW7VKI/rvd
9H5lYzKTVAxDGJp9lIO5THhY6mAdWcvUa08u1mNze867p5Ju+G3Za9hO3a4pMciC
+MYtVBDYdZnoT8W6uPSOSeDNmQZL4kASnFQQVG/glc+soPJvgOizrABGiP2JoJq3
RSYFAra7vcBh912ZOSFIQ1Kf3q3tgBZ0I/vXHTDoO/CAbHpt1jE=
=IrX7
-----END PGP SIGNATURE-----

--kxmyxe6cfjo5yecu--

