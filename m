Return-Path: <linux-i2c+bounces-11039-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91759ABC49F
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 18:34:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 691EE7A1AF6
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 16:33:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B15EC2874F9;
	Mon, 19 May 2025 16:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="IBAgG3Vb"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE4D28641D
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 16:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747672447; cv=none; b=HMk3LS5vAVXWtZl1HJVeZ7El1JsneTWiArInTkZJEL+5i4a/xe7E/gWxrqcFn6xomC+RYEiVGdwsHEyhJX0UyHUOcqrV4yxOaSzDtqjxMH5CBAjdXsvQDbTyGh8x1k0DSewny3H1YEvucUWBTXtXDYsKe9VJyMSFHZ1O9sGyKRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747672447; c=relaxed/simple;
	bh=uG4yE0HT96RV6aXbh+rbit070mzDFWRaxDlADaK0LLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u+MPzDcieIXToLVwUFr2bOMrBWnh1/MzvHocVY83ogFyvbXNXXPA99m8WYf/tXQvZWj2xXTI06bjxXWRd2Ms/lobahsu3wOf+p0R70fUwobyRJNNEHueY6xm0VtqsfnKwlCr4Z/5Ntatn+dCmRMEqfDQv8tvnMti9/wlhFYQzJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=IBAgG3Vb; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=sLf7
	BVa2zxE92TDTNo27qzYcFtneceAlHRuaONFI1U8=; b=IBAgG3VbzaJw7nxKBAJp
	XyyxlxmpIi+bB36tNTKfyht54NRLFl7Ir/YzpIL5vlbXquQAHPxKrIHuqTKr+AZN
	g+l2cXYrilP6UwbvM5RecBNm99ILuk0Aqwa+FkppaVILG5cTTbQ6JWDHFajSYBwU
	8Wi8eLUCJd5KZFDm7C3BmVi4pMciV4eGkIvjFez1OAQDZauil6hZz2ic+N1K/a09
	2tF44ycDN9m9jIxrli1oeKofnpNQ8nBNtREQ2ME+OPavrgqUciIlnZiPrVHNXt78
	KOX8l7Kg/7/cqYeAlacmbVHWDZXEgrG8J1M+WqZ89TD0/iw6cpkWMXM7sP8vaUY8
	7Q==
Received: (qmail 2562738 invoked from network); 19 May 2025 18:34:02 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 18:34:02 +0200
X-UD-Smtp-Session: l3s3148p1@U6EOs3815olZz6uL
Date: Mon, 19 May 2025 18:34:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: linux-i2c@vger.kernel.org, imx@lists.linux.dev
Subject: Re: [PATCH] i2c: core: add useful info when defer probe
Message-ID: <aCtdeXEGiro4ahZi@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Xu Yang <xu.yang_2@nxp.com>, linux-i2c@vger.kernel.org,
	imx@lists.linux.dev
References: <20250507102714.3535412-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jg0BsfBdhNzB6f8y"
Content-Disposition: inline
In-Reply-To: <20250507102714.3535412-1-xu.yang_2@nxp.com>


--jg0BsfBdhNzB6f8y
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 06:27:14PM +0800, Xu Yang wrote:
> Add an useful info when failed to get irq/wakeirq due to -EPROBE_DEFER.
>=20
> Before:
> [   15.737361] i2c 2-0050: deferred probe pending: (reason unknown)
>=20
> After:
> [   15.816295] i2c 2-0050: deferred probe pending: tcpci: can't get irq
>=20
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Applied to for-next, thanks!


--jg0BsfBdhNzB6f8y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrXXkACgkQFA3kzBSg
KbbMZxAAnumV9ELtr7CGAdKAyEYVOS3dG+Dcq6+5pPyVED7UH8ymzqRWrvGlMvUL
7RHSZRJ4lG2t2IeqqetDzt/Hda0cIcTuiauhNl5aEP84hc52cyd/GWmiNZ1farbv
rZH7VXDVYIlwu9JfsnT/plAIGxuDTOsRzuGLrxSg6NfTeqNhOi59j9N+FjcRJLxf
9rb4d36lA2qPabgmZumTb1ODkwsE0PQtthGUmJdXbEpzl58JmH/Sr4+5lvtDW0B6
Zz5rM3dAJ+c7DsvRiFlmJDiYXTRPPBO/lsEYdApXGhgjMW3+wM/MfYZrAVsy09Vb
IvmSow2vGezebGkq2w7qT6qTqvdN5ECmVNUtFswPwiglKorYnt2OtnhfrU/ESLrk
pmHEvCrHizd6VqZvCB3EC4pUVVft86TbUO2hjhRqv129Rpn7uDXqKff+WxkANEpG
YAw4kcbxAPSP9CGUofySMcwnic2J6cxfpypHzU9Xgjn/5TOhQcZzzszs3QWUJhWz
Nn2bnj8OueyXfqoc9E9Xe6L6VRV3oyXZUOYOEWCla7Vf1d/QCW5LqeKAjMdB2Bs1
ezMAU9h5fXTMaKfop4CAKYU1tvpzvDeCy1Eb/UGobvAGCW1JoQaiVX5NrLp8c10h
EPpl85RNCQfq2eP+Fnp/fPU2ekTTJyctlAUeJX9B7cuuB+QI4AI=
=cSuG
-----END PGP SIGNATURE-----

--jg0BsfBdhNzB6f8y--

