Return-Path: <linux-i2c+bounces-9783-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B77A5D16F
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 22:12:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8467B189EFB2
	for <lists+linux-i2c@lfdr.de>; Tue, 11 Mar 2025 21:12:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91EA6264627;
	Tue, 11 Mar 2025 21:12:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JJoD4cs7"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729E7263F31
	for <linux-i2c@vger.kernel.org>; Tue, 11 Mar 2025 21:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741727566; cv=none; b=hvVyxSWfSElgZn0/ZIk9351e4BKKBYLLQrAYfldciPowiYPp7DYOPMlKq5WdBKtBMtOXqUbWv5rcyy/+6TKmpSabQODLNLxF+3GEKDdclm7yW2CV0vZISDBilPLx3QsmxY0Cu2Cf+RuLh9OcY4fXy1pwxkxm2Kdbeno6U85HVlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741727566; c=relaxed/simple;
	bh=lC6Y0QO5+K1XxRtRb92W3nce/JojG7rq0xhvK0oFL4k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XZwxcpOcpUVy4dIY+I48wYOtqBrBid/YSAor3B1RjcKHlc4aO/2h6h6w/qD1q1IgLfdL0X31mf9mbFShGWKvvrsJtEQPOUqhQVhJft1TCzXcYxcTIpw+4WcNpv/eVkcSCBrU+P8RhUhdCTs5YIQ2HyR9Zw6pFr7o9INsZXovTC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JJoD4cs7; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lC6Y
	0QO5+K1XxRtRb92W3nce/JojG7rq0xhvK0oFL4k=; b=JJoD4cs7zvVvI4Jhk3ak
	wSnKi0YSHoQaRfloIz+5C0hwaEUxdzQzgquq0PfvZa+qunhR8ag6YfMHtekxg4CK
	uCgELVM9mniDhzywU6sFVwR3Bf56d9P9U5Uz/CduUPz4GBTQrgMHgRSVnPJu76Yd
	IDddh//MPNZjvroL9vr35a3UEtG0LK4u+KGjLOK9nbh18S9BlBTAS+eCkw2+DGOa
	+P125qgw+P9cgqzbMFN9PbVDd4byuL6urbsV+VKnqhqbEL9fkOS8EvsZ3bLgvZjY
	D79B9hrsb86lG6yeP9+p/0fSRAHhF6MoybHvk8RXt/+znSBS9JrvREQlChU7ovaR
	Ew==
Received: (qmail 1011587 invoked from network); 11 Mar 2025 22:12:40 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Mar 2025 22:12:40 +0100
X-UD-Smtp-Session: l3s3148p1@31uFjBcwDOMgAQnoAEqwANClyB/R595S
Date: Tue, 11 Mar 2025 22:12:39 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: vigneshr@ti.com, aaro.koskinen@iki.fi, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, jmkrzyszt@gmail.com,
	andi.shyti@kernel.org, reidt@ti.com, wsa@kernel.org,
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@kernel.org
Subject: Re: [PATCH v2] i2c: omap: fix IRQ storms
Message-ID: <Z9CnR2kFoTjUwy6M@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andreas Kemnade <andreas@kemnade.info>, vigneshr@ti.com,
	aaro.koskinen@iki.fi, khilman@baylibre.com, rogerq@kernel.org,
	tony@atomide.com, jmkrzyszt@gmail.com, andi.shyti@kernel.org,
	reidt@ti.com, wsa@kernel.org, linux-omap@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@kernel.org
References: <20250228140420.379498-1-andreas@kemnade.info>
 <Z9CA8H2GAArdTRqI@shikoro>
 <20250311201450.61d48787@akair>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sRASLUo3ObCMz+qA"
Content-Disposition: inline
In-Reply-To: <20250311201450.61d48787@akair>


--sRASLUo3ObCMz+qA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Exactly the tests which Nishanth did. So I would say with his Tested-By,
> this patch is good to go.

This is what I wanted to know. Thanks for the heads up!


--sRASLUo3ObCMz+qA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfQp0MACgkQFA3kzBSg
Kba0GA//co82xU2jKLsT0M979EbwwKBaF0l41p/vh69x6qIuiF+R0AFxRV6ZJCYt
z7dfGEJE7Av6nnV0Zuuv6u/EpwFWfmF32Q5ID5OnefkDUg5bS8P5rhRxcdWzon47
V5drpAtgVlsf7wWUJgqr/i2AhJkPAbTZExhRia5cIu3BhfMBvdbjW9X21bizaBuS
c4CHH0zERC55jnAtp7CNo6E03UsN1SIzZk/ZP/CVrY4+qcweIOWlNwiOB8KYgw2V
LCIKh59aLLvXrqA4Gx9Pna5o8z+8e0JKXVSubuiJ+UnlIv6TfAGQ8tHE12NYU7mW
nGy1GdJtFIh5xa/aQVYHV3XqA7a3gvsMFJG9yhG+ObdwghzNBl+URNykdWiDo4pl
peWXnykrVwtJC71M+D9jSSSa44ESFdfA1NndF3AsPTc+haPA/7WQMgs9XSlCv8lc
CWJJDM8YfBeY99xDGj0WSj+2n64kYAsbL8QQBECs7X/5Qz+EhQbmpS39YwAToQbA
YzKLuviTlphAWVQW2bE2Ji5goawHSRd5RQD1QXPmjwL8A30h0leyHilDaW2rnA5P
A89/I0ZmTKNq7/chq3Uz7EjLo84LwYP85oAr4BwtNInASj85Ae8wyX/RsSLnYdZE
zzONLZlrIWkSflUG6auujGMwmuN5PwX/Xi2ai7JRUaRADGTKbak=
=Du7U
-----END PGP SIGNATURE-----

--sRASLUo3ObCMz+qA--

