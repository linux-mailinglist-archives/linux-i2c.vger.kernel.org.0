Return-Path: <linux-i2c+bounces-5805-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7839095F2AD
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 15:18:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ABC121C21CB9
	for <lists+linux-i2c@lfdr.de>; Mon, 26 Aug 2024 13:18:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4924717BEC7;
	Mon, 26 Aug 2024 13:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="JGmVmpEd"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E79187FF5
	for <linux-i2c@vger.kernel.org>; Mon, 26 Aug 2024 13:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724678264; cv=none; b=WPQkUvvHd8Cvg7yOQQbQabIRY67cLe3VxIw7OJCvq5ncwQyo2tR+0yKdV4IPe07BtaK6CLm58Fg2q8A9fjeLgaRC87zGNK6BcWCgoP2A4SUh1cxo9sKAMjBY6YcVcOy8AM7Z/d1lIlCoqy89zUjwIMp6g+W0MtU09bAJw+MudO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724678264; c=relaxed/simple;
	bh=34rtwIKgwlHqwIRAT4modxu6ejV+02KgrzdPo4hmnuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NZJq+rTIXPiNX/cuBI6/bNaGKSYhuRupv0ekeV/AQbbyY2XsWVYfCJ83xndhTfCN7tIKSyABFt+MI9SqNiN3oMAVxyfcjSS7lnsX1fw7alFEF3hvyCl4eunNlRzgKZv3hmi0+4V7DyletrSQAYga+eKT2a8AO2joMynqrD0P8a4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=JGmVmpEd; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=34rt
	wIKgwlHqwIRAT4modxu6ejV+02KgrzdPo4hmnuk=; b=JGmVmpEddevBoRx482UH
	HbuzaXc3dtyV6xs0RJrOvk0rIFWIJ1FY1dKBsq5bA2fBAkz84n7tOcnM4xvi73LZ
	m5/kC3JYaFh7NyF2xWrclAitDRk3CkrCks9DlXx78V0sfMCcQ56urX2CoXAibK9F
	N8/2jg+/9sImtHMm177HwCGPEol+97oa/m3n/w33AtJioUNdssyfxjGvh5OWYgro
	Oycf9pKn3UGsOypM28tENoujJNHBSr11Cv26lTKauOGFEvePQGrfYI7cd8d3sd/V
	WqbBxElENj6WPltFXv0pdmFzWvk8RK9LLtUKvxu4rEvZucJa79bL2rlzSNx8C0eJ
	UQ==
Received: (qmail 2001700 invoked from network); 26 Aug 2024 15:17:38 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Aug 2024 15:17:38 +0200
X-UD-Smtp-Session: l3s3148p1@2LLq8pUgxosgAwDPXwdRANgvu6DX4+2c
Date: Mon, 26 Aug 2024 15:17:37 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH 3/3] i2c: testunit: add SMBusAlert trigger
Message-ID: <ZsyAcSFrdoX4fzFv@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org
References: <20240814182210.15382-1-wsa+renesas@sang-engineering.com>
 <20240814182210.15382-4-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="soWsVg3zH2KCg8Gp"
Content-Disposition: inline
In-Reply-To: <20240814182210.15382-4-wsa+renesas@sang-engineering.com>


--soWsVg3zH2KCg8Gp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 14, 2024 at 08:22:09PM +0200, Wolfram Sang wrote:
> To test SMBusAlert handlers, let the testunit be able to trigger
> SMBusAlert interrupts. This new command needs a GPIO connected to the
> SMBAlert# line.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-next, thanks!


--soWsVg3zH2KCg8Gp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbMgHEACgkQFA3kzBSg
Kbbg8hAAoH/EW2V3e71w64thTJcbfqq8OMbshbHmKnJ/XRMx08pIJRsQFWIWWnXE
QHDpwIxRn7IWPsqm7yMbqqqcWNiSQo+dcZjTVtI9Di5ZZ3FftXCZxr/fKpS1mWgh
1jIeDgG8eWf9M32WXP/neG7MlaMIrpnL64n5+JrdYYzOz2ixmP0PbDl8IJm5/taR
2VK0TwZge5OThFey5+1wdq/KR6PXVkIl4nfFI4KljxrzqnDYZ3+DpYXtFMdsA9be
AjxvMJoTVBM828OsjfOnXpSthFywdzgh/7HBVET/ktTDCnduw3/28Y5Km4PjY1Yv
uA2ZaBC20m3Riin5dZZFVbY+AVTnjpX3zblLPCvCefAW5+vfbp5LUmg380TGtpHX
5G0lOFBhzWAxFAsZJtkKWO3oZ9YvyM2DghWRlKCC2AIAYitSzZHgKG+WIrwF0zvv
rxX2kK6WPs6v73+4Dya5M3Yr69Dg+7ozQj/rYsXG0s7Hm7SsNNXtEAxIOutTkycI
4ta9K1C83guaOhV9l2sn7ujT5KIq23eCgBc5WN1yrPROkoXPcUorv/KoN0lBNZWi
bDuXpawDu2Ww3eRmrb8pzQT9Y4spwgki7m+8SBrONxJa5NsUOoeF4ktAevX9faDd
Ng6Ih3AGGnZrx/EEOQMKY/TrxPyMToLGTkT3YSEaWXUr6+HNtlg=
=gn4d
-----END PGP SIGNATURE-----

--soWsVg3zH2KCg8Gp--

