Return-Path: <linux-i2c+bounces-4371-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 016E1917DCA
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 12:27:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B8E84281D3A
	for <lists+linux-i2c@lfdr.de>; Wed, 26 Jun 2024 10:27:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31D217C7C3;
	Wed, 26 Jun 2024 10:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Ebg9xmYp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8C517BB3F
	for <linux-i2c@vger.kernel.org>; Wed, 26 Jun 2024 10:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719397633; cv=none; b=HhHjZ4R+psfwH/uQiuVbzUE60InoCccFMw20V4HmLEgSHn5wa6MRAtj/+IM26n90f3kGTNrpJUa/qWY/sIqQcMdif2te7/FH9hUjW003gTWmA+9PI02OzxOhhkvE0usJ3eezz1lTXptDVKXS5TneZxzvZJ6uRe/4GScPCW6TWb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719397633; c=relaxed/simple;
	bh=V5BzmDwdM8I83j7Gt1QKJNJi03bO1Uhs2MhQYSlRRGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QwIkKaQ6hWEhl8FsIH6Xyx7XkC0uTDLraymOcL3SL7Y4zgXXr83nPjPlxT0eysgvZib10dKH1WH/VLhrQZ69rxbYhJ+B8RQRvM3mpmwb/vTVxTW8xd04ozasG+2iOngFCrX6UmWB12q6Ncrbo1FkDuJ3VIrXzbFmdIznHseXiVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Ebg9xmYp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V5Bz
	mDwdM8I83j7Gt1QKJNJi03bO1Uhs2MhQYSlRRGQ=; b=Ebg9xmYpXxMjxHYCYqhD
	bGN9PqbuLwHj/FYZ/uRnwg6bTOkDnb4EJWogKR+s4fE9PNK363/HVA9FmN2DjyFK
	3GjJoNLNWGk2+O7spItb0Fc8eqqSdkfKz1Kb5Tt+a1jNzQ+vEE5oMAejjWuPQ1vV
	7OumbUqkaWZkSHagSgEWXDOE9CnF2TWR/ezJSrluFHKUIz/47mteMMCwhfZdizCP
	AuF5paQXqnBoStfXnMIoK0UlBTOJOiTXBcsaHz0fUs8xhnGa37FGNkIslC4mKEkF
	PAyDVifezLZaXYU4yuUWlj6wNj+A0e2ONB9p84TxwMptpnXkj+NYSorLRaG15xro
	hA==
Received: (qmail 534924 invoked from network); 26 Jun 2024 12:27:00 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Jun 2024 12:27:00 +0200
X-UD-Smtp-Session: l3s3148p1@bSJjdMgb+MogAwDPX0AHAIitiwsdozO7
Date: Wed, 26 Jun 2024 12:27:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] Documentation: i2c: testunit: use proper reST
Message-ID: <mxla6s6xkkg6ztkgh66yrwz4kyglibiffzmza3zaj6fuspddrv@r2tmnbz5nvyy>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240611095108.10639-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="47ic2dwa5v7ymibs"
Content-Disposition: inline
In-Reply-To: <20240611095108.10639-2-wsa+renesas@sang-engineering.com>


--47ic2dwa5v7ymibs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 11, 2024 at 11:50:31AM GMT, Wolfram Sang wrote:
> This document is hardly readable when converted to HTML. Mark code
> sections as such and use tables to improve readability a lot. Some
> content has slightly been moved around, but no significant changes were
> made.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--47ic2dwa5v7ymibs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZ77PQACgkQFA3kzBSg
KbYOrhAAnYCmpSI7+2W4m/vCbosojJHbcr8ksIBpd1kaONAr4YLJBSExgNVBlGAs
XwmFLT/18cczDs0/Q+JGStBhHR9yu3eiR2w0H37f67zQTKfa69wzwvJxkT2AegGD
eEhuSPwxmbsM59Z82+yy4qwevmGjdq1nv5lBLjoiFiomhKU4yQ2IvXN23gpWEwxg
fz1cz07BQpUf5pJHxJS6fKnIulRTRXl95MFSLGkHThFSuiEk89eyGYCpeBrL13O2
o6eEbRYxMByo7bf36WXPADLwtmNXl2d9scK21XG2c921CWMuJmBQbIbk3kzyHyEW
ojTMP7QKC2vW1KYJ5x+C6VQOGtU9CivEGUeMHNMn1mHSXCdfxIuO08CsGykIe2WQ
XgGIzVX2xTNIviIqqnBjR2MUhYZFikxN71Hgv7TutkGPVeDkmq6qL8TlZZCgTYMj
PcsM3CPD1lq2gT2wH+N7c0gdoX0rpcDoqbhajnSSgFwFJG2YPz4hkry7sqN5YFqf
6NKNcHjphfLPAGHj4OYmtHMcZoDkTHpYYusaI/91eJXtnQXlZbxXeKpM5K6Crzxa
+ggIRa+ElCAO3JBgICs/YTs3iFCT0xgAeYGA9J4pM2lm44ZtCHgV1VSawWtQnrMg
JZ0i244i0tT0siAGpInwdZms7gL2n+Pti/Pqin/Ho7dMKlir2JY=
=YQ/n
-----END PGP SIGNATURE-----

--47ic2dwa5v7ymibs--

