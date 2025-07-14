Return-Path: <linux-i2c+bounces-11930-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC7CDB037B4
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 09:17:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 23E3B3BC442
	for <lists+linux-i2c@lfdr.de>; Mon, 14 Jul 2025 07:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDBB6226CF4;
	Mon, 14 Jul 2025 07:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="cz0pSla5"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879D0155C82
	for <linux-i2c@vger.kernel.org>; Mon, 14 Jul 2025 07:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752477451; cv=none; b=rX5NoUMo3FinABK7eT+oFd8mdUGJLkPjOhEo6hzYPFeyLzJPaj8DkWlKIYOxWC7R2b2SdPSV5kXUZIwuSE6QwnhOMkyabqPw9Rd4fnJ2GGRyByVaGVbTeVjNOnNBqICBwONJWxLldiGuhkpJsFSXYtY+6jga5v2Byk8doGJ9w0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752477451; c=relaxed/simple;
	bh=Ei51OdxjfuLKtn6aKIlmfRzJ4aTM6xszfHtM8g8isLg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pBNOEtEhrtakIebjRxd4vcSvEXLtWXsLmc3SfMa8qqZ2KMIefSBVCtheGjq6JkKryBo7Q0ju4lfi2Jp8PTnrnFSgich8LDMOkk4/MmDKSsF9+xfjRIBRBr46j+NenBrzx9bN6QckRXfvB418DEKiuYFLrVO1ZQOYE2QYzkvQAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=cz0pSla5; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Ei51
	OdxjfuLKtn6aKIlmfRzJ4aTM6xszfHtM8g8isLg=; b=cz0pSla5zyEyR5lkDznz
	ekAfIP+29u8XcS721bM7xES/mOvq0OE8GH41Ic+HG2+zyZxIvs9FxcHXBfRbl7Z1
	+qdWayIPWxXwKN8tefr9u64UOg17v2Cn2s1l/F+Dcw15UIMPE6n5RmxQfsOw2/3O
	Xu9sSYPjREDfupzOpkKGmgKeCcsR2Y+j6p4iVcEbBMjD/93x/+RVAG3PlS1jS04Z
	vJYLTyI/MSJ+HihNOrnnMs6WRmH5Ji5S0ARsUXyAio+Kbe3x9YZ5utk1f6+mPqST
	U4CgQJo1UZ8lxXSqcYYqbNw1NZfu+cEQBicofP/D2mh5XzTg7QiqWkfT/286cKwW
	8A==
Received: (qmail 2363112 invoked from network); 14 Jul 2025 09:17:27 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 14 Jul 2025 09:17:27 +0200
X-UD-Smtp-Session: l3s3148p1@jHW4c945PNQgAwDPXxNjAMIr4MhSGEU6
Date: Mon, 14 Jul 2025 09:17:27 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: I Viswanath <viswanathiyyappan@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3] i2c: Clarify behavior of I2C_M_RD flag
Message-ID: <aHSvB_BtfuQ-4rQ3@shikoro>
References: <aCtgNpWs1tJ1FltB@shikoro>
 <20250709151402.7811-1-viswanathiyyappan@gmail.com>
 <20250709151402.7811-2-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="U7kDNKm5ettbj11/"
Content-Disposition: inline
In-Reply-To: <20250709151402.7811-2-viswanathiyyappan@gmail.com>


--U7kDNKm5ettbj11/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 09, 2025 at 08:37:18PM +0530, I Viswanath wrote:
> Update the description of I2C_M_RD to clarify that not setting it
> signals a write transaction
>=20
> Signed-off-by: I Viswanath <viswanathiyyappan@gmail.com>

Applied to for-next, thanks!


--U7kDNKm5ettbj11/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmh0rwcACgkQFA3kzBSg
KbZW5Q/+PSqprp2EtE0/md2KibJT3WTiwOcJEgFYO9kWf4TCuDcSyxLEaR93k/Xy
9MTdk8E2zM8u3WvzKNFdd0ESqyo3ikfNvQG7Pk1afhXFIRTCtTlK+r6fJygmdqje
/47dvnpH1e0Lz0ESKH71Hjwpt8vGCKwve7wauVTdoNrHdAgbzSxJqLeGyvE6Mf+K
Mjs2Gh8ZUbLKyjHPJkSgH4DbEKwMvl5bMC7aEWBgBPErcljZC6kZfl9KDZhmg0YA
re1zJW2cloRFw/AgNCVYG13ZJxoI6E/y06GMf1soZ/ibSgSLpTzxoIISKIv4KiL0
S+jvcnEzMv27i5JtxK+ugriswcOu86+eACCeHpWutelC4Vg4Vyop1j5N3+/8dQcd
6oDz9pqArgAjqjs2eH6iyY/5ge6PSWS+QqADBl5ygkt+SpbliZ94Rrm+m+muFH2w
gljCJhaMIgoT3C6EvAkAQA2GxwumL+Hu7z6cbBQGcRgCH5iImmA+gDvXfw9B/snJ
lIiqqI/+FV7wF2nbJeSe0fUFlRp3/GEwTEyrE3V8666BJqGavN+0CU1JUlpm/2XI
O3Ww8Hgl5/Hra24NhJVz2VfQ5Q8y9gKTLHEIYBOog7VftRE0OO5AyL4fxQFoh0zz
yNQ8ezlzsOenbKVun6I8CQM59gWlU2hKydSh/Zv4lJuMHkPOE4k=
=kKnL
-----END PGP SIGNATURE-----

--U7kDNKm5ettbj11/--

