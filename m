Return-Path: <linux-i2c+bounces-11521-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFBADFED2
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 09:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 495FB168837
	for <lists+linux-i2c@lfdr.de>; Thu, 19 Jun 2025 07:35:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A461325229E;
	Thu, 19 Jun 2025 07:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="cElNEALu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D96F7248868;
	Thu, 19 Jun 2025 07:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=68.232.154.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750318503; cv=none; b=iJD/JG76TlcWsfkOY0+kZ/Sbda2st9bJGW9INh3XYTpnMfIB79r7R250hhYHs31MBlkprwLvHHeSHmJQ+X6IKjOCR7p1fdnw+EMa0/5vjfEL5O8PUm0xAYyV7+bjj555D1e/04kkgzmBEOqhQgZRwJyzZrAnUslljqKZPBCQJZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750318503; c=relaxed/simple;
	bh=aH4MYI7c3m+ShgBRS97B9wA9VDRXLN0Ik809nqZTBM8=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qFikTPO8DOeVIjz+U9iRMtUAnnf8glLlQXDIQWn25pG1doqZnHxr6Hy/a2nhA/dMwRRHTgOtws+xxV9FEWL1BIkCZAOe6gsdU+uMtDH4RF/qu8PjZ9PeR54vBmIeku7i55lYi6+sWM5piPO2unrTZW2t2Nx9TUte1hkgjMXgRdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com; spf=pass smtp.mailfrom=microchip.com; dkim=pass (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b=cElNEALu; arc=none smtp.client-ip=68.232.154.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=microchip.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1750318502; x=1781854502;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aH4MYI7c3m+ShgBRS97B9wA9VDRXLN0Ik809nqZTBM8=;
  b=cElNEALuIza3Y0lQhADHm1FV6F3FXCmOT/CfN2ZtcmrdmKJ4kI+NSS7O
   HaezSHZ9gv/fXjDkh3pX+lzFKDA0MzUXV6Fo5L24/LuEf1UGi7yNllLaJ
   4eVcHsxQZGREKcJU5Lp/PFtY/PgbmC5XzzlMkPoyQA0yOBi19dRL8WKgV
   eu9oo4WXJhOnVNT+5s1EdgojMVsmWUbEYBAx+MHmrLsKtuKJn5fPHvFxG
   +cZxfGTsphKvUfOkZ2VOmd/JnLc85jkJLrV/jeHrs2Mp7C587rg5Zq3Da
   2B/fnBjN4yqDuysoiigqw6Gy4W7tCJ8ZdiBk96bA0xsf45/yr3yI8GKjN
   w==;
X-CSE-ConnectionGUID: Okrbc+Y5Sn2HmFwBqXV6bQ==
X-CSE-MsgGUID: gNNiB0ORS/Sg5ekHcFUhbA==
X-IronPort-AV: E=Sophos;i="6.16,247,1744095600"; 
   d="asc'?scan'208";a="43566381"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 19 Jun 2025 00:35:01 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 19 Jun 2025 00:34:20 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.44 via Frontend
 Transport; Thu, 19 Jun 2025 00:34:19 -0700
Date: Thu, 19 Jun 2025 08:33:10 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Alex Guo <alexguo1023@gmail.com>
CC: <daire.mcnamara@microchip.com>, <andi.shyti@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-i2c@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: busses: Fix out-of-bounds bug in
 mchp_corei2c_smbus_xfer
Message-ID: <20250619-jubilant-nag-c50bdebdac0c@wendy>
References: <20250615234919.525431-1-alexguo1023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JByXUeaN4Z+QSMXa"
Content-Disposition: inline
In-Reply-To: <20250615234919.525431-1-alexguo1023@gmail.com>

--JByXUeaN4Z+QSMXa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 15, 2025 at 07:49:19PM -0400, Alex Guo wrote:
> The data->block[0] variable comes from user. Without proper check,
> the variable may be very large to cause an out-of-bounds bug.
>=20
> Fix this bug by checking the value of data->block[0] first.
>=20
> Similar commit:
> 1. commit 39244cc7548 ("i2c: ismt: Fix an out-of-bounds bug in
> ismt_access()")
> 2. commit 92fbb6d1296 ("i2c: xgene-slimpro: Fix out-of-bounds
> bug in xgene_slimpro_i2c_xfer()")
>=20
> Signed-off-by: Alex Guo <alexguo1023@gmail.com>
> ---
>  drivers/i2c/busses/i2c-microchip-corei2c.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/i2c/busses/i2c-microchip-corei2c.c b/drivers/i2c/bus=
ses/i2c-microchip-corei2c.c
> index 492bf4c34722..a79d4d327f20 100644
> --- a/drivers/i2c/busses/i2c-microchip-corei2c.c
> +++ b/drivers/i2c/busses/i2c-microchip-corei2c.c
> @@ -492,6 +492,8 @@ static int mchp_corei2c_smbus_xfer(struct i2c_adapter=
 *adap, u16 addr, unsigned
>  		if (read_write =3D=3D I2C_SMBUS_WRITE) {
>  			int data_len;
> =20
> +			if (data->block[0] < 1 || data->block[0] > I2C_SMBUS_BLOCK_MAX)
> +				return -EINVAL;

Seems reasonable, but I'd like to see a blank line here after the
return. Maybe Andi can do it on application?

Acked-by: Conor Dooley <conor.dooley@microchip.com>

>  			data_len =3D data->block[0];
>  			msgs[CORE_I2C_SMBUS_MSG_WR].len =3D data_len + 2;
>  			for (int i =3D 0; i <=3D data_len; i++)
> --=20
> 2.34.1
>=20

--JByXUeaN4Z+QSMXa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaFO9JwAKCRB4tDGHoIJi
0oORAPwOMF7HJ4ncK8AJdngYGaRq0iU6yc1gSpPtOdeH4MjGdgEArIT7bXuTG9EK
znXpn8yenjNsLNWz4BhevGHIXt2A0gA=
=VSNl
-----END PGP SIGNATURE-----

--JByXUeaN4Z+QSMXa--

