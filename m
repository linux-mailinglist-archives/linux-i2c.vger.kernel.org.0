Return-Path: <linux-i2c+bounces-11107-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4CEAC0803
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 10:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C78874A083A
	for <lists+linux-i2c@lfdr.de>; Thu, 22 May 2025 08:59:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AF18289343;
	Thu, 22 May 2025 08:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="X+2B+9gL"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C9022857FB
	for <linux-i2c@vger.kernel.org>; Thu, 22 May 2025 08:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747904324; cv=none; b=CYBa4N0W1WqfJSR0DxtP+qAOKVSqVNdjCh2QgJduvdvSNtQJ5P1/mLWNNnj4DhvlNNeMPXTPfzRL6+6gQeY7mcoWIgk0U6qLHuW0OjjyLv5+ZZWHN3s+9Nm7YtN7lyfzCs+/quE+ii+B/bBmu40eveAO2TNJgA25Vz2zEo+dtJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747904324; c=relaxed/simple;
	bh=rIgTX22Upf+QtLihqTghTi+nnAb/MFR37PeAhk+wQ5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dECK0r5qSysD/Wd8r7SmSgE/wtrmLC6W/lleAX2u5ehzA08jHtr9mtj1H9izbCEarR8/HfCkYTcc4pi/1xw2fN6HR3vonsDDxsNOrCGu64j+ZNjGLnnvHS9zpLd/Er6fzApbAhboXj2Xw5hKkU6BYVrNI/AqoeDpnoTrU89ZFDQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=X+2B+9gL; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=tHPW
	Jsdh9LsI67avamJkFkbr3biAag3pxIaMylejiMY=; b=X+2B+9gLkEu6NtgKS/E8
	y8Rtu5zFd19M6ddtIzvHt0tXGn/O7pK7GkcLt/L+IxDBl5DbSyPH45O4/cMu/ChX
	nz3sTYyh4CerMVzB7EJa7yk9Y03LauOGj3WmS6cPgzwd1NgBnkzWATPXUDOfSOwS
	hQKdAzYcQTvPdfNNWi6umLl0xBf+ll3acfH45pjN3krXbaAbOZRsOQ2DynahqSOR
	MaWJDbc+Jc6ZCQEvzc55MliBElK/lBOb2PseV34XCq42rt6hnsmAweYNWHtL7oab
	w1gn+8oF0tvS3XD9iVS5LIS9Q+tok/1aGG5+NQan+BnYGIKkWMtmV3B2IMV3KKDN
	Pg==
Received: (qmail 3583304 invoked from network); 22 May 2025 10:58:39 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 22 May 2025 10:58:39 +0200
X-UD-Smtp-Session: l3s3148p1@/OISsLU1lM4gAwDPXwj7ADHm2wGe7qss
Date: Thu, 22 May 2025 10:58:39 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: Re: [PATCH v5 8/9] i2c: atr: add static flag
Message-ID: <aC7nPzu3TAtqMuiy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
References: <20250507121917.2364416-1-demonsingur@gmail.com>
 <20250507121917.2364416-9-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TaY6Pwvb1erV6YQH"
Content-Disposition: inline
In-Reply-To: <20250507121917.2364416-9-demonsingur@gmail.com>


--TaY6Pwvb1erV6YQH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 03:19:14PM +0300, Cosmin Tanislav wrote:
> Some I2C ATRs do not support dynamic remapping, only static mapping
> of direct children.
>=20
> Mappings will only be added or removed as a result of devices being
> added or removed from a child bus.
>=20
> The ATR pool will have to be big enough to accomodate all devices

    CHECKPATCH
WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#12:=20
The ATR pool will have to be big enough to accomodate all devices
                                           ^^^^^^^^^^

WARNING: 'accomodate' may be misspelled - perhaps 'accommodate'?
#134: FILE: include/linux/i2c-atr.h:27:
+ *                    The ATR pool will have to be big enough to accomodat=
e all
                                                                  ^^^^^^^^^^
total: 0 errors, 2 warnings, 0 checks, 105 lines checked

I fixed it for you this time.

Also, please make you sure you have a To: recipient in the mail header
next time.


--TaY6Pwvb1erV6YQH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmgu5z8ACgkQFA3kzBSg
KbYqDg/8CdkAV2akb6oEEHJ8ZyDCurbMvK+Ok1jnhxG0K9wHuNSciEKTSW0O+YHA
1RRRv5HLi7KCr788gsMJovtm/tDTfhxp9W7V2GEdn86jKyvVD/qbuZ6W6btuOjD2
z07QEv38KMkuCuzRah42kmE8PfVW1nLBjak/V6rmYxydOR65+ohH+PNyXyZsgGyE
JBT5Uhnc6hfJpNF7oY4AczYlIdiEYeqbyJ33tPcqFLGDVBWOicoI6gTgzrFrvNSZ
UtmnrNcEXXPojC6OJwq8RYg7nBSUDmnuAaa0inwSWGW/ce5kxT4kVmAsYABtDDpB
jGrATSoEG19bWxzyFG52xFl+uI4rOEF/oOd2dkqrLqvkENEuPEdNgDqo4FVj0EO+
YsEoX60++i/Ee/xCV/QwPgET7vB9Ka8bV4/3Qdal8ebP5ZG1VrIus+TSLiU9qDC5
FG/k2vyCvkrFVjY1uboY6x/uH9s+aUNNy0OK5YBpXJWHL29n1i3GxsHEKINWtubO
EjWPSwNltJZMwLGyAMswdQmydfzRcVEOEB0E2iJothuJ5atxWnQuHS1fO0pSXS9J
BUHZQcNaqlnifvkFjuDbIn3SdaHAlO4UGpFiAd0SZwucWHU0cJikL/zTkeAA07lO
A8sJlOVDlUd8lLxSQz1X3JgG66nZtNOieHUG7CmSEZmwqsL8/lc=
=dTD8
-----END PGP SIGNATURE-----

--TaY6Pwvb1erV6YQH--

