Return-Path: <linux-i2c+bounces-8004-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A14D29CDB13
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 10:06:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6573F282BE6
	for <lists+linux-i2c@lfdr.de>; Fri, 15 Nov 2024 09:06:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7A4C18BC36;
	Fri, 15 Nov 2024 09:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="Zsb7PJ5B"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06AA18A922
	for <linux-i2c@vger.kernel.org>; Fri, 15 Nov 2024 09:06:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731661613; cv=none; b=krca9STSqW9kFKLql+Wne6x+J04pEcPwRzIxXLUG0luXHFI5WG+6GylpcEb9WLKTDBgnQVWc7Pnnyg4KF9IYSP/ppaN7bZyXz7wNgv9IgF++zKpQHBOiE2gay5qStVPTL35/eJ3BL0htPqIkM3l8LTur1VjoAwG6bWvwqxcodeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731661613; c=relaxed/simple;
	bh=yPZVsgKXclOlJH1qoJgcuarPoZsvQmU+kn7v0TjKgwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rXN2/N+x0UzQYZOCpO9xSGkAWxPKhHzfVgI7JooERyHUArzJsgOcyQapY8xjv+2aOMwOUhdg4P+lpcXT0b8GF3nkwCh5G1Gy3XbflrzxZ02Sf49gVoY0yWLoHe/zrWmDKLkci9BOH4WEGfbTSbT5f1QF+9aLi37tExGdhzHBwas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=Zsb7PJ5B; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yPZV
	sgKXclOlJH1qoJgcuarPoZsvQmU+kn7v0TjKgwM=; b=Zsb7PJ5BXCpssQ0r+SWz
	lH2RNcqPi4KUfnvHZ6wJb1EWjoitv0ZP5RTR9j+jlhEqbzfX+k4VIwnHdLXXdGk5
	Qse5Q8hoznXgveNraWKDo/szDYToU33oCRGd0OuwtPZvli2eaH/xvO+4wGc4JrRl
	zjz57QkZX4sK5vlA2t+d92Y3YxHoIVRupK7aNk7ROaee0B2tJOJy5nysUiJeE3eH
	/Z5rTmX9b/U2MR6YPN4Ginosjgp81gH4iz5xtcAh38Tvh93auPytpSGyaRzFEvxV
	sjEedwRNwrt9hTKZYe1Hq/IZ+a6+S/BNZVzo/mYnMvOl5fiB2kL65BI1ss8tgj0o
	QQ==
Received: (qmail 3419175 invoked from network); 15 Nov 2024 10:06:47 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 15 Nov 2024 10:06:47 +0100
X-UD-Smtp-Session: l3s3148p1@nSH84u8mLK9ehhtH
Date: Fri, 15 Nov 2024 10:06:47 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Brendan Higgins <brendanhiggins@google.com>
Cc: tommy_huang@aspeedtech.com, benh@kernel.crashing.org, joel@jms.id.au,
	andi.shyti@kernel.org, andrew@codeconstruct.com.au, wsa@kernel.org,
	ryan_chen@aspeedtech.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	brendan.higgins@linux.dev
Subject: Re: [RFC v1] MAINTAINERS: transfer i2c-aspeed maintainership from
 Brendan to Ryan
Message-ID: <ZzcPJ9sweqxLZOGf@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Brendan Higgins <brendanhiggins@google.com>,
	tommy_huang@aspeedtech.com, benh@kernel.crashing.org,
	joel@jms.id.au, andi.shyti@kernel.org, andrew@codeconstruct.com.au,
	wsa@kernel.org, ryan_chen@aspeedtech.com, linux-i2c@vger.kernel.org,
	openbmc@lists.ozlabs.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, BMC-SW@aspeedtech.com,
	brendan.higgins@linux.dev
References: <20241115044303.50877-1-brendanhiggins@google.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="nK9GppicB146/nY+"
Content-Disposition: inline
In-Reply-To: <20241115044303.50877-1-brendanhiggins@google.com>


--nK9GppicB146/nY+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 04:43:03AM +0000, Brendan Higgins wrote:
> Remove Brendan Higgins <brendanhiggins@google.com> from i2c-aspeed entry
> and replace with Ryan Chen <ryan_chen@aspeedtech.com>.
>=20
> Signed-off-by: Brendan Higgins <brendanhiggins@google.com>
> ---
> I am leaving Google and am going through and cleaning up my @google.com

Thanks for your work on this driver.

> address in the relevant places. I was just going to remove myself from
> the ASPEED I2C DRIVER since I haven't been paying attention to it, but
> then I saw Ryan is adding a file for the I2C functions on 2600, which
> made my think: Should I replace myself with Ryan as the maintainer?
>=20
> I see that I am the only person actually listed as the maintainer at the
> moment, and I don't want to leave this in an unmaintained state. What
> does everyone think? Are we cool with Ryan as the new maintainer?

I am fine, depends on Ryan as far as I am concerned.


--nK9GppicB146/nY+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmc3DyYACgkQFA3kzBSg
KbakuxAAhyZAhgBDfdxkF5LlZpy0BWTyWqEP8GXLw6CcwvZK8FtelfWQ7fJp2q+N
WVUtpFgaiHmEdRr4OGD+1HVFtQgRVu8ybw/jyAt6P3ht1v0AZazUbKrxhJU9atKb
JbMDn5fMwiZu4YXAnfMXDA4VIrLYG3oTAjdDk4dYR4QwCh9EVRA9SJ4Oi+GkKdWg
jEu/KQiKNNTchEmr4Hm/A1tql1hOVKfKCg1dcOtnmzFJrrmWfL1zx2TurjyntpET
+DnDJGYx/96tWCxEVgmp517xxr1A4ontZeGw1VaozHzRjmOBXoW9NECyEg/J7zCd
hz1HefaJvPHACQH8vDYqtYUcAgdQqa06b/emsybRKhyIKkRkY6EG04ExbKEEM4tN
h+CMRFszsBPSIUQF9tErfHCXnK5z3cVHFrl56RVdBUx6Pb4uqIIVeoHGVjPKoCrs
HGSlFczraaD1v2bqneRbpdXoBBmbQjp/N555olQ8k9r9HYKxIYr7wr6eM+4quRz4
pSvGANzlRd6MDxCIInT3bNJ2Agl0qtQxNcjvJHosSuvHNS9Go2fx2To+Qogthww2
+p9jR8SFgPR6Obt0+jj2EoyrPI1ecFreTUxR7D6114J48e7N3oOgEgUsjysS6DBJ
Qz5L3N28hseO7jDZE16gbtqLJgVOKVjUmqJYo3sOSf3wYcy5sJI=
=yNAx
-----END PGP SIGNATURE-----

--nK9GppicB146/nY+--

