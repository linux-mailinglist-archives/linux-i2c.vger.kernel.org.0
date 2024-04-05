Return-Path: <linux-i2c+bounces-2770-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 47823899868
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 10:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1A121F21EA3
	for <lists+linux-i2c@lfdr.de>; Fri,  5 Apr 2024 08:48:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF0F2145FE4;
	Fri,  5 Apr 2024 08:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="R8T/4zsl"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7ED145FE2
	for <linux-i2c@vger.kernel.org>; Fri,  5 Apr 2024 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712306921; cv=none; b=Ah9jCDRMoGLYzdYc7Zxn6JUN1NAlyerWomN4cw52vE8h+z2GUHQL/TFTHoooNwi9NH07Txh2i2FNkgblYt7XHY9Tv3WqxeEu1UQKlBNNAsY1ZUb4KWKmD08lnvE4sIbo+AQ4jXtN6tWDZ6szomtaf6604sh9r8RQJTda2bsPnZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712306921; c=relaxed/simple;
	bh=rs0vw5LW9UM/y60I9xGZqbakggiNBHyoOs4B+0ZsN6s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=if/iITmOZWfT2Q0uhPswmoVue9XQ3g/SeRwqSvsuI2HQemoX2EreOj5Ub9DfPb5losXtbhfviESItdBDr9SPtkFCIBmP4e4a7mByDV4vKI4u7vK/WkKVV53R4hM5WhEpqn/FEdIxSRX4QaKg5JZFSPeTwnVCrWtmC+2KuK10gKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=R8T/4zsl; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=D3bA
	ysj0N+3ktsukYn/zGLisNXUDp098hBJ07HyHzKc=; b=R8T/4zsl0Zd0dNbaommC
	kCLTauMRf6yuGZlEbnNrPo+sDuLbN4s8BfD2QtEyqFV73GtOSagiQmnkLEuHWGCQ
	vRejlIPlKU/mYMv+6t8UkEAMEtwYdgwHTAQorcdRr9Ope6KAX7AmqTkxF537SxfY
	hbp2DrU8wtJm0oExDm1ozx0tnjR+RM/n3EJ7Hxedj1A/sxIF9bIEt0Q6uqjDDZO6
	DhN5dSoCZRnlewvb/Wq/ACyPQ8GtSN3yttgw0BjHvy2Oz86yt92QQcC0xPBJXssA
	1OMpCVAZHpK9gwh4XkivjtbsyOTJWxSQAZ6QWGsn2F7XdFdDJmCqNTrRYM5kOmvv
	nA==
Received: (qmail 4044863 invoked from network); 5 Apr 2024 10:48:34 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 5 Apr 2024 10:48:34 +0200
X-UD-Smtp-Session: l3s3148p1@j8VihVUV/oogAwDPXwEGAANOsN0UmmrN
Date: Fri, 5 Apr 2024 10:48:34 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
Subject: Re: [PATCH 00/64] i2c: reword i2c_algorithm according to newest
 specification
Message-ID: <kd2gnsosi5xar3mwc3zz7wqtqkfgicq3wical5ch34sbmlgegk@mb2c2hxzzoi4>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org, asahi@lists.linux.dev, 
	chrome-platform@lists.linux.dev, imx@lists.linux.dev, linux-actions@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-arm-msm@vger.kernel.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-mips@vger.kernel.org, linux-omap@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-renesas-soc@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-rpi-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, virtualization@lists.linux.dev
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <ug266trshvhhbsln3eoh53fmsuj3l63ziz6gavcl7rv2jhjr5t@3av5givh5n7m>
 <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="c5kq2kdwqrnl4eet"
Content-Disposition: inline
In-Reply-To: <j2l7tu24itjelylrgwe6gdsy3mfrw3dnve4rdofmri3z7xdroc@se56t5ylmdak>


--c5kq2kdwqrnl4eet
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi, hi everyone,

thank you for reviewing and waiting. I had a small personal hiatus over
Easter but now I am back. This series needs another cycle, so no need to
hurry. I will address some of the review comments but not all. The
conversion (and API improvements) are some bigger tasks, so
inconsistencies inbetween can't be avoided AFAICS.

I'll keep you updated.

Happy hacking,

   Wolfram


--c5kq2kdwqrnl4eet
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmYPut4ACgkQFA3kzBSg
KbbwnxAAtFWKOWnU/VyFFeZnqQCgQ76FzO93xERcjysHlgnZv3BnA6UpxFnrHrs4
Cn7RTWa0i9Ct1ns2AkkjOQ5rUIqczF7M2dVS0tqODwyazGPaDHYtsa3urfkCsLT7
Gz0y5V+oHHUNj1hypkKtQ37/7iFSYbo5oryt9MFK6eFfs878jel/4BCGJk3SEa48
ewNnEuM8aYfzlrn7/VbkWqHkCS5J6x8/VFk3PjlxgEW45UtEI3r30K6/jT9HOdx4
6lCofEZKn4Bl0VbfJJ7MXd1Be2/Dk6ZaY09e97iAKt2+fM1OLrBwig2V8PAdV7ei
LlHolA153CWJAAkzXE2bJsr252IuCLpVpZobTSQRfr+u5vVV354dfo2ek11R8iff
DSr94kqdKVvOvegpxt4vyHUxQrfy70R9vlkgVhkdvdGbi3JfLeiCK+C+IcBZlbXr
uTaPlNvOt6p+VJNAlucnKQF3mK0FvVMK7bTwqjbKR8ZzB8J20qj5pqxqtBZDjfOl
fpTR9f9+kHWdmBuCLBq35aes6Lxq4JtNRH+czt8F8wIAfx/xcgTf2uPThVoFPO9s
jyO4fy773Wsfo8PGo9SqSKr7K6gQW3dIDoFTk489lp3e9Y/DYJ+ZV2ixvCQKATjO
3K0umrWHYd25+mhripLMPzaz3h1GPtmAiQq/dq2GUviAFUPoZas=
=RWT2
-----END PGP SIGNATURE-----

--c5kq2kdwqrnl4eet--

