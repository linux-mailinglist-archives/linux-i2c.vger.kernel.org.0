Return-Path: <linux-i2c+bounces-8750-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CC9FD3D6
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 12:27:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 041777A0F4A
	for <lists+linux-i2c@lfdr.de>; Fri, 27 Dec 2024 11:27:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CF51F131A;
	Fri, 27 Dec 2024 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="b2b6lhrS"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86B4612C475
	for <linux-i2c@vger.kernel.org>; Fri, 27 Dec 2024 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735298870; cv=none; b=H9bysFOOWgbtEvKGOKd9I9ivAA3XM2sEiHG69Cd6rEIDClCnUda6zjNZX8iLygYBEnkC8Hv7VCDfSAdLgv0PSkZe7cO6Ggi29bDBFb1bac+p5wIWJpatSsGJUpU2sYCPof4cjONLLj314vFPPBWNICpBVpIjliNu6w1SwmD+6fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735298870; c=relaxed/simple;
	bh=V7diNujSQCV5jkD0V3FrjpaBd1QKx8dYvsFwi5TePJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tM4p1SoHcoVQZua1SpE9/rHrUmDVlYIrB+T9bKCXczUcfrXfuVRfwWwVYM8aHfMzoJ7GIt4630+cOKTaDDM/d92VSKJnsgY3lTzP1e0Sp4leP3mzBd23cql3g+jB+swLNQKGtkoXwkJZ7/iTJlDsvoHyGCk7hPmFIe5lvwrJDMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=b2b6lhrS; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=V7di
	NujSQCV5jkD0V3FrjpaBd1QKx8dYvsFwi5TePJ4=; b=b2b6lhrSwpRZzkE8lONV
	ObeaEgHCCteqbZL8KzUbdXHk6u81L8xisQf1ZwpWx+x4YOuqoOexGlsgYhP/TcNQ
	3STy3DdXRdZoh2RD7+kTr2rnxBZIWv9U7Exm8aohvJgD5ZS/d11HCP1QIbouFc8I
	9lcegjEBBE9bmainIxWwbALLtu6UdXEk/xlIdt7NS7HBef1Vge9kIy3qd6X6x270
	RDpVW+VO34aL5rsD8/Zt5ec3RIbUUs0gfEwmSHljVKoSLhncVW46Uhh8kvgQPZvT
	01MZMVcipiZZq3p2oSMEx4WqrJQjmwqDxhhxEiwHtJmLqued4XhQ/LJxwn+dtxwO
	JA==
Received: (qmail 3129495 invoked from network); 27 Dec 2024 12:27:38 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 27 Dec 2024 12:27:38 +0100
X-UD-Smtp-Session: l3s3148p1@88sDwD4qwKUgAQnoAGJMABv1nVc14PuX
Date: Fri, 27 Dec 2024 12:27:38 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v2 9/9] i2c: riic: Implement bus recovery
Message-ID: <Z26PKpEJi-nLcSlL@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	"Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
	Chris Brandt <chris.brandt@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Wolfram Sang <wsa@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-renesas-soc@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20241218001618.488946-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20241218001618.488946-10-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <Z2XewglpALJFE1Ay@ninjato>
 <CA+V-a8vB1c8Zp+zzoHp0zFpW8fjw-xq2=KPr=dyBUUZbOhBxJQ@mail.gmail.com>
 <Z2gJtlb5Sc9esEba@ninjato>
 <CA+V-a8s+tY6dnVHFhjyOZ43L+roLfqPr-_28FS1KyADwyTH2+w@mail.gmail.com>
 <cnwphrjjrakaafm7zp725mickh63xw5qm6mlh6q43745ljgxfe@33y2z234oauu>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PsPl3gSmMPh6Oyht"
Content-Disposition: inline
In-Reply-To: <cnwphrjjrakaafm7zp725mickh63xw5qm6mlh6q43745ljgxfe@33y2z234oauu>


--PsPl3gSmMPh6Oyht
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I'd like to merge this once all the hardware questions are
> answered.

Maybe we can apply patches 1-8 already, so they don't reappear on the
list? IMHO they make sense independently of the bus recovery patch.


--PsPl3gSmMPh6Oyht
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmdujyYACgkQFA3kzBSg
KbZhtQ/+JIa/VdhKFOqVjMnfChr2Mmd6rvRtsq66lWPGhfekT60oFb8MQGj+2Csw
Y30iFO3q9e3ea0yYtfrfrc0a93t5gAORj0kPVWafJgMLLD4K55oHmGLinImxLoCr
4izqBO53iQUEyB2ggMvBqBKcqY0r0yN2cqMwgN3DvmXhmlOFLy6mmdtuV3OQx/Rr
YpP3+zfHAPr2NjUMnZAu5nhljGWpYB4CqnG6kmqT3OV38MOUdkJCcso80sK4JEtz
tJGfcAJb/uP5XsLW9H3TjrGAiB2eXPkSxXCSMR4+dxz2zOHtnOQSBFZH4nes+S3S
FIN2qgDGZscbR8S8r1ywXmXnigqno7ckLQ2SawQFTYvP1Dm3clIR3w4qbBOjsH2u
rX59oi26eB+uApW44vJO1ktiwU26fJSu7UOhze5Pc44X0zHH8E9AsWVZLa2I0Kc4
rvW4A50gkQZYL8etyJSSXB5uR9GVWOyZj2ShZ/4EwjXgsWYjGNCE/287zHru4tA+
Ak8X/O9W37N+UV1A6tZDYhlM+pF4KrPsYpW0Hb2pfChHTqr0YkHx6hL3d9qMO9ID
humfEen5q/hbo4fsmYIana5XxIHyjyElrNR7WSIZldCCwFFystg2aeB4J9P1TWA7
t6oECF7Y1o2RDqNAKm3O+KyOgzphPixELiRAYUdhj5g8VnZ135o=
=IoQh
-----END PGP SIGNATURE-----

--PsPl3gSmMPh6Oyht--

