Return-Path: <linux-i2c+bounces-4953-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 865DA92F5D2
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 08:59:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ABC14B21019
	for <lists+linux-i2c@lfdr.de>; Fri, 12 Jul 2024 06:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A35FB13D613;
	Fri, 12 Jul 2024 06:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="bWQcv0il"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F571140366
	for <linux-i2c@vger.kernel.org>; Fri, 12 Jul 2024 06:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720767539; cv=none; b=SAbsf8wqYesUnAz1tyxRqOyPOjzysojUzwQrrJcqlEkH51Qi0BAhYGEfVepswd4OHifby/JuPUP5NmpTZ/tihx9W/ZXgsLM4MpPAkhVpDYI7L7bMWbyFQM86Z3cu4bsF9zBFmTCe27mSKaYztlvTQi/QPQG07E5Wj+EdRNm1lHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720767539; c=relaxed/simple;
	bh=VV6DhgTriiThLxLRRpj8iXco6Z+Sw9WamtlJvGJQhG4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r6OYVt90EUm7FBaWKoQmy71uRr62FBBqsms94p2OJn4Qti5+mlN8KVJzQw65sIfAFlGbyPhzmPV9/uuYZgo7LW8XerQF80qORED2lXPLWkC3tAZabH1NxFGfE6+eFvp2Ij/KzalDvC7Eb9HxvVVoGmEz504kHpFYSpZYM4nwM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=bWQcv0il; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=L+rK
	1GUVTyJmZkU9i4B/BF8719twozqAndEGTsl3AJo=; b=bWQcv0ilSWUbrH36V7mV
	vVkMM8mU8JNcaG95GRuQrYQfsSNTVjvCQWjhLwVbWM3AhbkF732QEiwbpnZzRbGj
	rUT8Lb/M7nTw5XdQ92Hwif2CEfVrtXMO0ji64re0Ys5yMqLLp/MnHxZXcNv7vBJ9
	8IY+ABXKe+66bGagaolgjzMSkm0T3d3yFz+AlnpZy9L5jt0TqVX7PcF9J39KxYvI
	OyjuSeyxXFJCJqjKfnVab5q/P9V17lcPZEhDYj9nPqVfke2ERGJnCk8IbtBguP08
	ZEEOgST4z/PMmumBi5E/nCUZxKzBw8VBfzpG0qYl/tEbTQZbteH+phqFQVGkChRd
	vA==
Received: (qmail 1062089 invoked from network); 12 Jul 2024 08:58:55 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Jul 2024 08:58:55 +0200
X-UD-Smtp-Session: l3s3148p1@xi6raQcdgpMgAwDPXwmZAIsFIv4n+Dpm
Date: Fri, 12 Jul 2024 08:58:54 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Bastien Curutchet <bastien.curutchet@bootlin.com>
Cc: Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
Subject: Re: [PATCH v3 3/3] i2c: mux: gpio: Add support for the
 'settle-time-us' property
Message-ID: <ZpDULr25NYzBDS8E@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Bastien Curutchet <bastien.curutchet@bootlin.com>,
	Peter Rosin <peda@axentia.se>, Andi Shyti <andi.shyti@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Korsgaard <peter.korsgaard@barco.com>,
	Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Christopher Cordahi <christophercordahi@nanometrics.ca>
References: <20240617120818.81237-1-bastien.curutchet@bootlin.com>
 <20240617120818.81237-4-bastien.curutchet@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Pdkz2/2fOjAy+l6B"
Content-Disposition: inline
In-Reply-To: <20240617120818.81237-4-bastien.curutchet@bootlin.com>


--Pdkz2/2fOjAy+l6B
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Andi,

> +	int settle_time;

Could you change this to u32 when applying?

Sorry for being late... if you already applied this, I can send an
incremental patch.

Happy hacking,

   Wolfram


--Pdkz2/2fOjAy+l6B
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmaQ1C4ACgkQFA3kzBSg
Kba6yA/8CRcaTeW8YOj1sMHXecYV7qlNjo9hVwr6tej/gi8n45qLCvaGo/ZL5pz9
6fY5AgvvoqdVytvrGui8p60dggB7ROxmUku6t6h3Yc+jaDy16cUJOQLycNalu2xt
A369VOAYO3GbY8S360g6yS4Eg/T7pbdVZaSw9llnXqj+KXhbuOUs5yMVYVEEI38t
YCT9FSVD1mU8OsI/VuRiCu5sQbK80QQy/qRlKgcQMEhjAkliUAwCnXKZleGE1lT5
5FBRsMyhfemkhMXgxRX2w+kCDrk35hB0aJg1QxN4ipGzj50Vb5arK+/2AaNK5r08
3+Z9c/zxVjvf9wRjlxHu+2ttjy2ohJcePHUEI5i+LfctFxUllqvDaCGf71iVeZcN
4cDVgP3Y9DiHjZxancMhRms4cWttkRFjRQ10QjotJPfDZ7cDTNLl4WJg3HRsi6ph
XBI5dO4GocicPJw+3+nuL+YsMuQ0QwSXQ0mpTrw02Ww/pJAC/5LI0bOQxcW5ruMe
jdyZMcQMUoV3CQX7NqKj/xQNUwfVcp4QWOOpFNaXM3I7zwFeed9Vzozt4QigtNU1
uzWMzRpMHw4X+9uxEgJiNe0yUcr2jemY9Om6ixBMvuexm1cMZ4wnFbU0A9BFo5r0
xmb9eliGs78yzh6nbNigJqiXKP664abBqYvjWVrp5g0uGlDofmg=
=JyJK
-----END PGP SIGNATURE-----

--Pdkz2/2fOjAy+l6B--

