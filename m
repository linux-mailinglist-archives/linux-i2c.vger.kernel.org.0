Return-Path: <linux-i2c+bounces-7503-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 490589A9FE8
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 12:25:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0A166284F2A
	for <lists+linux-i2c@lfdr.de>; Tue, 22 Oct 2024 10:25:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C20D7199FDD;
	Tue, 22 Oct 2024 10:25:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BVKMjqGt"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B525198842
	for <linux-i2c@vger.kernel.org>; Tue, 22 Oct 2024 10:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729592751; cv=none; b=EOBk75eMPEbOaFZO/TXUr6C8ZuIqKAeT0Ywo6g5YfkR36eeuZVcsUWl58HE+C/1DcW8v3gdODP42+2qyszUwYCQ2QU+cxoOhoHXMxQM5XmvcNJrx+0lNv0bzYGCQ+ENdsXm0gggMO+IrZRkc/jphQE3OKHDZdPu4KnatLLVRNog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729592751; c=relaxed/simple;
	bh=i6iLATdbJSjk7pgg1RoCxrfeoVkJvrO76BOc5xNKwIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rC/tlTX0e7EAdngknjLQ9XBussFZsHbewKHGNB9VGEv5GfK8/Kzu71me69v2bsFPLtV4sXBiGyoqNr7jJfhXR3sSE8khxrMiSbhdjznPNMZyzaD/xYw8y7xtWkPmK83syfUUn7naaPlMAfatO4CdrzTzL2Dg75WyuYMnm25dY2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BVKMjqGt; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i6iL
	ATdbJSjk7pgg1RoCxrfeoVkJvrO76BOc5xNKwIQ=; b=BVKMjqGt1sMJCSPJBhR8
	upF7gVRBuUG7jIUrKzGFtMJrbKjZGAfIGNbEN/DdZRWBxXtswC493URDzJo7+kbl
	Q7IINJzMAvYUDLU2LZrgLMGGKTSjcYmyjS0+Yg5Oab56kQF52FNLG7tbK8CaxS3+
	E4iFlDJjnfHrbzMwB1jRa1y+zo2o0sx9wHOG+xQFhv/Ff3unX4k/ZKQNOTbk98ls
	0TNSTyqlieP4x5LL+BbdgXqRHQ2/3kwdOY68zj1xqade7SnkooCsvJ+DzNHnoLbp
	Izx6yzVb3iRAbVatb1zSc8cYnzg0hUjJGInnRetrHTk9v8dNt3jyhEhhKC/6dqeM
	7A==
Received: (qmail 516368 invoked from network); 22 Oct 2024 12:25:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Oct 2024 12:25:44 +0200
X-UD-Smtp-Session: l3s3148p1@ppIaMQ4lgU1dtTDz
Date: Tue, 22 Oct 2024 12:25:43 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: Linux I2C <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Wolfram Sang <wsa@kernel.org>
Subject: Re: [PATCH v3] i2c: Drop legacy muxing pseudo-drivers
Message-ID: <Zxd9p9nc-uCzgUp8@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>,
	Linux I2C <linux-i2c@vger.kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Wolfram Sang <wsa@kernel.org>
References: <20241022120027.01bb4df8@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IBvpXv2dYEDGZ6zn"
Content-Disposition: inline
In-Reply-To: <20241022120027.01bb4df8@endymion.delvare>


--IBvpXv2dYEDGZ6zn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 12:00:27PM +0200, Jean Delvare wrote:
> The i2c-amd756-s4882 and i2c-nforce2-s4985 muxing pseudo-drivers were
> written at a time when the i2c core did not support muxing. They are
> essentially board-specific hacks. If we had to add support for these
> boards today, we would implement it in a completely different way.
>=20
> These Tyan server boards are 19 years old by now, so I very much doubt
> any of these is still running today. So let's just drop this clumsy
> code. If anyone really still needs this support and complains, I'll
> rewrite it in a proper way on top of i2c-mux.
>=20
> This also fixes the following warnings:
> drivers/i2c/busses/i2c-amd756.c:286:20: warning: symbol 'amd756_smbus' wa=
s not declared. Should it be static?
> drivers/i2c/busses/i2c-nforce2.c:123:20: warning: symbol 'nforce2_smbus' =
was not declared. Should it be static?
>=20
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Andi Shyti <andi.shyti@kernel.org>
> Cc: Nick Desaulniers <ndesaulniers@google.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--IBvpXv2dYEDGZ6zn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmcXfacACgkQFA3kzBSg
KbbYVw//allZCl3GGGViinIjro3mchjkma+sz2qb+RGDKBtOokEseNWrzqKgss9K
j0Z2XmZ44Bxs/xII908C0xS1CQeDviO6QgPMmFYoK7JCx11F9Qp3b6trH4fu3LVt
1jeXwTaAMRH8q/opg/tbgZe1R80Etf3lkW9lLs/IgXmUi23okRo1QIMWCoXg7nSD
2XPwlwuwuVeJNON6BLBjZa83OUWCH7tI+Vq2dMOy9Rtmk9B+V2gFCYvdI+dugZyN
o3HB79dj4jEDtXZ5vawbSap7rQ81gFT8KwCJ1uKBmPS3yhE0IhoKTDEWCtLWIFoJ
sSYlP5E+ztWqFDCixGSCKuUUaxqurZCNcD0/kopexqRPrtlbnyxg/+6KC/V4T5tq
rrbzyUtRd/aqFRLLiK+CuWaRXeLl00j8M6GsdHz0hrd9F5j5wNPf0U1YpvEyng5l
arbKR6bs1dlBEkYqa+yIJeIjPpKBJKHA+LODHtWCl8aVhOIVzgdDccy/X7ASIEDr
/7ibF75LNxQMjgsm9GJwL/czovNmvEeHqe3dUWh3ygsyQWSWgUI0KdN7CL/5Qplt
lcWOI14xKiCug08b4pL4sm2V6TmWDb/Ztz3BgaWs/vWKgmF5kwidz6I7+maiWp0W
XgW2iXsVylNGhopF1mtXt8L6RYEo5oOeaz3uJ3MSgYeLwaCUglI=
=7VOu
-----END PGP SIGNATURE-----

--IBvpXv2dYEDGZ6zn--

