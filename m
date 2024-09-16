Return-Path: <linux-i2c+bounces-6800-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A70AE97A2E1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FE64B20DB1
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 13:23:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 417C2155741;
	Mon, 16 Sep 2024 13:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="DRzeFTsl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF8A1862
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726493022; cv=none; b=jle0Pj2bhno4RmTFTeqSiUUeRmp6lKcUUPD8HVMyaNwsEzaORmjw+Wf1KjficBtx0ZAAeJiggNt9kVptWbHMU2kUboOZSMPRM1qbIkHU29X9iXoZnCAy5RqRRI4h8cg7vnHV80KenNVN4ZfIBjYpBTvdWW7AVeu/vQdlHWSfJio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726493022; c=relaxed/simple;
	bh=00f9aJCyCO0yYAivTmuYv6PtRimsVf80yJ/hO4mM0mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dVEaAInQXmt7eW0Sv4IrdeFaONEDI5NBtxTZz0inI4Y7mDUq3cxhYnBKxMoDACg8hET1CZLs9UjilaEhSIu4d1UTSfSc8wPX1l/HVeOyNnwGBKpU357bztEbbKgpyMK9bzi4e+xGcERdYfwg1CPN7aDib70ghMqD1MMAIZrTq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=DRzeFTsl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=00f9
	aJCyCO0yYAivTmuYv6PtRimsVf80yJ/hO4mM0mA=; b=DRzeFTslnJKCD/cqtXI3
	iufuZKk+wppQq0/5hT9BiyaiJi+oM6MB6Iug0B9kvFRgjSlQzZednkJEmUhKxuUl
	QSZA0TZofmaJKKpWsdcJcNPBxvwy+IdK/Wi84E08rykV8Ei31DVEEv+GjxgYgmLU
	GQV/3R3hYbSISYBERq/1rwKnAZF/IGBHdxvZeQOuqUCRh4YgnvpQwGmksKS276/d
	HlpYNHVbVoT1KVurVl5xaZ+5JaMDX1F04gHc96hWeJ4R+F8nF4bd5cAdJDS108c0
	DMGF2Rt04kCJ5ZOccmOf0sCoke5QjsECPn2Uv/tk5Iq/kClTzdmOAwZdDFo464r1
	Gw==
Received: (qmail 2009962 invoked from network); 16 Sep 2024 15:23:35 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2024 15:23:35 +0200
X-UD-Smtp-Session: l3s3148p1@QvvRejwigK65aIoy
Date: Mon, 16 Sep 2024 15:23:33 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.11-rc8
Message-ID: <ZugxVfn1IMCBtfyU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <2itivkfhp7s2dzmihtlo67w53wpdiukmmrcf625isex5rrtu23@4naen2rzimxw>
 <Zugg26oB74biYTwN@shikoro>
 <jlebwv5qchjbu6q2g36a7ilcnyt2o2zc4i2vw55vyqfmfnkkre@yrqezt3ufmkt>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="BGgOZZbftmVY/E67"
Content-Disposition: inline
In-Reply-To: <jlebwv5qchjbu6q2g36a7ilcnyt2o2zc4i2vw55vyqfmfnkkre@yrqezt3ufmkt>


--BGgOZZbftmVY/E67
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I can take the opportunity to include a few more fixes and send
> a new pull request.

Let's make a new PR out of these. I don't want to send Linus a PR which
we modified until the last second. This one has been stable for a few
days, let's keep it in this state. The new PR will have its own
timeline.

> Also, there=E2=80=99s a patch from you (a fix of a fix) that I=E2=80=99ve=
 already
> commented on, which can be integrated as well.

Further comment coming up ;)


--BGgOZZbftmVY/E67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmboMVIACgkQFA3kzBSg
KbZ5NQ//dkm4tlkbSl/twFwloZIkT3FOo/6ZUd9X4X5Cz+m/m+w7S5GDOMu3S+v/
ys2tlDZuVEZw4wBIRIm0iHSJe7sPNh/nlYfUfhBBQwOyGc3je5lWX8VVRbdMTsiH
jig4zGCQ45m8iGqy5UdO4UXx6KsYvYpuNFINWtiRiOAC7fKJST0tJYOm9Mu8syPQ
GJ43z0VY9zdHmtR66sblv8U4KYEwkvypWMzqn2zqfr0ZODiliDpiAanRkXv6GzJ0
mcuhax6tHhGE++cNAVrLpCZf5Ax6qd65wbr7ZVTixYqscVwsjjxxx54t+Ln0jkSp
K57qdhUJwPShd8/AnfqCSuIiuoo/H6kAWuJ3Gj2jNMhtf8hTfVl3qePIOCG+9Uxn
8mRo9+UC+OSQf93wSAYF1cVJBH4rCJYxf/n6odl11al3PcSz9iBV4ONyQ13OYT+T
0YItcWaeLVhcR46tAXEYyAAdZLg6pF0LVT9JGolX+GbrCOBt5LNEp1yznt6Kewsa
lJR4LcJ2UVrJgkkRhh0lray5zxpy8LWqRcWdl2BGBRB+TJkV4EC3dbAaedThY81T
jKdezpfQkxXhJ8lM9dt5bGRq4C+L/eS1Eyhx2Prjd84SgzExPhlfT7cCfK1zEblD
0PDKZ+AVChboxm3Wu/cJofmLc4HSdIwC32Q4BUPFAxWXSZnlEyY=
=mwFz
-----END PGP SIGNATURE-----

--BGgOZZbftmVY/E67--

