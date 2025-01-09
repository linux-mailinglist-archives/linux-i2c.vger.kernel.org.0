Return-Path: <linux-i2c+bounces-8996-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58379A07318
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:28:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12F8D1884B43
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:28:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7574216383;
	Thu,  9 Jan 2025 10:25:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bPhAe254"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4D7216385
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 10:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418310; cv=none; b=hRMfcBrfyibwU1eBucFAzT3o0RMMujHajhKYeoGTjSJA0lYwX6O1glO1bzTZqPU+9qh7oDckSUPGo3eDQuEzIsXcS8gaqzZZwgAXVF7LF15WGzmmurfuvrtRTCBFOCbTF1s2ziVjpc81tmi/DwhupJgIkwxpQQCyBJbAtLyf0CA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418310; c=relaxed/simple;
	bh=fuMEweWYi5UJh4y+lAzbiR++jlv2avpmGLjp/Rv53ag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kZJG87ijZoE4qRvxLD8IfnODjpqKIhEorwsfyL2Kt7i7iVLlWUbgYgXO6IFXMoRH6lNYYQgtt2X6xgjgK/jw8IOUoVfFkdVugEmjowJyyavts6a8jm5Cz1uAKDYnENAhlJEZ3x+SDznQm5bmSF3rpQUUFzEXtHRWPzvTL3xnkuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bPhAe254; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=fuME
	weWYi5UJh4y+lAzbiR++jlv2avpmGLjp/Rv53ag=; b=bPhAe254UUdEliOJdvlF
	2Pi1Hgo6R0/4E7gFUqZkzKrN1AZEWT06Z6gZ7iy36RMJsPgJndnzXWkKMWY8e+8k
	2mtrID79mCAeNthS/edcRsASSfbzri0aMoDoslbRYv6R1Xrcedclyc925Jxq3Stq
	OC2sA0xNDNdKBzkRNJMxRv6t1DJtpDcZo/INSmuKkvkHgX1l9cVrbf9HqSp1vN+Y
	pZFoV4nD57A9Q+2KcPr5mRLRtta+vjVgQ1CddjMwcJPrnqeud/rtRRNNbO/ZAZ5M
	C7V8sSty4cZjsetiRjd48ktiNyIFZFzqLFkmJAi+oylYO6ZkElWJIfEJTHfVNE9w
	Mg==
Received: (qmail 2869049 invoked from network); 9 Jan 2025 11:25:04 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 11:25:04 +0100
X-UD-Smtp-Session: l3s3148p1@ByQvZEMr2JEgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 11:25:03 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: core: Allocate temp client on the stack in
 i2c_detect
Message-ID: <Z3-j_0E_aH2RqSiw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <29ff7e5a-fea6-4e2a-9bf1-baa69d77821c@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="J5rqm8//XVGNZ0sb"
Content-Disposition: inline
In-Reply-To: <29ff7e5a-fea6-4e2a-9bf1-baa69d77821c@gmail.com>


--J5rqm8//XVGNZ0sb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2025 at 09:24:29PM +0100, Heiner Kallweit wrote:
> The temp client is used only in scope of this function, so there's no
> benefit in dynamic allocation.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Applied to for-next, thanks!


--J5rqm8//XVGNZ0sb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/o/8ACgkQFA3kzBSg
KbbRDg/7BISsacKULhz6NmcGcKcWcRYmYPQVmI7mb9TbLpS95grGLDrJnZlg8BaB
fRgI7FMRnGSHuFW2A9fLoauCEppVVUhsumZoUfLWDQk5k0Ak2o5poDgIigvPz9Mc
FPsGaATHO6OLEurkPq53M0aiFa/DjyhKXnpouynPuGySqJF0VkcOPkSLGZHvR73J
PBkrLSt/qTvsrT90P07L/KJX0XQPxnlikoVA9/2yJO8+uoYPJ+xD6kzyeXeCEIWT
L4v1SLxDMFdPVKPL39jK4Afz9j3ZJlKbqHRsz044Q06aI7JVQRvWO5u82vXWOLRc
ab0O3TJ3zY0uMwqMFUdEMpDPXRgtAaazQzxStsw2Q0ZaCAYwHqyUPbG7yBBzyc2j
CoZH5MqW1pFVNev60vDgm+6dq43n8osoaeP26XP9D5x6HIdW6jBL4eluMK955qMC
SeaC57Zi2GzYAij7cOQTdBYvUiQvryTyYNvbIvUJZBIbL6i/NCr72m0b8Xpv2b0Y
vroWmT6kswt5bLJ/IZ15hH2aUFRlEq9uG6Vmz/eIiBfWyXL1gVDc07c0u91Ggzx4
VdHTLulSusKZ4gi5s+/tNersFKgIhcRFDSBccgAr7wp2pCgLJMhD4fmbOSkwtARD
znft0ZnFzLbjd6tMz0LwE8Y4WkC2dHqm0V4UbXcy0Wjx+ic14ts=
=x8NQ
-----END PGP SIGNATURE-----

--J5rqm8//XVGNZ0sb--

