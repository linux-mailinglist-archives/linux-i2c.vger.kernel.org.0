Return-Path: <linux-i2c+bounces-2797-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F8589AA34
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 11:32:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 02A4E1C20F29
	for <lists+linux-i2c@lfdr.de>; Sat,  6 Apr 2024 09:32:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9503322EFD;
	Sat,  6 Apr 2024 09:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="PpKwEYkp"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A4522EED
	for <linux-i2c@vger.kernel.org>; Sat,  6 Apr 2024 09:32:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712395939; cv=none; b=aTfg6fTNhfzWe1Oz+BahBJAvhUKUIsSCmlz5gkRs+iHUqM0YdAylTZMnTTIY6XHcIPEvTqg7N9rmtaQcH2rT2vDcIXtPpTsCTx7WeILBKdeVGAYkXsGEWPbdtTHRQxEpzhEoD5jSR9JUAOr353X/Z8KZQqFFScD7efx71VN0ldk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712395939; c=relaxed/simple;
	bh=iZ21sUNSOkTasKznuJ0Vp2jCVOSejhc4PJIP39oLhHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YzH/Qaq5+G5lQDcvtsZL1SM2xXFkwNAh0yARI8Qcj8ZvWGxCtlwABhhU7XemBJlqT+fDFZb2BoUzFnQ0Zq0eOKr7wjFVapDNX6kLhD/qLsBabATxj1esUNP2SjoX5oc4rriB8Uzx3/YsRHcciRfC7N/jReEUxz4NV+WsSDdxhJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=PpKwEYkp; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WNQk
	/cjO1tN8eNweZiC4vZSaOrtN5+8sXZKa6GSLdXs=; b=PpKwEYkpiOCmRm8kaovR
	4KnyL9GkdcXTB7Y8YVJfWJWUoTRg27DsCD1uxlWy4EISrE01UauPCqSBlPnsynVu
	kDUlVTBMEUitKgd6b1A2CBHkaoZ2PAzdbTe5AghoYaU+MTqySMnFUMqPgdpjhVAH
	9Ua3kJy5WcLWZGpLG4W9ZT0r2VwtvusteoprHkHGYox44LNf2Uv1nbjwH1ePmNYP
	YWmJLRtaXPfszfo1UM2kSblvq+jc7kCg/gbBcLXslghacVdKwIrkobRlBflBw40h
	HsdTSPf8DdkgfWuOj7LjrXuDMQ8LICB7exGCSXh2av0/ID/D2P+m17fJ/VxuZXid
	cA==
Received: (qmail 175598 invoked from network); 6 Apr 2024 11:32:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 6 Apr 2024 11:32:05 +0200
X-UD-Smtp-Session: l3s3148p1@AP7ZPmoVMoIgAQnoAFjkAKEmXOPl8vkH
Date: Sat, 6 Apr 2024 11:32:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc3
Message-ID: <ujvlqe6k4azkiuaff2mjhvzy7mxb6gofvjywzgizxhweijkj6h@sootztgi4bu7>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>, Arnd Bergmann <arnd@kernel.org>, 
	linux-i2c <linux-i2c@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>
References: <lv7pvqvuacslbw5uvitzftxrwp73pl5nnl4hxjvr3htrgjtsmd@gvuvd47dgysz>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bl4rkfy7ozg4inmu"
Content-Disposition: inline
In-Reply-To: <lv7pvqvuacslbw5uvitzftxrwp73pl5nnl4hxjvr3htrgjtsmd@gvuvd47dgysz>


--bl4rkfy7ozg4inmu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


>=20
> The following changes since commit 39cd87c4eb2b893354f3b850f916353f2658ae=
6f:
>=20
>   Linux 6.9-rc2 (2024-03-31 14:32:39 -0700)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git tags=
/i2c-host-fixes-6.9-rc3
>=20
> for you to fetch changes up to 95197779091166b9ed4b1c630c13600abf94ada7:
>=20
>   i2c: pxa: hide unused icr_bits[] variable (2024-04-04 01:07:57 +0200)

Thanks, pulled! Enjoy the beach :)


--bl4rkfy7ozg4inmu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYRFpEACgkQFA3kzBSg
Kba4jw//Uub9iwZV8zuHhAdXE8Wu5Swjgx/egxEgHVKGlJcEeF5tX3boCWgvfs2S
nps9pIH+ka8eRNby/Dywk/KvEKoewz11MD6ZinlgYO/tmH0ZfGlEaPQsIHDEwUBf
NuRDWE7QN5W4vBGYMDgboolxDqUyJBV7M563U51Dmjl3u+5Yl1RuBqVPKGs9LUfF
5Drz1oo+Gkg1KgWoIotJyX8vnenfGD8mp38CrDiGxVIHxuopW6ipNQD2XU8fnMxn
3EzjAxBEUgoiBKzC1Ca0dSr8nUEkr2fKFSkAN8F4l9XJLPOPLIk51g3peuG+lkGu
7XGQ8YWDr/B2DJuZJldYuSNrpH0Vw95h53cLxmloAZvhSxkGuQZY1ianfoTeQT6U
ssytSHQakTlJbXlzKSDg6tXEGdt6NQ69AIyfrIceXlOWVdkT13ewNBO2Y+5Lp5tC
X/aAb35gdBqYagfsn31CfT8hkc6fYI/Fyg1sGuuFZAjRT+0YPmgJYl9BxDHh89Ek
nwHW25ffCyx3tjnaAZd6zH5NfjNGG1ckc5aOUrMZhcfq3hKLVokOCafdLOIU/plu
uJsabjm9u4gEIYkSpI1+QjisJ6Z/MH0kXc12gME8D+Qe7wqr2l7sd58WI/M3LpBo
K+X5dvpiV9Nm5x/hmG+pQmCqx62P1UPxtL9Eso51oADW0E7glLU=
=UHcZ
-----END PGP SIGNATURE-----

--bl4rkfy7ozg4inmu--

