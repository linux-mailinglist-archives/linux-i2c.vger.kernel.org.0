Return-Path: <linux-i2c+bounces-10727-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A5AAA65AC
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 23:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 934329C65BA
	for <lists+linux-i2c@lfdr.de>; Thu,  1 May 2025 21:40:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BC52226D00;
	Thu,  1 May 2025 21:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WMu0hOFB"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898BB1F151C
	for <linux-i2c@vger.kernel.org>; Thu,  1 May 2025 21:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135646; cv=none; b=RlK473zTNm+PLbK1lQPWOoUD3FB9XPfgPruUJgBMfy4FX/IbQhKdz9QBcC0fdV6yX5sbmYBLBZSP20Dza2RCWh5ZWptA+uT6+vzgc1sXPluMV1QzzMLnwG7W/Hw1+ST7dOoVZbUztDwYfsNBPMNWSaLzpGtQEr0ejmBEMsXFqPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135646; c=relaxed/simple;
	bh=+LwK8bN42ppbJfGX9hLPUFQkRmMs5KebRo7s/i49pNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HnqIcQP8eopBa65a1HsfJSeDbb4eHHV8pPvVlSm0ItGWJsLIKOjJg7GHK0hQJzNNgDdi0XU0PkJovBt9pYMT/OLeIXJ76yXmmu0a9WDt5rvONwNIoks0ssXgk+H9DX6ltzEadSDdjtRnU2o9EUe7JDHTAItU1ga1sNj48Ydd+s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WMu0hOFB; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+LwK
	8bN42ppbJfGX9hLPUFQkRmMs5KebRo7s/i49pNs=; b=WMu0hOFBpz6KPFBW2VNb
	+5vJzBuMGqN6UxBJ1bT15YRo9nq36mV3GmsN0w4MhGPtqli6nnZaQrzK96+Z8YD1
	euEmPt1UKI1ZSg6vkx9iIqbEgwX1Cc2A7RDwv5SYBBSFgyU4R78yYgaxV8JQbOru
	1gzjGKirv1X3MeNiwyKW2JwfMLv+VNja8RRUWZRK20FRqiRZRBtqyXakRjFIvsAM
	a8MAwaJdZRniWHdCenhP0r72wW8y1AxO7XsJUZ1txfq2XQ3n6Qh/DE8vFond6kz5
	O+n2RANb7KftgEYcfhNqJsCE4Ts4zwSk35dDMMy1TUpi6csdFGcsAmlmunaTseIz
	yQ==
Received: (qmail 1179474 invoked from network); 1 May 2025 23:40:33 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 1 May 2025 23:40:33 +0200
X-UD-Smtp-Session: l3s3148p1@qNQi4hk0CuQujnsd
Date: Thu, 1 May 2025 23:40:32 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH] dt-bindings: i2c: renesas,riic: Document RZ/V2N
 (R9A09G056) support
Message-ID: <aBPqUIFZQ2H844Pp@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8aQsv8yiMRYmKi6V"
Content-Disposition: inline
In-Reply-To: <20250501203310.140137-1-prabhakar.mahadev-lad.rj@bp.renesas.com>


--8aQsv8yiMRYmKi6V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 01, 2025 at 09:33:10PM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>=20
> Document support for the I2C Bus Interface (RIIC) found on the Renesas
> RZ/V2N (R9A09G056) SoC. The RIIC IP is identical to that on RZ/V2H(P),
> so `renesas,riic-r9a09g057` will be used as a fallback compatible,
> enabling reuse of the existing driver without changes.
>=20
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--8aQsv8yiMRYmKi6V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgT6kwACgkQFA3kzBSg
Kba8Qw//ZcntvvyNor5qVxjmU4Qhh3o8vfwjCP8yMUzfblUr7Ukuhor4CABWgSC+
k/Il3b/7HYe1515Q84/T/da/T6CEKZnlsprpZcKcOce+k54qSl+FVznmnSCKaMPA
btSC1gQ0iG3fNlJqRWyF2Br3zE3XXm3o0k7Xi1zPU05LW7q66X3+2LAE0m5k//K2
/LZ70oheATLL/UUtSqxV3/ZXbPV4dBCV3SDjMm6YjFQNT5g+1xJghEJcuUokJPFG
rK4dyixU1KLi30lOT/MssQFog8gsVXxbUE9fiXzIqBQwRr0/xrQH9fI5MS2QTxZB
OJjlCkaaek5IHFNbekOk5AylBicfg0mpBLIvoRaWB3a0/sIF8lTVmuPUlT8OrrYy
B27C9nxO2cPlVtG10DOojFBkYNWPJ/+aSP17eKJu4eIKz2ohFle3vS5gwAO7srQX
+tPb3+kO6eTs9vj8zLXcc+N+QuTzBkqY2cR5RU6XqSCHNOQrriupeOJM9Wz26lRO
gZW4DukyvWDToBPJnVlAggSvoEkRgEMpPBXnh9r78vjgcljKFGfUsePJLcrD0Ypy
uDOrf7Bnvz6Z+I2JY6ThoNr/ORJuqJFFVVwop8Da9OfCq8sg1u/MyVw7ZKF86FIa
7/VVzd++wdEd97fLCttP9BSV4aw6W5WyQxrEQemVK+zTVkl9vIw=
=B9s5
-----END PGP SIGNATURE-----

--8aQsv8yiMRYmKi6V--

