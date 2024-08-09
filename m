Return-Path: <linux-i2c+bounces-5257-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5220194D172
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 15:39:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 196A7281E9F
	for <lists+linux-i2c@lfdr.de>; Fri,  9 Aug 2024 13:39:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECFA4195803;
	Fri,  9 Aug 2024 13:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="EbwMsnsq"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773C19538A
	for <linux-i2c@vger.kernel.org>; Fri,  9 Aug 2024 13:39:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723210791; cv=none; b=nGgfvvNi7yZxmS1NdAqV9vBwL5Faj/+B93X9C6v4OlZ+NOKj5KJp+/4zR4CfSd0XrAnnwrbmNwVl1zy2FlaC2Xsg73gRiziLSUd8ZhsHhoAHjT8vfbfFvrXjnvJWrgmT/owxrDH4VOaWl1yo5EPkcr3X1kIi9Us8QblsVqlEvsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723210791; c=relaxed/simple;
	bh=d0ADfooSD+MQ9RnlKIStCtMA/V5ID+/9Ydemptv/6kA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kQA5xAtJcf1pyaaub33nLG7pBfRILOfy1gLl0KbY6RfSZ3Yasyxbj9up57N0NM+OHGwQNviPmDsEWcTz3sjVzfOuCkEzZiOQ70l3u8yPCf0NOqxK9n4+4O/ZM4sh+gTwMzZSAA47RFRkmLLyGxuHDOpY2c/c/ZSsntLe2YaNQV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=EbwMsnsq; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=d0AD
	fooSD+MQ9RnlKIStCtMA/V5ID+/9Ydemptv/6kA=; b=EbwMsnsqe5b601/dfoiH
	P0tRhsXZjJYY/U0XY23WsBZWDNxB5oCwjPor6GBrP0EFZhbVi9y39o38fNWgvCEV
	JGeCHNUMUxeRikLx6oYmeqJmHvzSo51Ul9GCkaKmvw/WOd3gSeaJQGowvvR+Bv2g
	gEHqTNWmQDRs47aWhBDsse+0hBHWOJ7xROtV1wAJwHx5z0zjBO5Tf29JoUioJbqs
	Il4gFalhFnOPp4WcJZb0rf2jQ6J87C2Vs2ZRaVByp0IkAdA3HNGoJctM09Q/m2Tv
	OGRw8iBE+en7oZfWB+i8DF1i3rCpJ8OYvWLD30S4kmmVqAIq6tVFTVqgKM+/AzKR
	bg==
Received: (qmail 626016 invoked from network); 9 Aug 2024 15:39:47 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Aug 2024 15:39:47 +0200
X-UD-Smtp-Session: l3s3148p1@9knYRkAfRtsujnvj
Date: Fri, 9 Aug 2024 15:39:46 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: chris.brandt@renesas.com, andi.shyti@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, geert+renesas@glider.be,
	magnus.damm@gmail.com, p.zabel@pengutronix.de,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 07/11] dt-bindings: i2c: renesas,riic: Document the
 R9A08G045 support
Message-ID: <ZrYcIr2yHjWuaJk-@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	claudiu beznea <claudiu.beznea@tuxon.dev>, chris.brandt@renesas.com,
	andi.shyti@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, geert+renesas@glider.be, magnus.damm@gmail.com,
	p.zabel@pengutronix.de, linux-renesas-soc@vger.kernel.org,
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Conor Dooley <conor.dooley@microchip.com>
References: <20240711115207.2843133-1-claudiu.beznea.uj@bp.renesas.com>
 <20240711115207.2843133-8-claudiu.beznea.uj@bp.renesas.com>
 <ZrTiZtD9U4I2LYZj@shikoro>
 <e39ab10e-8e95-4fce-b75f-10fe918e81a5@tuxon.dev>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="LKWSB06+yuFlnXKJ"
Content-Disposition: inline
In-Reply-To: <e39ab10e-8e95-4fce-b75f-10fe918e81a5@tuxon.dev>


--LKWSB06+yuFlnXKJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I kept it like this to avoid confusion b/w RZ/G3S and RZ/V2H(P) documented
> below, as the RZ/G3S falls back to renesas,riic-r9a09g057 (RZ/V2H(P)).
>=20
> I can add a comment here, too, if you still consider necessary. Please let
> me know.

I see. I don't know how such fallbacks are documented usually, so I
won't consider it necessary. I was just wondering about it. Let's just
be consistent with previous fallbacks, however they were handled.


--LKWSB06+yuFlnXKJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma2HCIACgkQFA3kzBSg
KbbWeBAAhwySOswgim7RXFC0+wmYWTWMPQ//dQm/h/4zKInQ4cqR/IVJjo1qA0gq
iIgmtyf0AUdG0TbPLGvRBtobSYulS9OTocCsLUAgO5qGNVYfptBkhl++JDC3ZKG2
RRHJA9fsdGFuoLrN7BeADFXtC84VYvBFHoOoOUX9TV+qPU6WYk6ReVW7HllVaOr8
mzuq/PGSQ2xieUpFj9lUdYu48WCkUQFBJu5/Cjas6NcHxKzyPbrsb5kFllXix+CN
Yi8/w1+Q8uZnYC20uH2G7f0xamWvvAq7b34KJbLW5+xE1E0BVBO5xYUTZd8PtZZG
vgTIDK0Qp0GM+afklmbLdVTrW0yn5YTQF8hWerjln2e2dW4KCK5zN9Ybw8ZYpcQw
iOuKGt7CMDsEd/Dx/uNsrrOV9v5DxFkDrZC7bGoYtmo1C3bPlRUPziO7KXSzkwZ6
6gSUFT+Df13pdXe4hUbtF2An20ytN+RxJtOvz3NrLlt6rv0R6aNE91Y0r0UJooUT
VliQCQlkw5ncYUMy9EJG78SAPTqGPF4NQUxvou+VEnMeeVF4k98QET5zsvX0DoSq
5z3lARzdrnwxPrxooHhT6LMH+p6bd77LD/CO5NxVtYeofOjFffSPESRIKpIBnKup
d9dP5viQ/hMi80xCNQe97gHhkVbJpvJSAwHmuYIffIsMl3tw44s=
=fyRb
-----END PGP SIGNATURE-----

--LKWSB06+yuFlnXKJ--

