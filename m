Return-Path: <linux-i2c+bounces-15133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16228D1A97F
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 18:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CB34E30245D7
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Jan 2026 17:22:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42E852F0C63;
	Tue, 13 Jan 2026 17:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OPyxptzB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D3822258C
	for <linux-i2c@vger.kernel.org>; Tue, 13 Jan 2026 17:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768324953; cv=none; b=SbV+MGKoSFYMBaEzVWFvqCxoi1vYqFrKXvrCAvEJMeircSIAqhoxaL+XXWjo1PLeGw5bpGFWcDrtdE6py8Fva8fUFY5y5QwG46EE556UFJ+yjxIVgratIVvzY2mXGl75xNFOsEOmWTHvWG3VhxmbOihpL6YsVkpW5h/30X/mfg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768324953; c=relaxed/simple;
	bh=WzjFiMEgcNZW+oETl6ZTD+vdnYdjsNFIgr3WnuCiRLE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D3x6jKqFINKuhvDDwPFdo5gIc5Da84rtGcTaLAYuNeDNohwvC3dHtOyPTp8Rg09A+mURxGZDpKFtCNlBKQ4CRLi4Eqp23EpVpI835J+aH/cOYgXVUvyuXHKWwz1khPCemlLpgFSmxZS95V+27bC0FcySAOfx8yQRk3QRA8KNpL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OPyxptzB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+EYg
	s/nHL75FRmGc577h+ISW41xp/HE9MPtMj8dmPwM=; b=OPyxptzB7I+4/IrbWScb
	WvAPxQ9qT42L3ep3EJpM7o2p5/a5hJnc/GvCFpfBdeiH72dEY+gSpjL4aWlaqFLG
	p5czcSohBgfu5LQrtdQ3jVh6SPHx1tVARb2RJIMn7mUOYSSQwVUy+6r4XvQspunO
	onG9xjpO9qDJ/qZHTrusdrrTdpjUi5+873/L3ZHktGxK415i+l+79KYvlUbTqK0H
	Tso4idzXD40xclvKZkyGJLMsFRnjtDWS4xjvpMjBIsRaT2ZF3dSwZ/9U1LjC1PTq
	cRzUhj3KF8nt5hbK+wFhLjR2CihMLqzEuWJiRqUwNVQR0oCQmDB0BczZtVi3V1Yl
	Mw==
Received: (qmail 1793964 invoked from network); 13 Jan 2026 18:22:29 +0100
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Jan 2026 18:22:29 +0100
X-UD-Smtp-Session: l3s3148p1@uN9tPEhIDNEujnvx
Date: Tue, 13 Jan 2026 18:22:27 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: =?utf-8?Q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>
Cc: linux-i2c@vger.kernel.org, Jean Delvare <jdelvare@suse.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH i2c-tools v2 1/2] i2cdetect: Display mangling and nostart
 support
Message-ID: <aWZ_U55x3qkklzJP@ninjato>
References: <20251223-msg-flags-v2-0-8d934a4366e2@bootlin.com>
 <20251223-msg-flags-v2-1-8d934a4366e2@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bu7NB+rfjN7DTref"
Content-Disposition: inline
In-Reply-To: <20251223-msg-flags-v2-1-8d934a4366e2@bootlin.com>


--Bu7NB+rfjN7DTref
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> @@ -165,6 +165,10 @@ static const struct func all_func[] = {
>  	{ .value = I2C_FUNC_SLAVE,
>  	  .name = "Target mode" },
>  #endif
> +	{ .value = I2C_FUNC_PROTOCOL_MANGLING,
> +	  .name = "Protocol mangling" },
> +	{ .value = I2C_FUNC_NOSTART,
> +	  .name = "Skip repeated start" },

As we can see from entries above, the ifdeffery wouldn't be too bad for
those two, I'd think.


--Bu7NB+rfjN7DTref
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmlmf1MACgkQFA3kzBSg
KbbDJQ//UvmEBXYrHGujtYCUkt6bA+aLtelE038RPVE2Pxq2QfXaXtKN9uaAVdRd
5Rr6YJfCH6hRumMPwBouOb7gZ+Ze+NDnY1AappLP7idYn7NffuPC+v4KV1KXKRjd
Jscg5JchW6NvY5H2Y8YsKUG8hCKeamSieT8/BbBy4T4JuV+VxVMkgiK84YJvJeru
IFgTqBEO7xvsU757+K3kLVu8lwk/CrDwtSzfvsfwJz1uhrkzj8WLP5KxnoJdSqAW
0d5pEF41YCZNmwYa2ySBuiBXHmegZNKaomgNI3mRl45XuZTv4pfCYyh+jFsIlFbM
CJIrbOapA83HgK/XK9FToKny3Bz8VpCntlPAmEGywYYP/vMfMvSUCDz+rSMGnjrL
/Zk0LGnP3e18UYmtVv/H482wL7pMmhF+zLP0t1mDSLtegF54s5xcsiTMRs6Lb9UZ
tyIZZiR8kZSuvyL/8wb2x1CFD5EzkpY19YCDKT3ZtNZ5EAE4xjjpyuZ+U9RTQHuU
4Q9F86T1gFVBfKjePoK4oohbZT+UnxxCSvw6Rh4ky+znaYlY35WpLWRlO8FXFGnm
3oSiWvsb91+C9oAdUXx2N0grjWcyUp6E0F+QPMisWxp2OJ6IgftX5ZIszpW4Ibc6
UYirm3O/scQroZgUjEjC4OSsoHRE25ALzH2Jw47aifWGzlI6b0c=
=cLdj
-----END PGP SIGNATURE-----

--Bu7NB+rfjN7DTref--

