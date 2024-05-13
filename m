Return-Path: <linux-i2c+bounces-3482-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C8F8C42E9
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 16:12:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A98F51C216BC
	for <lists+linux-i2c@lfdr.de>; Mon, 13 May 2024 14:12:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AD17153BDC;
	Mon, 13 May 2024 14:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bUfPdhxu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64EAB153BC5
	for <linux-i2c@vger.kernel.org>; Mon, 13 May 2024 14:12:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715609559; cv=none; b=bIwAtrpK1Y6tITtL1WQahuQGtqwmjcjJYx+cBmRhrO3RSCZjObhR9W2DYNLKin+QrhK9lSEK8CS2x3GLSBTmvlZt5WjFwHAzx5FYOx+QE5his3DapJ8y8OxLKRNBpPOrmutVBdzECpTkkoI3hJ8vsJ0Lr09ElYJpkaH8UOVuS5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715609559; c=relaxed/simple;
	bh=VIOB+Xgn2uoFT4eXFo1Gt7GG9iF9Wef5X6W4CIajLWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SxUP7KnZQOVKr4Ig6dGJ/ylY8R3owg8lRhNnVaLOa91SBh70Ow2deXkXWaXtmQGbz8AM0ysUI13hVpynT40VjUYXHYAIK3++CIXw4sh54VA8XD7DrApWke9w6ilYCzJnfNGtnzenMK8l4eLayI//cBRzVraH1EEC8atNwmtk8mE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bUfPdhxu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=VIOB
	+Xgn2uoFT4eXFo1Gt7GG9iF9Wef5X6W4CIajLWo=; b=bUfPdhxu+F9tK4dV/lui
	M8fAUAiehnCBubGkO21CrlEw9Cmx8tSer7p9UEWC7/aq4TInz2p79ocAzLGimCqJ
	ZdjGLiMfkwwHYFbUGKTNroT+kdkxLxBIEdXjyxRL15vAVEQhAvGvT0dwqxEgXHgd
	wV7MW7XySaRVLQ6rxTAhHCRSF8NJH2kFFagycackCHkPDhNHd/QvGeErviAjijQv
	Sc5gZmlTXUEBOHCvpMLPHUrte3NR+4/yJQwR6xxjTolC3dKa7ppkvnIV+AeqW43v
	pAiqHhNwkNagyIWd1sHk3aR6d4UO+ZkVlahrm+jv80dRfGjeEGWuNoJkulcI+rsr
	SQ==
Received: (qmail 2174077 invoked from network); 13 May 2024 16:12:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 May 2024 16:12:34 +0200
X-UD-Smtp-Session: l3s3148p1@tEEJelYY0qdehhtP
Date: Mon, 13 May 2024 16:12:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Wolfram Sang <wsa@kernel.org>, linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.9-rc8
Message-ID: <20240513141233.q7eur55tfxbyaynu@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, Wolfram Sang <wsa@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
References: <pb7vi7igdvqo6jlyjrd2lhfgbrz2kx5nmmw36vcdy64ndwbs3r@e675jdrgq3lj>
 <sadxp73tm5zhfgsv6ufroexcoq4cg4j4quljry4bsojkzniw4c@m5mhet2w5f5e>
 <2mqgax6smctnfpkelum7sbz2ukqraankpudjig3sv7cwx2bgsi@tgslonensttd>
 <20240513135914.ul6nrieeljeuo7rp@ninjato>
 <xcvnd5wld2lobtol3xbx5ir5z7xohnv22xzhvnvijbhgssb4kg@4rovz5mdgal2>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="h32rljwqjshgwqe3"
Content-Disposition: inline
In-Reply-To: <xcvnd5wld2lobtol3xbx5ir5z7xohnv22xzhvnvijbhgssb4kg@4rovz5mdgal2>


--h32rljwqjshgwqe3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I will send a 6.10 part 2 merge request in a few days.

Awesome, thank you!


--h32rljwqjshgwqe3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmZCH9EACgkQFA3kzBSg
KbbI3g//eAGWhGJUFUSRU1NUBVPX8tNiFcIRbdSxjWu2iLYtt1y5YvBomOqciJ0y
mj2ES16B/LpNNEwe5h9Iuy4SYpbZFdcJMlJbbjQTz2go4n/fg715ESl1wuRXjJqe
mqvgEJ6aaaZQ12lSxMv22AnDZnIVSVfQWnBjPgnLwkAciDSO49WUcbYgGKeGvqh2
5YmG1EnTzWu9mYVGlsMCuR987ZVx14Sdl3TDUl2pLvEMtlsZD23lA7o7SBD06jfO
1pROSfWU+YZgJPQFGMwPsC2Z+/Tybp6ownEfqPnfDuoNh1CdEGzu6S4brh4bEfbU
pqC3ntfbe1drFAaeAzCK1adATywvis/NQbXZejIbtAUwl6eBFQCMyMtKK7yGGPLg
jxxi3vvdjngzCnfVgmvTC3E6+oCQB7BkZN5TnkQD1ooV2vnX9Y6IOI1dICEBfsan
PBSe6EQtyCwGO/4PRAyNG55fDg8kEMva3UfxP2iGNLxCGlzd6B4guy6681spXEoc
X8kkPgLf1Y7x72pnd1XtE0OTxEJd+QGLuv0WLSC+0jRPvt4Yj4Zrdmz3YWr3Yv94
BLpvShaUOGdWu8Gwu6SqqUyrIzhxsknLERw/EonTTvPnUMjUP+PNr+CnnUBzde0E
pMmrA0YEltW/dhuuwjjQZR8DRfIhlyh8DeGjnBBrKaeD84M/FI0=
=iK62
-----END PGP SIGNATURE-----

--h32rljwqjshgwqe3--

