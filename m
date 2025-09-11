Return-Path: <linux-i2c+bounces-12865-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D48DB53349
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 15:10:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 887157BD827
	for <lists+linux-i2c@lfdr.de>; Thu, 11 Sep 2025 13:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8498A322DBF;
	Thu, 11 Sep 2025 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HupkIRP+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFB7376F1;
	Thu, 11 Sep 2025 13:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757596232; cv=none; b=OB7wjCtkA56kDhxhcCBsTwVAp1svF9IvGFRXvw6WAyc31kYYe4o9g4bKrksE9TM1cY1p4ntWoDj3hxwGf33KYNNCrCbifWVUURrB0wcPfiGD19Mb5RA09/6gOUQ18oZmeszu2IrtVAC6Yec2Yz5z2ypAgUUwg9ChOEDq9Bl9RM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757596232; c=relaxed/simple;
	bh=g7o0gWTJQ6il4k2UJaVcOH46zJkxfUUYoJdujgJq82Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MW+OHUu5+on58WwJmR8sVvIyRjzgqjmT8FV5mhj03gLb5xqNgWju8Ol2Mlu4ySx4FLWDdN6vXLfGVwhhoIpyykU8fEHpkWcTiR2CYDNv/5R9P//spaHm91fN3ow6kTQVsqIPO5c5nagKgvVCp40ryVt3Krb/W6IroDDzMSPgEe4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HupkIRP+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAA9C4CEF0;
	Thu, 11 Sep 2025 13:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757596231;
	bh=g7o0gWTJQ6il4k2UJaVcOH46zJkxfUUYoJdujgJq82Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HupkIRP+CGighnxg6PIy3J8pSMrQ2SF2MtMtDWU0gm6RSDUd4zv/VD1jDt+74ipwb
	 knTjYkZSOZPSms6vnDC1UhJWykssFGgnxmdgZHcE77zHyAeKeB8KlPJ6o3CcAbRLLt
	 kAT6gPRjsPjYeW0Wdlea3lgv20q3scQesRj2nH2mJCj81CymhW+H/qUcXoXOoZLOym
	 pdjizPAE9gvrLLyU8sJH0a0mu3UxDvxyeegYAEuaXGrn1MbB66cTyyk+lVWI5wyKC9
	 79udK3iBAEs8hRgT6ceGOFKJLTdjOMVs7HFU6o2uDTPOQuKLnpjtMnZAHPo7E+e8NK
	 GAJA3ffK1sGog==
Date: Thu, 11 Sep 2025 14:10:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>
Cc: andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, gregkh@linuxfoundation.org,
	jirislaby@kernel.org, andersson@kernel.org, konradybcio@kernel.org,
	johan+linaro@kernel.org, dianders@chromium.org, agross@kernel.org,
	linux-arm-msm@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, linux-spi@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH v7 5/6] spi: geni-qcom: Load spi qup Firmware from linux
 side
Message-ID: <11014118-6d1e-4e2e-a6ae-cf10d78cefa6@sirena.org.uk>
References: <20250911043256.3523057-1-viken.dadhaniya@oss.qualcomm.com>
 <20250911043256.3523057-6-viken.dadhaniya@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kQzJFNH/SXwUNzoD"
Content-Disposition: inline
In-Reply-To: <20250911043256.3523057-6-viken.dadhaniya@oss.qualcomm.com>
X-Cookie: Your domestic life may be harmonious.


--kQzJFNH/SXwUNzoD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Sep 11, 2025 at 10:02:55AM +0530, Viken Dadhaniya wrote:
> Add provision to load firmware of Serial engine for SPI protocol from
> Linux Execution Environment on running on APPS processor.

Acked-by: Mark Brown <broonie@kernel.org>

--kQzJFNH/SXwUNzoD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjCykAACgkQJNaLcl1U
h9CVhQf9HtbENC2VIekirEMK8oBv3wi9v0EwE0LjsrUayCwYIc89I4TarE5hPvUD
64J6858LtISPI9+8zVAASbfalUHPQV44PeikCcfRMl8uzyt9THTVXjTUZohpHsGR
gdlW5z5fyHJxm0ackIunlwiVZPX4+DICycfbgmSNwoRAlsc9G56u9X8hhU4knIkn
XHLlM26TmN48G281bQ2Cpc+n099dDEYC4OMRqSpZ2W5ZXqOw12vRNVYvVUYsMUIB
7I5K9VSRPSoE5d1P/oF8PhHS0kt65R2IAq4SmqvUrWXVWVtTe1nWcqZGiy4kwpVH
Vci0lnOCpQH+LkISM3INXSmgxyhXMw==
=a5Fi
-----END PGP SIGNATURE-----

--kQzJFNH/SXwUNzoD--

