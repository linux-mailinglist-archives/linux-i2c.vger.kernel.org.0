Return-Path: <linux-i2c+bounces-5299-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DD994EA79
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 12:06:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F2B03281116
	for <lists+linux-i2c@lfdr.de>; Mon, 12 Aug 2024 10:06:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA2716EB65;
	Mon, 12 Aug 2024 10:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="l4LN63Qy"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E6A16DC05
	for <linux-i2c@vger.kernel.org>; Mon, 12 Aug 2024 10:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723457176; cv=none; b=O1JArvaKpTmKlierAOhAV1+PQtBkD417oSSxxCF3bDmxZH2jntVr+bfwsXPxL9k/MrMydkRtZ06aJD14CnT1WBq/ZNAznfIKufkAUSXsmm1uU9RrlUEJXtvRZ0DAKJCnDzvtrGLQaNQjcr9Lwh910Ag/fl04lkMZbd2grSbcZWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723457176; c=relaxed/simple;
	bh=mClt4km34eZKuLNhSvzGvo9tPW7Zym4xoCrXG5E0FqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fYoww/trEhveXcPkwHNW3xTmPAKbHzaOuO3np7QHoyuB04JOjUjo7o7L5seNPir5lQQBYDrYELKc2YXsvEg11Z9MWk8AlaDalYKQdU2WER9MElr5ISMGKDVZXa/oXtTulqiDItxLmiKiUBYsFwM6dLAmu1QWEk+gaZQ5ATitewM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=l4LN63Qy; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=mClt
	4km34eZKuLNhSvzGvo9tPW7Zym4xoCrXG5E0FqM=; b=l4LN63QyZU7GaQ1Ba5S0
	JSGvyJuDd90fBKqdlNXMVv544GCiktX3Ocinlc82IHA82jXsh//8rayazjtsjRmB
	vlYC7GTkgmSgyUv2V8IbAnbAB1ALjGTgQSMYbdFZ1syY1iVKb8nSIQkWrVSBt5g/
	+mQeYb3qYWp/Ft4ksrqwG02Ix8hIAViOJE7YsIMpahmW4Tg/d8T+stnIqDuxXw1/
	LG4pKtOoe+XQzgchoZEv218FA0uoXFZqaZIQrSHyOH8FvceY0z++HUjbRKl2kq/a
	JFX08RFBItBdPziMS3appP636mDQAeg+dbpAGri9FSz+QDDmdkGzalPoVC9FHOmu
	tg==
Received: (qmail 1328508 invoked from network); 12 Aug 2024 12:06:09 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Aug 2024 12:06:09 +0200
X-UD-Smtp-Session: l3s3148p1@MwtbpHkfJMAujnvj
Date: Mon, 12 Aug 2024 12:06:09 +0200
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
Message-ID: <ZrnekeUKciV4eAKC@shikoro>
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
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="od+vr8RbPCV7rMK7"
Content-Disposition: inline
In-Reply-To: <3a36e89b-b4e2-4eb8-9197-a7a1d04a7fb6@kernel.org>


--od+vr8RbPCV7rMK7
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> Let's call it real ping, because we have warning in next due to this:
>=20
> Documentation/devicetree/bindings/hwmon/ti,amc6821.example.dtb: /example-=
1/i2c/fan@18/i2c-mux: failed to match any schema with compatible: ['tsd,mul=
e-i2c-mux']

So someone picked up patches before the dependencies were accepted? Bad
idea.

> Can anyone pick up the i2c pieces?

They need review first. We likely have an issue with resource
availabilty here. It is that simple.

> And/or fix maintainers for your subsystem?

Have you looked at the entries? They look proper to me.


--od+vr8RbPCV7rMK7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma53o0ACgkQFA3kzBSg
KbbX9hAAtTcJIjNItRlX7aZ/4MZzyR45ugXr/STAZxJX7S08nlhnx5Cd5sbQClF+
Y8vFbRbILrfO6JTtfzeQbHdaP2mlkBjfiIRXnvtIYfDGhS5qI/dJ8s9TZ6NtSvxk
2zcqvsfPKosniM27AHw9w1RBHBbpDDft+9uEo0WuWwElDTsppXB0vqapu2w3Qq3k
TAfmQpLOjaKL/BakfOZlfK9pQ5EyBxomUG8QuuRAsXOAff9tyEW5p5s7DOOUg9sb
6ETJ8rZzb6Y8rc/rh/fBxrVpXjpBffq55GlugVJCjpQNDARKl728XIEarO1rRoSe
YhMJF3yMyUZDmRcV1BHYZStG7POyRKGdyaIGhX/WjOarqiYBZgTyfs6FmeKqU8f3
ycWIxDOTAYntMlaw/yfEge3RHYAhpvvb9I9tO2xmw3oa+gQ5hieZs1hi9UGu+AIO
nZ+L5MKoO0VTrcTMzZ454YwCMJO4soQcDKZSb7vQLqbaHdC3aDAqvslDQ1dBXXbj
RMkdF6Mf2wyljtQ/BIne+OrsnemVRk00HJlJgkDiesFUuUDyEAtUXFlNflYi32d7
GNIITkt9iCHztH08wPvsONDLEZKQGfp8NqhVGZYXJwf5XN4PpZOAzHC7OOXVsbAn
lG2Hc8gZYplc+98IbQstC+PJizVUB/4RYl024aqk1BA4HsbxLvo=
=e8Gs
-----END PGP SIGNATURE-----

--od+vr8RbPCV7rMK7--

