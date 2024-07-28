Return-Path: <linux-i2c+bounces-5071-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EA9C93E922
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 21:59:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DA04628186B
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 19:59:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B02BC7174F;
	Sun, 28 Jul 2024 19:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ZL4od/cj"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDBE58203
	for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2024 19:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722196749; cv=none; b=XbN0Up9CxbkTsfDJf/isKmRa4ff/t67CeUs0OIw5i8SNg5d0FrWq9viTBJJAtamONLhdZXQB1tOS9abrKuCPs9fhz5N9gPd3X3afl9y07NHQlJRJseaRprskLCZTEKTrh80j78gEQiK0IBhbBhMYv5Z425btbWMgPepJBROC7gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722196749; c=relaxed/simple;
	bh=ibXNozkVZgmExW8lnmjyadlwnvi5tEPyBgBEJ1ncv5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DLgC9AckULDnTz/wso7XKU+q9aUxSsclLCFuNRT5t1BQzfgaTghQ6/ArZcqM4w9cXo6AimPzTRUoBgDpFyXi+6hxWW/Blq1WiaKzDISEjwgHIU7ZNrr4QJtjaXFLZSWLMHVWBTFdbqLlxbo+N95XkwlY4vU+PlgJbL0qgAx9Jew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ZL4od/cj; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=yCxX
	IVD6iC7MzIEiSPVf0vHwjuy0xrq0AtYJWOq/ebE=; b=ZL4od/cjIvUJIfR1msNq
	OlFLsX8N802GejlGRdnICnaf5rkjwYIaaiVYb5mwfOZUGgNXqdE50SdQcshM+qtT
	LuoaOXZkpX611dDNtspNcB1Abifi4oUvvjPXExDB1Xfj/XvlkC3hLFUPDrWbCV/Y
	1KGXD6rVCeE4JRlVqWIQJHaYPdMRUIs4W/2A/DyPG1bqudjHyV9Y6kOBVx6JzfJ6
	lHmASkqfISrK/rQXKqpCtGMcCaVp2IvertoUZL/C8mKTc8zFjBXtDY6EwUQyRAfe
	aUfD1W4H6bqUJ0tNEC2hP1QvRKdivNd3sp3VI1EIfoXBUvlfM8urEg7xTMRS0s5a
	SQ==
Received: (qmail 3888601 invoked from network); 28 Jul 2024 21:59:01 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2024 21:59:01 +0200
X-UD-Smtp-Session: l3s3148p1@6ZgCLVQeTqcujnsv
Date: Sun, 28 Jul 2024 21:59:01 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] i2c: smbus: Handle stuck alerts
Message-ID: <ZqajBUknxDaMp5wy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kxTBKAMs2xq1DGWx"
Content-Disposition: inline
In-Reply-To: <20220110172857.2980523-1-linux@roeck-us.net>


--kxTBKAMs2xq1DGWx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Guenter,

as I mentioned before I now have to deal with SMBusAlert as well and had
a chance to review and test this series. When developing the SMBAlert
trigger mechanism for the i2c testunit, I also experienced the interrupt
storm and your patches helped. See later mails for details.

> Note that there is one situation which is not addressed by this set of
> patches: If the corrupted address points to yet another device with alert
> handler on the same bus, the alert handler of that device will be called.
> If it is not a source of the alert, we are back to the original problem.
> I do not know how to address this case.

I think this can only work if we require .alert-handlers to start with a
sanity check to make sure their device really raised an interrupt
condition. And then return either -EBUSY or 0, similar to IRQ_HANDLED or
IRQ_NONE. Or?

All the best,

   Wolfram


--kxTBKAMs2xq1DGWx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmamowEACgkQFA3kzBSg
KbY25Q/9FrDdAAsHtbmNwmxT0S7gpel0rA0JV5Zicet6tlDgsUJZLWuU+1nVNRtx
Cwf0Dp197Zg4Ibo6wWO2zJUPfbDvnXpYGVZ5ZLqCGniiepKJP2Kjc9UxXzhRSkRs
8ErT5nTj1firE9AG8FhOanSKUQjfcaEMIjmoJ053HZJqk123gMT4Brkh+ymeATYm
YNSJqzoW2Q/vSluKz0/t6t41prlRqAtzQGpR3c8sF8gav5NAmFHAReu1WJCe+Y2z
7jAnlMGm3yvf1Vn4GXmub9ZHPryM2GoXwEyuc8/DVh8xa8mHRIYcCP2CR9KHC7oN
xVDBTmfeRaB+MRwlQCbYLgdZIqtKyhdiAwaspFpCkAAc+t5hzSudI9oTBg4nVrXA
Hjr/uqb4T4KrZCZNHPqxksbxXRTxcu24qWNeiLrPvajMVd+9Uiy2ct4FDjOzSe8S
/3E8uEHeBxM7dDp33xu+Qy8huPqWv5IFAWwLOf8L71l1a1EU8O5rpirC/91MwoS5
/VWusRbFcnBwQAZ4k9u9EsTKSCHR4X/FXAYjfanVzzmXoWgEzp4qxkP0kXi0DsH8
4gn704Sf/2CNV0KIMpSgDs8jWmO2MbBNE9XDtYwp7Gj5DWh9GGCSueuBPgLHljlT
1V3U3DRYaZJyMKpDlowp4R9vv+lrYf1PBuozxxmF4lY3WbczFYA=
=qhqX
-----END PGP SIGNATURE-----

--kxTBKAMs2xq1DGWx--

