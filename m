Return-Path: <linux-i2c+bounces-11042-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 28979ABC4DA
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:45:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47B2D1B6129A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:46:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47BCC1E9B2F;
	Mon, 19 May 2025 16:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X6b/TWUV"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43D241DE4E5
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 16:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747673152; cv=none; b=kgcrdGWm9FP7yCjH51ONJYxWVEvADJ7EqO9iWqrvF/ly0wuXVJgXXcFgbdRhUiREUXVi/qAOIK3yhmmH0DZcGGau+Ouk2hNvA5wPzpSS6v56+abTMaX0N5FeJzcd3HpPewVUEq9dfnI9Ls+6p4ptaRN0wiOCWBaOPANNlEdN91M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747673152; c=relaxed/simple;
	bh=qg/FF/QC4I1e34vFmTqqu1OwwF4tpwubPEzn9O40t1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jCn8vYCQJuXTtWgQ2YtUVxZ1r2EB44j32OgiPJgpQ0hOcsddlsNz9oO6KAYvkChplotfsBEnPMF/LDGChqyb9YrNy9h12ZFaDGpXHi2A4IhKEGp2LuNdi4YdIf6zv0BdhgsvxlBnrtEjTkjOyQiOwbtAB6l3Q3BAWoAuLnPWCCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X6b/TWUV; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=qg/F
	F/QC4I1e34vFmTqqu1OwwF4tpwubPEzn9O40t1Q=; b=X6b/TWUVsK0rtB0KhtGD
	qN7UOXtqzxqt4bKNk6eyiWLt3q3ilGBHeFs8s8y6VjlrAO36TeEtDmf2EDLnVryU
	k2wYjQlnVeTlCvu3XQmWuufBnP3Bm2xX8PYVgvfGNd2iSryJaFc4NpbjSyEQeE1W
	xeHEkKfIWmp9v0hEzglszKheLj/EY/GUvTeXxvDeTwi4/bueQ/kv0jZeDnNiGVmh
	/1AXxGE9ho5glJuEa1mA4/82lq0FsUELeEnnQDcQmP2tHX6CSOEHdSCy2UUmLcFd
	Eeq1fluC9JZrZCpaermykhtnHKGfQOU2DZQuzQtbaARjOFkiqawOOjHMfSyGMd+2
	cA==
Received: (qmail 2567526 invoked from network); 19 May 2025 18:45:47 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:45:47 +0200
X-UD-Smtp-Session: l3s3148p1@LYkX3X81LKxZz6uL
Date: Mon, 19 May 2025 18:45:42 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Viswanath <viswanathiyyappan@gmail.com>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH v2] i2c: Clarify behavior of I2C_M_RD flag
Message-ID: <aCtgNpWs1tJ1FltB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Viswanath <viswanathiyyappan@gmail.com>, linux-i2c@vger.kernel.org
References: <20250510212721.29829-1-viswanathiyyappan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="H8jNmBxwUBHjb0u8"
Content-Disposition: inline
In-Reply-To: <20250510212721.29829-1-viswanathiyyappan@gmail.com>


--H8jNmBxwUBHjb0u8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, May 11, 2025 at 02:57:21AM +0530, Viswanath wrote:
> Update the description of I2C_M_RD to clarify that not setting it
> signals a write transaction

Well, ok, if one is new to I2C this might help understanding.

> Signed-off-by: Viswanath <viswanathiyyappan@gmail.com>

Can you please sign with your full name and resend?


--H8jNmBxwUBHjb0u8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrYDYACgkQFA3kzBSg
KbaQyg//WCWQCxUWezKPYsrKqGs7Tje4wRzVd4qisG9OLWt1ttM5p2ufXQ6kfSNg
0lh2niCnaQvDtcOM92JhEBNmNoC2z/UmRs1iF1bMG+xwamlwDEu2c68KpTnJHkZ0
eO3ANxWSAaPzQh5TkRx9CDYEMnAE2WM1yA3kpfg5izArW7sdlC5X425c10s1ClOf
nT7rhWd3WK3T9fE2AA56T7KFiqwwpAuIlRHuXhELqme8P4V+LwIbfK4XYYZAAj3/
AlMq/Fotm1F+8GkPKTiRepWxgpEtlC5ON8LupTfP39eBRhg3t0/XtCaChJgST43A
TlaPQ+1eMTuBfCEcNbc6Crhs30MyQa6waFh93X8q9I4iS+WxKEMGCNajMRfNpgSG
iI2xUC4Yzsq1IieXq0QmpwRnScjwPMRlMS3X3Mlis/eGyOEsEB3gKzO4aS0G8EmZ
KZoypy8qmpb+LWkpGAmRcgz5agxQY/J6Xj1KS/lXZGax13CF7ArcQ0pB6LJptfxx
zUAtMkpM9bnOsjxHghY70ZQBH0ml7kgvmww9vWGA3ZA5Hij0uYdCX+APtgHITFlc
jtO96wD+dbksYpKGGRg3x6C3zoSU7s44FEXzD15Ywg+B71IHpd0kbrmDwKGevNHv
qKLRcgs4ajvtQH0LnYbKJhVavOGSTGDvjQM8OyNzlx8PCXb8Xrw=
=hkY1
-----END PGP SIGNATURE-----

--H8jNmBxwUBHjb0u8--

