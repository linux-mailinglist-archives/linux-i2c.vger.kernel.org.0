Return-Path: <linux-i2c+bounces-3269-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 963058B4BB3
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 14:15:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51114282183
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Apr 2024 12:15:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BCC56A33A;
	Sun, 28 Apr 2024 12:15:32 +0000 (UTC)
X-Original-To: linux-i2c@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263846A33F
	for <linux-i2c@vger.kernel.org>; Sun, 28 Apr 2024 12:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714306532; cv=none; b=NDARCtGlrNxmv0siS9kP6g1B4a8eeG1nt31vCx4s6S1ErFCE9cd2Yqm+zYyW7nHXj+AzT11+qWbRjTwQEgOjE6hM1/FZBNSHt9UfsNmeyXeZQB/3j7nYKy3rbtk/mSoC/hBJBDD52DSpAtM4/hSDS7mU7Snmuei9PUdUTqSo6Y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714306532; c=relaxed/simple;
	bh=uwu9wbnRByZrueRW+DJVozCDP+NHMntKMf6BCMOKSDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TVJ9E67sPLo0orYM7QtLOoKZKhxAGl2TCuCyb15Q7PZFcjRAnq7Vrc0HPaB4mbsKt0ZYMFWKKMS/ELd1P67VBxzyYoT0ptyh4i8uq2u8hqqlwWaUWvzM66PI5KftiiroF5SWPo5/4sUeoz6K4ZoY8LbDCM0QKvZy0QLgphrYVVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1s13R3-0000Fv-3E; Sun, 28 Apr 2024 14:15:13 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1s13R1-00EnNe-Ln; Sun, 28 Apr 2024 14:15:11 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1s13R1-00Ao56-1u;
	Sun, 28 Apr 2024 14:15:11 +0200
Date: Sun, 28 Apr 2024 14:15:11 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 07/15] i2c: st: use 'time_left' variable with
 wait_for_completion_timeout()
Message-ID: <uh2onuws3or5ikefsflvobijxhxxoersvdwtzcuu264efqjsk4@kbmmpue4wqb5>
References: <20240427203611.3750-1-wsa+renesas@sang-engineering.com>
 <20240427203611.3750-8-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v2id2b4lhcrh7vec"
Content-Disposition: inline
In-Reply-To: <20240427203611.3750-8-wsa+renesas@sang-engineering.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-i2c@vger.kernel.org


--v2id2b4lhcrh7vec
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Wolfram,

On Sat, Apr 27, 2024 at 10:35:59PM +0200, Wolfram Sang wrote:
> There is a confusing pattern in the kernel to use a variable named 'timeo=
ut' to
> store the result of wait_for_completion_timeout() causing patterns like:
>=20
> 	timeout =3D wait_for_completion_timeout(...)
> 	if (!timeout) return -ETIMEDOUT;
>=20
> with all kinds of permutations. Use 'time_left' as a variable to make the=
 code
> self explaining.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

I like the improvement in general and looking at this driver in more
detail this looks right.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe
=20
--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--v2id2b4lhcrh7vec
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYuPc4ACgkQj4D7WH0S
/k44DwgAtZhKVJj9zttG75ZuGtMUekDBwzS3shaaEzhuPTFiGDqNIvW1h9F8gYd5
eTYcl3CB1CQlLmyPjn2oQZWOMuXA7pxcT4dC4pjzEBxy265w5MTecW/27+gGnM9W
Efll3bOYAG3XWy52dz1XaysUsX4vco3pofeMPbI2XO17FGhFCAHwcs0mkgtISCHE
Gv6iIiUxgf3cY9UAfiGCPg5hugDhUbmy4Q+5pyDKWIySNqP7BgCXEGtF9zF4XLAw
LIJIAxqsRelpPGwXpOWI53grJlEo7BRziMp8I7wpPBIC1J07rx3u03VJFwh1vh13
J2j2bOT1JHM5aGd86m8TPqOdYa/RJg==
=iiGY
-----END PGP SIGNATURE-----

--v2id2b4lhcrh7vec--

