Return-Path: <linux-i2c+bounces-13151-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B87B9EB96
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 12:39:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0F0CF4A144C
	for <lists+linux-i2c@lfdr.de>; Thu, 25 Sep 2025 10:39:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1AD82F617C;
	Thu, 25 Sep 2025 10:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="K10vuajG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC4912F6175
	for <linux-i2c@vger.kernel.org>; Thu, 25 Sep 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758796551; cv=none; b=YrwPX7BE+i0d1+T4eiGrE/9l2Kv/y6OdTtkneWiEe3gEd5qYFwQsgLf6Ep8KoerfbeAT4jNEHgKft0D1vnSh7LO+MrN+IhQmCvQvFEmD7zlxL4rk5ijbWkz/AblaoLrhmShZ4SCCQgajW5YJcLn9jVwA//7e3uvuQdSuydjaq6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758796551; c=relaxed/simple;
	bh=TTZjhxVA5M6bOmVMDWWof0gtm21/VDd/lp/wpAHdrsc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=POGkTy4qRbe77LaNmNgrBFnTc3KFeP9UbY4gtPq14AmfYFIDgupIuPAwaQQrHBHdes1tnPEhvzQ736Xb7gMOAbRwDFYU89huDipZ8B6YjX6wfq2eSzdqX4Llezr+EmNbJSnXFmlobzfYnZeZ4NrsOq2WMXY/TTbP2dz/icnhLO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=K10vuajG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mUJ5
	3zDS7PSA8HfqWIajmskhphtgcIYLAgTDwt7JV+U=; b=K10vuajGkf6IdU8RPf0L
	pA+vvCGRHz19htDTVCpudrNKKLsK47y9+PFJKTGOT4HXUEXXH9LspBgzvRhw3Mo3
	WEbu4rz/mwgIfg3mS7PhzxJeVvCc8hVk0uBYVMRVq21KWMVFVWiTpp/pYl6uhEmD
	8ao+yvnEUfQYtqDJWLbAk60kA3aEm4PQSbeeND21gdiKrtLyZVPhM0FypEU/ofR/
	fh6ocvXyVeUizmegSuxpsidtCia9QdnIcGhR0lnLrb4AqEILnTLcQbrX4Bc7dp/a
	+MtQsJQEy8P5PKJnctbpwmVDPwUpYPGQVr4l1owGWwl2rLhQGsFwkQLj0I4ElSVD
	ug==
Received: (qmail 1830398 invoked from network); 25 Sep 2025 12:35:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 25 Sep 2025 12:35:47 +0200
X-UD-Smtp-Session: l3s3148p1@ZWVzu50/JK0gAwDPXwQHAL/S9V79e5yL
Date: Thu, 25 Sep 2025 12:35:47 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cezar Chiru <chiru.cezar.89@gmail.com>
Cc: andi.shyti@kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/3] i2c: pcf8584: Fix do not use assignment inside if
 conditional
Message-ID: <aNUbA1SvCE3qEst3@shikoro>
References: <20250907114557.15453-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-1-chiru.cezar.89@gmail.com>
 <20250917133524.85063-3-chiru.cezar.89@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rnARcSkxfBPDt9V5"
Content-Disposition: inline
In-Reply-To: <20250917133524.85063-3-chiru.cezar.89@gmail.com>


--rnARcSkxfBPDt9V5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> +	if ((temp & 0x7f) != (0)) {

Braces around '0' can go as well.


--rnARcSkxfBPDt9V5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjVGwMACgkQFA3kzBSg
KbZYfw//evmHAV6GzgWfW5ZXW91thb+7hDdr2KcD4YqGX3XFGdg/qumjmidC6ATR
bOlWc7Wm0FeVQM5rfg0OKIgUgzl/SERL3LZUo8k0jN9CNEbRPKetIrvCrukD9RZp
qbSWCktd3xBN2zpp7/C16Xvf/JLZtagHuEJtQWqzNpCXsDLKaLNnQMnAxyn3vzo8
JI697xanSEj7QvmlG5Haee/HEWroLWavSluBms8K5RpEs2IOo0G6WkTDlvR/aAtb
HWxI5TdY8KAOdcUboMugWRkda6igZJZbLsXJScFBcK9A00UIg0aUmlhQC3Hmc58f
faliDBQxRAUnvSfQ2dlDwpwJ7/Iij9WTPoSI78g27c3iggN5D8N1kjHyrDbX0bQW
s7gq/UpPL7fGLwjL4+Okm8j8FFiwv8svX3iHkzf6ZRMWDHQ+cQCyzU/2uY31wpji
54m/AwJClSxv5QS93zxrg6g1KkYc/EZ10RY/jG8GpiceHJuSb9u3zex5JCZWRfqk
B8WbSVsS8TlYIttvSMqLjm9QVsH67G1p68qPUUwNfeB52CmQwdYsSe0wZBkE+7/Y
d+D0Yu136n40paZ33wbVNp+qE6HxJGdYF616aVL61lk+ebmk50A/b9lzuVnYNPsd
kQj095krqQcEBda6fetNpf7v62kQhY4NUuZQhk2oXQq4GiEY8yA=
=C+rG
-----END PGP SIGNATURE-----

--rnARcSkxfBPDt9V5--

