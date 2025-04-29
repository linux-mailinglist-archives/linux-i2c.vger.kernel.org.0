Return-Path: <linux-i2c+bounces-10670-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDCFAA0039
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 05:18:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 720041B61B76
	for <lists+linux-i2c@lfdr.de>; Tue, 29 Apr 2025 03:18:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1003C26D4DE;
	Tue, 29 Apr 2025 03:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="En+j9TlG"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575F41C6FE8
	for <linux-i2c@vger.kernel.org>; Tue, 29 Apr 2025 03:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745896685; cv=none; b=I/Aa93105EMolhvBOg0kBcavr1DNHB/68od8JqQLQqxhPld8mSSzQkBaSmpQb0Ob1oPxt9Tj1dx2AEreg6WvUR8ydzeXKcMJDAobtsBVnHG54tcVA8C8NsdGFOp8st7vyZ+9L0l97dlCOY6rG/QNWnjlDaaiscOlpY0zPK55Xqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745896685; c=relaxed/simple;
	bh=5mLCwrnjZn8OBKisiLfUdaXrrtKwrXv/semtMusNXFY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rf1mRyHrtJmvjLIgrLUJfDDgdee/suqjEVrmoLmeS8J162+hEoq8iqER/MtLDgsY0nJLyTPU9gL8hLYMCFPJdvCZvpQCQ3rvyyZsrbCybXtzL2JSUgkxw2uXouUIUmxyMwU2K1pfm7oGLUOmdFl+dJepXaLaE4g6jqFL2JOrbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=En+j9TlG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=5mLC
	wrnjZn8OBKisiLfUdaXrrtKwrXv/semtMusNXFY=; b=En+j9TlGpCKPiOJgSsay
	hvaFqnAMGizb6ogRqTgnAHRe2+00eb3f5hOtOsrdg/dzyAUVonEMSQb0XFwHasp8
	aN5Gvxxx4n2eiXAyyxsiTHB6C6hEG3bMb+ial2kvxgNclC4xoSNKA4dq+WpMiZoE
	/4Wy9I4R2/JfGDIcorI1i/4M0xnfb5x1GCh6otrIFIorJz9STctMOBBGNY/Pe5Fp
	Ex7dAyAkSeWMuq6ijoRRjWIlFjaLE1Vob081Y0J1oeVsLuyCckV8oBGMG9a0zaKR
	0VWJ9v/mdZYZvGMcTUJ7i428Cp2wIWFiPZIYd/BeWcyFewvpkRJlosuBqCPsBiSK
	vQ==
Received: (qmail 95693 invoked from network); 29 Apr 2025 05:17:59 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Apr 2025 05:17:59 +0200
X-UD-Smtp-Session: l3s3148p1@7dRbP+Iztu0ujnsd
Date: Tue, 29 Apr 2025 05:17:58 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Akhil R <akhilrajeev@nvidia.com>, ldewangan@nvidia.com,
	digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
	wsa@kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v2 RESEND] i2c: tegra: check msg length in SMBUS block
 read
Message-ID: <aBBE5mgqGk0yXQWN@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Akhil R <akhilrajeev@nvidia.com>, ldewangan@nvidia.com,
	digetx@gmail.com, thierry.reding@gmail.com, jonathanh@nvidia.com,
	wsa@kernel.org, linux-i2c@vger.kernel.org,
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>
References: <20250424053320.19211-1-akhilrajeev@nvidia.com>
 <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="YRvL/7b8dLptsTvN"
Content-Disposition: inline
In-Reply-To: <j3jxuuwu2joyn6jsfa63lkkuwqazd2mpeki6gamdpktllhpkhv@tfoqnztsa7zw>


--YRvL/7b8dLptsTvN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I agree with Thierry, this check is driver independent and it
> should be done in the library. Anyway, for now, I'm going to take
> this as this check is now left to the drivers and it would be
> huge to shift it somewhere else.

The big picture is to support SMBUS3 somewhen which allows for 255 byte
transfers. Besides that, it usually is not possible to check the value
outside the driver because it has to act on the value right away. That
is, the length comes in and exactly this number of bytes has to be read
in the same message,

> Before I merge, I want to know if you have you seen any failure
> here? What is the reason you are sending it?

Usually some devices just send more bytes because they can. A value of 0
would be interesting in deed.


--YRvL/7b8dLptsTvN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgQROEACgkQFA3kzBSg
Kbb5mQ//Rlh2wr2jkIAmexXR7q5YkkzDm3MRpg+MjcvpuDv+l8Rg/XIu3C6JCxBx
de9iQ8qkLzfjj/rsHYlBC6uCLJTENBcirLHlT8PzIX9bqeLWSHUFyBqnuoO78FsD
Gwx1Y5E8sLBAXwrOl+WUBhqw9YIL3wMFgWvPi5lZCrr/bqA50TOlcCXxhUgVTh/g
c6MDUpbfPAeicSKnZsV2wTNEBQe4e0QU4zEBASFBb0Q8t0PKbfLbHNPyPDQDbxMH
dBz2S0bxNfw6TX1RQcG877ZgD4YYSbXDR7hmOhZhmtJJgFmde9imYjxU3LD77gV9
AlKIuWtwkhknYqg2kaiJ0oM7ys03JLqe2jI9ZAPuXcjoqioZtjJ1aEfzamswEvCm
B+FSj5dZ1nDMl0ylGXH5bUcxcmu4D9cKKxFnlcRuLQMcFmOg8KexL+4sduG23IMz
r6XZp3mtulzo4CiB4bWmZ+SvyqPPYBjj6SAfSdBalaL9djrI6Aka7CZ/r55D9ZHN
lBKLaTItBtwS4kQp00ZY5kcBqu+JUBTXGKqx87Uyf2AB2QIz53mUxQ6wxsoOn/Qk
v7tJ6i6WvXUr3B55anEaWjA8aKR91G++wXkWr7yXEF23bTGRAw7D8XFUCgLkqmqA
nUHu/D7kX9XvB5rmF8ZxhLcnUAkS8S3nBJtKN7QRMDIsMQEaeag=
=dBIp
-----END PGP SIGNATURE-----

--YRvL/7b8dLptsTvN--

