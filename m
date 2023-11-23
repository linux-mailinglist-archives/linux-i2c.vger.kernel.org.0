Return-Path: <linux-i2c+bounces-429-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B47377F6893
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 21:59:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 688102818FF
	for <lists+linux-i2c@lfdr.de>; Thu, 23 Nov 2023 20:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70B0B14F65;
	Thu, 23 Nov 2023 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kLcF0P6n"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA5411C85;
	Thu, 23 Nov 2023 20:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99BE9C433C7;
	Thu, 23 Nov 2023 20:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700773157;
	bh=fzFQNEVb2RTd/2hgefW8AJx6r5bO5f5czC0GY5xmZm4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kLcF0P6nT4uwAHgGgE9PFkD2FGWCBE1fJtSuNUA4RisdNx13IeUItQDbEbvBMtWM1
	 wElwLiCbiU+esRnbjE0xu4i8+0pcXhr9vpF4krWeWfCle9SBudgjwuWsA5K45DofJ9
	 DWegvBz2+8y0cb77a4jMtfMfi3zHl/3hrEXqAZwxazc/Hkenr2zzLk/VwhKQDstPSP
	 IVRvjzW5cdOy3xXVnNWyALdbKpVeAtc3owK9M1ZqGLbZsae5LtyzAPFy+1d5ipyyEg
	 XLLqNSPNqxm+YI9wm3OyEpA5B5rscmda3wvxidUynxxuAsJibVmnb29EKY4hkzbkN7
	 YYJQfB4GWqMiQ==
Date: Thu, 23 Nov 2023 21:59:13 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-samsung-soc@vger.kernel.org,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] media: exynos4-is: fimc-is-i2c: remove I2C_CLASS_SPD
 support
Message-ID: <ZV+9Iauj5y7q8R6H@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, linux-media@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	linux-samsung-soc@vger.kernel.org,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <e4395454-c500-4d76-af74-42e29d4b40d8@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3nbfQcUlVqUy3AsR"
Content-Disposition: inline
In-Reply-To: <e4395454-c500-4d76-af74-42e29d4b40d8@gmail.com>


--3nbfQcUlVqUy3AsR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 08, 2023 at 07:42:37AM +0100, Heiner Kallweit wrote:
> This I2C bus is used by the firmware only and it seems I2C_CLASS_SPD
> device auto-detection has never been used. So we can safely remove it.
> That's one further step towards removing I2C_CLASS_SPD completely.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

As I want to apply this cleanup early in the cycle, could we have an ack
for me to modify this subsystem via I2C, please?

> ---
>  drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c b/dr=
ivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
> index bef6e9b4a..44363c424 100644
> --- a/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
> +++ b/drivers/media/platform/samsung/exynos4-is/fimc-is-i2c.c
> @@ -57,7 +57,6 @@ static int fimc_is_i2c_probe(struct platform_device *pd=
ev)
>  	strscpy(i2c_adap->name, "exynos4x12-isp-i2c", sizeof(i2c_adap->name));
>  	i2c_adap->owner =3D THIS_MODULE;
>  	i2c_adap->algo =3D &fimc_is_i2c_algorithm;
> -	i2c_adap->class =3D I2C_CLASS_SPD;
> =20
>  	platform_set_drvdata(pdev, isp_i2c);
>  	pm_runtime_enable(&pdev->dev);

--3nbfQcUlVqUy3AsR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmVfvSEACgkQFA3kzBSg
Kba9cg/9Emy0WIcCoC6cx972s8jNlNRyUuF1xI+QKrMxzxPZZ4gu0I01owVdXPJc
euQ/b17W/wHWhdcQeWA99K6ZxZTb32Md4LovfGvhXctZ/nEECQu3aoJ6udxIc2GP
jerDU92lFQDtGG3JnmU5EYVVrDugq4nMR6kPwSgGOPwIIz1E7rMxnSKwUIfVK7Pk
BPM5T1wTzz2AZtpkrILa3mTIAuwIHuToJcCqEoneQ+H9w4QKj4LM8C98SCc/vWh4
LYXP63mOxALBp/FbNfqinJAidlxuKXtBQjV1m7D9dokrh5ypknxPK5aRSLDknCey
tHIQlHUkoU1czUj/CVbj4335sVVCKBSXCa87O8TBGRNY7/29GbsyHPSHj6xQcGQ/
Y/uBBFpSnYWsx776WyEuwzQkDIE7TraRjCSHoCv5y5MxbiyHrxwxtP0FJDYeuEtJ
G8khmdswxnTx8w89+JN6EUwk4XrR/7y/p4EplCMZayhRsoIfnES+XmYhQOFT2H5R
l8iPET4bnCK6c8Uy2+hU19XlfsSBUwA4qZkCt0eeQJ0I5xybQGyoKbtkdwmIQxXA
kN1ZL9Z5xUvFgDtJES4RiCMOndCU7KqfqOeF51VqPZKMB+c1aPvWsa1vuKbPGJ45
WNPdgIWmnQ1R3+1jpTKGzGmvbe+AYAIR60mI7UlHNkn8I9cA4Lc=
=dGDK
-----END PGP SIGNATURE-----

--3nbfQcUlVqUy3AsR--

