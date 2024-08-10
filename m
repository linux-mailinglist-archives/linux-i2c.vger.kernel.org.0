Return-Path: <linux-i2c+bounces-5280-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1101D94DED1
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 23:40:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F179B21780
	for <lists+linux-i2c@lfdr.de>; Sat, 10 Aug 2024 21:40:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218E513E3F3;
	Sat, 10 Aug 2024 21:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DdAdPIA3"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89BB13DB9F
	for <linux-i2c@vger.kernel.org>; Sat, 10 Aug 2024 21:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723326032; cv=none; b=oNYowDz4XiEl7widyhY0E0o7RjRq5YP6pdXGH1JIhmOCB6uskMJAN07wsUzlmNdPpWhxP+usHU5G3OfoW3vgCBnVcF9gLV02wdrzG4xFd93rWL79229LV5OYRki6dxKmoT65k7RZb9r+smOFHkJm4YLeG0daMnbl56dyKnNKP00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723326032; c=relaxed/simple;
	bh=iQ7JyENaNw9Dw4WCl2F9+gOuw/ixw5tODexzsIiVSH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O7WHX6CIddkV+vwoahLy++yBuwGZYM10rJA8KSFRL/b+RIRPtFdX/fI2c4TFSGalMQR/L3ll4uu2Pf9dYiaMsE/6UibczuA4Kr+8k2HV3+sDolnICMuyDCOQZN9qJUsmu5a4y3A/St3IKH9HjtJDvjz3LwaEPh2C+QWWE7LDtQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DdAdPIA3; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=FA/5
	FNnyQRevr84MuiGFi5ruWHLxR4Jt/yf8Jy0onxk=; b=DdAdPIA3FSL+0Uq+CF7k
	WvxXrZXTo2NLLW5jAcIlckQHOTVAZhNfPSP933Rb7ItQR7nqpUh4/P/l8KHXG+bS
	HUvigaPoTvAWJ0uCgBiQgeMk8NwLqgOyycQf4jbKOI2AceLnqbBjXmGmZPYNEGpx
	+E/KZ520BHzJxq749TWGfLxIyhldFtjeutoEYEnJtZ9Aa2+R7P7rdN2VAHWt8R6A
	gSEBjYH9/yfJ1M5MwoxKTby8tKIB/k5ZpkZ9oS/KnyFNnJKEFY7VZ3nsHZ75L/+D
	21lDCWbJOiYfPhfjNIiTyuaEgyQbbUPKlUlEl0jGlCKblY2AmWcaq2caLDNMAi89
	Pg==
Received: (qmail 941895 invoked from network); 10 Aug 2024 23:40:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 10 Aug 2024 23:40:18 +0200
X-UD-Smtp-Session: l3s3148p1@35IrG1sfbqoujnvj
Date: Sat, 10 Aug 2024 23:40:17 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH i2c-tools 0/3] i2ctransfer: cleanups & add binary data
 option
Message-ID: <ZrfeQeH_aFxnCGSi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A6lHio9fgDc/Rund"
Content-Disposition: inline
In-Reply-To: <20240807112159.14220-1-wsa+renesas@sang-engineering.com>


--A6lHio9fgDc/Rund
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 07, 2024 at 01:21:56PM +0200, Wolfram Sang wrote:
> I wanted to print out read data as-is, so I added a binary printout
> option (patch 2). The other two patches are cleanups found on the way.
>=20
> Looking forward to comments!
>=20
>=20
> Wolfram Sang (3):
>   i2ctransfer: sort command line options and add to help text
>   i2ctransfer: add option to print binary data
>   i2ctransfer: don't use plain 'unsigned'
>=20

Applied to master.


--A6lHio9fgDc/Rund
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma33j0ACgkQFA3kzBSg
KbZcqg//eNgpamwC4Gj/MFDvAu/UL1oIx411yVgsjeEP8BXG2bQEpOgaiJcd2MWt
g7HPr7sFKir+b+llBe2cP0H0xjQRg/wc6uS+uZPTx2i0LYi+n2pjTtsTUkt2PRUf
1Bry5d5eZ1AnOrTtVdJt+nugIMKkDLH0fXfNXWxtdbsSUsMUVZxiw6OKEBc5yIBI
4az9mRGw7pGoZLG62qpE4dlQjFotLXxA4UBDVgq9baC13u39wDEJ71HFsSCn8mZF
fDiJXe1zlin+fN7GVHIJOdGkrerRn6oROsDGgTznkN5w57YUVoY+lugkg/sjsW3t
kl4CrwMfEV1ySGZXmkYFkThpWX6LMru0jZHVzchZgZWnVBICbNFPiE3GA33XmK2M
UKHBn5rh+lc4CZWgLiVun/L3ylvvz7foTYKYoTN4CM6VNus40CQrEAX/XLhMdBFt
8iEWEktK0for6E9jKsUHvDiJNcFxik5uziUMI/M2o/PjkIYWa/p90qtkyBH78WDW
kz2TVye0x8aJqra+D3ARd4c2NkwwHIuRlLzuefE81zBEKgQhNrPFA9aKdvq4wRpJ
Ks5VhEifpfmNdBuH587TX8ujtxWSiaDlyBcCq/KwHBBPWoty73GXhA+WgYoMPlJC
xy+Y7VUCzDLM6txiUvRiuMG+DlzkmQjq/MLmJ1Y8tqqTOTjMFuc=
=aS4F
-----END PGP SIGNATURE-----

--A6lHio9fgDc/Rund--

