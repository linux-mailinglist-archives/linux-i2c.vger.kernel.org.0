Return-Path: <linux-i2c+bounces-13451-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C8BBCF3A4
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 12:33:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 7BC8D4E93C7
	for <lists+linux-i2c@lfdr.de>; Sat, 11 Oct 2025 10:33:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3004525B2F4;
	Sat, 11 Oct 2025 10:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="CF+MQd1T"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6105F25C70D
	for <linux-i2c@vger.kernel.org>; Sat, 11 Oct 2025 10:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760178816; cv=none; b=W+rLIkE3W2pmhYmLL/ZDj4usoRbnayXB8u2pSMhDAIUyBbOgMNVoqeMG7Eq781ByhDc0co2bHe3NpL8OaUL+A6jcCeE6x3+g0V8XE04Ol1pE+XbcHMISc+wLpuuEjTiNY5swdyk8JdAoEPEoVy6aXqeRMooc8InCyKPpmXleNN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760178816; c=relaxed/simple;
	bh=fg1RHWnvUmDjEaE8LFeiOl9ZjRz5QsRWAgF5vPcp7YU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHm0Wmhm8znXM7bF08svFxmZnUorQmufKrutsFdnJQa26MT4M9achay3vcifUEgf46mZ7TsY6PEQEtQA00z2Xaim0/v0OOUDnMQAbmC2+8QWxofNQJJM9yJmfJUc+Z93lxBA2PAbq2h31bPQkORYX/dAooqUKTAyE3sWTrZzq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=CF+MQd1T; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=IzXK
	iYvrkWAgPpvxSlT4Q9PfKMHpibeOyXlzqdrlK58=; b=CF+MQd1TOlKAmvqdXEGh
	BZyr+Ep+Yw/atPLlW3M49+fPDKCGBjCaT92JzFKYJJw7tuHMXZ/g2JmZbAHH7d5Q
	SXfUV53EYg3UpmHC5it7fqmoAO6xzOwDWkKOUYGqTkjC6keM0lJo5e+dWK2KBGYD
	YZGr4JdhwMVTweJHds0V8HXHhXEcJq6g/uLo0rOAhROqZ/xrFw9FtKpq3yO4HWWq
	61wrGtr4XexMT4Zw68YhRvawVWHP+yqKPDn6sLXqezcDfE/cj5ipeAwp61BoBEs6
	gT22KQM28tCs+O9xtk4lfF269gf48fP9O/RAOC+3OU7EJzjdPHobzOOuALHQ/wOn
	1w==
Received: (qmail 1793806 invoked from network); 11 Oct 2025 12:33:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 11 Oct 2025 12:33:26 +0200
X-UD-Smtp-Session: l3s3148p1@xw51kN9Avowujntw
Date: Sat, 11 Oct 2025 12:33:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>,
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>
Subject: Re: [PATCH] i2c: i2c-boardinfo: Annotate code used in init phase only
Message-ID: <aOoydT_I7d3khXuh@ninjato>
References: <8d09aa09-b656-4b69-b01f-3ea40418b7ff@gmail.com>
 <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Hffl64dN477NDPMA"
Content-Disposition: inline
In-Reply-To: <29ec0082-4dd4-4120-acd2-44b35b4b9487@oss.qualcomm.com>


--Hffl64dN477NDPMA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Konrad,

> Hi, this seems to break booting on Qualcomm X1E80100 Surface Laptop 7
> (arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi)
>=20
> gcc-14.2 and clang-20.x
>=20
> Funnily enough when I build this (albeit on another computer, but also
> with clang-20.x) and boot another X1E80100-based device (x1-crd.dtsi
> in the same DT dir), it boots up fine

I reverted the commit now, but please if you can find out more details
about the boot regression, this would be extremly helpful (maybe
earlycon helps?).

All the best,

   Wolfram


--Hffl64dN477NDPMA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmjqMnEACgkQFA3kzBSg
Kbaw2Q/+NMYA1vAv5VXCn2cwEops3vP7MMcBcq/8tL1rPCl/BqO54oE/nuoHi885
HyhW5UaTQfNesDAylGBznyQq9jDTzft2h6k+TJp6YMm27EgHE5ft1oXjpp7ZKXLd
YZ6cpR2HCmSccg4y5+dkD7sxd6hdH4/mXWnXYd21Hvr+xq+cFOlZDJfgzbqCXyn1
mfvg4teOjtDbs1YD0n8ixDZPTLS5XWIJF/XCaIotQilXKqLgKU3mBi7gouF9Dp2p
+lmfMP/oABO1aIX44nMyiXk4gTfS5+NpYBjctBx5q/RluxMmDNX323vy0BZCaXLO
Icc2UPCQ10/kHRr0ZckHwvCfNl5QehnmPGNCMjVjbP1q16EC7QXFZh08k7HFmC0g
v67nUvLOOVGvEas2k9XVrKJPM2E8gABYjTXzcMDitfDe6usdR8c5cMDio3SbO+6u
txI/aQogi7x8jYbYfGyu9H8a6BtS5C48lkZX0B0/tErsdWyhauTCdZkz27bkkosN
zZSlLVl1FGE4c+xyZrnXaAQr7qfuLQ850kjU5f8XZtn826Y7GKeN2c0yPQEiubx+
6P1xUKRA5k5FYfg0k2zvFdng2+WQjOYBw2eWwcmWtHIdVSXjy0EXtKopdkkGCOn4
wh8Qu2aqoMGYj7gKnQMevScBwp7ncAY9K/6AJVY9e5v6kZJFuSY=
=sWkJ
-----END PGP SIGNATURE-----

--Hffl64dN477NDPMA--

