Return-Path: <linux-i2c+bounces-3326-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0618B6812
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 04:53:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B6931C21F0A
	for <lists+linux-i2c@lfdr.de>; Tue, 30 Apr 2024 02:53:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3A965D53F;
	Tue, 30 Apr 2024 02:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2Ve/dkz"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0165D2EE;
	Tue, 30 Apr 2024 02:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714445601; cv=none; b=Nc3k2plgG6ypbMdM+eFjV6nOM7VfO2H4H0PWQhYRRec3hi2MdsWM+C475nsRkB8OkHZTk/SaW94J5KXcQrKRpP8SBzBeHrSQyETb+xnjwd1cSNcnjZGaDgZMP4nHVwCB36qbU89ksW0pDzq+8dULoSBaj5xNXIVHpwzhX3c5qn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714445601; c=relaxed/simple;
	bh=ZbwdDaroTdo1GXJdazAaqQwp1j9mDh2nFYYMy1dOxZY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdb/GUvAMg33ZGXb2zeJcGgKaRVDPe0c0RBiCgIAdttu2OcRgausJtDg8gmNqQ0RQNa/HXG2Evp1U3EkxSuOvIMy/RPSoXAPcX8GbTdIkQtdy21D8Y2V9GrzKLejgolOriIjhmATA1n7DN+NOYkXbGaT9pY3O/ko7sOuvRrjJvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2Ve/dkz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B59C116B1;
	Tue, 30 Apr 2024 02:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714445600;
	bh=ZbwdDaroTdo1GXJdazAaqQwp1j9mDh2nFYYMy1dOxZY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s2Ve/dkzHaZytY/7ZZi+2NJbXD1Qee6O59sRdhbrzt3zuAQ+AESp1ngA4+yvM1aA9
	 zJ/0FjGDr5IgGfo3qXJ6C42rZMKYl5UTpaJPpXxuO7iOfZoFP+oiqRJ0AHu/RmjizF
	 mqJSg8omO2zIPo4DLIUU9Qt7M1OFeJEaNfDN4GXlivAtNdfWE24mHue9oFm8IGhFJi
	 ZQIj167hQfOdkVlaVLxpF73ZapXS1kDtU3OX2FJ2mUQ5Tzrr3U3ASTkB90bgtIrXRt
	 FFIusSV0zUHIGy2dY7saGMrnzF+tRivpjkX9bDFTZC+niSqw70vRhn6kJbbzXbMPd2
	 Y8jlW/fpZapAw==
Date: Tue, 30 Apr 2024 11:53:17 +0900
From: Mark Brown <broonie@kernel.org>
To: "zoie.lin" <zoie.lin@mediatek.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH 1/3] misc: eeprom: at24: add optional dovdd-supply
Message-ID: <ZjBdHdVUW9Q67nAC@finisterre.sirena.org.uk>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
 <20240426102949.23057-2-zoie.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZIh+FzWuFnJR7Nbu"
Content-Disposition: inline
In-Reply-To: <20240426102949.23057-2-zoie.lin@mediatek.com>
X-Cookie: lisp, v.:


--ZIh+FzWuFnJR7Nbu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 26, 2024 at 06:29:47PM +0800, zoie.lin wrote:
> From: Zoie Lin <zoie.lin@mediatek.com>
>=20
> Incorporate support for the dovdd regulator, which supplies an
> additional power source to the EEPROM.

It would be helpful if you could supply some additional information
about what this supply is, why we can't tell if it's supposed to be
there or not and so on.

--ZIh+FzWuFnJR7Nbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmYwXRcACgkQJNaLcl1U
h9BeJgf+KQ2qScakBicm2lPxwrL7sUMR4q3n03ty2aFii2oaAjfWmx3n7bfbHQB3
rMAz8iACiz36eaQsR0IYeuKcsSXCjgp8QQhqXU5nj3+8cvAn7G2gSYn9+EODx3Mr
n3ZCoDJxzcnuwpjuEKHuo7tFlD+kPRwmuc3z8TEowNosa5KpMUna/qvTk0z4ETIP
AERQFdjEyZVDV7EXjPAMBLt24M33PKPljlE0E/8jpOHCYsWg4zaWXae3zyvCOFoy
vD3NFlQ4eb+ITlUkRuaYwmFAAsvjiOwyM31/CeeIA3any2ybfk6S0e2yB8sGzQe7
HuMkGpgeXsfHaA3g0KANZ3jndjKC4A==
=Oyc6
-----END PGP SIGNATURE-----

--ZIh+FzWuFnJR7Nbu--

