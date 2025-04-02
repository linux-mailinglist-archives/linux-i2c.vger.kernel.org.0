Return-Path: <linux-i2c+bounces-10084-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C71FA788DA
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 09:31:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8CF31188D4D0
	for <lists+linux-i2c@lfdr.de>; Wed,  2 Apr 2025 07:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BD413AA27;
	Wed,  2 Apr 2025 07:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="HW8x+YzZ"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C378C2E336E
	for <linux-i2c@vger.kernel.org>; Wed,  2 Apr 2025 07:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743579076; cv=none; b=mACgXkM5ICn/3NLWM1r/EX2gQIuP7U6suyL1+8Pzuinjx/Z8xZNDTJT/TamjeJ7PP/sffKYBET7n8bkZn8DHZiaYoR1GiZ31UzUbRBrane4RArUHWPlE2aeF1llPJER5+Ro6s0pxWzy8Rt5GkSCbv1V4VaThab3x9PCmWzTBUsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743579076; c=relaxed/simple;
	bh=Lh8HemzF+gXxMbgkqE0EedcKYDMPLe/iJtkk2hp62mg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QJ8dUJ2t1IoZjfMdzZToPfXbOpXKOcNIKKOSDOVkAikdlr81eQGPUd2pLlA2wtHNYwAMTGRGmv0pbjjIZdCBFTQaX8s9XP+Auz7NTR8m+y2SNUkm16N/EXevmPboOGDpc6TzdUfADiopsy9WawlVHwpGMi8QWd8oE3bciX1K8iY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=HW8x+YzZ; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ljpb
	TAUmeFbI3YgPqeVDrRxq7+Vatl38e2qzYdsQiNQ=; b=HW8x+YzZqRY6oyGrUgym
	smGsxTrPN0vPW7j1bW8I79vMMuAsU2iz7sJcHHsIjtkk0WFSi/MJPaiAJIpud3qN
	MjPnQ6eqrET0NtxK3RFsu9I34LWM9PwDgTMPvQI48ue2E+i3KQUNIcXw9yzS/F0o
	SdvDhiwpEMJ/bJvAKETPHhd2YBbJTOKgYN0GDQJRhtNIHNljCJaNQEzan8CbNP7M
	sAT05HaznedazkDJ3hcp2kFxA50dOe/IKr8TpEFsWCssvENzksefmUuZgmAmy6Nl
	xttLt4AWpW7V1R0Zf4HOk2mSiCiUISmRubPb5MnLZd17v2ojxVwe0CxpAuiMzKri
	Ww==
Received: (qmail 1881095 invoked from network); 2 Apr 2025 09:31:01 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 2 Apr 2025 09:31:01 +0200
X-UD-Smtp-Session: l3s3148p1@diiPosYxNIEujnsv
Date: Wed, 2 Apr 2025 09:31:00 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Arijit Kumar Das <arijitkdgit.official@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH] i2c: docs: Clarify I2C controller and target driver
 requirements
Message-ID: <Z-zntOOPL3f-Rg9F@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arijit Kumar Das <arijitkdgit.official@gmail.com>,
	linux-i2c@vger.kernel.org
References: <CALDPgrtrsa1AzkW0G=z6YCyfuNF3XVMAjfaTnEhf_432THJOPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="djE/Hd2VW1gRew39"
Content-Disposition: inline
In-Reply-To: <CALDPgrtrsa1AzkW0G=z6YCyfuNF3XVMAjfaTnEhf_432THJOPQ@mail.gmail.com>


--djE/Hd2VW1gRew39
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Arijitm

> I am a new contributor and am looking to gain initial experience in
> contributing to the Linux kernel.

Welcome! Enjoy the hacking, it is fun.

> This patch improves the I2C documentation by clarifying that each I2C
> controller requires separate drivers for its targets. I believe this
> small addition makes the documentation clearer for new developers.

Frankly, I am not sure it makes something clearer because I myself don't
know what you actually mean. You only need to enable a driver for a
target once in menuconfig. If you have such targets on multiple busses,
then the driver will be reused. You just need to enable it once. Or?

All the best,

   Wolfram


--djE/Hd2VW1gRew39
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfs57AACgkQFA3kzBSg
KbavtA//dLzFvUd1v0ZyxSdnCXEd2sSMPYm33EA37N/DJyjsSgMnxdt0fCIaU6dt
lJ5zDRdtoqeU2iUFuYrnzBwJDw2z2CrpZu6nnHM9aIXBfSLohR8wR/Cs7jdhdNpL
w8QdCDaNidBhjJQGN7cl2f1PFc2ft5B+h1TX9UtVTmDxIzfYnd1pzqdDUk919I+F
+pqxlSIo8eqaotLXlgPqmjbR7/dLT+sKaQK7Kgpp3ZL+z6i/q5xxfPjMiyzZhrTG
/UcvrVXM/QyPLU4voz5gOm9eJOzX2Ft3iEdbV+HQUcL9A8KcifOWoU28/8TYn5iZ
lOvyaenLyjntqx9DtNPYvRELUcHOFV+k5Auue+hihLx/qs+Jpw4Mm4+UjWsMseyT
4PvX8BmYBMcAh1BPWJDVmRpf20K1xk9WZI8aK1jpCArnwjmvOECOue80hfN69H0u
djN9Nfewv5QLebyggbMqEZIXGeOQ5MZD0k1WAHCGdGghNzUoNwhSSk3Ahs+y5SfI
lLFdrqlJnno54+fdoBBG4usn1R3O6xx5ttp60kCpzRIpQvApm9iKOSvn3YBLp+du
1748drpbkQQJ3DsIAF0uTRpMGySEuCUXPusxZwiYrazEHywdipSW8zp31kg9wXGU
9bBfd18771sm+C927kcA0CUNG61UjAPV/iM1jmGOb9NxWBIQHiw=
=iJ/c
-----END PGP SIGNATURE-----

--djE/Hd2VW1gRew39--

