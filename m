Return-Path: <linux-i2c+bounces-4734-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 15CF192945C
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 17:12:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 478461C21003
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Jul 2024 15:12:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 494491386BF;
	Sat,  6 Jul 2024 15:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="j033J5y1"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD9D13AD18
	for <linux-i2c@vger.kernel.org>; Sat,  6 Jul 2024 15:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720278745; cv=none; b=saUzbxOU0EPddgIDUXgCPRyoQ265PVFXbF8zHMkvl2Vi+1rPP5AqMX1sij6ActJShjlw6b2bZkAbftZME5eqJ0EZk4l3RLxZGL6Fn48810kqrWW0voXhrlfMmXY/DCMmPwnJOOTKzR+xzTyuH6Ii+hSisDsgV/ne2avRQS9b9iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720278745; c=relaxed/simple;
	bh=rBITywIPzpyfHq59M7dtE6/q3BxI0mNng54Ho9cj0so=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gSoTFiMWxUfV32W9NtGstFkUtaXAM9KnFDsLJCseJKQ9/OEwUZEbv5C5KjtQk74ti527IBGxpCG+Izh4x7Xs3723g/pNguYa6mO6B62BOa/D06vUMiJOeoth9Bfi848HqYCfChiK0IrstjoTvZzvOObL0+2orbTfIdt6SL/g7mQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=j033J5y1; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=zwm/
	kLx8EJVafCXublgtuQmv6UtpEvQHrdYJHtjk8v4=; b=j033J5y13Odgwrz4kIyU
	9r/S2ZyVxwo6ZJFjjWnUZeuIv1v+UDY/VT1tyM3kpl0H6vhPqVfOyWyWRz1o0Req
	Y821mGWWN/twkMuHKStqdyxRsyoUiR9FZEwv66Wro8EGpPWzb13mXMcbc9Vh1ivs
	mVvEv6JmBoe8EDy4R/mnhU5bLo+lhVWQUExk4QGe/V0E9HUlF242xEoHDgMX7wqw
	CEBMM3bkeZM09MOMuYxcDjPfmpEWZrHBpj8pKIHL2HQdAMGIWPJCIiM8OTMyGgHv
	ZJxr0gy/Lx77nruCI7jWAB94+uG5Vgo1ETUxQBDxnEUQ+8Ewhj9y1nXDAs32BURn
	Zw==
Received: (qmail 3856002 invoked from network); 6 Jul 2024 17:12:20 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Jul 2024 17:12:20 +0200
X-UD-Smtp-Session: l3s3148p1@ixQ7m5UchrJQT+F6
Date: Sat, 6 Jul 2024 17:12:20 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/60] i2c: cp2615: reword according to newest
 specification
Message-ID: <Zole1BYectz6k2rV@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bence =?utf-8?B?Q3PDs2vDoXM=?= <bence98@sch.bme.hu>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	linux-kernel@vger.kernel.org
References: <20240706112116.24543-1-wsa+renesas@sang-engineering.com>
 <20240706112116.24543-10-wsa+renesas@sang-engineering.com>
 <188d9071-01f5-4e81-9427-5b8397864211@sch.bme.hu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NP4HVa4xH4SfJ44k"
Content-Disposition: inline
In-Reply-To: <188d9071-01f5-4e81-9427-5b8397864211@sch.bme.hu>


--NP4HVa4xH4SfJ44k
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Bence,

> The diff is cut short, but here would be the comment for the next enum
> element, CP2615_BUS_ERROR, which reads:
> > /* I2C bus error (ie. device NAK'd the request) */
> If you're going for consistency, you might want to edit that as well.

You mean "target NAK'd"? Yes, can do this.

> > -	.master_xfer	=3D cp2615_i2c_master_xfer,
> > -	.functionality	=3D cp2615_i2c_func,
> > +	.xfer =3D cp2615_i2c_xfer,
> > +	.functionality =3D cp2615_i2c_func,
> >   };
> >   /*
>=20
> I don't understand the need for the whitespace changes.

If you have only one space in such struct initializations, you can
change later only the line you are interested in. If you have aligned
them with tabs, you sometimes change one line and need to realign the
whole block. This is annoying and spoils history a little.

> Reviewed-by: Bence Cs=C3=B3k=C3=A1s <bence98@sch.bme.hu>

Thanks!

   Wolfram


--NP4HVa4xH4SfJ44k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaJXtAACgkQFA3kzBSg
Kbb+hw/+Pzp1jYykkV8V03y4DILyb+FIajG0OwcPZp0Q/74jIJhHuhQ3rq829PTE
pXcuddqlMh02tXpPFc/6E4ezv/FwPLKDPbIvXJCupuVYOKkH+GOO3nXnzG38ZwlY
CNW55WRuwRglcnONc+bxxncN1GH5ZrD5ryCZf0ry+H7lBw8gNsCdgNcjEvqNMsvh
T7PmhQUE0yAWURg3GKnIsD4CLjaGVF0Cpx08UsQw5ObZCX+tP79phTYIP/h351VH
OrXt1whibLOmnMJ/NTqHwojEq1TmfV1iEhhcJ21EGPvlOgcUtkJ5q/nWmED2nY1u
/z+MoxRTCGneYrsITrUhwDLSJ75mtuMuJgMdsG1m/WY1dzZuh2gxKYlk/xAAQv4w
zRkUzsWfCd6K7LivjQK6E7hNhrOk32QkpQc3Q6JknC5heyA1Evj7AcJGKMGb8nYJ
CKculQFrogZMZX6yegZqD6ZYTySo2apEhOINjTIie6RypvlB3mvhJz0c18gSMC/l
vmTFglYgJmP1K+4uC7flMiuAxMVAiBViioZMe9Clqs/6t7QLbGQnx5j5jKdDxrmj
1bYh8SxmfQ82oOLGGRVOX+4KTS35LNCy3OhUVXA26wN804CLzq6DOnh9p/E6LQ8U
hJdq4iE+9gCbMp/Iwf4LiJw5ttVaYUKmO0ABf7cPdoxg4SfQzZk=
=/r06
-----END PGP SIGNATURE-----

--NP4HVa4xH4SfJ44k--

