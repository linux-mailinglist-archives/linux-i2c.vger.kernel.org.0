Return-Path: <linux-i2c+bounces-5432-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 832AB953A35
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 20:36:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 394DE1F218A3
	for <lists+linux-i2c@lfdr.de>; Thu, 15 Aug 2024 18:36:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2B5357CBC;
	Thu, 15 Aug 2024 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="GmMBYAbW"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC4B3A8CB
	for <linux-i2c@vger.kernel.org>; Thu, 15 Aug 2024 18:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723746980; cv=none; b=rkOnZy/mMtBTj2jZUvTJDwVYYRsDZr6a6CBAWhlbvDkuKg9xLv+zGGnAZWNQglKllBPD+4FPQfYFua8uN7Fz5K07GksYT7MBNnUjKxCMA6Fw5XOPh8A99INydX9h8yOoabPViFi8mCa/oQoltS4hO338ytKdz1ewriKSIpAEEf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723746980; c=relaxed/simple;
	bh=KhIzUyHW1AxqaXhoYB9qjz4xjKfFqKl+AsLLUWeOxFc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y1HSDOwbwYaApyCQGiE58+JOhXnPm8RcK0a+eEtNKKhDJZY7zbF/zKoRPArmr5HAif+G7WagtS+Du+6rCSP/cxnny04YjrdohfehB5GQF00Tfhq1AMP8nl1+2a1rVpDlSUFeljuD2jMYuPPGNmFBRMhoXCF69V8WvuHrS0tctAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=GmMBYAbW; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=vUs5
	/orZo4Fk8yuKSG+tTg8UMv+u5QuGJJbyy0pM0v4=; b=GmMBYAbW2i6yxQThZRnA
	8TcF6v4aRGGCemXfQyWO9sBxnXmcFA5m9Khm8OiDxVDKm3B4kzKQVLSbDo5pYIH6
	l5QKEmA+LEyRnNpqqZPSq13FnPq0xlc+Gv+j1td4mUhDyxOiyNogcUVOmaj156V8
	uTKyK9SSCsVNJAu/K5Tes5m9DfTA0SQPKzsv5wS49Cz7lKc3YlnfZ5gmaN8ONjNJ
	Wq3rxu6UHTHIHa+n4PFpoTww7MFKI6/zQIWznl+141uJPwPt3Ic0EgUQzqS8vaPX
	IcZwvcksgkCQyPcuozXji+CXQSanElM3Ocv6JG1nsDsF/PDj1yj3C1tmEmz8Vugv
	+w==
Received: (qmail 2370641 invoked from network); 15 Aug 2024 20:36:13 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Aug 2024 20:36:13 +0200
X-UD-Smtp-Session: l3s3148p1@1zMHHr0footehhrc
Date: Thu, 15 Aug 2024 20:36:12 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Rob Herring <robh@kernel.org>
Cc: linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree-spec@vger.kernel.org
Subject: Re: [PATCH dt-schema 0/3] schemas: i2c: fix "smbus_alert" handling
Message-ID: <Zr5KnHR-Qjukqt8K@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Rob Herring <robh@kernel.org>, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree-spec@vger.kernel.org
References: <20240815120935.5871-1-wsa+renesas@sang-engineering.com>
 <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4Bv/rem0dk49VCmU"
Content-Disposition: inline
In-Reply-To: <CAL_JsqKJRhq9UzsjqbOAam0GSkm4R7m82FZ0zzYFp-mY2HS+Yw@mail.gmail.com>


--4Bv/rem0dk49VCmU
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >  error: Multiple top-level packages discovered in a flat-layout: ['patc=
hes', 'dtschema'].
>=20
> Do you have a 'patches' directory? Not sure why that's a problem other
> than python having specific ideas on directory structures.

Oh, wow, yes, I had a 'patches' dir and that was really an issue. Weird.
Thanks for helping out. I got one step further, now I get:

  =C3=97 Building wheel for pylibfdt (pyproject.toml) did not run successfu=
lly.
  =E2=94=82 exit code: 1
  =E2=95=B0=E2=94=80> [14 lines of output]
      WARNING setuptools_scm.pyproject_reading toml section missing 'pyproj=
ect.toml does not contain a tool.setuptools_scm section'
      Traceback (most recent call last):
        File "/tmp/pip-build-env-5v1x378l/normal/lib/python3.11/site-packag=
es/setuptools_scm/_integration/pyproject_reading.py", line 36, in read_pypr=
oject
          section =3D defn.get("tool", {})[tool_name]
                    ~~~~~~~~~~~~~~~~~~~~^^^^^^^^^^^
      KeyError: 'setuptools_scm'
      running bdist_wheel
      running build
      running build_py
      running build_ext
      building '_libfdt' extension
      swigging libfdt/libfdt.i to libfdt/libfdt_wrap.c
      swig -python -Ilibfdt -o libfdt/libfdt_wrap.c libfdt/libfdt.i
      error: command 'swig' failed: No such file or directory
      [end of output]


--4Bv/rem0dk49VCmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma+SpgACgkQFA3kzBSg
KbZkEBAAj3dPwUldZB4PLdN8LQ8wY1LD/Xbba8eUX6UyZeI4cdXOe3bW7qN+s6Fd
vuCAb6wmKzAeHWDj4qYkPR9b3qxkaWU4Gu+2oRugIMPXModeeaHMCqZaDnCfKQeB
xGnd1n9fqq/BVxSIq4TSt4rKgKYJy1Nst6Vl9/FHZociooGq1g1fGr7xtkSwl49z
NvTV3kH+yCgoy2Vwwsl/LKy7cCRPhGTZ2q9/lQrr9Z07DNqi4T5bLPa4taUgYQkx
PlM6B+2NLvRWUDDFcT714YKApXJrTSXUX81Mu4W9QSW3OWbi2RM6TuanI2oD4+nI
T5SxSfsWcMSUNCwzxtRoiN+ePflOoXP5g0D7I56sgUxdc3hu2nIaBfq/9Sw+Y7gs
wlgzbq5V6EaG3J0GmTGuu69MTDdP/mdevbjKAhy61clxYLiOW2w5Hzx2NOv0Rbio
cR2TJfLSvQcnR/UGK0y97F97USOnShOxQIiZzIZt+gkGW+NGlbrC4X4vzi+cn4Bw
68c7/N4e3u2yNgAIAzbUcUbrMk7Gc9HwdjTlPtZl3d8LHhlYgLy9/YupFcKHnXIj
GoMRKwkrbR5LmTIh63ohJarlpUNyefu5Tm8ITJ5JFO9H4gboxP33v8m6OdPgf2ip
FJeRprYfzR74/Gx577ePDXxgrMwSR1RJOlHMSH0ieao/s12jyHw=
=i6+Y
-----END PGP SIGNATURE-----

--4Bv/rem0dk49VCmU--

