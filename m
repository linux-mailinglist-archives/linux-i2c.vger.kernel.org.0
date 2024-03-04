Return-Path: <linux-i2c+bounces-2133-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6250D86FD45
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 10:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93A0A1C21F40
	for <lists+linux-i2c@lfdr.de>; Mon,  4 Mar 2024 09:24:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C106C224F1;
	Mon,  4 Mar 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDzdg1Z8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B7B2374B;
	Mon,  4 Mar 2024 09:23:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709544207; cv=none; b=hxTbHPerVspfAZW43lHRax3HrG4ouw6h+zUAdqYxfuziSKwIqqYe4mqDgqabgxv0yrDBrjWs0a/R1ZBGJFyAVuCKva54QPxTmrS4EFK35jdUmM3faHut6jiPTd5N9aoeq0WsKNtsLo/y+5d2KcvW5Ira0Qf6NyNQk639Xkxvp8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709544207; c=relaxed/simple;
	bh=Fjyke14FhJVuxn1qjXkhnPeP7VsIKBGI3TtDfBX5g7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n0IUki6sJpXG1mpcwT26g10Scamjj6CmdDVmTSWm4H9Pc566S11xDy6vwK9cE8pKtjEh7xxtceVfEA7nGCJ6thuOtWXi7KNjoft4jYcP8glz0wKsC/Ylj9Uyt47Dgu3fRPxIXxZecsqb8cmMZRRlPYXen9Ivf+zGBEy1Kudv0Ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDzdg1Z8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AD21C433C7;
	Mon,  4 Mar 2024 09:23:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709544207;
	bh=Fjyke14FhJVuxn1qjXkhnPeP7VsIKBGI3TtDfBX5g7s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LDzdg1Z8PXwnwGjYQ4nm55CeEZ0UJ8Jj3hScHoRe7rhX1gUNkstTGpGvhRTgJtxbu
	 OaHYE9XjY1a2dWg8jYFitJjCALv4shw7qUlRbYEJco5MxsLYQvYemONynN4uZlysFQ
	 kXzz07BmAA78ss3V82Ov7u4eb5tOd0aOqu7RIsQstDPjjotYciNQnfYpaqRFIctkXU
	 Xb2V9fSrqPinyYpc731SSf/m9t40BhCEZweynNeTi84EVcpo4LtJT2z9yx6k1CfEMv
	 UUWjIy3iM4XemV/RBLLfJxTyU1R9XLfB62vK8vkfwVCtu59azNVXUo+pxliAXyODLE
	 FLdHMQ4EzoZsQ==
Date: Mon, 4 Mar 2024 10:23:23 +0100
From: Wolfram Sang <wsa@kernel.org>
To: =?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
Subject: Re: [PATCH v2 07/11] i2c: nomadik: replace jiffies by ktime for FIFO
 flushing timeout
Message-ID: <ZeWTC4Eq9CzOs5AV@ninjato>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	=?utf-8?B?VGjDqW8=?= Lebrun <theo.lebrun@bootlin.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Tawfik Bayouk <tawfik.bayouk@mobileye.com>
References: <20240229-mbly-i2c-v2-0-b32ed18c098c@bootlin.com>
 <20240229-mbly-i2c-v2-7-b32ed18c098c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7C433FooVKfPFjO0"
Content-Disposition: inline
In-Reply-To: <20240229-mbly-i2c-v2-7-b32ed18c098c@bootlin.com>


--7C433FooVKfPFjO0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 29, 2024 at 07:10:55PM +0100, Th=C3=A9o Lebrun wrote:
> The FIFO flush function uses a jiffies amount to detect timeouts as the
> flushing is async. Replace with ktime to get more accurate precision
> and support short timeouts.
>=20
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Th=C3=A9o Lebrun <theo.lebrun@bootlin.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--7C433FooVKfPFjO0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmXlkwsACgkQFA3kzBSg
KbZlmQ/7BeOpHXFkVAV8V35Hfz9OhDx1QR4Sbzc1KklBr+gm5IbuVyYn6GgB5HVY
6Xs/IIPgOk4V7xk079tFAfFCJ7X+I3vPVLh3l7ZXKSVpGKfoU4rmuBNnHL+eG4uL
+YIpuSlM05j1ne+TnkvY8fdFFFDFkpE+w0ZSlLMTiEkU9BOJSTkF7VX3vHqXDO2d
E+SzqxObu4EuQonD5OSVMUsP/KTdWUciUejZSY4C5G1GjObV0hfNsG9CffYDAKH0
HAVqfiH28XQ3ZDpqZ44n91eL0CtU5MIj4F/UESfrlny8F9Pi8pf48bHSCNBnFFyk
wLsEgar+GHwlGL1QiIuLafN99CPAh2vNXDI29+UzziyMo4nkd1Zr5ap5HdLrIx/g
mT87ioofGWlDkuGWaLjRMOPK/lxdrdiSKw3ctQ7Te1KSLzh5WY4VjvY0jWsnvOGa
TlkHIuZYWiSyb6p7nSUBKZKkAv2GQbcagC+4B6JRS1vb8dxjv6xyz2+6WzNsVmyb
QoH00jNGkpHczE4QOj35d0JMuZq3GeBnxJo2brOMXgcsHEUabQv+SAIGreIa2Haj
zVaOmRb6ymLb9SgS5bp11kqbwjnJ/rPunzxoq29UteqSy+oECRt+EXUyuauEuf4r
2m/tvl/MqTDN1qhuR3Yb3f4reiA2lTNSNOu7yUGF84Aa18fb0VU=
=XC4v
-----END PGP SIGNATURE-----

--7C433FooVKfPFjO0--

