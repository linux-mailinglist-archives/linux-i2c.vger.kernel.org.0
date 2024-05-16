Return-Path: <linux-i2c+bounces-3548-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EDB58C7C83
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 20:31:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A088AB22B86
	for <lists+linux-i2c@lfdr.de>; Thu, 16 May 2024 18:31:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA7DD15748B;
	Thu, 16 May 2024 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nkYjuS/N"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A35156C7F;
	Thu, 16 May 2024 18:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715883892; cv=none; b=tcEgwi+qRJl9nl4U6V6KkhG+9LI9jAIRQId9GsliZlA8D0Gis8MEQ9ebW+80tip13YByZz7Efu7Ly74ZGjhI+UqX0Nfh05wA/YM2uRidgu/fH7EqaFZbpvzCxJXRexAAa0vxHN+HPZwPm2Cbo84tm16GM4nHxyWTHLJ+v7eHe3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715883892; c=relaxed/simple;
	bh=cPL1DhrdW/xtQHPL/q/XvgIelBXk6IEmMe/AGb1c944=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BA2WgGa7wl5zBkPsETlWeJUuy6ZIh4Jn1vbq+ONn4otFiYhV+jvQCSbYVL5aOpW8tqdnrSx2JotEpGBHf9Nvm3gzC9KELGbH/KEC2tIbK16HUgscEmUS5OqzrzBXKo3X3PYHixzt9VQo2+pTqhsDAOtCrGmmORUQuuX1Svbn9+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nkYjuS/N; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C819C113CC;
	Thu, 16 May 2024 18:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715883891;
	bh=cPL1DhrdW/xtQHPL/q/XvgIelBXk6IEmMe/AGb1c944=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkYjuS/NexdomGUYU3PhmF2BEhhJUZUm4c0PYZXVThwzQ1oUCUlMhSlRnZ1V3G0dI
	 Wl35yGix0v9t0gXtX+EXf16tY03zkK6DewJ36fpxh/djVTlLkaW2R/+NRXUvKtylgO
	 aRhbWYSXg7PTX9Y3jEpRtXFnL/Ydoiw95ivnOxxWhnRT0x2UWZks1Yk+85EkqyFn5O
	 nTSQ8P7WVoKmLK5lq+y0Pd+JeIEPBYtIRr+ORf7MgipT/MbEkZBrOLgo2UNDPPG02Z
	 zMHpHpGNvRSuztl7iD7RNVzpr3jdPiJZ6FCQPxGqpZOxeN0/+iPfCsNAxZV4HyVH8v
	 ULd2zSEYDI5Pw==
Date: Thu, 16 May 2024 19:24:46 +0100
From: Mark Brown <broonie@kernel.org>
To: Eddie James <eajames@linux.ibm.com>
Cc: linux-fsi@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-spi@vger.kernel.org,
	andi.shyti@kernel.org, joel@jms.id.au, alistair@popple.id.au,
	jk@ozlabs.org, andrew@codeconstruct.com.au,
	linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 38/40] spi: fsi: Calculate clock divider from local
 bus frequency
Message-ID: <a3cf96f2-fa53-4f18-90f0-c21d6df5b2af@sirena.org.uk>
References: <20240516181907.3468796-1-eajames@linux.ibm.com>
 <20240516181907.3468796-39-eajames@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="EtRMkbJm6V6cCFzH"
Content-Disposition: inline
In-Reply-To: <20240516181907.3468796-39-eajames@linux.ibm.com>
X-Cookie: I'm having a MID-WEEK CRISIS!


--EtRMkbJm6V6cCFzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 16, 2024 at 01:19:05PM -0500, Eddie James wrote:
> Use the new FSI device local bus clock to calculate the proper SPI
> clock divider.

Acked-by: Mark Brown <broonie@kernel.org>

--EtRMkbJm6V6cCFzH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZGT20ACgkQJNaLcl1U
h9Cd2Af/YyaJyngR16Od3D4m0rdz60YKgrtOS3Cb/uzkT7akZun/GI8APPvqa3eT
MoMILsYV/sJLZZSToRxWTX4KeD6W05e/xroFqQGdEFOYPKIgSKurASoHutiksOW+
6eG20q6tI7MHN0ljWxuvxl5f50mmgNGHilOP9SliRxqwZ7Opezxbmjefr1Zzekpd
VpuzfhVO+Cb29HWR8NWcIqFcLi0Hi/VzEtJ6ydEWQAUuVU1UOWP1VeNLiNxLrP4d
mAn+T8KHJfreTV9pf2d9hGxH0KXpeEVeq1CYJCjClrSZ3I5ra3iSVNxIQhpTZnWJ
BhkD4E3BAnkYctMOFZms4ZgVm8W50A==
=n/DO
-----END PGP SIGNATURE-----

--EtRMkbJm6V6cCFzH--

