Return-Path: <linux-i2c+bounces-5078-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD5793EF34
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 09:57:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 355A0283531
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 07:57:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BB79132492;
	Mon, 29 Jul 2024 07:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="SgN9VmcE"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13AE131E38
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2024 07:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722239834; cv=none; b=ZHKfFtTcLgcAnd+idTy0WPrAiC/jF3md7PzO7xAMjvMPrh44srYUFNMaj0svm95OQ/mMH4N+L3tMJqQT7WAnmzWaku3lq9xngc6hogMSK7KXBz71AHV92qMIpcf0crh92LuORMqaVW74nQQRM/lP0RN0g0Tqw7UG3f+HnfqOKm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722239834; c=relaxed/simple;
	bh=0pmFYSHLJF0nMzU2zthIKlZ+WNb7UahZwvJRW0ih96A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=epNOQQAnA0c2CgHQR7GgdrUJA/WUOExjPshjaPgAvIslMzLTaEIVQF6BF7FnUqLLK13lwrr9PpL6HisvMm4PznqFmXlp/wVQ7rkBf6j/pPQgxZz3cRlib42egFTcZuZvGFqv+/a8oi7mhrq/29Lho3RvS9iBdjVF6/8fJd/4Gcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=SgN9VmcE; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=S6sW
	8jss2M4MV9hL7QWF2v02HzjqcI4qjr5zZRvln24=; b=SgN9VmcERgrdVXChYvaw
	bM2fqXK+pCRFxN2ZrlUZs2OfHc5fF1qNf3r/3LGfdW/LxVafTLcZ9vPQDFYM3XLl
	Lloo+/I3Q4ovvaYXYkx+K1PgLNhjIqAaCrL3QUuonnjf1Cv5VLWw1vLqvFzvogXZ
	JToShLrixaZaGv/DulH6k/3X2tEh59sAry35Hg8mgOoRRvv/B8bbOi/XTWZNyHq/
	gBxyVDzLz/L++BS6dAaaKGQVH0J/xfBramvTAq28rIVgF7JOWPegCEjXm8Ggr3ep
	WHLYD6/I3Wo8NrOrojyQejhrc7dN4dr04ypsGxYdzb+Ix96zVd9Aov5CabS4plfh
	7w==
Received: (qmail 4023567 invoked from network); 29 Jul 2024 09:57:10 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 09:57:10 +0200
X-UD-Smtp-Session: l3s3148p1@NcdPNV4eWIcujnsv
Date: Mon, 29 Jul 2024 09:57:10 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
Message-ID: <ZqdLVg6IVTjsTWb4@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net>
 <ZqakaAn3f9Kg6Lgy@shikoro>
 <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="A2G7ZnwO/aPIJdKm"
Content-Disposition: inline
In-Reply-To: <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>


--A2G7ZnwO/aPIJdKm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

thanks for the feedback!

> > High level question: why the retry? Did you experience address
> > collisions going away on the second try? My guess is that they would be
> > mostly persistent, so we could call smbus_do_alert_force() right away?
> >=20
>=20
> I honestly don't recall. I had some brute force code to trigger alerts
> on connected chips. Maybe the idea was to catch situations where another
> alert was raised after or during the first cycle.

Hmm, I'd think that SMBAlert then stays asserted and the whole alert
handling will be started right away a second time? Given that all
hardware works correctly, of course. Your setup showed that arbitration
does not work well with actual hardware. Props for finding this out!

> As for "call smbus_do_alert_force() right away", I am not sure I understa=
nd.
> Isn't that what the code is doing twice ?

It calls smbus_do_alert() twice (without '_force'). If that fails, it
calls the _force version. I am wondering now if we can't call the _force
version right after smbus_do_alert() fails once. Meaning we could remove
all the "retries" code from your patch. If there is no clear reason for
the code, not having it is easier to maintain. That's why I ask.

I hope the question is understandable now.

Happy hacking,

   Wolfram


--A2G7ZnwO/aPIJdKm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmanS1YACgkQFA3kzBSg
Kbb4ZBAApJjcmr3njHPjN4DXoGobRQFLog923G+cg4ZC0nVItt0/CKt8yG4+EcVi
9Gs0CRvtq5HL3OuA1cxConwyAaXBFZKckZHOOklV/r/lktCqzl9kWstQ0WTWAYbV
VBQEIKsViER0KCVJZazzQGP8PmPjZNyZcvVAYo9AgQ0AGzvuEntLDAQpjkNv4ILw
NrQ19d2SfLeWxlg3RjfzWayVpD7quwVgSeDdCrizzBYHInXBltBGAEOWSqnX/eJm
FEp3sWoNySjnwKo/S02cfyFILTIsnnL+PCiBho+icgFY4TrVKM4D6ijjzmbTcAMf
uH/QzH2AWrJ/l1GopCnFTRXZBuHnNq2z/TAdztRUnjdwMFsdA99Pg81JQO4VkNou
c+qE679nKaIsSFtvJjO5bW65ztfXbo5mIAXfyApUTsNzeMc7A7DagcnoaagNC8TK
a6jbzEom/eO2+E4cNX5vUyDEic/5i8zO1dsywKjhE15lwBMdY7roqfDv91epKo7f
fRWOeZfPrUGWptZ8iLD/D3fbc1OmYQeZWJ0TboYvrAHc9eGMkTo/ceab+2eJgygm
apq+tL034wBB+pr/vXNb70FT+DNyvb1ztKsqERujiBhcd1MApk5wnZub+s24uXOL
fe4vhTsbctm2Nfe0DflhZcHKGmtGg6hzn44XdduJ6SBcYCIJfmY=
=AHUN
-----END PGP SIGNATURE-----

--A2G7ZnwO/aPIJdKm--

