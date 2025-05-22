Return-Path: <linux-i2c+bounces-11115-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F2319AC0987
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 12:12:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1A60E1BA3601
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:12:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64CF4288C9B;
	Thu, 22 May 2025 10:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="lGbp1kEf"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EF52882BF
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 10:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747908733; cv=none; b=RGLiK96Y4UkfWvaXg36Z/5NsbH3pZIlqIfDXieiXCb+z+WDSMorT2wdhkoCiLUMwwnZ8OrJ/da//eeOIhzYMaMV3mdvspKqWYh/904roj7gBn2voUG/YE8g8ZRVsVVpWNmwUkRJDO/gfedBa3ZZ8+8pE2g2wzuxixsCYQm/UTuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747908733; c=relaxed/simple;
	bh=c15E/+NBPv6fuFlNqrqrXNkHhGA9OL64AoKJ5bRvttw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0JQrqAaBQKaorprrs9H+3PYkxu53+IsLBBgbv+CfJUBQJIZFxJ9hxOn2lO6TUmLW9kh92Dnx0CApytaBQX/pkcXeXkxjMu8im0k6fFdO3Yvrqo146KPpUTGE8piIg/msru6at1bNKVS4OIwmT5qA9rbHMD3bkyFrIVOCUARPNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=lGbp1kEf; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=6F1W
	vTj0UGEy3Utpc80p61aj/NjDeQE3A7oZc1v2ynk=; b=lGbp1kEfpG10X5kVOQ/4
	U2Lg2CKtVTF1n++pqpLaLOo6RO1oInLMzE95Qt/g8q+eMoSl6jcyi5TGK3HavNDt
	xTvoc+/cP6fEL+BwuFsreHA4d326qVqc1K83KKQt0Z6uOrBG1swLZdkER+7g/mMf
	D/bSfKrBq5pyhYQw1zX25lvRzLh6xyWaqobn5umCW0llBG178cjqIhu6ug78YMGw
	rkCFUaESAI/n+0AH/B5Jksjusepwzo6ivGvwKQnrX0UG46c4wcuVQvjI23c8l1qr
	8kn8I9Wteq/29hp5AmhTyz+cWNKhArBDFKtLjb+7U43RyJBSdUmrT+lVIDIlkr56
	eA==
Received: (qmail 3610671 invoked from network); 22 May 2025 12:12:08 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 12:12:08 +0200
X-UD-Smtp-Session: l3s3148p1@j7XctrY15tggAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 12:12:08 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 0/9] i2c: atr: allow usage of nested ATRs
Message-ID: <aC74eGw6_CIR1fd4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20250507121917.2364416-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LvuMpXix1y3uk6B7"
Content-Disposition: inline
In-Reply-To: <20250507121917.2364416-1-demonsingur@gmail.com>


--LvuMpXix1y3uk6B7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:19:06PM +0300, Cosmin Tanislav wrote:
> For upcoming GMSL drivers, we need to be able to use nested ATRs.
> The deserializer changes the address of the serializers, and can only
> do that for the serializers, while the serializers have proper address
> translation hardware, and can translate the address of its children.
>=20
> To achieve this, add a static flag and a passthrough flag.
> The static flag prevents usage of dynamic remapping by disallowing
> creation of new mappings outside of the attach_addr() function.
> The passthrough flag prevents messages coming from non-direct children
> (which don't have a local mapping) to be treated as erroneous.
>=20
> This series also contains various fixes to the logic observed during
> development.
>=20
> The previous version is at:
> https://lore.kernel.org/lkml/20250428102516.933571-1-demonsingur@gmail.com
>=20
> V5:
>  * pick up Reviewed-by tags
>  * expand the I2C_ATR_F_STATIC description
>  * place i2c_atr_create_mapping_by_addr() before
>    i2c_atr_replace_mapping_by_addr()
>=20
> V4:
>  * rebase on latest merged changes, and latest submitted fixes
>=20
> V3:
>  * remove i2c_atr_new_flags(), add flags parameter to i2c_atr_new() in
>    a new patch
>  * remove "i2c: atr: unlock mutex after c2a access" patch as it will
>    be moved into the base series
>  * remove alias_pairs variable used only once
>  * remove err_del_c2a label used only once
>  * add lockdep_assert_held to i2c_atr_create_mapping_by_addr()
>  * I2C_ATR_STATIC -> I2C_ATR_F_STATIC
>  * I2C_ATR_PASSTHROUGH -> I2C_ATR_F_PASSTHROUGH
>  * add passthrough check to i2c_atr_smbus_xfer()
>=20
> V2:
>  * rename and split up i2c_atr_find_mapping_by_addr() to allow for
>    usage of parts of its logic where applicable
>=20
> Cosmin Tanislav (8):
>   i2c: atr: find_mapping() -> get_mapping()
>   i2c: atr: split up i2c_atr_get_mapping_by_addr()
>   i2c: atr: do not create mapping in detach_addr()
>   i2c: atr: deduplicate logic in attach_addr()
>   i2c: atr: allow replacing mappings in attach_addr()
>   i2c: atr: add flags parameter to i2c_atr_new()
>   i2c: atr: add static flag
>   i2c: atr: add passthrough flag
>=20
> Tomi Valkeinen (1):
>   i2c: atr: Fix lockdep for nested ATRs
>=20

Applied to for-next, thanks!


--LvuMpXix1y3uk6B7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu+HgACgkQFA3kzBSg
KbYDNBAAtneX9Reko82ECjjvgXy/IQZH+eaJaxDK7MOb2KcrUQv5F9pB2eH04HRe
v0xgW3fe6zRMSFx1jkJRIFf+QHeFxYuZeV35guSEnR9GDN1zeL0wxBy9lkUEUXtw
nik2uc/4IrAIZ7VqlcrbXIsfMCrHDF2fQnzPpVKDI4QVDdHtyO4RzXygNrZuJwrb
dlW9076cwj+vZh05Rkq6AFrrEqdPyj8O2wtvo2vASfYU6Vk8gpMaMqmJ9RTkJHFq
/4wEdsEx9mXZ0YvMTN6iAWiKF6Sg5z4SU7crSShnV7htkmJNVhvelNKpThkg8OsQ
R70GdAiiwE1tJa/VKdRF9DQtOmmqmfaOMWVLJuCs8mOsqKZbnHJtXI5uIm74oP+z
AGDnLZF2G7zhex6T0DRfiMsNmqA3+yhBRdBLH4kkt/qJHZ3y+ljVUAwCSd60f1Gs
GWRtuoahvbAhYpQv6uekQM9l/IHDqn1ie5J0eEO2MZ8Jcr7icaEg8DG4bsQu6H6n
/7ib+GUFzfIihz2swlkByJ/SGHUAvelN/R9gyasopJavEVi1bHMpcgRRBcTxVx5X
aniRBER17AMA+xaeQyXKiFq8RievCusZvI+/6M6N/TlfTgMGCU2mVBsSJzZtSOaU
ZpZjxlr5BgVO5C5/kz4eqkSH1j+sJIPdxQwMl+6VrVqYa8XnPBM=
=4Gps
-----END PGP SIGNATURE-----

--LvuMpXix1y3uk6B7--

