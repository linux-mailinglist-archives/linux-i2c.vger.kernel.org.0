Return-Path: <linux-i2c+bounces-866-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B0E818793
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 13:36:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8776A1F22436
	for <lists+linux-i2c@lfdr.de>; Tue, 19 Dec 2023 12:36:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E9F31802D;
	Tue, 19 Dec 2023 12:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sx8XwVUI"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AF2418622;
	Tue, 19 Dec 2023 12:36:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC17AC433C7;
	Tue, 19 Dec 2023 12:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702989381;
	bh=tiHOc2vd0PeMZmcefRov95UDysQbT1EeRCm2fFpUgQU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sx8XwVUIxasLh6HVN/W8pU7bRX4zjoBWn7d5JDeV7dh47LKadr6MdqW+EQ16jKN5j
	 gjF4Qm87OOKGmtS8sW67sncJwB5u0vZjqEfR+HgeyyGLN7lrRBDFAO8BH+f8XT7xCt
	 1gHNNoVmCPDr1Rj7ZXuMC/FruTuA6gar97X7r3ePywDLF5WjK9Kq8mChVySDNz2R4+
	 OCX5/OC0l0tcA3Wd11ovN4U7r6etYa1f96orjVP2scOlQa+DU5Gvuy+7VYHIkUsZ3i
	 pCOJKNHbhF4Od8ex75bifvlf6IGLgf4KbYCg/TWvUtkVhhTnzCsfUyTD/T3QMBFNEl
	 beMhs4PaBjiCQ==
Date: Tue, 19 Dec 2023 13:36:17 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: linux-i2c@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 00/10] Don't let i2c adapters declare I2C_CLASS_SPD
 support if they support I2C_CLASS_HWMON
Message-ID: <ZYGOQYDaXmTK2nke@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
References: <20231124101619.6470-1-hkallweit1@gmail.com>
 <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="+O02xqf8AKUyujd4"
Content-Disposition: inline
In-Reply-To: <b2dd7159-844e-4d5a-832d-a2e8c0f26f50@gmail.com>


--+O02xqf8AKUyujd4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> This series and my other series are sitting idle in patchwork
> for 3 weeks now. AFAICS they have the needed ack's.
> Anything missing before they can be applied?

Applied to for-next, thanks!


--+O02xqf8AKUyujd4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmWBjkEACgkQFA3kzBSg
KbaO1hAAooFUEwBmrRIwLhiUmuleNDxpkm2+TJogB4CxDIfA95CV7cwuMB57JD0O
zpyBvqiaj8yHo9h6QW5u8oeYcyJJAkpO5bAa4JDCAqtvJjoEs1lx1FNvD5JdbwMD
Nzps601cYoNHO7wGT3Yzv3ZDYFlpUhY1HdcJDRrNxLcIzwDgLHDaIKP/qXF82Fvl
CFj00WJZ7nKay2vxMF/kHcEsqUTrIxsEgJGio6am7qPeSoCP3/vkl/jiiCrtVlIE
wPpzNJ1xGCO8UplCczBENJjmaBqLOlToUm4ZuIJE9TPUqj7CL53JvhRUIkeJARuA
nBwqS4qrGhxSqHugucwkggcKLB/g5iLfFtZrvEXooNX+i0So8+zTWDv6Py+/wtiY
Kw4dyT0n9obNczQm+VywnGvPQ+DR3cqkYnvAuFd0pPztitYm0MRWdNqpomstpTFU
f1NaLgQwaib8IP8xwmZ/8WRpB8yrMN0o4CE5ckYtGAV51wC/LBNL8LJNbqq2x2tf
B7gimHvJ5Otr9t8UY6DJY8K6I5pPKT9yaYTxjgj1rSOj5ANtILP1qzU9ZCWh+qvC
uqgv0pYoV91nhMtKb5XGzKuvhOrsFjNl0+Ujome0s2EIX0i4qpfbSky1UEux53xM
mrLf9eN+EyCpqdje8jO4E6DSOrGq4PD7ob4C03v0IJ61jyZou2s=
=3pKs
-----END PGP SIGNATURE-----

--+O02xqf8AKUyujd4--

