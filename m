Return-Path: <linux-i2c+bounces-14316-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D51C8D963
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 10:38:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4F99B3AF045
	for <lists+linux-i2c@lfdr.de>; Thu, 27 Nov 2025 09:37:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 552CE329C7D;
	Thu, 27 Nov 2025 09:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ch5sPwdI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7482427FD5B
	for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 09:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764236271; cv=none; b=NthQrDmZykyWaPaAFvJAkkjAUvrqUp/0D24Csp+tm9B4qcn+w8SnxHCljwev1xYpiEWcPrHHTeDY/2CUdtcRQshXvtsMQrussWPgZHMjVzKP9dVkp4MycCayYSVmNvWTNk/Vxzh3Ybyk9/i1ErWAYXxzTDTCJaJPa3RmAg5UWfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764236271; c=relaxed/simple;
	bh=9LmyuC/s7oRdVikZDSpF2fV1icZX6r5JHOPL1xkJJ0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BpCUzjRNx23pjp0Cd4/oxqrTK14L+OUoh8WtK5LOIX/mIm94nyPU99GlVtMsxI4UEPLtWh+cvzrzXCtqrBFiOQHQzVx1dDAFoyqDoB8ZjK4Eb5Xzx9yw5/rM2HwnLIN9ygUjXEK7tplkLW1jQxfw9D89hZR3TXKsSA/iZeSZe4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ch5sPwdI; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b735e278fa1so142209966b.0
        for <linux-i2c@vger.kernel.org>; Thu, 27 Nov 2025 01:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764236267; x=1764841067; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+qZLiNYJlfS3mb4AeFT1CN4qD2558qTiIMjfDrC2qtE=;
        b=Ch5sPwdI+AVfVw606YGZuyPmh6TWbcD02E0UsvrbZ3LXSeKv07As0YsJE9CNDLeD1o
         nBHSportX0v+q6/UmiJxUlcHrCIaUg9Yhux/1R2KRbp8ohIdnvdy86tUzN/jN0baqhjT
         xhIN58AYIVbYgy85rPfIFppGuBhZhhRUkL93Qbn0yox3DYxp3vxCqn7Dlm8FTrfuRZK1
         348lTRjs3Tlk9e8CWa3m9IeZO47aNE7wv3nmW/ej1VKv0803HwPe9nz5TV0Y+RXJO4GH
         dnXt340/YTpp106CDyOZE302Tydv/Phj5zE6Lo66xgjzcwtQ4Ioe9JAWIscc29l6iCo9
         S7FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764236267; x=1764841067;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+qZLiNYJlfS3mb4AeFT1CN4qD2558qTiIMjfDrC2qtE=;
        b=W1h3S378N2kTfkgaeQXsUzuxIS/3OXMeRUmey0P+10C5rPUu/cNVHdpyOiGyrFhU5f
         9nJd40UfMptgNdyLE2h4Qn9tOo/UEd3IU0go3EjKz83V++ruswEn0BtktH+9Ni9Pst7k
         eovDZuQ3XMSrDVBPRZy2MwVPGlK89ixAkbAMrfbxZ/VTf1QLXtjK5X329MlD0sXgSMe+
         yzDBmDru9xy7y9fd6dsd2UtkHVvsEF1fB1SflrH4xI/1zoaFHRm967PW7SUSVYjOJI2Q
         t9D0vqfU2OyeBWI4W3lO1BhGhI3QD99cYqPpsSAy1mwfs1fbsO1+XjeOct4fo8FumPOk
         DnZA==
X-Forwarded-Encrypted: i=1; AJvYcCUj3TEH9honkaFHKXdPPwvAr/4vMf2zJqMqnpysQOrp+AZBE5N3ly1ODu2X/Lt+EQOm6hsl+XbR+Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdLHp2saqp+G2EBWWooXE7LSAt4eN5TbPTEgZb4Zmt8qsR1rsG
	7TLnDdWZZVMOlzAJirlQjzTZhMp2oCHZ/YKnLSM0T5kuYRktUXC4r0NHekN3Uw==
X-Gm-Gg: ASbGncvLTtlf+gl3Z7LU1oBTEgi7gjDdOsakREmcM07IH366eoxltvMrbx3nee4qVqE
	iiJrTDTv8Bg9ak8kWcTdakEc/IF7XvSABZQA6n2L0KDF5jcdbwhIQq30OBvwB3LkYo4UrnD6xAq
	lRH2BsuRseMBZMHy7iwIj6Ud0fm8HjgoAj8ge30csDIJH7iCFu2Kpy0KOoLNbAQfV/FJ8v1vXOs
	zoOUsvRGTILdCYr3op6bWNpNoJsLhbdc3McGDnPp77G4Wg/lb9QXD5ctNcEhJtrje8dVPcbPEPV
	r+HW/eH0Y5HJEI1zakGHxiq8nHVrG7FavhM1yLFnsNg8h40CmcGEZaO8u9qHyw3UjNsFHaOtRDy
	+RXXAD6gwcUG9lQ2sWv0KlZiLrMgVvdG9KX5kZc3VnZRA7EvsxMnRxZIxEzgVSfAW+hdwh4wE1C
	gq6NT2SvuDbFc64Hp4dlmFuyZmR4S3m5u8t5nETGyemvP3MfKHfWBHFDmMp3r9sNpgBXM48NsyB
	8Xnk3BCYE1eEssY
