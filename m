Return-Path: <linux-i2c+bounces-11019-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8236CABBC4A
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 13:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2E18C1654F3
	for <lists+linux-i2c@lfdr.de>; Mon, 19 May 2025 11:25:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D04926982B;
	Mon, 19 May 2025 11:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="OzNEMaBu"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3F9920C00E
	for <linux-i2c@vger.kernel.org>; Mon, 19 May 2025 11:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653918; cv=none; b=e9qYaiNi/S7TSz3MtthXSGrxjN6068LM6ykVKYgxx2Og6jkzsCSstkjhrRtstJF5YbsiwVlvuc+QN7vcrCOjJhSfDtFoTtAnUnsiAdq0F9s1Ntpx9ywMJS4rX0incID4utK18uPa5i1HjF2f/TWN5BtrMVok7L+tge0GQYJBneI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653918; c=relaxed/simple;
	bh=amdKsUZVQPrVW8cuWdNcj07OCkKH1MAlvNmlorlJOzM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bI61LWJnnBML3aBivHutHMiT8FqR/NAO3PuJdLY++/vc4vChikQSZKqWsokSMQf5RlAzpQ9nUWOIFcmLJfio78QFnl0Ccp+RvFS10r6y7vXPAvzdwbSbmyoxw5rSn1TvWQDi8wlB2zzRBqJWffwdboJ+NdEZj9abpvXQb4nw0/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=OzNEMaBu; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=36Io
	VoT4eq+7ZF/rX8bRL+EWFny4tTmAbZhfgFCP11c=; b=OzNEMaBuyxabA3Up6lpU
	Uwu7GZgyHQd1WWlmiTBe4k8QcuMH7SkaoradHH9d1JZ7U0XkRK8jGzqBh2naCnvI
	Rcb9ybNV7zSVghQeuJCNVD+Cupftj3k5odeBLD/tB2P7kwvaspWxVKzDF1LjV666
	nb8wlWZEZNrIKDT6JIDTRtgi/RTx9gYfwrDcg4JVRvLYTkrZ4wJbDh0VXnXX+kT0
	OSqpLo55X9HMkFR1Mbvetq67sypzI/jLTJ2aya3XbXNjsVv2x4+YUaIDlX9eijFa
	/6E/0L0pHeEU1hREy35RcgDmn1JJxhxWgosgTpuTuzjtdVZPHwhjgn+t8GSb3192
	qg==
Received: (qmail 2458104 invoked from network); 19 May 2025 13:25:14 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 19 May 2025 13:25:14 +0200
X-UD-Smtp-Session: l3s3148p1@dX23Yns1BthZz6+V
Date: Mon, 19 May 2025 13:25:13 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/3] i2c: powermac: convert of_node usage to fwnode
Message-ID: <aCsVGUAQ61zAgXMl@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-i2c@vger.kernel.org, Andi Shyti <andi.shyti@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>, linuxppc-dev@lists.ozlabs.org
References: <20250519111311.2390-5-wsa+renesas@sang-engineering.com>
 <20250519111311.2390-6-wsa+renesas@sang-engineering.com>
 <aCsTjM49Ll2fcv4j@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tiLI6c0y3rR33YIN"
Content-Disposition: inline
In-Reply-To: <aCsTjM49Ll2fcv4j@smile.fi.intel.com>


--tiLI6c0y3rR33YIN
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > -		info.of_node =3D of_node_get(node);
> > +		info.fwnode =3D of_fwnode_handle(of_node_get(node));
>=20
> What puzzles me here is that of_node_get(). We already do the same in the=
 I=C2=B2C
> core, does it really need the second bump of the reference counting?

I'd think so. i2c_board_info has its own source file outside of the I2C
core because it is used before the I2C core is even initialized. That is
basically the reason for its existence.


--tiLI6c0y3rR33YIN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgrFRQACgkQFA3kzBSg
KbZnUg//cWSynO4god04ylSSVdsm40lrGzy9pKWcKA4TjkX4svYytQJ2XCfHvxzH
hJ0LMgYgUBdXeekavG565XTQPXPRNKHhEl44LzwACGNa66WaFv3Vh8/TJW2ztRDl
KYo6l8HPSuXis09rYLWBf3qkRxJnt+fkgQXDPClSsbCqIgeWwlS9gmcXty5G3MSQ
oeA0u6I/KXKFNEHX3tQjMZsE/OZAJ3UAk4Pl8V1VSBEP1g4SqhN7ZWNIVevkvp+3
7JSXCLuf9NF3+pgjia4SSZplvPaEgjwlx9ObksoLmaxiOpz0BxHUq8p/IF9+Sh2f
BxZ4zKTYup0Mh5swuFd9WxzQ9azCWnZRRWyqgGBFVZqvrzYuHdEoG6A1ds4WqO+Q
wwXMfafZQ3msIgj79G/R6MN9p3FnmioqC/yQsFvG3a09pm6AoKH1egP5mJajhu8a
Y/a+EA4KDVLyoyvvNvAtF+kbuo8nOgwWT8p/VsY3oshBdgHqU7KisQumGbSV0aET
FGNhU0ScWo4d5pNQSAGNNwbLhe23tFBizJtYHVPHr1/xgjzsnNwa0/8Y+L1ZGbk1
IpKmLzJQZgGi27y74OfHH1kS/F+L8NK2twPABlsmPxM2GZ12oms6XE6hcuKtIWQ2
RK0QukhGpazgEJ6zAVT8iARfUXV+Ix1O63467sgm0GTY//DrQcI=
=paet
-----END PGP SIGNATURE-----

--tiLI6c0y3rR33YIN--

