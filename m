Return-Path: <linux-i2c+bounces-5455-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 243B2954C6B
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:36:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C5ED41F22A4E
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:36:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1F781BCA08;
	Fri, 16 Aug 2024 14:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="drMmoTwT"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A6B1B29BF
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 14:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723818958; cv=none; b=HbrhQwF8Hp01M48DZ5+EHSfIMfexVm8n/CKaJGm4FcJPXNrbRkagOwOfCqS2gL98fiI35wUyUVumk2aGBrET40KsyE7+xMoXBXx5hRX7YTRVsiYK1/2VbKZeUTnuJYIZefH15eVPYuiE5Td2mcrO9jdw0NDmAx7pHg93j8EO4jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723818958; c=relaxed/simple;
	bh=0ZwfgptXhvhSleyh7cKa9hmPCX/e5fDvqTe3wQXtdlY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SlqY4nseSEZM/ZQwnzcB8QcTaWkKepadsOjcm+OrBoKKhPyEq0+umBgoaY50PpvoUeqAbnEF0aTffWJk+dUif4HONcMUs7cJeg3fiCkVsvh4rjzDv2Ikvyfd1nQ1oZ25CzvW8Uk3GX4cAH6UXvljpDwPtPkIJ1W+zEIDPWW75Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=drMmoTwT; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=0Zwf
	gptXhvhSleyh7cKa9hmPCX/e5fDvqTe3wQXtdlY=; b=drMmoTwTK2mazqpWVAj9
	sNtLSJN4xA/4dzdsyBYazgLne8wbXuQAA3wSvbHPHde+PmYJR/JQjPr7cuz4+iim
	GM+i7NwmbKqsTO4lOXE7fV3qVvVVR+jgdo94gImy3t6pveElKWT9p1B/xv7a3/Q3
	Sis+TpFNIeehYMuPCVYNSsWn+y6WQHcsAirVRS25ZtC4J5G1ARMzuuselrMPMjgh
	fI8B9GKr0dIfklYpfzi1zNRGWVu0c7rRelA6ztsmVTmz0hTcMI3Q+vLEFb6lwx8O
	Re95d3MAK+yD4RsI7Kt5Y8NoGjyZEg/SJHC8Q+ajK1nDcYYdQRRfixAfc3q/+BUt
	hw==
Received: (qmail 2627351 invoked from network); 16 Aug 2024 16:35:53 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 16:35:53 +0200
X-UD-Smtp-Session: l3s3148p1@dqlj4M0fHpFehhrc
Date: Fri, 16 Aug 2024 16:35:53 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Andy Shevchenko <andy@kernel.org>
Cc: Andi Shyti <andi.shyti@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 2/6] i2c: i801: Use a different adapter-name for IDF
 adapters
Message-ID: <Zr9jyQhhYNIE_L6P@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andi Shyti <andi.shyti@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>, linux-i2c@vger.kernel.org
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-3-hdegoede@redhat.com>
 <c35b6mawhhbhjioan6hvrlthtcoc6dqivwihhwz5ftvv6jcohs@ovctm27nnd2n>
 <Zrz43Qb62EB6o39e@shikoro>
 <Zrz64Fo17mmekJIH@smile.fi.intel.com>
 <Zrz8yHYdACa2Hpuo@shikoro>
 <Zrz-AXk5gHEw00SA@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kyTIVT+OsI43n5Y/"
Content-Disposition: inline
In-Reply-To: <Zrz-AXk5gHEw00SA@smile.fi.intel.com>


--kyTIVT+OsI43n5Y/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> There are zillions of naming matching code in the kernel on different levels.
> TBH, I have no preferences here, but I definitely see nothing worse in this
> approach than in the other.

Okay then. I am currently not aware of such naming matching code, but I
trust you. As I don't seem to find a better way right now, I'll stand
aside and do not want to delay any further. We can improve later if we
need to, right?


--kyTIVT+OsI43n5Y/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/Y8kACgkQFA3kzBSg
Kbb/pxAAjUjar92cVG+FsOOXIxR1ZpWciyYOMycim1NAWiuw2jNT3yduj1RUMrDj
DvApK9vH3r/6Q0ReBDNs+CZwCoVY3OURfVjIBuxI40sUuRSf/KTv/nWRWr8r5O8l
nlxyUeEBzGhwgFDaDImi/pCk66qQXQRHWy56gLm5DTroZL1AGRtjsDmMEIXRFgI3
WbtT3nu+ZQ5ELkE5/F61h9fdTZhwiXxAES9V1Hm+f56dzHeZaSfQAUBCN2tEx5rR
3wjHwATcodaeUw09q1Kk4K8N46t0z4YXl7z9ZJmoOYsy9H+6kerIS+RJKlc25w6c
UzhdCdnK9yhFKWVUoqh2rXz4m2JbM+Tb5x+XBgLO8v8PHeo6IVH9XGBLPSUbMvoT
A1MacwNp1aszITVnR+XFDheNZBQxkU4o/mR8tZCakqaw5nPVlPkgEryQCBfZMjFy
iML95GZPL/jqOjB9ifn9v3sqh2MSPMEtvtN9xZJe+aIRwS+CIDfiq8dsJSDJunpc
23u3+Gng06Hn695rhQRBjJNkvUpBTVsqc+jvxle3La6MK2W0T3KHTMLPxDBkokxB
VonjxO/O59WTxyHUT9MgGMIhqwzy3H/7fmJQv0Es30SAc/GUyVjkKjkwP1AE/U+8
owqm9xXTsu7G6GbcFgbozrS/EW/m2dJQ7J0YX8fMGsJ1dJ4XCjk=
=nq10
-----END PGP SIGNATURE-----

--kyTIVT+OsI43n5Y/--

