Return-Path: <linux-i2c+bounces-10092-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE099A79FB6
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 11:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3E54F1750FD
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 09:09:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12AE41F2380;
	Thu,  3 Apr 2025 09:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SPJ966d0"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA4A1F1500
	for <linux-i2c@vger.kernel.org>; Thu,  3 Apr 2025 09:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743671373; cv=none; b=VC90OJoOqreQN8JglAta6tQjtHxDXmpfaGXMbS69aYtmnGaNKiak+OghHVWB2G7Ifw0MTuS4WdAOGnnNQWluwB8A21mmykC71dF52FDHAH/Yyxh5+0R1/qqqSzGgPLfnHyRYiXg+8qJKcpyK4QjTcXAHK+5Kh64RChVLbQ/wIH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743671373; c=relaxed/simple;
	bh=i28Ur6D4dFksz1V6tHcoVDYKKTu8sjypXRVvZ23xK5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZvZUZaKqKtyWA92inq5t48zmnG8ZRHIVSxEdvefp/RxNSPHaywFGKBTE0+RpJdGkBIH4EyFeKrVmYj2J76D3UEe1Ct4w/obHZGxVJZGpVt2A3vokZxztySzb9LeVaPMaOHdZnMNh2RaMDxsac55WrFNZ0GgPgqDFszNiBRGrgFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SPJ966d0; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=i28U
	r6D4dFksz1V6tHcoVDYKKTu8sjypXRVvZ23xK5A=; b=SPJ966d0tJhl1UyS+XV8
	SUp8MMf3JS3m5QxsKp/wv9Va3ChGXWHunos0Yo5p53CVqy2lnKtdO1GzQEzMyAJp
	lUe6dDIZ/4fn+Y5J0WaNeqP7zW+E3b+T8hkEMorK7qr1u79DrlVxgSKur8G4EWcC
	onCqzOU2Yfcx05+flpsCCd2vBKNhydM9uf2HAhUw0YQpWO0otO8NZYUcsX2oa6gg
	JGzGvZF0oub/nKYWAZovKhGN/RdeJ7m3H0WlQ2RIohF8i/MtvK0LkNoGfCmcOnlJ
	PC+///e3fHTUbcFPheAWRMkdhMCDOxkIJj+nDlPRCwBuVfLV5RLZThLiYIXBV7E2
	rg==
Received: (qmail 2313138 invoked from network); 3 Apr 2025 11:09:29 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Apr 2025 11:09:29 +0200
X-UD-Smtp-Session: l3s3148p1@ruKSINwxXJ4gAwDPXwaqAEtIN5mYkFJw
Date: Thu, 3 Apr 2025 11:09:29 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 3/3] i2c: i2c-core-of: Handle i2c bus extensions
Message-ID: <Z-5QSVNzr80boyJd@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
 <20250205173918.600037-4-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DA2ygZZVAeF7cHkv"
Content-Disposition: inline
In-Reply-To: <20250205173918.600037-4-herve.codina@bootlin.com>


--DA2ygZZVAeF7cHkv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Feb 05, 2025 at 06:39:16PM +0100, Herve Codina wrote:
> i2c bus extensions were introduced to decouple i2c busses when they are
> wired to connectors. Combined with devicetree overlays, they introduce
> an additional level of indirection, which is needed to decouple the
> overlay (describing the hardware available on addon baord) and the base
> tree (describing resources provided to the addon board).

No comments on this one.


--DA2ygZZVAeF7cHkv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfuUEkACgkQFA3kzBSg
Kbb9jA//W4ypAkfhwSG6MpabDbOIjnhl9tn+HGyHDk9XzrXGBo2QGrOAvcQa1Jne
s18NNEJmJkrWdJwT2wrQKWyhAc7dbROZMb0gemNuMsNLotu9w3Rk73JQjbn0rf/E
eJRcGxdGDi6eh6naxAcLvsw2pzvjcQvVo+dzXklapv/tbvwAwp4CzpvEnELZcGrs
YoVc4JR34y0l31zmtF2yQiezctgqzp9tm4Ec3jD1Zw7+cLwwpN64ZiUMC78T7IVr
cKplcyQ2vXM++4J6v/NkUIpd2YhU2ykNiR5U20FvV3kVb+/QYY3VUTA4GjC22cej
gH+oL8Bs0CIcXL67VlpCxxLMqbL1qmhyAytUI61fUdVTuFsDWRFuXyeCxqplHKiv
eT+RXHaYDz+yj59BhFryDeUML3JTIIiCUaDWEQZxC/ZjrSgN8+470Z0tm2CWNE7D
3HeOzhVsksOejWYwpmIhBA/z+i/RztmMyjbbp0j/J8BOkf+AIu9y5tXkRxuJDFb7
lGd9uDOazD0EvZqbuVDeIBfIduKk2Wkuonu+qcq55Y8TA6+kGCwwafMbi/oHKXCk
prXeT88B78Szm2iKiSIZ8+SC6JsUN68GmUvh+8FDljXDORAvxGJeC7QaRIYJBjuW
tvYWwcWqc9Txz/FlbtdYBHHZ7ZKR5Xf6UKtaT37heyvO1cGRHMQ=
=41tG
-----END PGP SIGNATURE-----

--DA2ygZZVAeF7cHkv--

