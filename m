Return-Path: <linux-i2c+bounces-2777-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 66795899AEC
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 12:32:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9784C1C228D8
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 10:32:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F008471738;
	Fri,  5 Apr 2024 10:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Lkq1DS5W"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB3E6CDB7
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 10:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712313166; cv=none; b=gOW7/rOYY2/1gX5GhOJDn68tuREQdR+n+XkyWgAqR5Ie648cVvODxeWTMPNuk+hiKoGtIvnwSSkQfEAdXTU1qMrqFX4B0aQT4AgNt1i2hXdmVgAHjmNGGskth0tBgUqTHq6CMvdN1dFIOndZDE81L3n/AEIhADaX8SbDmBq6RcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712313166; c=relaxed/simple;
	bh=LxF0BSRsYY9YuzF6RMysKr5fa1M5QCRgF2nZBa70Q1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JuljPr/W784IA0VNs9E/uMVBmUQe73gaOeaa0N9n2E30Dv8gI93ltMhjq49IQxbjCnPWkIXWx9Swxby7coPV0JCv906+mUnJQ5CKheUpoPffAVXtE2baUTVZmJhluA5KFPbSdxoSVW+de9uwuhnTAAmgm39+7gERNpI53A+Nwyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Lkq1DS5W; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=LxF0
	BSRsYY9YuzF6RMysKr5fa1M5QCRgF2nZBa70Q1I=; b=Lkq1DS5WQOt2gkjm3G+A
	GnIKYbysgu3ee9KcKgO2LeLP/l0MFDYuJEJmfMU1MfDh5YGj51uH13bBW+mMx46X
	2PQrZjwV4U/5S06bBTdVc38EaJs7w0SpBzoQbBjdUTG8i6x91RhtDiZCZaXS1pL+
	e16/kj3MVFd7Q+m/Lyj2BiF1vl1/iWf/mMgVmeMWpekjGIFV56iT/SCedPv3/pyt
	xrAVPEn1dBE3Cc9sJD9sZwiGp8y5M1KJ2eoVcCh+0INiHlbBvP3+kWzBlZZh3Hz9
	ij21sIL6dqznCIaNUt1xOezU49/3GjocMK6LWmjcpr4OKOlXhhXoSQDUZw3c9f6p
	rA==
Received: (qmail 4076162 invoked from network); 5 Apr 2024 12:32:42 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 12:32:42 +0200
X-UD-Smtp-Session: l3s3148p1@d9LB+VYVypkgAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 12:32:41 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/1] i2c: add HAS_IOPORT dependencies
Message-ID: <b44wxgyzhxhxfqsazze3doy5kigi743vc6tuw4fgqrotzji4jz@osaug52h3pvg>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Niklas Schnelle <schnelle@linux.ibm.com>, Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, 
	Arnd Bergmann <arnd@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org
References: <20240405101009.2807447-1-schnelle@linux.ibm.com>
 <20240405101009.2807447-2-schnelle@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gcyxf7hf6r4jxara"
Content-Disposition: inline
In-Reply-To: <20240405101009.2807447-2-schnelle@linux.ibm.com>


--gcyxf7hf6r4jxara
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2024 at 12:10:09PM +0200, Niklas Schnelle wrote:
> In a future patch HAS_IOPORT=3Dn will disable inb()/outb() and friends at
> compile time. We thus need to add HAS_IOPORT as dependency for those
> drivers using them.
>=20
> Co-developed-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Arnd Bergmann <arnd@kernel.org>
> Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--gcyxf7hf6r4jxara
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYP00kACgkQFA3kzBSg
KbbDsw//V18CsbXlLUZbOMcuZyTmbnf2TksMmnXYxLxV1PclCCP/A2TSXIsj6Tho
RlvnjkW+3oQ1zbM75GN7bYX9pj67DrShceUnyamH7A8pCo9bmmCrk9bLWGYPGOO7
umkR6fhmlsVbkiK61zZmFvfQwA9RrjkgS64VjSpQq00/WLOqgD2TxrGcCWio+HlF
Xnz6WvHleReG75YacMz16uLYSFRMiafnwmFpQLQJVp7lqaF6L1MoCgY4gmMDwNyJ
MWXZpbTqdPPmEevx2hpeJbU3okJt5OzArH5RsHVkSl9dmyfurXj18d1foZ/vhxJ/
2k9PPbql8oVbR9u3xtas9b7oweB9pwR8tN0y57wJpitd/aw5G0uMNKbBtQ1A8lMX
JxQnKP28RWSoik9S9HruwJ06xroloPJ7ZdBZ4xPLEUyw5PXTYOjcPG+jFW/otgyK
7iyzWGQI+6uuqSeV7kP64KMpzRh73p5cleshEMgTW0ZRO2N9ODIiMUZzW7pZAWt7
rG5aT9KAGg9jbg21aGRncZlQcnQtXfJxF3YeMt7NO09ajwc3CTsCdX9HTvpcXUXJ
0KUJYL67pP2rNphf11sl6tQfoTl2au82Ee74B15mEMXtwyYz+VUWuU3hE6cRBdXx
PxJwisLloBw/d+BtIDdtHMoBmjzbgf0T+JzMpoK/+iN6ZDyPl60=
=IRCg
-----END PGP SIGNATURE-----

--gcyxf7hf6r4jxara--

