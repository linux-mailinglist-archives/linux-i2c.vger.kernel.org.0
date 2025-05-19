Return-Path: <linux-i2c+bounces-11037-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7A1ABC296
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 17:37:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 446D9189E110
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 15:37:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE1E628642E;
	Mon, 19 May 2025 15:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ei6O0Pb3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9363286421
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 15:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747669021; cv=none; b=OtWvHqWbspKoGZcJZ+CGak0WTHCUh/Mg5fXomir5UQORlrqg18037ec0jLbnwPO0eEI/V4wSxWtzFeO1jz+LWZMNB7aZI2kTyGb/IZiQKlfE7o+6t8xG4qoRcC4j3yWnDxpAgRSUy1Di47wI1XIE+n3RQC4h5cdk9CzsHlVzGgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747669021; c=relaxed/simple;
	bh=xFhAds+616xMz5/PI3seBVPqhnhP4NnHMe/MU0Gt/dc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QembGDlehwsPtoFVXKqhkL7UVpOqGrnphgL8XnJe0cCY7ssKM+hlxhWUL+69job7+JevxjNvLKD1zWlTyBKXXYKLHK047Cg+PVSavspAz99TCDtQlwa9cdB+gcUuRR6Cbl5PPsuVj5oWXErseYWWE9Dxg8PT6g9rSPdOA6QW0lg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ei6O0Pb3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ia6s
	n4IkrNArO/XBzGfYuknqFILyzvho6pfa6EGAEBc=; b=Ei6O0Pb3qKltoI7rCxM3
	bGoZZcAbplVVWOozVTurQoqDY+DI7bukk71iMJnSibQAqe+LWv4sQEPip6EUyLnt
	i6Z/B3C7fSFCCwg+mXiqYUZJgzid3j7duc1B4Kj9t5+9nsYvq6hSzZAfYD/ncdSQ
	oPaKb4ukeYlODGBGu/ycuPHg59EFbTJwAbUtlFDRvMx47ICAv76AP7d33/hZTNIH
	0jHYfEYDGrxvgH42B5AD1gLffScfnEXo3/kl7jfFZRadDVdPJID38qtxTMIEuzja
	G3WIwEm9lg2QvCaBzLzUa6khV9bwSMOucZC0F93U9WWz8G0GAi5xLTXuXJhwALUF
	QA==
Received: (qmail 2543913 invoked from network); 19 May 2025 17:36:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 17:36:57 +0200
X-UD-Smtp-Session: l3s3148p1@7pO85n41NNpZz6uL
Date: Mon, 19 May 2025 17:36:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH 3/3] i2ctransfer: Zero out memory passed to ioctl()
Message-ID: <aCtQFfPvGJuVN1tv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>
References: <20250513172119.09548573@endymion>
 <20250513173539.39952965@endymion>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+natKL32U6BabfFg"
Content-Disposition: inline
In-Reply-To: <20250513173539.39952965@endymion>


--+natKL32U6BabfFg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025 at 05:35:39PM +0200, Jean Delvare wrote:
> Valgrind complains that uninitialized memory may be passed to
> ioctl():
>=20
> =3D=3D Syscall param ioctl(I2C_RDWR) points to uninitialised byte(s)
> =3D=3D    at 0x499382B: ioctl (in /lib64/libc.so.6)
> =3D=3D    by 0x401957: main (i2ctransfer.c:343)
> =3D=3D  Address 0x1ffefff94c is on thread 1's stack
> =3D=3D  in frame #1, created by main (i2ctransfer.c:144)
> =3D=3D=20
> =3D=3D Syscall param ioctl(I2C_RDWR).msgs points to uninitialised byte(s)
> =3D=3D    at 0x499382B: ioctl (in /lib64/libc.so.6)
> =3D=3D    by 0x401957: main (i2ctransfer.c:343)
> =3D=3D  Address 0x1ffefff956 is on thread 1's stack
> =3D=3D  in frame #1, created by main (i2ctransfer.c:144)
>=20
> Zero out the i2c_rdwr_ioctl_data struct as well as the msgs array to
> guarantee that no uninitialized memory will ever be passed to the
> kernel.
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied, thanks!

> This one is not strictly needed, I can't see any actual bug. However
> making valgrind happy seems to be a sane goal, so that we can keep
> using it when debugging other issues without getting distracted.
> Wolfram, what do you think?

Sure, I agree. Also, I like the simpler code.


--+natKL32U6BabfFg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrUBUACgkQFA3kzBSg
KbYEkQ/+LxKToeBItJzq0mKZF75ffP2q+TgHHN+t1AaYi08G6YDCw3H6+T0GKeUM
gCVOrkDs8RaE3rcqithDRC0iYm19QjMX1gIVtf24uwYTyYvm+wdXy51MAE3NuKWV
HcYKtIUKpygfzawrctENJg5GEehTwH/YeyNUl/RFHUGbwVRGpl972r506gPBtCUK
ONDKASjtM4Alv7qac6f58XR+nWyngVXoD6Vh/21A9h7LTcp65nrklHVDIpA6/nc9
cAXbtOB5b5baHgXTCI0AgWYDNnoYNl3nCCE1RDJDl/MjBtLD9L8eGucOfwbUk5b5
ATWlOqd8ZOBCOcR+VHRehiw7JQIwKJ92aTlSmOc7gWkXafNobAjXud4IuJsYvXYZ
XZRU1mopP/YndyNn6pylkonVfbAfwDqmZyrM64IXZzw6/jD/rE5hvWXurTsgLJ5K
f2QbVXXWV1Ave6R1Ii0KUoBIvTBl98JcdZlMsHVz3GnLs18McKL2p3+L0gBQARkp
SAYpdpmbAFAGvNJzlGEuzWxVk7Boj5K6Enh2vo01F2y5A+MmO/UnH2bh23nn43hZ
Pyi2sGVBPU+KBiTwQ8Mo9xlWbwvtJe66/anvPZcwbwZy+jAUNNvfh9dHY/h3l+ha
S5haBmh3WLaRgWhFT8N3LLgCTOm37Rjo6lQOYsbFXs1bohdewEY=
=EzJb
-----END PGP SIGNATURE-----

--+natKL32U6BabfFg--

