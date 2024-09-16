Return-Path: <linux-i2c+bounces-6801-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 496DD97A303
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 15:39:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E80D71F21418
	for <lists+linux-i2c@lfdr.de>; Mon, 16 Sep 2024 13:39:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FD9215574D;
	Mon, 16 Sep 2024 13:39:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BwV47of6"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 477DB14B094
	for <linux-i2c@vger.kernel.org>; Mon, 16 Sep 2024 13:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726493948; cv=none; b=hO/DevWiyx9zH64SbniSgxvFUrvXwKMl2c8RIEybrDtKnEmCuGNOjL4rhyyZef9wlbfitMHKEqmCdKLskdrDjMgC/OCwB8x0vrVjCCINaGacAf6IundMCqvOulYkbWbcZypLP7lnRekWoRfy+rCr87tMImU5xqvepLzeV1slzyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726493948; c=relaxed/simple;
	bh=gpDTnqpsiA0konUnyq4PiZCiElhUnaKwv4G03rEeMn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LaCYWLMPz3j7CxfVA7GtUXo3pml5c/VuKeUTdx5M2Hz9mw0C627xDiYzzAumWgqGMq6iHhuBgVF9hPh66TW6LHaJWxrz9QOH4SOd4gz+S37r4+R97mjKKpYyuQiJQqSOG95q/UwHq68GQNRVsH+If/sslmyUPBmHnjqZN4DNVo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BwV47of6; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=g/eo
	0SBcEoDYXOfJ9SKKPnWuwKIaMlQa162DkFW4Pt4=; b=BwV47of6aCh89+e/vqHE
	2Jj6Rs8Nw4xOxJRloKt3VU6xMSfwW5c011mvASzH8EB/0x6AQB7GAQ6O6WCLmB+a
	n8zFXcQh+nSzOJjedMfJUYWCx5yUHft9mpfiozNs9bniQpwIkof91fqoZhWZBKPZ
	3GenBEFsYo9YQo9KI42mcpmbhRtN8V5JvwtfH6VadxORI3+Wwr+QpR9u16pTzi4G
	DmIHhuDTeSYtxXu4APedrIT8P7kh1t3kZWIxjUKmsS+RM/7u1r17hePnO0Tn26uP
	6GRKoDDoP0SEb0tSkQfJLnyD3Cu6ZbF1oYd4QVJwrblO3XoylOWpBPnkI7tkcYRu
	ZA==
Received: (qmail 2013929 invoked from network); 16 Sep 2024 15:39:04 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Sep 2024 15:39:04 +0200
X-UD-Smtp-Session: l3s3148p1@ihY5sjwietG5aIoy
Date: Mon, 16 Sep 2024 15:39:03 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: linux-i2c@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] i2c: qcom-geni: Keep comment why interrupts start
 disabled
Message-ID: <Zug09yHONEFdGjav@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
	linux-arm-msm@vger.kernel.org
References: <20240916121516.3102-2-wsa+renesas@sang-engineering.com>
 <rezzwxrahok257tz35sxawqodn5sktkgxfokhmhdlrm2o4624p@agqoixuxg3md>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V2aMwWMpBes+BDfA"
Content-Disposition: inline
In-Reply-To: <rezzwxrahok257tz35sxawqodn5sktkgxfokhmhdlrm2o4624p@agqoixuxg3md>


--V2aMwWMpBes+BDfA
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Thanks for the patch! However, I wouldn=E2=80=99t typically consider this
> a fix, and I don=E2=80=99t think it would qualify for stable release
> inclusion.

Okay, I agree.

> That said, I agree that a comment should be added back. The original
> comment no longer fits as well as it did before. A more
> appropriate comment would be:
>=20
> /*
>  * Do not enable interrupts by default to allow the system to enter
>  * low-power mode. The driver will explicitly enable interrupts when
>  * needed using enable_irq().
>  */
>=20
> Does it make sense?

Frankly, I think this is too detailed, we can't have kernel driver 101
in each and every driver. But I will happily stand back if you insist
because we are entering a bike-shedding area. My proposal would be:

 /* Keep interrupts disabled initially to allow for low-power modes */

Chose what you prefer!

Happy hacking,

   Wolfram

--V2aMwWMpBes+BDfA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmboNPYACgkQFA3kzBSg
KbYG5w/9Hl1jPxxxAgbG4Zgqso3YLYPCQtJvZYZoQ2yHhnPEnhHGVqOT4TjhEDzr
uIWFtNI/HHPib8iWSQa/TgV/RZ5IomWR7iEmWfuL/qYK+FhzpU4m9SQ3zoBcHERg
WaA/rNLZgziD6l56yvZY+ebIvqtWD1qgkRF8wUiNndXWgIe4unKutE8TkqNXu6Dc
pSIA/58Q04xX/GlHeGQsg3tXiAZm+lm9X+6hJAzFKOZ7DbQGVg43mT/MWH4CYMbZ
cNlTedHzM7ypULSMjd7DFRR7Gig4a1yuOCxMcwzTqw4RpBJMlGuvIv9k/zvp7dA/
RlRfrcT1korxZkn0hLWM4nLOVyZXhQw0SfDcmICajKlJeNO5K6iqqzbHCpirKC0g
rexaOJUEq4ugvWs7hiAzc0/J1oRqwfFSEvyuwh+Mx4VuxbXAWEv5tTRACqUVzSWS
PGTt2iX54ZLPKN4hIj5ckBquKSE/QbWWiJlGU+ZerlyTQwEjL1e7yikkD6GqwPsb
Esplj44hrM9A5lUAeIOie/SIuo1OZqUcVLBugAVwey3yV4yvTH5ekIzZ40Bcxgod
slhY3DJhj2p1XJBZcaFyPcV6JgXm7PHdnbhOAMXBWb64U+CdpGuzOKvAIciABoh1
9WR2A6sh5aKyCAlB3mbHw/uvmY7hjV5FBl709VExNz9UGXJZerM=
=hejy
-----END PGP SIGNATURE-----

--V2aMwWMpBes+BDfA--

