Return-Path: <linux-i2c+bounces-5081-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7166E93FD75
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 20:37:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 269FD1F22FEE
	for <lists+linux-i2c@lfdr.de>; Mon, 29 Jul 2024 18:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A87191741D1;
	Mon, 29 Jul 2024 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BWH1A0T/"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB85416B38D
	for <linux-i2c@vger.kernel.org>; Mon, 29 Jul 2024 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722278214; cv=none; b=P+5SSGhZ/BZshUGfnVrRfhasTEdzSgNPTLkBYoyuLbjJTjAj9mNKsii5+4dfgV28iDpcpg4XWkJ4U4rAUox9X3T5535lsKGq6E5pt+GwbfccyR6LB3lh9rAFSHZPtDPx7Zh/QjJVxkRxQJ148p58Ui3aWRrKKGD5A8BKw7Ytfa8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722278214; c=relaxed/simple;
	bh=fr+JfuJm+bjiKMoLBud2oV/F/QCCmRiMLsIYsCUX72w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qQgwQ/y1fXvof8PQFKDZu7FK5G8IBCYNCiZQFUC5+Aq/enbToS15Za5o8pSf8FkyRHI4C7v7Ru5F8MgziJniHp/dBd6NiBketzR7XthcH17NZZ6lEm2J5yKJvhfInLWiYBVfw3/tGhdYYKB0far8q9QS4wWrtSZTDP0Ci6MOzNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BWH1A0T/; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=WM7j
	/Nz0IYoOo0rJpSmA6WecCCjMJ2XQqYM1ZPm+cZg=; b=BWH1A0T/X10Z15OpscZV
	PoTDIbPbGyi9GLOQEdtnECkh4g6xwzs1WWj9FExVAKf3bf0SNoso/g12l7071vx0
	nz2YlxMt5biXIGSPyfYU7ZYjMPoOQlUHU/nJl+27TDV1HGuW3IlU1bSHofVypDTL
	chJQDC9l1qPar4p41MSJ0f8MZ1FE3qoyKQ4sOGj9YiqH+90f4hUgG63+yWNAm9G4
	Ihtn4SeIpCKgabV8xjVLUC3wxfZsHXinnigDiFgAWafJGETtoWf1k7glPyAUr8oD
	v1Nm9ve3UYaNX8maY5SFpw7heebwYZICMNIdTGkeQ3vo9sak1mfsZuOWNw7qx5e8
	5w==
Received: (qmail 4181966 invoked from network); 29 Jul 2024 20:36:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 29 Jul 2024 20:36:46 +0200
X-UD-Smtp-Session: l3s3148p1@FiKyJGceChBtKPLj
Date: Mon, 29 Jul 2024 20:36:45 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
Message-ID: <ZqfhPffOTu53bfwU@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net>
 <ZqakaAn3f9Kg6Lgy@shikoro>
 <7ad68f35-2e90-41b7-a95d-efe5f7db8f3b@roeck-us.net>
 <ZqdLVg6IVTjsTWb4@shikoro>
 <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SatQlZRllKaPm3CA"
Content-Disposition: inline
In-Reply-To: <3adf0b8f-2e12-413a-a76f-866e56bf096c@roeck-us.net>


--SatQlZRllKaPm3CA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I looked into the code again. The sequence is (or is supposed to be):
>=20
> 1st loop:
> 	if (!alert_pending)
> 		break;
> 	smbus_do_alert()
> 	if (failed at same address)
> 		smbus_do_alert_force()
>=20
> 2nd loop:
> 	if (!alert_pending)
> 		break;
> 	smbus_do_alert()
> 	if (failed at same address)
> 		break;
>=20
> I think what you are suggesting is
=2E..

What I am suggesting is more like this:

1st loop:

 	smbus_do_alert()
	//impossible to have same address on first run, so go to 2nd loop

2nd loop:

 	smbus_do_alert()
 	if (failed at same address)
 		smbus_do_alert_force()
		break;

As I understand it, your sequence is missing "my" 1st loop with the
invalid address, so you will end up having 3 loops altogether?

The code I am suggesting is bascially yours without the retries
variable:

	status =3D device_for_each_child(&ara->adapter->dev, &data,
				       smbus_do_alert);
	if (data.addr =3D=3D prev_addr && status !=3D -EBUSY) {
		device_for_each_child(&ara->adapter->dev, &data,
				      smbus_do_alert_force);
		break;
	}
	prev_addr =3D data.addr;

Makes sense or am I missing something?


--SatQlZRllKaPm3CA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAman4ToACgkQFA3kzBSg
KbZQvw/9F5lbiww0Xfg7WZZfvQ7GcaO7jV4QqnCLnyqiE9gBqQyCvpOdTawdwvUi
j4JuArRTYTwbQiwPW5eJvj6P8LvGdprqnT/8/y5fW8MX27UG1ARDVvgzKrvyCzWC
lJ2RxHGgd/3wyoVBLDJIx1PzvYPGDd5dhmRHqD+rNnanDHiKeFxVq6yxVvSpv0bV
zP3zDLXh/pDabo4/TakQdEe2kpM8GZw2MkKwcChkt3LCae6NTWJNicnXf20BNIZO
Na3jr13V3VXONsDZMrGvfqK/c7x8+EC5Fg+lRxIwEty+5W6tGZkpKZZHrN87hNlH
czh8z0I6xxsW5J/++WKM3ODb37SytmbNrS3VhftvHz76Gq8qitMmt5mwjKbxsiat
cNtqGb8EB0YzThMRu8M2Hcyes3AkxHPOGaZwVl91JLrG4YO+rUYL/n10H2TcvIBz
YGNCDl7yiwNvQBIs48LCdNIrLjYxzugEpWGoNH2f20PvGqhmgQRfyd8nNYXVcVQ2
sxV+KAVnPL8cvtFALu4Ix2yN6EKkaKj1NJA9tx4cULuXR7EUREO/pbD4caF9Khp/
5Z05Pr2v/hF3hRdYdf1hq6376LGk/A9TpZgbKYquCf41Z4QG5Ta7HYaz02NwSJkE
tB/zv4vG2l/Y2RWHb9pxGA8a5We6zsOeQah+YtHK7+lxgdWoCIM=
=LXkU
-----END PGP SIGNATURE-----

--SatQlZRllKaPm3CA--

