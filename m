Return-Path: <linux-i2c+bounces-5083-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F39D93FFCD
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 22:52:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE1B8B216FF
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 20:52:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EAFEE18732C;
	Mon, 29 Jul 2024 20:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UZPB3l3h"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 884F3131E4B
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2024 20:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722286336; cv=none; b=iKpFhlPTHvokHHFoD/khTfnLdBvlqNFebqUDI6EULZSAJC8F99CEZVna2XveuyQ28mjE1dewozTimPqX3Aca0qqcUoKczALL4SMSjhP25TmU0ohmrO7+4GUIxZEyMbIeZ0jwlYHB7C/Fl+WNGmu0nVW6/GLkTFPVD25Fm9JlW8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722286336; c=relaxed/simple;
	bh=Ra1T5q4RNazRGN8kU1OO8fgNtI1jjkVQcxvAH+SiBTg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DxZ+uvhBlu+GBZYQvNxNIF9ICONscK0kwhSlDaxjX1ftExRzlmwk+WyIjiRzKPiuOobdn9Cs7t5OpQef6hX8GGi8pPBBdMjeCO/ukzga31dskKvODcZo5TL3CuKmn4UZ2xoXFMx17pTsoWb4Ag8hxx47jo6leheT9RKemEVnjY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UZPB3l3h; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=BDCN
	a0vDyLIBvZBo2xSTpcs0HzDlyX3pc8pgUvgJSNc=; b=UZPB3l3hdotF+X4k6YUd
	r9OaXaIVn6AjlDwdC6kZ/ppKg766uTU/69Z/zg1rD+jhuKMZML08Z1q1DFtm9RsT
	/WoctJ2KkNa80i47nwm5N4M8h141zzod7OLHgUypbEETYaicdLsXVSkD8OdnSkSx
	XRRqaJU3GKTeJBZS01T0uEiR9BdKe+mCVckT9pDPT902zZTnorvQe6gE87fZbo66
	9pkQmI5+5FH7+pG2VGfusXDajchRsSQ72Qdmetg7HepLbiP3wDx9RqB4a4tudb/G
	CVm8eUMskVYholImeaRYVopeDCm0uDr2k6LChMHEycVTdp0wQ+VJbKiK10quYTdz
	Qw==
Received: (qmail 13399 invoked from network); 29 Jul 2024 22:52:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 22:52:09 +0200
X-UD-Smtp-Session: l3s3148p1@O6rcCGkemsEujnsv
Date: Mon, 29 Jul 2024 22:52:09 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
Message-ID: <ZqgA-Qo8bccaouUr@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net>
 <ZqakaAn3f9Kg6Lgy@shikoro>
 <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
 <ZqdLVg6IVTjsTWb4@shikoro>
 <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>
 <ZqfhPffOTu53bfwU@shikoro>
 <c58ca576-2763-4f73-bc0e-c33677c5228b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ag7yFxqGCLrZ6wGF"
Content-Disposition: inline
In-Reply-To: <c58ca576-2763-4f73-bc0e-c33677c5228b@roeck-us.net>


--Ag7yFxqGCLrZ6wGF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > The code I am suggesting is bascially yours without the retries
> > variable:
> >=20
> > 	status =3D device_for_each_child(&ara->adapter->dev, &data,
> > 				       smbus_do_alert);
> > 	if (data.addr =3D=3D prev_addr && status !=3D -EBUSY) {
> > 		device_for_each_child(&ara->adapter->dev, &data,
> > 				      smbus_do_alert_force);
> > 		break;
> > 	}
> > 	prev_addr =3D data.addr;
> >=20
> > Makes sense or am I missing something?
> >=20
>=20
> Yes, that should work and is indeed simpler. You are correct, the
> additional loop should not be necessary since smbus_do_alert_force()
> should already call all connected drivers and hopefully clear
> the alert condition on those.

Great that we are aligned now! Do you have time to rework and test the
patch?


--Ag7yFxqGCLrZ6wGF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaoAO0ACgkQFA3kzBSg
KbZ6rA//ZqjSGMho4gLtYLdACdEGezVn5VWki0NOdLTh5zVXLtYS7ri3Jn9rysn9
9B1KxK5nI2XFVAbtjDM7PqVFLHLsbXFwun26jLFXUWu1XF3Uisz+TQ/1Epica4q+
08AJWlGkZtgNI4BCJiPYBcSkbh5hsh5A+8fde4dQvKezR6jcVwwSexYwWs+Os0b2
gDLCaKuSoScUNlGMpWzU9mnY3BlpAUeEDLs+9ROmvSl5FU5ngbHgFxW35SSxQ+HI
+kAAku5WRRmzQOyqmRV4ljVA0CzQgQMrIf7Vh2hqrJhVC46EenNcURoqUG3WSWYC
jW3o6myO7CNUj1BynzPWGd8tgEYetEewxjB01fRGzKFHStVrKYS7CQvZdev8lnnJ
+GjY8Ey/pqRe+rGiEUUb/tnTbQMP0IABfOBE7mRPjFBOQ9jxAkrYFeO0Kjnf0rtx
PlFXYV2D1Gg1/w5vC2nvdlM5MCripBbD3LWybCfRcNTycGOmYSfOyLS6SwcO41JQ
yJw4Vm66x4tfdh18HkghlFWqNXaVD2DdZCDBSy0WRyox40Cjk5UbvGDlb1Mk4LSa
uKc9rrr4pjH14hI32wnWduVP8Lm+KORa6Y33hz5DIffXvIJOiRqIA3zxu0/Pq7Mr
BDC/YoUi45iKn4dRgggxd3s+cHvYbbnUl2xhVw0GSAGb4jit23o=
=MU2X
-----END PGP SIGNATURE-----

--Ag7yFxqGCLrZ6wGF--

