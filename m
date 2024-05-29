Return-Path: <linux-i2c+bounces-3706-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F03C8D3BED
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 18:10:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42CD81F226B3
	for <lists+linux-i2c@lfdr.de>; Wed, 29 May 2024 16:10:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9073B181D1B;
	Wed, 29 May 2024 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdGnTttw"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487DE139588;
	Wed, 29 May 2024 16:10:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716999050; cv=none; b=MAX9NRLQCC3f6a6tlNPUsB9IztP/bUfWSVlj6Q4QFnEuq/AAYXkpucLrslf9iQW+J/Rgt1e5UFvK8pRg9bob8L3pROAPBLE3TRqIRTYVKOkUAaeSN8pLWSqbHstUDzBUbYlkLQf4Acxh12XpuXNyr3cqxo1ZSCulpva3s00Nex4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716999050; c=relaxed/simple;
	bh=4VLYCefvsT9d8ond7H7XyGpq0yneSfHbgNsZAxOxGX4=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p3svTsyG0U+Qhcw2jkCNtg5zDoelfL6jeRqWPjltqoA4mmetl/+7CmPQZ3kLQy9lhN6wmjDkZalJ4+w0ZGUr3dl+5VZ4Z1VzSDL3+hYu6AOjenif0w0BrxCxWV54KRhaZcPFUuaKijVoXZzMiblb6jtEGEisv/pFYUK7bUwjXIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdGnTttw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEC1BC116B1;
	Wed, 29 May 2024 16:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716999049;
	bh=4VLYCefvsT9d8ond7H7XyGpq0yneSfHbgNsZAxOxGX4=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=rdGnTttwzGsZtPL/V5yGQwFVkGALc888z57SvYKgv/h63BU2ygtubn3GDRgx1AHSz
	 xGkJvpAGs6P2BtusTcAX/1bDgd2z6k0Pf+hoa3LqEi9/g7GSVUGbP8j9HKOycL+06H
	 lrINskvYzpPwYZkDm4sPKDF0DJALsJwCiNmf50T6VjigCM+A3L7ZFYXxTUV0LQvS6t
	 02LvkOozuL7TXQx+z3A8ku7OpDfzAm5t+0kwlUKpbN1qzDLs0VHsj5cmoky49Zmp8X
	 aDNNFkaIuOTI5+enbdaNwCknT3D7VT+qavIA6PCm+Eoqa9Ab0WMHk4vV0+h+uLPSgi
	 a+r7qbVSlDq+g==
Date: Wed, 29 May 2024 17:10:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, egyszeregy@freemail.hu,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c-dev: Introduce "linux,i2c-dev-name" property for
 device tree of I2C controller.
Message-ID: <20240529-espresso-founding-54a36bb34e8e@spud>
References: <20240519165504.19627-1-egyszeregy@freemail.hu>
 <mnzj5bqbiuwt4dqnenwctejdnqccqzk2x4tkz2ukqssrmdmsxc@7srnfnfjym26>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iKz0L6DxNIzz7++T"
Content-Disposition: inline
In-Reply-To: <mnzj5bqbiuwt4dqnenwctejdnqccqzk2x4tkz2ukqssrmdmsxc@7srnfnfjym26>


--iKz0L6DxNIzz7++T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 29, 2024 at 12:28:03PM +0200, Wolfram Sang wrote:
>=20
> > Optionally, an I2C controller may have a "linux,i2c-dev-name" property.
> > This is a string which is defining a custom suffix name for I2C device
> > in /dev/i2c-<name> format. It helps to improve software portability bet=
ween
> > various SoCs and reduce complexities of hardware related codes in SWs.
>=20
> (I thought I already replied to this?)
>=20
> Highly similar to [1] from 2021. I don't have a super clear opinion
> about this, so I'd need help from the DT maintainers. But the discussion
> from back then stalled.
>=20
> [1] http://patchwork.ozlabs.org/project/linux-i2c/list/?series=3D237908

This patch (or one very similar) got sent to the SPI and GPIO subsystems
too. The response was effectively "use udev":
https://lore.kernel.org/all/20240519144920.14804-1-egyszeregy@freemail.hu/
https://lore.kernel.org/all/20240519211346.30323-1-egyszeregy@freemail.hu/

This definitely is in "devicetree properties are not for software-policy"
territory to me, maybe Rob's changed his mind since 2021.

--iKz0L6DxNIzz7++T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZldThgAKCRB4tDGHoIJi
0qZkAQCM+GMm8GvD5T4HKNdwij22a+vQCLueZ5s/QX8us5FaUwEAmr2n7g5m+C4V
qQsS4fLZv1sNspTOA1YmGzGEOcc/JQM=
=TSAn
-----END PGP SIGNATURE-----

--iKz0L6DxNIzz7++T--

