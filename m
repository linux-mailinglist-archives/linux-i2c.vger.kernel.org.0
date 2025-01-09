Return-Path: <linux-i2c+bounces-8997-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id DB379A07320
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 11:28:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F97618845F1
	for <lists+linux-i2c@lfdr.de>; Thu,  9 Jan 2025 10:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 554BB215F52;
	Thu,  9 Jan 2025 10:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="J6FeoD86"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C02215F4C
	for <linux-i2c@vger.kernel.org>; Thu,  9 Jan 2025 10:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418470; cv=none; b=LdkyO/SwPbYTnqqVzguiAzH9ssnM9jK07CYXFKDgw7OLiDCoixsNOfZ+7YiXefVXrq78k5VbIEXptfmZKSPcU+7U6IwGo/Wo2o6M9VopkEyClCZW3y0MFxAqtIFZvJR/2KesT5QzWQiH9LWSPY0USTP82OKubgAahGzHX+tnzIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418470; c=relaxed/simple;
	bh=+6BAexsGhiIXtUwkhZ5WSC9PsFGp9Zgn9Cr1EJiHotw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AoZKwJq/KnshLCEU4EbRUW+4MC+nHoOEq0nzEGhGqxmdE0ALHtX7Yj7zPZ1JJBcFo1/3DN5B/V0Q8k7OhWSEytB49Vwjr9pBqukQ4aoE0wJZouWUJHCq8svyVmdlyBFZ/uG/Lnz2DMT5PSblKTWLB7i/3wd8KWuW3XmA7P09EVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=J6FeoD86; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=+6BA
	exsGhiIXtUwkhZ5WSC9PsFGp9Zgn9Cr1EJiHotw=; b=J6FeoD86LVR8JAHj4M4Y
	ND3Hdl1nKIU/AX7J6UhDPhRaq9/YIWAnRf1/pRXBGgMrlS9B4MBSec0i5WCVpfn4
	962/4B5TJRfA8/cFkFgvjMCOrv3aa1Cp4TTnapxX+1efAUzVC9Ufh+KTmPMxTdIj
	/l/y7JWcJmbO7UqwaEHiq6iUTrqQCks/EVpgHYgyjYXoGKZtIFbsagXYTjSYn5Fz
	a1qasRYf34dkJ3SXG0ru0XXxEpN69TV0LGfBbVOlaW5ay0sbBtB5TMo9UqM+/AuX
	/Q6tPBu5eN0FQcs+SBtfqE7DMWBp5RIVQFRqT8oVxdgFWjMb6EsfpVyyWXND7KB3
	eA==
Received: (qmail 2869778 invoked from network); 9 Jan 2025 11:27:44 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 9 Jan 2025 11:27:44 +0100
X-UD-Smtp-Session: l3s3148p1@tanDbUMrDtEgAwDPXw20AOMQ2KO98fSH
Date: Thu, 9 Jan 2025 11:27:44 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH] i2c: core: Improve i2c_new_scanned_device
Message-ID: <Z3-koEmVAGPCtV7z@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Wolfram Sang <wsa@kernel.org>,
	"linux-i2c@vger.kernel.org" <linux-i2c@vger.kernel.org>
References: <f4110289-f7e9-471a-bb91-941c85bfb43e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SSRZ+pAm/Ccgvm9w"
Content-Disposition: inline
In-Reply-To: <f4110289-f7e9-471a-bb91-941c85bfb43e@gmail.com>


--SSRZ+pAm/Ccgvm9w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 07, 2025 at 09:29:07PM +0100, Heiner Kallweit wrote:
> Simplify the logic in this function. And as we're no longer limited to
> C89, move the iterator variable declaration to the for loop.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Did you have HW to test this patch?


--SSRZ+pAm/Ccgvm9w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmd/pKAACgkQFA3kzBSg
KbZq3A//RFKHnrmklU6FkD71q+3meLHyoPlujHJM9QB7gdspPPeOv3QZ7nccjcjk
+nfQvNPGB895LRpXElVWQFFBJoecP1UDwF3QQXQfmFJS1k0EbAjnOuHiWybWAQOE
sVTGgrliViZa6xQotsEQMiShHssHhXHqu0RiryReX9/szdRTzwg83MJLuTIfmN21
2oOrU2TplcmrLJwmuLyvZ7EujtfQZDriwuYERah2mLCk93T1Jv6KDn9PWr3GFYd6
N8iulFhB504/YDSxk1p0u3YxWd6tYLsl450uXTGWAUKLshAep6BP9kpTkMFiV3I+
ShNCKUmGdJ8B0czS0zhEtdYDublOib7D4Ny3wFAxuC8ZsciFyLnbBSY6Gl39R+mg
cPlQexG+JblVF+YeS9JnV4YXEu47Hjzw116C3vPtPIJX1fO7zKHQidqhD3sbbrD4
ufTEDY/qw72TZZWuLbolr72aiu5li+XdteRsfPFJk9k5+9/u0AST33m0Ftq5vMrK
sN041F8jUyw6HfYTC2MH7I/0JCfMTlH1GrPvYue37lmsUzCideeDjuqToJwODw+M
79UgLs1ig7AX+SQQg3eUfVH4E7fUNNBp/dgqdVux3ZbuBCTjWel2McwGqIcy3AXh
XefQckDWicfb2XSoHuTL+FYvHdTx+L/Hc4gLQDi+8L70TU4hfow=
=iTW6
-----END PGP SIGNATURE-----

--SSRZ+pAm/Ccgvm9w--

