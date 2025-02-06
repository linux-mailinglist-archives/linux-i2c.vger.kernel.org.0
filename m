Return-Path: <linux-i2c+bounces-9327-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CF4A2AE7C
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 18:06:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4936C18811ED
	for <lists+linux-i2c@lfdr.de>; Thu,  6 Feb 2025 17:06:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDDF239569;
	Thu,  6 Feb 2025 17:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="C4LTj5ZT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE2F239564
	for <linux-i2c@vger.kernel.org>; Thu,  6 Feb 2025 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738861603; cv=none; b=jlXLh5kPDkSrat2yRHd3+HTc6UqXZvW3zd0FUMWM7D9fo3mw8nf612aFRMM2jMy1ta1LDgUr0LAL5MAk5pyzeIOwPbSDSSZ1HxHo5yJ4HdAUvapnssWaxgeDrf8lvWW/Pj2rn/748dBxQreA2PALNTuViwZk58EoYseh2KtqTLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738861603; c=relaxed/simple;
	bh=f2JH9tYg/4TD5x27H2giotLSUeyR2oh7WYJD9fGluw0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7QSH2m/sz3vSq8PFlCpHfhOwu6yFDBisc8uO5R1drZrWBix4Iux4jUTYbQNfg4gx4tIEGVVZweXDtivQy7jfGTs5CrV2TStflgWHjuAPwU38vBIYM3irV+mK2r6oY7abC0VQFwhUGt5A7dqZbQOIzm7XaCGySnz67dy8XdgjkE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=C4LTj5ZT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=f2JH
	9tYg/4TD5x27H2giotLSUeyR2oh7WYJD9fGluw0=; b=C4LTj5ZT2eqkZqCnt0pt
	zFWaEHoB766Fx+27cjpCCDAGR4frtgyXCumCDOCc8wlDqhynyzT2v5mkDlbx/+2I
	yBcjj8jhJNVosoeBxT86+LIoiV3J0nS3rqZ0KCoMgRpBuN3GXauoBWnwU3aGg4xb
	EvR689XmeDH7Y5au97dCpx6rgUxaj3HD9+IRN03t3CXxPeWC5cLNXGeIan7cdO7T
	Ox6VbXdFlN2lsH2RgUrEFHnA3HZx6quD2p4djVwWI04GGx2v+Cw8hO9xAmScbg48
	FUgQLAI5pka5MsiVqLskAnaME8iHuTjVtIBAZQ67P94a9xupfxgqdLlqCCne4BWF
	BQ==
Received: (qmail 3800971 invoked from network); 6 Feb 2025 18:06:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Feb 2025 18:06:38 +0100
X-UD-Smtp-Session: l3s3148p1@zGviQ3wt7MBehh99
Date: Thu, 6 Feb 2025 18:06:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-renesas-soc@vger.kernel.org
Cc: Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH 1/2] Revert "i2c: Replace list-based mechanism for
 handling userspace-created clients"
Message-ID: <Z6TsHgRr_CR6rIMI@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-renesas-soc@vger.kernel.org,
	Heiner Kallweit <hkallweit1@gmail.com>, linux-i2c@vger.kernel.org
References: <20250205134623.6921-1-wsa+renesas@sang-engineering.com>
 <20250205134623.6921-2-wsa+renesas@sang-engineering.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yoicBNrnd3xPBh/n"
Content-Disposition: inline
In-Reply-To: <20250205134623.6921-2-wsa+renesas@sang-engineering.com>


--yoicBNrnd3xPBh/n
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025 at 02:42:26PM +0100, Wolfram Sang wrote:
> This reverts commit 3cfe39b3a845593a485ab1c716615979004ef9f6. Mux
> handling is not sufficiently implemented. It needs more time.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!


--yoicBNrnd3xPBh/n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmek7B4ACgkQFA3kzBSg
KbaqCA/+PVLqj5P2Fg7ANW4MpAw2HGUlCcye6ffAbQcmqSvBErCyYIGBLa7U4Glf
cZFGT1eLicYzjD8ewNfJMvgGouTUrOWgjuOB0Dw6+WRkW4EDvaodGT7P88LVVgVf
Vwr28bPI/5Y6WO6JSCPHa8lHmFLoSmfkX1db7lX68nHxJuoDUsJFkXLhSlKlYhNe
Iq5s5hhsMSD6rXAFuwPRzbEGhvvEquGG0fUmRSVIidvjUctSSUuzsU+mHzCPccp6
+nWpQ7VuqBiBhRxuGe4IIwrJcf3GaCEvqvXqdP0t1r0w0OGoZIaGdiWYyykZwAmy
g/YwMr/XxYL7EuWnWVcphMKUx1OARwD6efCxFTTnh1r5xGedRMwVZbmik/QPS+0x
rjd17Nx1q5xajhnw7g8rdkbQQM9dXnsY78vy1bqznCpfM3qydk3dbmUfyVXlzX3u
WgZhH87zZ3S2Jit2rxw9g85JRdjsngbsNBTOd28JnPi7Ecbd3Nr2JUEEP7e39YO6
E+ZJvtBJhKlp03zCO8m0/blxockeuu/9Cvy5CtIIBStEL4Wm3UteHdxxZ14A22Ez
0h9lL7pW4Sq+FvbFYzyRrnt1wUpI3TxLi1DxzQ2O/Ok3yEyEsYtZyT0Qt/Mst+3a
n64bPQBXe4rNVRK4J7Y88KHs0xCAjaM97EtdNld9DQ10K9tu/iw=
=DJsv
-----END PGP SIGNATURE-----

--yoicBNrnd3xPBh/n--

