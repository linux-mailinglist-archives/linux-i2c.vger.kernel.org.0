Return-Path: <linux-i2c+bounces-868-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE578187B1
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 13:43:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1265A1C23D51
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 12:43:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF471A58C;
	Tue, 19 Dec 2023 12:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="QWktO/OU"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DF7219BCF
	for <linux-i2c@vger.kernel.org>; Tue, 19 Dec 2023 12:42:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=38oQ
	T3uqHdPC7B/hQDCu0zozo7rgmO/z0+twHKOMQog=; b=QWktO/OUOmSaQ/dgFfcr
	mHG2YkSRRJaOleDwOlyQHH2zY2I2jdwSRMjR2nqiR2C4hcCRp9JMekP5BrAGvkPn
	1PmzbR1cPhhFP/FDUNNKOh1sM91gIS07T7p0va5Sbcy1xf+2LOOnmii+/TNOQdhr
	4fp0Orw4n1O904QUbI3Ith9s0XD+LMeztCYtEG3qgaTdfyTLyYg5vOoNTNVUhDgm
	iZohif5Fn3MSAPPZbu0PSLIU8ZP9SIspfWWchTPED/OqP7S71IhUs/2gPafdkb0h
	p/qgjMcJLRj5XWySnDfUFF6i+70uBNjUM205K2gBtKzBTckeONZX8DdUF7ozoX35
	pA==
Received: (qmail 2562568 invoked from network); 19 Dec 2023 13:42:56 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 Dec 2023 13:42:56 +0100
X-UD-Smtp-Session: l3s3148p1@gAOoNNwMBOoujnsb
Date: Tue, 19 Dec 2023 13:42:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] i2c: rcar: add support for Gen4 devices
Message-ID: <ZYGPz2tndnZefVEA@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BHHuKcB6ZmV8MrDz"
Content-Disposition: inline
In-Reply-To: <20231214074358.8711-1-wsa+renesas@sang-engineering.com>


--BHHuKcB6ZmV8MrDz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 14, 2023 at 08:43:56AM +0100, Wolfram Sang wrote:
> The newest generation of Renesas R-Car SoCs support FastMode+. This
> series enables the driver to use it. Changes since v1 are annotated in
> the patches.
>=20
> Looking forward to comments and test reports etc.
>=20
> Happy hacking!
>=20
>=20
> Wolfram Sang (2):
>   i2c: rcar: introduce Gen4 devices
>   i2c: rcar: add FastMode+ support for Gen4
>=20

Applied to for-next, thanks!


--BHHuKcB6ZmV8MrDz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBj88ACgkQFA3kzBSg
KbZO6g//Vzs8M/eFJMlp81JS4z/Frc3pbNA2O/Gq965PDVh/WGlONhkBEOR0vIoy
KW4IGga8Yg7MpL0vZ0TkUHED308IhKVPWIlu2wLpxLsR6pYV7/CJ69yaeGwZos8o
+KOH93cPu+v1FgUq/Fci7HOADHWFr8nrgw7QGeikzWarkHVYvsrxLtk8UioCAQJt
cBFd0tqji44dr7CHVEVaPiPjO8idvWqjFS/wSYpfaMFgDPXN4HI9rIkIYSBL69YY
CiiY+xwWLuA1Mw5MWTIONvpNjv6dVOe63R0Pp2mFkrVcOf6so5m525yoGG1oNtoP
W220n/HPNPUPmHDiVmuSJVsrlwWVgnm+ncYuAvAWA+WdK8bWsBYdXhacO8m57LgB
a6+7/bgYtNK3TeRo9r3g5+azQ/jQfGVLK9qOWkCDDj0XRDwnEd/tbZ13gPn365TC
CvlA7SdZUcNrLha8IKkIixyfYsCZyLiP/JyKKGACt40gn33l3Qts+Qb1paS4hUU+
8qOilFzTl8KiHv1FivtYY7tLtW2E0UfoVUzcWGeY9gXtgsOubUsOeNwv//d0kZ3/
fEi5oO+RIdiZN6mvq9O/K3OJ2ndwDMeapuh/c8x1gwxCWNgm5OmqXJqF9QB4D4XE
H1r8BGqPbV49FlXO+YkhTVWYDIFdWBIcHVGPVaIb4M6q4ICeQgo=
=4AVO
-----END PGP SIGNATURE-----

--BHHuKcB6ZmV8MrDz--

