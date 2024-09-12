Return-Path: <linux-i2c+bounces-6654-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6559770E4
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 20:46:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E306284ED3
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Sep 2024 18:46:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1D6B13DDB8;
	Thu, 12 Sep 2024 18:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="UaDRRL0+"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29F591BFDEC
	for <linux-i2c@vger.kernel.org>; Thu, 12 Sep 2024 18:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726166783; cv=none; b=ddj6Y06xF1dLndvwfflFf4pi2hTYF68tVbWY5ig6Cb0ePHkjKUYVTaaPQmoUY/vHVB0ehCZdvtJux8XlBGi8l3noB4ujPyougBeejniEKF/1fxMPP07DfOmNrbyxb/fVUSr33smI91znhQJqGT2BpawkELI7CfgTPEwHZd6VKb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726166783; c=relaxed/simple;
	bh=SLQHZ6SZ+w3azARg2uj1uAAkSMpXW3XoVyrwUCumU7I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eho0MSH82X4RtMQp182YIb5Sn7COP3XC0C6zvV6q9OA8nKA0d+of8huTWtGR2R5lr7RcKpSs/RE4wzL7uV4WmGXchquIov0P0TUG4dq3AvYTmFrjqovoRJtd6GeJpgAczwVmMKvQyMIE8Exmvh8UIMQleq0JYOIKTsrqCYpg1xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=UaDRRL0+; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=aoOV
	tNFFr1UwOsv/r7HHhtZl98FSoQvfv5ZRBDIjaaQ=; b=UaDRRL0+4iYenyXD1hbQ
	Dvk9KOkYy5t0gkeRUpi9i0PDgE2gsLwTR1b2HAHvJE4v61A4DVj+T7MKpyWCxCEb
	7jEUJDrmvRXBqVxI6nbFS7JLX9xbbvJRZivGHG0vLCM1a+THv+Ym/lBPxoPU8Na7
	btbfe1o4ul5PQqqzYBTJ8PYhfgmk1p/d6kioSDnkohjMf3inlRQ6BXTrb2RU+/V9
	Qi7wc50FnqQ8uZPmiiDCNwUDmuYtiAHOIRr1hTZlJq/4f9szLETp6KbKpIiIVTW/
	nKhr1ZaAI/lfir53ZGr8II099+PwFSmswgJMxuc7vWegL/K9WCTr/jkk6jwhdUef
	Lg==
Received: (qmail 986352 invoked from network); 12 Sep 2024 20:46:15 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 12 Sep 2024 20:46:15 +0200
X-UD-Smtp-Session: l3s3148p1@0d90hfAhVLtQT+F6
Date: Thu, 12 Sep 2024 20:46:14 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-i2c@vger.kernel.org
Subject: Re: [PATCH i2c-tools v2] README: ask for DCO in contributions
Message-ID: <ZuM29m7SXrArSDFU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jean Delvare <jdelvare@suse.de>, linux-i2c@vger.kernel.org
References: <20240807112835.14346-1-wsa+renesas@sang-engineering.com>
 <20240808112746.42fa8590@endymion.delvare>
 <Zrzy2zW8zXTGyphQ@shikoro>
 <20240912144219.3b1b4089@endymion.delvare>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="As6TW4moZ04uEB88"
Content-Disposition: inline
In-Reply-To: <20240912144219.3b1b4089@endymion.delvare>


--As6TW4moZ04uEB88
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jean,

> Well there's one pending patch which I posted to the linux-i2c list in
> May 2022 but never got feedback:

Now, this is strange. The patch was set to "Awaiting upstream" in
patchwork, probably by me. It seems I set the status first and then I
forgot to reply saying that I was OK with the patch :( Sorry about that!

> There were some changes meanwhile so it must be updated to apply again,
> but this is trivial to do. I'll post the updated version, it would be
> great if you can test it and we can include it in version 4.4.

I'll reply there, thanks for respinning!

Happy hacking,

   Wolfram


--As6TW4moZ04uEB88
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmbjNvYACgkQFA3kzBSg
KbYGoA//Tl/khFnMhsySyGRAAyZl0rYi3+OhJuKohI9k1e8hmSdeY+IPLkDyo1RS
AB/sgm9ow78f0J5vW1yj6kIkUKWwbLXs9bs+uxI6ZPyEkAk6n8ahbmu+Uvd8zMkj
xXcCQkkYE7d9+mI+Y9MBRnte9ZP1z2mYij55e8EjhpmJKUs6jXkZ6yVBeNHu95tU
amrTmBJeAw1EhrelhgsxFRz4adzd/+URDCKwQJkMBOrzxQlXiUwkxpbjHLxWRK4x
peNjiWwZQOuzpI5n77+Jar60R5oRIw5aqRKmy/hj/XOV8ZGAp71cMV+Hg6Q/KySV
ajw0DbRw6O5xE9zFnztyebCSmxYaab4K9fnNnBBuhI4WiVwDR15RM7Wd0UQCMqq8
oOHUhS/eN1eS30wiuKUDEkk/q9kRPxT1IHrs9lzDUXiID4HhsDTPcRfCv4pc7XTH
BrPXnhJRrT5WnG+rNnvhJ4+iZdAWtKXmhkG0tLBmTJRz1sHbc0aHq7nF2/Hm4XcC
3wPoCAuHn+LX34rqIKWbxOemWEv/SSfITlQnAn37FeoPPpKFZQMnQjresRhb7Rw+
8wmJdHiv25XVlm4p86ToP/afqVdOX8Y9vbsutkrexDGhnVa5DaKaxJj5wqrXUwlJ
+hZexi2kCg1lyKnq8qhjdHn1Qy6/KfSwtIbhro01jSV5FryZq84=
=HH6U
-----END PGP SIGNATURE-----

--As6TW4moZ04uEB88--