X-Google-Smtp-Source: AGHT+IF/UVgvMjdB+KUKiW+HjXKxDlZdBOQy/4DVqhoiv1NHoHtHvjilqqvuAhJ4hwIhw2OcyLYXxA==
X-Received: by 2002:a17:907:7e9e:b0:b71:1420:334b with SMTP id a640c23a62f3a-b76c546da4bmr892897366b.8.1764236266421;
        Thu, 27 Nov 2025 01:37:46 -0800 (PST)
Received: from orome (p200300e41f1abc00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1a:bc00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b76f4d533f2sm120777866b.0.2025.11.27.01.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Nov 2025 01:37:44 -0800 (PST)
Date: Thu, 27 Nov 2025 10:37:43 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Akhil R <akhilrajeev@nvidia.com>
Cc: andi.shyti@kernel.org, digetx@gmail.com, jonathanh@nvidia.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	wsa+renesas@sang-engineering.com, wsa@kernel.org, kkartik@nvidia.com, ldewangan@nvidia.com, 
	smangipudi@nvidia.com
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
Message-ID: <rf7m5rwnz75ft65zxy27fmndoxo6cc2hckbgzfltzyz27zt24u@n6hmqstpp6pk>
References: <20251118140620.549-1-akhilrajeev@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="o4pnpg6sftsfo7qr"
Content-Disposition: inline
In-Reply-To: <20251118140620.549-1-akhilrajeev@nvidia.com>


--o4pnpg6sftsfo7qr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v13 0/6] Updates for Tegra264 and Tegra256
MIME-Version: 1.0

On Tue, Nov 18, 2025 at 07:36:14PM +0530, Akhil R wrote:
> Following series of patches consist of updates for Tegra264 and Tegra256
> along with adding support for High Speed (HS) Mode in i2c-tegra.c driver.
>=20
> v12->v13: Update has_hs_mode_support to enable_hs_mode_support
> v11->v12:
>   * Added two more patches to the series which are needed for Tegra256 and
>     also cleans up the timing settings configuration.
> v1->v11: Changelogs are in respective patches.
> v[11] https://lore.kernel.org/linux-tegra/20251111091627.870613-1-kkartik=
@nvidia.com/T/#t
>=20
> Akhil R (4):
>   i2c: tegra: Use separate variables for fast and fastplus
>   i2c: tegra: Update Tegra256 timing parameters
>   i2c: tegra: Add HS mode support
>   i2c: tegra: Add Tegra264 support
>=20
> Kartik Rajput (2):
>   i2c: tegra: Do not configure DMA if not supported
>   i2c: tegra: Add support for SW mutex register
>=20
>  drivers/i2c/busses/i2c-tegra.c | 304 ++++++++++++++++++++++++++++-----
>  1 file changed, 258 insertions(+), 46 deletions(-)

I really like how this looks now. Thanks for seeing this through.

Thierry

--o4pnpg6sftsfo7qr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmkoG+cACgkQ3SOs138+
s6FrPg//ZV7UbYm3KX7weTtDnjK2YaMsOBxQEUU+TzHDukwCuR73d73aIyLSetza
KiB2X44lMt2ULvw5aXTlXrC3+ysJk0HjSDlzFZQptP8Yt0r4B2Gd/yZlGYsgT0BJ
+ftmSXDG6Hza2368SYj3qcpBSeD/HMSoUzZfqSrPmpCGnjHmoxCuTl+J/RMVJFk2
vuAqBvY9KNJYZq93KRE8pjE9yufLiZeBlmM7b2Zng5l6f3WcEzmJ2joEB4h98TVi
0H9gLPC3GZnNrFGocFRj3mRLjkINoR5x9ft4SM3CsBCsRLzqdaODn6qSL8SlliBh
HZ2L1mX4U6dqzgwQuiHnzr5nZc2pE/lr9/bHFhWxDs8soBFot6HLrTYMj+ddZlcB
0X0OvVU8aJEgBjI6XSvCnJB37686lyXrgA7pVr7Zj3xLhUB0so2du6Hp3dVpoHAr
TkNbAMpmoLn9KjQ/o2+RZITvFM/3Ji26Ct+l/IWJ3f7Mz4Lakh7kicl7xDW3KtD5
fo1kt20i7qdEOUQWadsYhbM/DgmjciZEzIKSb9GFp9+kY9I7stsbyD9WnEW85h4K
s8ZYydzo9BwhkMIRaB4DtaY87uqSJHqxHPHFCbErFMxza2hp0h4fh2Xu8736SYzn
3MISZmXLIFGG0GUbjfTavCKNf8ybTTdkT5QK93z0+U1zy6W1sVs=
=kflr
-----END PGP SIGNATURE-----

--o4pnpg6sftsfo7qr--

