Return-Path: <linux-i2c+bounces-12613-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30454B43789
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 11:49:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06ED354518E
	for <lists+linux-i2c@lfdr.de>; Thu,  4 Sep 2025 09:49:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A21B2F83C2;
	Thu,  4 Sep 2025 09:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="O7PypI1b"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F3E72E6CA2
	for <linux-i2c@vger.kernel.org>; Thu,  4 Sep 2025 09:49:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756979370; cv=none; b=vDXlSekkBThSX13rm4/L3sVZhv+POPpGyMUGXctbQEDckMLOEBzWutgGC1JZH1tZLo//Tx9lbyqSd9GPVVigZPggP0JzqkXL2+SwWfwYNI3YBleENuBH+sJn38fIF2H6ifyyrFWgAN40phjA7T6BLlZ9QX3LixKm+B1FE3F9E70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756979370; c=relaxed/simple;
	bh=4poblmE4yXou0q5bkgh+2IldYARqdILiBkD+5uymZ04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSxHCPZn2rzVxZeEL8Cg0zWOFMOp02YgyxlGQ7wng1C8GyTFt8ORtaapujDE1KEX+7FrA/dWphM2rSRPiQLOcG9yBMEqV6DcX9TJGh0kbi+UE+1SOCEOEwIMaGxvsotRX1/lOvBhU1nqFhZ+O+1MtTrY74pemDn3/zyrLHi6Nzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=O7PypI1b; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=4pob
	lmE4yXou0q5bkgh+2IldYARqdILiBkD+5uymZ04=; b=O7PypI1bRS+zGM8Dqxld
	CY/N9AJgcSSnd070fkmGf1IqrtB7XoHLTiIcn5LKNRJm1sf/5bShhI/DY6kBS0Iz
	ue5PpqqIw8v7XesXnQ7w5F+OrFd2yxgaZ/7JogSCUkgfoqidBoRuLSLyRgBw/dQh
	BeylWRAn0dY8NQuySsKxnfiACX1ihcoxE5pwG9vXxfc7SMSyqLFZuThuLj+JM0g2
	5IW6d0QQHLe/5vpudFsKSeieyQUg++ORRXnP4SV6yMQz/M9KClhEzXItNlwtDd1J
	/4ql6T1lsrGsaUJRw8ZjD2xaSVW+daxNPOsjh/Wo0ba6Ddq1lL6SQ+fYFfqrB/4k
	Jg==
Received: (qmail 3618206 invoked from network); 4 Sep 2025 11:49:26 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 4 Sep 2025 11:49:26 +0200
X-UD-Smtp-Session: l3s3148p1@gEr7ovY99lRtKPNb
Date: Thu, 4 Sep 2025 11:49:25 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: =?utf-8?Q?Jean-Fran=C3=A7ois?= Lessard <jefflessard3@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH v4 0/2] device property: Add scoped fwnode child node
 iterators
Message-ID: <aLlgpUlHp7t8P4dQ@shikoro>
References: <20250902190443.3252-1-jefflessard3@gmail.com>
 <aLgY1z-MvQbDBx2_@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GS7pOaLvyaHreIQZ"
Content-Disposition: inline
In-Reply-To: <aLgY1z-MvQbDBx2_@smile.fi.intel.com>


--GS7pOaLvyaHreIQZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It might be good to have an immutable branch for me from i2c core.
> Wolfram, can you provide a such if no objections?

Sure thing, I can do that. But there is still discussion on patch 1, so
I will wait for an outcome there.


--GS7pOaLvyaHreIQZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmi5YKUACgkQFA3kzBSg
KbYE+g//X6O4F/IeSTFFhAsRMgVo4AB5RlTI0RPe62c/ucxzPjLEAfzu3RpfaA31
UjVk2Tt0vynBP6Y3+K2zuHUleEPIAAfS46S+W0m9DRyRsWdhEBCAyhpmX5StA74q
Lex/zCEbOqto/BuZJ5BsihQIresygtA1dHbMXhKVl1H0SHCm5JJ4GrBPtppwWLxN
/EQxsZsLpclDW46bf99RO5G71UiTC1LU7EeSDEYD9lAVH1kAYawTbUJst9BXpP/b
h3uw+a2wgCkZPEzVnAAV2aekLGjW/r34zLuiyr+wiSB9VyZYcMctcdo9CtW9gEvZ
4qJdrFLDaZM7efDzfvZcAvz1NciPRbFOsD0Ib1vOVXkZ0VKi5q9CqGseTbV+Uz1y
U1De4q/O2jUIu1+ZY4k4p1pLNUHbIC3Ay9sum8rbAtiH8BfSm256uRkPdeshyEqG
KZCRMzZbCeHgAcadp6s2QOJVxHmCL34HWPVUrJqjsXR9cSOgyoHKCKgRZOznnZ+e
B4aC5HtW8Wrnpq+PiOwKSy35lswL3VGY5Ov+SrM8lG+jex7lRyi7N0vOOIwfI0hF
lmU1Cq0YQKadtjbeC7Hc6k2NEhr1wtVJA9eTYqPrTwkfD+h0DpgpELTa1snWUeDi
jOpiKSDTMc9JQBq2wr2+MQl5lFcRmqANlrQ5j3lnd7B3ouZBEqU=
=WedA
-----END PGP SIGNATURE-----

--GS7pOaLvyaHreIQZ--

