Return-Path: <linux-i2c+bounces-5346-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 33ED2950D54
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 21:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5F41F23069
	for <lists+linux-i2c@lfdr.de>; Tue, 13 Aug 2024 19:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 718181A3BBB;
	Tue, 13 Aug 2024 19:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="hoeC80sN"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883931A38D3
	for <linux-i2c@vger.kernel.org>; Tue, 13 Aug 2024 19:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723578437; cv=none; b=jRiCGEDPdngdRQoy/9HJU/yjsyDPCSeVeF2GLzrmHShF6/M/5GYXwT6U+7WIWwlccwJ9Ia6noirtU/7C6J0B7zEqE6Vca/iBuGmIURW8FlC/S+mxU0g+/aDifaN/0VeepiiaSvQ8Kq+eLoKUqqhthLeyxi8TD4Qnq0QV1qbtSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723578437; c=relaxed/simple;
	bh=q1WEkObmezT4cuSE/xHZpVscMy7YILLRUWpLPnFk6fE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iEeNbqnA9B9069JPivcYycnxIO5ju801JI0q7NZdDzcKACYPNqPFR+CBiX9QN8MsoZqTS3lGdbxASbpF4xE4cP7MJrFVO9DeBesmNvInKS5hyzwxrJ7iHEi5pzGZTd+EE17WRyIzsTe/scJZ7r2ccC05yMVGde+PpV+RX1vyYz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=hoeC80sN; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=q1WE
	kObmezT4cuSE/xHZpVscMy7YILLRUWpLPnFk6fE=; b=hoeC80sNy5+d5g31f5S5
	cHnrFL14SBj7IYI5pkPJbJzC+L9zlk9c9AR3X05VbL57XrwsrzPd07oBCZPB8Ajh
	sBX7j+SnxCPZjcuacCnojCj/k7z08IFrXzi1tD1LZ6vMj11rzf8vHQQleqaIf2S/
	JNAu9h0/15mLWN5v3adW0WdOMTfMRIScbONBPOyz3T5QNWxOBXcyxbSKk4AWJGV8
	dCNhckaJIAQKZq7QaU7Ipp0s8y/LXVVcnFqTrNMzy+BVuVuo5XdzzSw4zgaj2uAW
	vdfjjolYCAo54zQEw3aV7F1NvS5+7UzFWU4gmard5gWeAkAt8+UuekVsC8Rtm0Bs
	Jw==
Received: (qmail 1770866 invoked from network); 13 Aug 2024 21:47:05 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 13 Aug 2024 21:47:05 +0200
X-UD-Smtp-Session: l3s3148p1@2ZS/35UfGMNehhrd
Date: Tue, 13 Aug 2024 21:47:02 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Breno Leitao <leitao@debian.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] Do not mark ACPI devices as irq safe
Message-ID: <Zru4NpfJZCzE6uoa@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Breno Leitao <leitao@debian.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Dmitry Osipenko <digetx@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, leit@meta.com,
	Michael van der Westhuizen <rmikey@meta.com>,
	Andy Shevchenko <andy@kernel.org>,
	"open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <20240813161254.3509409-1-leitao@debian.org>
 <CAHp75VcLR5ehrCyVsY0TKWSogRt-_ETqkZ1VE=ATVqRc8Y_9vg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vp+VE/yiAlCbU3dL"
Content-Disposition: inline
In-Reply-To: <CAHp75VcLR5ehrCyVsY0TKWSogRt-_ETqkZ1VE=ATVqRc8Y_9vg@mail.gmail.com>


--vp+VE/yiAlCbU3dL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> end it will be ~5-6 lines only. Other than that, LGTM.

What about a proper prefix in the subject?


--vp+VE/yiAlCbU3dL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma7uDIACgkQFA3kzBSg
Kba0BQ/8Dp6P0nzxq3BrGGgCD3+Pe6Q9sXIcdvMWnUMmg3fRkPlWj9EV94QuQSjk
t0hOF5YD7amXLHzgfWTACivXYN3pMbrJ8YdseB2TT+4PDjVBDwPkNIvRlHexmkgX
EyYs9uUQuqRtQ3D1oFLjQZxaFAn/gAjIS5myT2jYWjb3LrRBnS7JCXawEpsz1dbn
iCiQh9CcWa17L6yE/yAzf9CVMC+NQSJcU1Gr47bPI3TEoUGw6yydjrgnDUv4/ws6
glyXdQ6wg+iJdRwLLNvI/F9HzG3CSK+YnT+gzgsqbWSUzRLSOGWv/tTX7mKx0Ns2
R28N/BZEF2oiUpWy0OZqPE1kVvizgIU21YSMo9rJPFDyps2H6t/w3rKbKUYRgz2s
duxUdZ5H+I05jQLBL965dw/xmpMF5X8QU1N7gtYOWKPCm21OpDFwkFOru1xW55nQ
4bKwE9IfANYPP1ILMDrfADpHWQWA5WuGwjki4w4W6kAMjRQcEXjS0eVh94RSTGTf
QDSaX1hUylvPTIvyz46SoJYwthrLt6S8E6xTHfqMtnDw0LylwVmXImDPQGSTJuBI
XA6jaEpy6EF+vp5lCbBZLEEF0VjpJlv3df9X3C/HMKQWTAzWo2ZMBUyfnUfMOt/D
yBd+ViIS4u7IgeNe9kqYM2ycqoq82lXWliWxVy4JEPfX/PRK82Y=
=NuCY
-----END PGP SIGNATURE-----

--vp+VE/yiAlCbU3dL--

