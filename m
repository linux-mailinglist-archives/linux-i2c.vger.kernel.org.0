Return-Path: <linux-i2c+bounces-4974-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215529304B1
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 11:17:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5A6B283C3D
	for <lists+linux-i2c@lfdr.de>; Sat, 13 Jul 2024 09:17:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 726D22837A;
	Sat, 13 Jul 2024 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="S1Mghrzi"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B1A5A0FE
	for <linux-i2c@vger.kernel.org>; Sat, 13 Jul 2024 09:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720862267; cv=none; b=MN6jwQFJ25xRXnqUF8tGI1ZZr9TQ69LpoLAANO/fojB5zngWoZo9teXjQfxP85O8w7A+Mr0BI4Twk6uzfYf6hlsYicmhxTyt1UnzinxtwN13bhXNyRAzDRkm5jkGwld5ipV9IqQZFoY7LmrzoDHQmuiBXlRD2PVmCa8MxVhWX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720862267; c=relaxed/simple;
	bh=FBR7r+3ACmJ0CU/LVfllE17WSexOlJsPajQSxAwdmlU=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9AnoYKOC+8vy6R3U286lWkpvsoIsgnmdsSPVOnX+NN4UI/5LZWOOlkLzXHHm0uw0zoEojzXD3lAy8V5AwQC2psaEbABSdk6wK5pmb4O4yJieaTVUOOeIwxSkOyjAOF9JlLGFhGNALA5+SkZ3jbEVMqZ7PJV95+Xt/qX+jbpnyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=S1Mghrzi; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FBR7
	r+3ACmJ0CU/LVfllE17WSexOlJsPajQSxAwdmlU=; b=S1MghrziaJUBXb0NezIO
	oibAUNhPqT0BwxV2PHr+hIkmIZ8zq0owlZpr6APr+4uWPEA4WEBJPNvko/4v/c7V
	vdqzPi2q+eE4pavFvYTkRApuFpoeFshxJMySPBJB9LP5jdzGXM9WmXQL71QpFM/W
	UVKX6YYlg1BOpI6UimEE/9ngaY0rAbaN7R0KIpkJw6BQNm+huqpU/myGNKLPzzP2
	ZIY1mp1iePoXlKhPiqlwMVMwavUeTAEt4rzBuEj5cCctUe9YWvDZSMEUbRtOF2jb
	sRNBMdRPZbvG0hWerelRi9nCUylPQfD38fNv44QJRe5T+gObSWR2o2hWU1awSE3e
	zw==
Received: (qmail 1389217 invoked from network); 13 Jul 2024 11:17:43 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jul 2024 11:17:43 +0200
X-UD-Smtp-Session: l3s3148p1@Jnjmdx0dzsZehhtW
Date: Sat, 13 Jul 2024 11:17:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host for v6.11
Message-ID: <ZpJGNirkEoBFixQP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <yxymqbpeuhq52w3ie5nl5pkoojjuybaeodqtrd6uhe2rkmfhfb@3dqr6vefsdxh>
 <ZpJF39FFqnJfinQn@shikoro>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="88WgWCnBdTEOvaR/"
Content-Disposition: inline
In-Reply-To: <ZpJF39FFqnJfinQn@shikoro>


--88WgWCnBdTEOvaR/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Can these patches be included, too? I think they are good to go.
>=20
> http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D410673

Oh, and these:

http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D411205

Or shall I take them?


--88WgWCnBdTEOvaR/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaSRjYACgkQFA3kzBSg
KbbdIw/+NUVyBjf8m+BxqE1ysoRF8tzvqiTSxbWxdJpbteuFqRnV7XmFYu3lmRYD
/ysn9D5UoJqBIjBzT3pfLA9k+dfZUOSKrDju6c3snBrvVBBroewArBnJPaLP8jP2
+PHlyaQn/L07Gsm+oYq3UGMdBLvGnr0o4mVYBjmpDLyYDPIzBZRud+Tm7PWiK6jX
dwZJaYENGStWo0dLugzIQgqVAz9lN6m+NmYSse+hXmucWElUTrXtrTfPrq6hy9H7
TqGPVwCgpLsfq/XVbjF45zEoRhiAdHWrp3jEWAkZrDvguPQOye1AHKkwyJjC688k
09lRdYT8Ov8SxNtWq1qIr+hGGKJnBZXd4W7IqB7mrAaZEhF2qgiy2PKcykHFI5r4
pyEYSeovxRFwBSq/82dOzeBPknVJmeVY0olDEnaJkYjH3VaOEeZA/3jOmmIgnZMn
pxv1ccvoVN/O9xBMwru8+HQAElRnymptyVtg3vRFi3UL0tUVadbMqZq+GMlpYcX8
LVtB3yKWE2EyGPK+53BUATR9GJuPTr8it5+CSavDjHFcZEO+a/x8UtmMyjRntdK5
TSLZk5ECbLHVcCzjJVgykXQmsXNDR7KVF30YXY9LjpSkN80k9DukfZVFIrLUqb9S
mCoBW3XMI8pe0c1h6MBD1/HAtWcKvQh7hmZoYx2yYO0yV/gpmAA=
=rRCz
-----END PGP SIGNATURE-----

--88WgWCnBdTEOvaR/--

