Return-Path: <linux-i2c+bounces-7096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 72BF898A005
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 12:59:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 333D6287144
	for <lists+linux-i2c@lfdr.de>; Mon, 30 Sep 2024 10:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9391218D63F;
	Mon, 30 Sep 2024 10:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="RSY8NJxQ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1295117B4FC
	for <linux-i2c@vger.kernel.org>; Mon, 30 Sep 2024 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727693962; cv=none; b=PIQHkd1DC41UaEoRqI/fhzSPsDeLcxzuJ3Qnjen8fI6fJ2CNU/cz95t8/AsbCmscRxOFYcTFZIBwfRyhlTyYAvbYfBu6qmR91BFeleYeDJ/w5sQnqfbIoNxtTCJTBRosa+fLCP52GRIckY5cVs/trCHnvqBUqyGaCvhnEisAR1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727693962; c=relaxed/simple;
	bh=lw5If+GIILGSbLpDuRGfWmPM+Cys4f1k8AcgoxhDZ3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3Kcx9TyoKp/Qcm+nIxdtlGP1rNhOhEdsIeTHmJDHuYPCNjBklNAG1CdMR3qsugJ93xOw9vUx/imZw3/kZ+t9DKE09XrVPZsOU9I7AUFopdRWj6Vn65KP2c0J4LDj7Q80Z0+4u0j6wWlFoETIhprzQWjjDIO1hHwzhTnCqHVQ30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=RSY8NJxQ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=lw5I
	f+GIILGSbLpDuRGfWmPM+Cys4f1k8AcgoxhDZ3c=; b=RSY8NJxQ7e3H9iYrXNlo
	PsTJziMfAe12jpWSe1q+1mE2ewMRsbdhawNeHCPQoeZeRR4JYqfaj4ORAqkAUnKb
	ASunx75Kt8008Ce8rY0rR8y3Bj1SvjeFZNQw5sW6Vr6J187a0Fmv68drK5dfW42v
	NGQOvgTPdZN0t6G8PrMmY1N+8sAheJpCw+S07T1pjFy5xkZxMiksmVs/vSGCBU4s
	38lnrZioG4D0Bt6trSqZj7tkx78JBAHoIqw/RdMK++2RjSthVjsnnUK6oxWEqrgB
	PoyIJJg8Dg50v6I1dQxLWzhEy4mdxXpNAWJbe6gEkPLNyT05rbrbAx3tswlpy7AR
	Og==
Received: (qmail 2157446 invoked from network); 30 Sep 2024 12:59:18 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Sep 2024 12:59:18 +0200
X-UD-Smtp-Session: l3s3148p1@0NCmGFQjYLUgAQnoAH/eAHsKVyf407fR
Date: Mon, 30 Sep 2024 12:59:18 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] i2c: Replace lists of special clients with
 flagging of such clients
Message-ID: <ZvqEhntonE9qWnPF@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	linux-sound@vger.kernel.org
References: <3982b2a6-975e-40d2-bf02-2155e5c36c14@gmail.com>
 <ZtQ0KMWUk9iAUCCl@shikoro>
 <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lkY13Myg8hwxwTba"
Content-Disposition: inline
In-Reply-To: <18306ded-6451-4880-9f74-6bceb0f26dea@gmail.com>


--lkY13Myg8hwxwTba
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> Now that 6.12-rc1 is out: Are you going to push this to linux-next?

Yes, hopefully this week.


--lkY13Myg8hwxwTba
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmb6hIUACgkQFA3kzBSg
KbbQcQ/9EASzQjORYWf9s6/e7BnuFOf2lHA+8uLuFhUQ+wcP1fap1Dp/4h+XrPoO
kZgyn3O/AWLYuQqmUPrR9I0ijodVWOVUyMif7gSQo6nDgDVaEQzsN4awe7IpZ3O1
kYYpqq5o+2S0cY2DFfgrz/ly4E4P1kkiPiXRsSmwtBUwY657eHt4Lnfxji3x4C0c
LOpks7TDFCqSygTBLYZ79e0qsHXE25yFJ2Uy1KQ10L2kIubaLLDP1f3DsDhkJI/a
fXLShJFQQQJLSbj8/zPH0/HM2TBikXsycKOWiddzeIf9uOFQo+3SzAFk1M38bIMA
CsjusCqacv87kCGuwhqcJRjV00nwjyOOBeLmTSiPyUx6y4SzaFvWDs5IkofZbXMX
XEmeYA1NY7QSF/tl1urIXNCCaPtIg25SzJ039kJK6G2X64VVPFGRUFef3TIgYh1t
RHy2wnDOuY5w8Wuz8HsMIgEgswXcD68XWTC3tbQVbR4bohd0WIpNvLT+bj4Vzs6S
P8FGIAJuPtVl9joopThInpoqpUgUo29TMC6FBFDVwUIKEbJHLBWwD46K9Qx5dwm5
sUQT/EDYpuaKf7bkUMzfvHaB/KILQqdPwmSOjJXEQRotVxv2/LRDileINHvU4y8S
VUDTWZ/bd9dxA4SnBez51hrmLZ6Qb+35+2YvO+9tKWjwZcsYyUA=
=CqVs
-----END PGP SIGNATURE-----

--lkY13Myg8hwxwTba--

