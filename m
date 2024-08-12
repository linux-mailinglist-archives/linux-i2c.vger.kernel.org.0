Return-Path: <linux-i2c+bounces-5315-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE7794F5E9
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 19:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E5E961C21CA5
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 17:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D64B6189507;
	Mon, 12 Aug 2024 17:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZI4PNX5Q"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6F618732C
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 17:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723484229; cv=none; b=QI9WPre6dFKZF+zMb6yk4Y8Mzq5hrx6oWa0yfu4lWfMwAHA8n4GeG7LAHx3WWPd7094HeVkBTv0cxebvTy+c62G9aYXBRNEqzpJe+GulpSgC/JKc10puV/O8LvQop2ihOzbhcEhrreEt7qecqPSPQWjS7bZ16OgTivbcI0W3Jxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723484229; c=relaxed/simple;
	bh=X+tCnDWQvroKBLhT2+NKJ34gv0lM9SYFG/oysxvfa68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oX9BDiGZ/WaZ36G8/wdy65TUbL75Q2WuY8/HTdwkm50wRgZ86vLga0CdQX5ERVYopBWxwGHd2huFJUb0wPxXz2BRJzP+sbzbgtrzQL8yW2sTPr/mWgmYtolJy5KGmNrgCHgwZtmmV8oinv3BfgaN048OqM4Vw1VsyA8ivOYSvo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZI4PNX5Q; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=X+tC
	nDWQvroKBLhT2+NKJ34gv0lM9SYFG/oysxvfa68=; b=ZI4PNX5QAJ2kYGaRJ78/
	jrL1WU84XbC/GvCvgCLQIpkRFAjMJ75pvqVVGjHD0AfbPhNyQzSb04fi/rSjeBSq
	kH3A0WVSe/GvDA5htlN99bIIcZRYdLGeT1g/xhV61wzsx0LyPGvQvOyPNlFyGzxy
	DLUIreB96yAuBFzYKUYJPL55dRD5Z+Lsx5o7cjYokQnTnSLUfPBYem/g5e8DaLxv
	30y9ana3kYoFvNWHHpfu0H2aH5H4K30ETFQSPuBxS8HGza08rqT6jplBq5rpmTdJ
	wZR0dwLqbiIIbN5QmAt5aOchLz8AvSUtCt30GV+zy6+uoEX9kgZpmJHcYqNU1hWc
	ug==
Received: (qmail 1432277 invoked from network); 12 Aug 2024 19:37:02 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Aug 2024 19:37:02 +0200
X-UD-Smtp-Session: l3s3148p1@Rmfc8H8ftusujnvj
Date: Mon, 12 Aug 2024 19:37:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v6 2/8] i2c: muxes: add support for tsd,mule-i2c
 multiplexer
Message-ID: <ZrpIPTOTN20GoWqR@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Farouk Bouabid <farouk.bouabid@cherry.de>,
	Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Peter Rosin <peda@axentia.se>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Heiko Stuebner <heiko@sntech.de>, linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
References: <20240725-dev-mule-i2c-mux-v6-0-f9f6d7b60fb2@cherry.de>
 <20240725-dev-mule-i2c-mux-v6-2-f9f6d7b60fb2@cherry.de>
 <728a8e06-81f1-4771-8031-ea043b9baf20@cherry.de>
 <3a36e89b-b4e2-4eb8-9197-a7a1d04a7fb6@kernel.org>
 <ZrnekeUKciV4eAKC@shikoro>
 <f6dfc6cc-365d-4f0a-9a4c-dc34cf4c5b7d@kernel.org>
 <Zrn-ZkgYKVquarDX@ninjato>
 <426eb8b6-9b2f-4594-9cc3-320ef0cee835@kernel.org>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/t9BApsAyYarLt7K"
Content-Disposition: inline
In-Reply-To: <426eb8b6-9b2f-4594-9cc3-320ef0cee835@kernel.org>


--/t9BApsAyYarLt7K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> No, it's not. It was just a ping. The issue is here not describing
> dependency, allowing Guenter to take the patch and not even telling him
> that now next has warning. :/ It's like entire weight is on maintainers
> and contributors care only about getting their patch inside. Once it is
> inside, not my problem anymore... :(

I totally get the "weight on maintainers" thing. I just also see that
for new contributors, it can be hard to see soft dependencies in
advance. I mean, even we missed it. I guess Guenter is right, we all
make mistakes, so we fix them. Commits got reverted and we will re-apply
better.


--/t9BApsAyYarLt7K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma6SDkACgkQFA3kzBSg
KbazHg//UBrJXW8DM60tpZPlTELL7+7g6fwFoo/w9eTO2Nus8TPYisMeCP3wFfFj
otbLP0QqgloZv27D4gogTFE0HoWhLdXxZ/hJAZddOyBsm4qDOzBad9GCVI+a60Ge
woF4s7L26m8JwUZ6tzEbCf4dUwhI322bbqFgv2c5G94p+jzgm8T+iwyyv0qAMsi+
nQdB3ElNgt88XAfBoFttsPKoE9+RrUZlHSJhLokEvDatAO+iXmYzbUhLfXDM6pEy
mJRcWWcs45bxC3mEmQpZ9dvh2ZY8Q8C7o6E0lCubIKEh6LazNNAZnfWt1FQFhiy8
IntMUuK2zITNsFo6HV5ISNy8IkQxKeOMO+QuCZfQKGeErZP/yV/Uuamdku7A/S1j
Mk3e1oiHSi4g57gsSKqeC/j1N/rHFoDCgVrh7l1kaQjuwGY9QpZPgYedfzxQ5oMb
347qEM7Yd905SdXNOoFCYshaEVhDvRNrUHVlZDseKn2XWf3/26/dvevuH3AuLipi
5ykyvXxUw3/GvAGQEcrx0d6qotT/Ow6hYiCE2fPQ+AqfLsn4F1384q4xXgGwprfT
ZO6RVwVXkE9V1yaN+8zVs085bNbs97VLy9YPncGroK4kvvuNq4EWKWBEMA+78ucf
CZ6tcKwph09bY6bcYHQ2RfaSH+19joL6xzWbr2NtHYXaSWSjk6Y=
=nV8m
-----END PGP SIGNATURE-----

--/t9BApsAyYarLt7K--

