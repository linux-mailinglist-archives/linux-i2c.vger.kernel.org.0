Return-Path: <linux-i2c+bounces-13182-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B114BA1899
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 23:31:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5EFE0189AE4D
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 21:31:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A99B9286D64;
	Thu, 25 Sep 2025 21:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OWZc22Ex"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6C1E22A7F1
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 21:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758835865; cv=none; b=fO3STMZkycSprK0l2MfWczHqMEKiDWfRf/vTD7dfNz97b6Yp/xRmMg3gaYlwNItLHwTS8rvNYeep6fVc04xWqEIWllGwd8+erwrgcFqiT9jkvjwIX5YymGFB6Rjawd1oCWC8eLsMPUhryy/LQiv2eiGyuYDCLa8VCJAjID/e11g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758835865; c=relaxed/simple;
	bh=WVdsQxbe9UaWBdOhX36alN9UVBCyGgEWHyRT2Dfx5Rc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CyME4nOlnd5DDS9vziou45m6zv2iTpVJgN7CCfC5s0GnaK8hQ3hoEKEitdwI1J6sqQy4Fambx5iL2Y8IY6Xii6/3x8jj+fLDYr0aZPnGKLtzu8TIHP2CCtj13FoLmcD3GNTEn9KH0CP3HTaBqIfxg8KJZ8ERui5lDyE4fwLL69Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OWZc22Ex; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WVds
	Qxbe9UaWBdOhX36alN9UVBCyGgEWHyRT2Dfx5Rc=; b=OWZc22Ex68AItBuuCtfp
	B7LRxLrwBQ0lXFnw7ln64p7t+p84Mdzvskt7PYGL18tQ9CQ7VByocuKQL1sPjyol
	nJxK0z6FebAuYy8Vi1QL9lT306JaopSt3/YAUa1TVcfg7YyZC8DRlQRfoG+ld76v
	tY2mIebDY0gmmTVfpoU4ViI1AQaW8CMrClrG4ou92w1hTZeLIxlWq6zmeLS+PcQK
	equEgh1Y+gHBkqnYMBXJUPJWdD0wXRyuZ+2d+i7OL78llzeE1yLPtBKTaozazK+w
	W4Fl1mcJZCjpEs4ewBIxooOcNa3Y1pfx+qzal+dT6Q4npHlTggXu1J50noiVnkBe
	JA==
Received: (qmail 2020059 invoked from network); 25 Sep 2025 23:30:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 23:30:59 +0200
X-UD-Smtp-Session: l3s3148p1@+Kdg4qY/yIwujntx
Date: Thu, 25 Sep 2025 23:30:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jonas Jelonek <jelonek.jonas@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-i2c@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Stockhausen <markus.stockhausen@gmx.de>,
	Sven Eckelmann <sven@narfation.org>,
	Harshal Gohel <hg@simonwunderlich.de>
Subject: Re: [PATCH v7 04/12] i2c: rtl9300: use regmap fields and API for
 registers
Message-ID: <aNW0jiJQHcS-FKwr@shikoro>
References: <20250831100457.3114-1-jelonek.jonas@gmail.com>
 <20250831100457.3114-5-jelonek.jonas@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dO3d+mpa6id457GE"
Content-Disposition: inline
In-Reply-To: <20250831100457.3114-5-jelonek.jonas@gmail.com>


--dO3d+mpa6id457GE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 31, 2025 at 10:04:49AM +0000, Jonas Jelonek wrote:
> Adapt the RTL9300 I2C controller driver to use more of the regmap
> API, especially make use of reg_field and regmap_field instead of macros
> to represent registers. Most register operations are performed through
> regmap_field_* API then.
>=20
> Handle SCL selection using separate chip-specific functions since this
> is already known to differ between the Realtek SoC families in such a
> way that this cannot be properly handled using just a different
> reg_field.
>=20
> This makes it easier to add support for newer generations or to handle
> differences between specific revisions within a series. Just by
> defining a separate driver data structure with the corresponding
> register field definitions and linking it to a new compatible.
>=20
> Signed-off-by: Jonas Jelonek <jelonek.jonas@gmail.com>
> Tested-by: Sven Eckelmann <sven@narfation.org>
> Reviewed-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> Tested-by: Chris Packham <chris.packham@alliedtelesis.co.nz> # On RTL9302=
C based board
> Tested-by: Markus Stockhausen <markus.stockhausen@gmx.de>

I wanted to apply the rest of this series but applying fails. Can you
kindly rebase it to 6.17-rc5 or later?


--dO3d+mpa6id457GE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVtIsACgkQFA3kzBSg
KbZvPBAAjZht/3VKrr4/tynzLvBBiMBfM8zK9TbUBhgrXy1CdKyo57dpemzgqizW
7peUZ+jzGWa6UwbL0DsPMunGFeurssFQ8ZmJ4PTrkw8ZheizlsMBSRO8Wgl9QTkr
xcDjRiJn81SAO4A07ZIZVcgwslR61wM9KUvgAJL31PMIdIZyMZK0LBqB5EU/34XG
ZMkUsFSinNyz9fTQEcO50Afpbj5YfxWp1ARR2KuE8Hj3Wa8R6PSwnUojYdjEIUiA
xP0sAUC1LMIE1M4CO5HKry4zevMStVEzfnrpSm/wuemoOZvuFkWoHS70DV1hfeo+
eJ7ZsDO7bbrbdSFmTEX4bNcaya1rHM6ESd2rbnPhYhBaERbJi6/Wy4VbVAAf9SUF
unA3xsSO72p1mzKvG9Sx2M3BCWLOk388upRHIgPCL2Cm5NEX365sUk3srmGrWmBc
JKX2odxg42Dz4IrfStryigaK6n3jMw/iPeAJxTDfdUFA6Wjj2r4aZhqNicpBPjby
3BdWKhk37jHebwpfOVbSAMuqzsqHSSWbeIUxVVXfryNioOPN9LAN2CF6cUzsi1ir
TakGsrUE5lw1YHxCsbKAk/5j/+1Upay3vrIULKXX6BPXDqjDz+JUmIgPax2rxdxi
brEw4ziIzzSQjTrj+krz202jWYOdGdxOeHD2fW+uwZ4e8ZPCkHc=
=lj8t
-----END PGP SIGNATURE-----

--dO3d+mpa6id457GE--

