Return-Path: <linux-i2c+bounces-9126-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE693A140CF
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 18:23:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 88B413ACA3D
	for <lists+linux-i2c@lfdr.de>; Thu, 16 Jan 2025 17:22:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC4CC234D12;
	Thu, 16 Jan 2025 17:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RaM18p/p"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6D5232424
	for <linux-i2c@vger.kernel.org>; Thu, 16 Jan 2025 17:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737048048; cv=none; b=SevdDTaOiX8QB8hrNtewffAmM4uCVoA0XWYIMAnbcc16avuNYhMnWm9lTySMHr4w7IXwji6u+tMmDb8cvosfh3a8JP5p2hlU5Ya1Tb6jRY7Bg0TVXhZ3hYGY35/eowrr0jSGEzZB5Gr3nQxC9ynR0hgnmhypSYVFcLsbNCERKyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737048048; c=relaxed/simple;
	bh=ERjLcB+aufRzL09jSvXfXF5aCF0XOCuMm+6wPAVJFbU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u69Zq4bMM5tqk7BMcYlFGB0Q3FjL4tfcmU8yQudCAt/VrT3kvJG3AseqkMTeS78XCIlFVcedy2pk8CtOClvH4t6aM8ko0WCbvcRylQrn1zMjHYb2mOxROsUXRAx26Sk2yzMjgXFuPQ+T85p1SXVr8f8Ec9bO9wi4qqLI3eZWLuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RaM18p/p; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ERjL
	cB+aufRzL09jSvXfXF5aCF0XOCuMm+6wPAVJFbU=; b=RaM18p/pAxDZCdnKDTmi
	EpP9ZHbBkYvpEtUkYRjXfabjcR+JK95hx+xeDSzr3ssvJqsUemGNSFWNbL/bDEUh
	zhuXWm+A3/WyDGD/os4yu8jX3cKDijfbiTP04WQtdfz1RjgpFLmrQ+IiFT6jBWh8
	FHZ0v0uZHBFF9o5KQo3Wmh1lMOqxqdxYopaHaBPbWl7lIBadw9ronWzW0ik6Wm+u
	z7+4M8A1nz3kUO6V9PcC3f5Zvmi1OGrvMVYETGFriVI8a6ngkqvfZ0i5ICYCDnMa
	C52H6JkYO4LnrfS67jLBlby8osDXilTcLr5PGhGxSHr5W3rGRML1IBWI4cXUwXfY
	Aw==
Received: (qmail 970185 invoked from network); 16 Jan 2025 18:20:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Jan 2025 18:20:44 +0100
X-UD-Smtp-Session: l3s3148p1@SqakA9YrapYgAQnoAGFKABs35iVLDC7C
Date: Thu, 16 Jan 2025 18:20:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: testunit: on errors, repeat NACK until STOP
Message-ID: <Z4k_7A5AFISEu2eI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20250115184609.1844-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2ha8DWP58p5FmMGn"
Content-Disposition: inline
In-Reply-To: <20250115184609.1844-2-wsa+renesas@sang-engineering.com>


--2ha8DWP58p5FmMGn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 15, 2025 at 07:45:52PM +0100, Wolfram Sang wrote:
> This backend requests a NACK from the controller driver when it detects
> an error. If that request gets ignored from some reason, subsequent
> accesses will wrongly be handled OK. To fix this, an error now changes
> the state machine, so the backend will report NACK until a STOP
> condition has been detected. This make the driver more robust against
> controllers which will sadly apply the NACK not to the current byte but
> the next one.
>=20
> Fixes: a8335c64c5f0 ("i2c: add slave testunit driver")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--2ha8DWP58p5FmMGn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmeJP+wACgkQFA3kzBSg
KbbVFw/7BQRyOueHPeFRTjo/MArfnIpwGk9z8cN3sy/KEv91N1L83mxItFQk8LCz
PDAbdYRx2cWCu9CVHdlUt7TuTn5lm93F3u5F0WlcE1l1BCtFhuvGY5V2hQMfGJIv
Op+i/duvTBkv0WUe1wCaeyBd5KyzzcgDH+U9/jaHbwWyIJzjCPNjrku+SN/Z47GX
wSTULx8uOK8Lj1wt41ozhOpn8PDsjMte0WQAdoeTF3KR5l9L2CC0N2tlRztGIaoo
+mp/a7yqTMOJwBXwsTBYXXtTKmJ5DxayX4UnggllkNhAGdKxIr3i1Wn/r6T8dMfL
C3nD/KGaBroqg1bHhKNjaqX5JE6VbtC1kbRa8XWJNJGfluIUBMxBlr5qRmtpT924
fS5HikqZimEND4pcMToH3D49JQSPbOB0y0IR280iCm/7N3La6A21Cz0h/NL0hecX
3zETZvfz3jL5MbzW6J+cxT+/627RzsC5ySbWuGU+F4QyT+Q0b5j8WRkMLsGGcqcZ
UQF3FQvIL7C6D2AWGjdp1aXny3m+g0BN9kPArcPi1ukpK5TCU4TH91Z0x+RFTbYF
mClyjVL9TIyIvq5NGdMTPVzNy5Jxx16xX0g3nqmWJEejU1/Ev34wloLLg++FLqSf
6bYYoS3SWtnIm1/LcJRe2+KcnY+dJ4PDYygDUnxaBFIBp2bCNiQ=
=1Ge2
-----END PGP SIGNATURE-----

--2ha8DWP58p5FmMGn--

