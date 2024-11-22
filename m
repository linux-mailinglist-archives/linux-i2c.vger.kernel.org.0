Return-Path: <linux-i2c+bounces-8150-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 695789D5F41
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 13:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EE525B273A1
	for <lists+linux-i2c@lfdr.de>; Fri, 22 Nov 2024 12:50:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F311D63FD;
	Fri, 22 Nov 2024 12:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bLQX2zwK"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7391FBA20
	for <linux-i2c@vger.kernel.org>; Fri, 22 Nov 2024 12:50:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732279825; cv=none; b=n4D39O+0BknqhMxKEUFzu7Hh1vBbi7BU68nWcXf9E1KK4cbe/vPGnYJfbf9VV1byrpKpo+2nwhRM/WuV375MGjFyAS7CFdN5gI4Glx7NKHREJjL1x1Kfy7pgLTzknnyTwufYpsRwHuA9azk4dFL3kixWa1Vvpbo29uhzpUsVhvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732279825; c=relaxed/simple;
	bh=atb87RVlqbps10/eQPzMRbuCyy5wHD42O3IKfx9I7ro=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iTj6hSxGbnoof2CUe8KJYxGYMBPhRLINgv++3WheQvKEuG9xCs17H+iRLPSJ7DTIb8Rn6C0vxR7194pc+CwKBxrdWZh0lCxINP2Mwrm3l6xESWNyUGp85B43xg0KzEsjdY8NmCQOjeayus5fzDv6qnJIqU1seWbawi6ZzRIBZRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bLQX2zwK; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=bUFP
	p322PNcA7L+056zakPx2ROmDJtwYS7dswWzCPkk=; b=bLQX2zwKeJfJuIvC+wJ8
	KaYDdd7Ya3IJUrmSG1YIurjJaeahaDXH1T44ni5pe8ROGs+eOiRrIfrzFpnUIaMB
	soEV3n5TcWZCzbuuoLvgajGyrpFQUdcJKwUwdlw5NIi5pusAgZZXlXzTAT26uuVo
	rAfjoMPv6gvRkFbNdYDgAkMpe1Fq/Siphu2c3eeQR2nKaMwU6i01+jflpcAvqCMh
	zEMX12epCwPGRnJOsxgqaLkKRsF2mxMar+QeBBiQEpDuTT3xwLvCJe8BZOJWlibM
	AOciBlSNRQCR6qLmGnHVf2gt4UOn+CzoygZXshh74CMmmRt1KqRxk0cf++roBbwd
	/w==
Received: (qmail 1604655 invoked from network); 22 Nov 2024 13:50:17 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 Nov 2024 13:50:17 +0100
X-UD-Smtp-Session: l3s3148p1@6dIt038nAokujntT
Date: Fri, 22 Nov 2024 13:50:17 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] i2c-host-fixes for v6.12
Message-ID: <Z0B-CdrBfFMFMBTq@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c <linux-i2c@vger.kernel.org>,
	lkml <linux-kernel@vger.kernel.org>
References: <detebsw5fdnjirwzai5ldvy2arsm2jgyzojulpw77m6gujn65o@mgfxsijpsjdg>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QkLNcp0BoAC2nUz8"
Content-Disposition: inline
In-Reply-To: <detebsw5fdnjirwzai5ldvy2arsm2jgyzojulpw77m6gujn65o@mgfxsijpsjdg>


--QkLNcp0BoAC2nUz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> just a MAINTAINER's update for the fixes pull request.

There are no fixes during mergewindow :)

> Tomorrow morning I will send the second part of the merge window
> pull request, I want to give it one more night test.

Can you put this patch into that part2, please?

Happy hacking and thanks,

   Wolfram


--QkLNcp0BoAC2nUz8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdAfgUACgkQFA3kzBSg
KbZniQ//V2GSHsElMyv7bW60iz8C7qMis1gdz4y/FfCL/yKpTFgmalts4GdNBwNW
1z9QWmFCg82Mvzvxfaf3EP3AbZ8iS4sowL5ogjfCZKkhX+EBxvNwDyxwA4SdNWd8
eS37uG5/NFUQ9j3642fETb2pgVMOLrfn+HNQQ7iY00H5UCXavT3pGPZXujocPr7t
tQbCgYK+ScBJCeNV6fgIC7xZVoDa1IAZMgYZA8Cz90EGwdZEyt3UXcXoFCAWxbh9
KcAo+9WhK9sUY5SiInJJAQ6mzG3AWPyDtGyrVxJquFdM2MSvHA+K6WjVhwc6QYkk
51Ocn2PbO9E4pg9t5oSI+ErNJMiTDOxOfd5WPAo2an3P5r3qK4M6oMYfx/8ujGaZ
yvuc/odC8oCTRWCOdSBpZHQwEg0hQQ/6aYWGn6NyuxouJmaPmz9h8UrTCAl/G8fh
UluBu3vf6ZyY5UYzPxiaYuyvC1adM3qQaFe3e8pXBAcLp1RAhA2YUGuKDil8QMIe
DDpLIniAS5K3IwK0UXNH9sLQjSt1ZyaOtng07QOMHuYvljuuS5DutMglqIy4/CaE
ejjF5rRGMNCMe8zLeQQB7n0yM6BikAVQHlHctEVE5cy2UcpSct5kBObrO74alF1n
ijw+SF2T+N0ZuiK6f+LtWdZ4JJud7RRM0mzlr3QxLEfknfmlPBQ=
=CWG7
-----END PGP SIGNATURE-----

--QkLNcp0BoAC2nUz8--

