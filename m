Return-Path: <linux-i2c+bounces-3247-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E38B4568
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 11:46:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DDC9828357F
	for <lists+linux-i2c@lfdr.de>; Sat, 27 Apr 2024 09:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B190047F5B;
	Sat, 27 Apr 2024 09:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="XlZoCvzU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0110A4654B
	for <linux-i2c@vger.kernel.org>; Sat, 27 Apr 2024 09:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714211170; cv=none; b=EE6wHrUDa4L5SOKfeVFHTDh4CAJ+b7FnKXIA8T1suYGCocdbJmwgWTahbHdw7vvSEiiPdnxMFK8T4DX0avEZ+m8svh+DFnEoFOiuUvflZ0NMAXskNW+Fp7pvX0h2mwZ+thJ0ScNAFgjlLsbZfRXECloaljUQebTjKt5gHQQJCGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714211170; c=relaxed/simple;
	bh=PmJvFm3Bz5unf7X0KuGEXxdKacc9UxOqg3VtjXXW5Iw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Kb4h13V1I2/7EsfBj7LOB9yRWdrfGf/tV43fkcdAYoomOhRRwvEXKQzHjix7Z2I0w0k1VoCfo94sizRprza/9pNDIXIYFaNybRikZjhZYhOwEcdM3zBdDOIV2xXmMnpch0c8NGPgp3yOOWJViJ3bCltJMYBIw1O4OaCfGxo8iFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=XlZoCvzU; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=PmJv
	Fm3Bz5unf7X0KuGEXxdKacc9UxOqg3VtjXXW5Iw=; b=XlZoCvzUdP7npVfBVFxH
	wdSBK4NhbQCymn31U7zpbf8S1T9KIJ+LAfk9ViH3NM8wDf5I4+0ubW/qq6dq9uWV
	3MhxjWVwPYvpIoHqAzNvUf1VM7iGi64/wGiwbmzTcAy67Gzyz8JuMoHkWqlT+tX8
	KRpbhykkF1Z9zIBnzLzZ0Ddg+DDiRp6EwVWqoegHpRphZdS+z8yBWyMnf3Ic94Ao
	w3JR+6KOg0dpYfNCC/6NX3Y+xMcco2KLIQ6tswJ2uTF8nLbSe3M4KO8SBJkd3FkL
	MKZqxCMntnOCOdURmA5z9/NdIkeBa6g59MogBauamkimLCdrcgjR2YTU4YTk+GG6
	Qg==
Received: (qmail 1645813 invoked from network); 27 Apr 2024 11:46:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Apr 2024 11:46:04 +0200
X-UD-Smtp-Session: l3s3148p1@fR2A4xAX2rpehh9l
Date: Sat, 27 Apr 2024 11:46:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: smbus: Add (LP)DDR5 types to `i2c_register_spd()`
Message-ID: <20240427094603.b266oz2d5oaar4b3@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20240426220748.28184-2-pmenzel@molgen.mpg.de>
 <20240427091408.3gbzxe2rlu2m5wyt@ninjato>
 <72ef1975-0bf2-44fb-9701-7fbba93940a9@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pwrrbzvs34u2gmo4"
Content-Disposition: inline
In-Reply-To: <72ef1975-0bf2-44fb-9701-7fbba93940a9@molgen.mpg.de>


--pwrrbzvs34u2gmo4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Thank you for digging this up. Would it be alright, to adapt the warning for
> (LP)DDR5?

Sure, good idea. I think it will be helpful to include the standard name
in the message, so people have a starting point, like:

"DDR5 SPD not supported. JEDEC JESD300-5 compatible driver does not exist yet"

Or similar...


--pwrrbzvs34u2gmo4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYsyVcACgkQFA3kzBSg
Kbafyw//Z0icJo8mHEqMzyUbx4zz+yoYRttZ+OtzHHI1msKvLFvKoXIswDOCPfa4
cxhrKOiEYtEVWblXLsG9/ztHHkjbTScUyjaIEEqOKFIDLLUVd82MyT6O3bmQ/hVf
BLb8IYp2ZWteBxywK0WS4KLYocIxrscOSIxnKamp+58+1KaKVAcDmOyv4fBBAKd4
ASlMitFfO2mBJXCElhQbBC1XMg9Czw4M5vUBIx0z9yWrI8BbTKN6UuqLLHRRpVzF
v9gc14PvoVCCxRqVtxQaX8V9welUJi7AORl3LJtd7QD45xfcqpNvSMM896+Qxfc2
uBYX6hJVd1BH70mt0MYnWJYzeOiJvOQDjc0v7tRPQy/U7054qokVxMJY56j3YT5k
76YtrNpXpbAuuNCmmvriTtRxgUrP2VhuP1c3R+EiUROXOtFXX0Fh4y7BWRKND2Dv
e2q8DveouFu309Et+3GASE9OZ/zq0U9vbMGW+mEY7ByaMyHui2eQCAsLMj5M3PYM
DYvrTitq8nUZH0Hxzrx/Wz4/wbk5ReUz/aptXYXkbyaiwblfJ4oV3rWY7Gsn/C0U
4MP+eEs5AD6FuT0j1L1ZW+KwH3Y/kGrZoBgh/CzDovNo5EYnWIqJ//XczUgmzErh
zEYmfdOzHXSf91olEFaYWowedU26uXM0ARxc4mepfDm/0t0qbfo=
=Ar7u
-----END PGP SIGNATURE-----

--pwrrbzvs34u2gmo4--

