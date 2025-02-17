Return-Path: <linux-i2c+bounces-9469-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B169A37F97
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 11:14:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 882ED7A231B
	for <lists+linux-i2c@lfdr.de>; Mon, 17 Feb 2025 10:12:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AAB6215F6A;
	Mon, 17 Feb 2025 10:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="YPpiNbxl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C64E81E
	for <linux-i2c@vger.kernel.org>; Mon, 17 Feb 2025 10:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739787202; cv=none; b=Y2lcGS+cNgi574+qdrfDv9O1FZR4bsgpvXYWaqRBLC1HCgsj1mk73vBvQaypjI8xlm+AvjYs2wNdKddiv1D/1Zk4EF9jJh55cVSOywlPPw5zHLw/e/FrDmYF7LQWgLIIdDcs63cDWxvoOq9fAC88se7QFddYvMORJJiOgWboNtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739787202; c=relaxed/simple;
	bh=5lZiDOb4Cl4u75ojopXMXQj9ND2UBVVxu7wDpjgXEzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mLE2uXMmxANJKYBtKVUsKapvVqGTPGLKzdayh5qlYzMWMj+mWk868TR3z6aaCQSJsLioq9+yvPbY3DOVKi3/mFmG41HMDFMcX/hv64CDI3f3JV4jg3Jr0nr9LJCIywJe8o3gj38Z9JpoG6JRLTlOoZk5Iut49coo6b6iZM4oMeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=YPpiNbxl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=2oWb
	+WruHpktLVYYWrQ9q/yqS/SDQBOJLksMRV/2xbQ=; b=YPpiNbxllUJH5yeLX7J9
	OFPE++xZsyH1K8p6BPlNFEuzBQwNmc9DQXp+FlTPkJBHNh7LVH3FyPd1X9lFyWAH
	zVvLWRVwi3Atbe/knHFSeu0qXD7ts9RMTjHHP1ckAZN6B75eIiNna64Ty3r6D1gV
	kdGUmYJYaywZiSl6bntm/5ffnfg0aaCbqgTAx9zDLwjOdMS57gRN1WZ6uy30u0n3
	4yTNH6/HVpcvPXgpuqg2FIc22CAyuWwYEozGh1XMuSOktB1tTaFm65BoYzv7TGya
	CoOhZrM31FkTBbLctbF8x3bIEWrFysCUbr09QtpuKSE3sxqdlcoDRkXw14ObPRJr
	LQ==
Received: (qmail 3247893 invoked from network); 17 Feb 2025 11:13:18 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 17 Feb 2025 11:13:18 +0100
X-UD-Smtp-Session: l3s3148p1@FXLqxVMuTowujnvP
Date: Mon, 17 Feb 2025 11:13:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Frederik =?utf-8?Q?Br=C3=A6ndstrup?= <frederikbraendstrup@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: Dynamic address for an i2c device
Message-ID: <Z7MLvS5L3ttWJ1LA@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Frederik =?utf-8?Q?Br=C3=A6ndstrup?= <frederikbraendstrup@gmail.com>,
	linux-i2c@vger.kernel.org
References: <CADs2FCF+v3g4V4cfNREFm6KZ_LAHB0vCC2T2PcHjNO4UHq_atw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bKRBGjctkoJPllPo"
Content-Disposition: inline
In-Reply-To: <CADs2FCF+v3g4V4cfNREFm6KZ_LAHB0vCC2T2PcHjNO4UHq_atw@mail.gmail.com>


--bKRBGjctkoJPllPo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

> I have been trying (and failing) to understand if it's possible to
> make the arrangement specified on page 45 regarding "Multi-Slave
> Operation", where each device address is configured during
> initialization, by first pulling down the nFAULT pin of all other
> devices and then writing to the address register of the default
> address, which the remaining device would then ack and use afterwards.
>=20
> Is anyone aware of other devices using similar schemes, that I could
> maybe draw some inspiration from?

Well, GMSL has a somewhat similar mechanism, it seems. The de-serializer
(drivers/media/i2c/max9286.c) is an i2c-mux to which n camera sensors
are attached. The sensors all have the same i2c address initially. Now,
the code first muxes each single bus to the controller, so that the
serializer (drivers//media/i2c/max9271.c) on the "other side" of the
muxed bus can then be programmed to translate the all-the-same-address
to an individual address. After this is done for all cameras, the mux
enables all channels at once because the addresses are now unique on the
busses.

The code for all that is complicated, though. Not sure if you can derive
inspiration from it. Good luck, though!

Happy hacking,

   Wolfram


--bKRBGjctkoJPllPo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmezC70ACgkQFA3kzBSg
KbaATg/+JWpkBuOGvvPz4ryeiWodZD/wakrUupuS4R7/JjzyKGoQpTkPhfyyqP9/
/RDBRRvN2jdvknNiPUFCFKl5rwYXjZ7GMSDZ+YKOkmk2GJM9bEwA3mlxIwstkWQ0
yWDeFrg+iyFYaWZ+W4WT5ohKm8ZmgXUWNEGIhGGVFXlZ/acK4McYhGO6q9jKKwLh
D18lki8ooVG/iij4XGt7PGnoKFgEHFfeDGksXJFVUBDj2GdxSPIXhSLuCZzFroXY
x/AkaJRXebZ+07JrxxvjrYcDpHHqOdENQagPRFLDwIK7sMlaAN+alS7aGpkIyf+P
WXnc+tq+bW3+XU+dRpJliUUu5L/1dsaGKfPGEKnZERC6etgLhixsbz/5R6/Pm9Gk
WEaWE4g+lU+shnooTuem038J2nx8tmHU7yJJV4AXmktKv+VJImTkhD5k4F0PGTsK
h3HLJdj1RY8l+puR0ES+ZS3h/KEjNX3PdjCX0ouPu6He/NNJT9tKYaQxZWRTEXrq
ySn3rzm963Zh5T1HUwBXUkblUrA/dubuW+zXnGMhCb1DQ+pqD7EwN/ng4bN1otxW
3PSvXpwf16zQWUyMcc9FX0GHpxrAytJTTa+wArUqBmNmnN045qAla/rd8GOkcd30
3d3vX6PKe3BDi5RoI/hmjP4d352jXMVsGGnGJsd1y6P51f9KRc8=
=WHFd
-----END PGP SIGNATURE-----

--bKRBGjctkoJPllPo--

