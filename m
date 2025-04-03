Return-Path: <linux-i2c+bounces-10096-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B006A7A1C5
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 13:20:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DF214174238
	for <lists+linux-i2c@lfdr.de>; Thu,  3 Apr 2025 11:20:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 795FC24C07D;
	Thu,  3 Apr 2025 11:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b9jGx0n8"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDEBA24C074
	for <linux-i2c@vger.kernel.org>; Thu,  3 Apr 2025 11:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679212; cv=none; b=qY/L6yOi8AtZZMxj40TNvWS2PuctYuNKQzcQRY9lzwgyRny49AJF66IIckjUPsN8LKAuupSQ9uFZyuGjrF2nAyudh0jWh5WfEdS0lOMgRCWIn51fGb9TPOxvsBvIfY4VIqrLkTqYO16JKVRrvJjxt6zQOslo20RGTFITGicarAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679212; c=relaxed/simple;
	bh=xZr2b1Yr2ycIg/CW3ibrgZf/gEe4XUSNPljObyAf9E4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qtQXgdXlP8BGSU2gDuHQJ22z15zZhJMvXvNoLYMgECKovIEOPlLkQsT448wAbOOtRleNqrR38MasjGI1yj4SFJXayZ1xYKIcYSg5esGz2SDPJ69URt+7hYQIdACcSS1OLAHrwaky8dSNEFj2t0QnH/wTBqfUQ+dnhGBimBNmEDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b9jGx0n8; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=xZr2
	b1Yr2ycIg/CW3ibrgZf/gEe4XUSNPljObyAf9E4=; b=b9jGx0n8eKKRl6IOidXK
	CjxbwTvSxWf+4vxut/Lop+k5H7ww+6sir+8p5hM6lTqQKHcj9pM/q208k2WSg+PV
	5ce68OK5HdIgmmPkyWFVb4Fcmd/kxAZT+VI00r73jIEmaB5Qyj/sVeGRqsBcIZCd
	e1wXxwMzEPZCHSaEqetXI5kdn7MZqJ6KPBEvKmK7ml0PyleNItyruzN0mCmfr6w8
	Pst7XqubpVaVZSEBrgcIMoe8CcUDdtVPum73ndXgAhSL+ErL3zVSQ5InLcS+Qp5v
	BdHUGSp09txcVrcrfqmLtVJHLjbrjxK8cEToeHQlqoMfwo9np8f7JkNkmwhbgwMu
	ng==
Received: (qmail 2358143 invoked from network); 3 Apr 2025 13:20:06 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Apr 2025 13:20:06 +0200
X-UD-Smtp-Session: l3s3148p1@UqOn890xc2BtKPG8
Date: Thu, 3 Apr 2025 13:20:05 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [RFC PATCH 1/3] i2c: core: Follow i2c-parent when retrieving an
 adapter from node
Message-ID: <Z-5u5bAnY8Y1DmFz@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250205173918.600037-1-herve.codina@bootlin.com>
 <20250205173918.600037-2-herve.codina@bootlin.com>
 <Z-5O3-FSsHbn27lW@shikoro>
 <20250403125050.22db0349@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="G9LojCKw4QqmBaKY"
Content-Disposition: inline
In-Reply-To: <20250403125050.22db0349@bootlin.com>


--G9LojCKw4QqmBaKY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> The debug message can be interesting when things went wrong and we want
> to investigate potential issue with i2c-parent chain from the last device
> up to the adapter.

I thought so but couldn't estimate how often this is useful in reality.
I agree that introducing 'dev' is too much hazzle, yet I think the
message should have some id to disitnguish potential different adapter
chains. Either that, or...

> I don't have a strong opinion about the need of this message and I can
> simply remove it.

... we just remove it and let people add their debug stuff while
developing.

> What is your preference ?

A tad more 'removing'.


--G9LojCKw4QqmBaKY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfubuEACgkQFA3kzBSg
KbYDjhAAnEpQ7Lq325zgF0MXbuueTeNaleJHhNRlNnfmT3m1lUJ7aJ06Sme2xwu9
kvCWEeTY9GxME8MpyusmI2p0LrHJowjNF+vGC70qC6P6LUemDlXzwTP8G0/nZUOU
3lXg2Mzlgwqbyk6k1arQ6JiXLrFeHILIy5ZH4ol6LLAaMEjuzCMPYnga7w7hgF0r
ZHBYLMJbUUH4VFInzsvPw1NjsHzivGYpPSkhq+hVM08hRFXGb4rhxV23m7Irqg4Q
2PWPOhJNJem01G2HhqOEnnXadzveu+myxTf+g9BltHXgfnj9QqiLD95x4i9PWm1m
zJ/4limYDwml2x/4VReDpbnpcqHhEgKNytXIox+ynWKTHTR3T0ymUydKK1OY+o84
8mI2qySM2YGIo6figoL4md30TwRHuhjoXHW6zo6HjYdCL6GY73XNcHJMKJ82V5bf
z+vbeyB+7cIoKP2ONNOCchUGJhb6ZXkjJWk9uuJtE60ILIhFXJA5/DXg4gV4z/02
KAyJ7AyS6LGazJMZWaJ/68sbyVatanlGofihV8Y4K6bLjR8RZUfaRrYJ8AUR6rKt
slSagnxdW2Pm2M9/5fApO6YC3Yo4O8gWOueFzEZLQHv2Dia6HnkyVavoXXtgp2zU
JmFELo6mimchMaAJs0dbIXKsK78P7WXwMEpDWxMiyyxsrRDslic=
=ZgW8
-----END PGP SIGNATURE-----

--G9LojCKw4QqmBaKY--

