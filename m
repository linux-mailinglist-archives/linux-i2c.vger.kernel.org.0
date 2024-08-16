Return-Path: <linux-i2c+bounces-5456-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id F0897954C96
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 16:39:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 79C73B249B8
	for <lists+linux-i2c@lfdr.de>; Fri, 16 Aug 2024 14:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA86B1BD01F;
	Fri, 16 Aug 2024 14:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="ItLrhkqD"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87D221BCA14
	for <linux-i2c@vger.kernel.org>; Fri, 16 Aug 2024 14:38:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723819128; cv=none; b=VH+qARWTMV9rxgqxpHSeROrzlPVLxarfDym1TERDt9mvV/IalAnLBwyAyrHYLM2nDOehUnHCvMSToya8xulim9jrxzWIRQfZKqr8Dw6aFwrLv7zPG9kfcXBtwyst8mTotpxRSvvC9l1dHLYEitW+pqf0UUH4xx4FBcBFAw9kTzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723819128; c=relaxed/simple;
	bh=Kvw+y0x+EGwRsnoiMAQC0XYdT8SUJROEwjwwZ0tEhjc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gAcD3wR5qdnvOvYFX1cT6/28tZEyz06OQ5jU4uyI/7uxP/ghXHhxPHQZ2WfzFrpe3j8PzcenZE9ECY8MgR6N9CeWDt/nTmBiEmYcJQ4MUAPGILkHxm+/Z/77xuQqp4HybN3GguAByDnn4i4R+M84hsCzsFANFdWr9fd2J3h5MWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=ItLrhkqD; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=Kvw+
	y0x+EGwRsnoiMAQC0XYdT8SUJROEwjwwZ0tEhjc=; b=ItLrhkqD93rZeBkKrh8q
	RGAJbbAx4UdyzPvojyv0xpLa9IOuVXT31ri3WGkZJPe7XjM18iV+FvPY9DPf+Twi
	hHHd+xLR9LytpnQskctMPCGkIwXF1qw5wX4gCkZE1tNbER6k0Toc6xinOWZ0VNc8
	qM5XC1skW93TMvw9voZDtYMT78ZszRPWPPA6c/TP+5kQ5g66XumXsfv4TdQ/y8mj
	JmibC5c3QPJg6qaPcZ8HxdnKy56CqYyVVbCyWNn1lQbiZA4QSOG2q2dw6Eh0CpeR
	uww4rGzGWbanGIXd/IWlEu9ZJ19T2YZwnm99Q9NwjHNjnW04RNyK046f6ZDA7Efx
	CQ==
Received: (qmail 2628081 invoked from network); 16 Aug 2024 16:38:44 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 16 Aug 2024 16:38:44 +0200
X-UD-Smtp-Session: l3s3148p1@sXiN6s0fvLNehhrc
Date: Fri, 16 Aug 2024 16:38:44 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Hans de Goede <hdegoede@redhat.com>
Cc: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
Subject: Re: [PATCH v8 1/6] i2c: core: Setup i2c_adapter runtime-pm before
 calling device_add()
Message-ID: <Zr9kdHSj2wl_MO4H@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>,
	Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>, Wolfram Sang <wsa@kernel.org>,
	eric.piel@tremplin-utc.net, Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>, linux-i2c@vger.kernel.org
References: <20240812203952.42804-1-hdegoede@redhat.com>
 <20240812203952.42804-2-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XhNpWf/lHsbYrC4F"
Content-Disposition: inline
In-Reply-To: <20240812203952.42804-2-hdegoede@redhat.com>


--XhNpWf/lHsbYrC4F
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 12, 2024 at 10:39:47PM +0200, Hans de Goede wrote:
> Platform glue code, which is not build into the kernel and thus cannot
> use i2c_register_board_info() may want to use bus_register_notifier()
> to listen for i2c-adapters to show up on which the platform code needs
> to manually instantiate platform specific i2c_clients.
>=20
> This results in calling i2c_new_client_device() from the bus notifier
> which happens near the device_add() call.
>=20
> If the i2c-core has not yet setup runtime-pm (specifically the
> no-callbacks and ignore-children flags) for the device embedded
> inside struct i2c_adapter and the driver for the i2c_client
> calls pm_runtime_set_active() this will trigger the following
> error inside __pm_runtime_set_status():
>=20
> "runtime PM trying to activate child device %s but parent (%s) is not act=
ive\n"
>=20
> and the i2c_client's runtime-status will not be updated.
>=20
> Split the device_register() call for the adapter into device_initialize()
> and device_add() and move the pm-runtime init calls inbetween these 2 cal=
ls
> so that the runtime-status can be correctly set when a driver binds from
> the bus-notifier.
>=20
> Note the moved pm-runtime init calls just override the initial value of
> some flags in struct device set by device_initialize() and calling these
> before device_add() is safe.
>=20
> Reviewed-by: Pali Roh=C3=A1r <pali@kernel.org>
> Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Acked-by: Wolfram Sang <wsa+renesas@sang-engineering.com>


--XhNpWf/lHsbYrC4F
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAma/ZHMACgkQFA3kzBSg
Kbb44RAArCNTA8JfDxMf8muwYQfDG8hyZu4G6VQcW9Yo9zqQYmvwSf2SU3rmgtEs
eKV2xJf7mfjgkgtXgkJQtvygMSaSRwvO0GSFTyqTJeXx9yxb2BkTQkVSW516H/os
E36hUpJzfzlaTCzfRWUK4OgiaSQBjw9jmlI3xcrLoM4M0GzJgl44n7Hjtdd5IsUU
fuToWvrimbTG6CoJc/2d2yd8F4vvil3PkUuCceLybnDhL4ueUqq1IL3hDQpKQaqc
voyrtqWnR+4g51wlQX25yGTTEXLp/yv21/YQjWHF9eQM3RWT2nRaKnb1o/XqRPXS
J3X8EGUTnkO5q7Msr0AAnqk6OJii05XXg29bavosOGi4QkRPf0Om+huaLPmAERNr
3nQHvFxYBf0ucKDtfmi8XncstsPJPNo8l/tm9U19tnK9MoRuJpsunGiU32M8hDA+
O/Qy0mrAlxp6LaXxTDluUM3WM6IFbmWqx9dZ8w64vd8KDT3ZZXTdmrgW8Qz8Aj8s
b0PM379qZG7ubRQb5G1fvZj9DsbO8PDa3+56atQUTatXJ6ePy6lBtyl8Ge4KKdM6
Q+DqkRHIin0/mO/dDlftzO3KkQOgzW7asnGhM7Fdg60Q6jQZbkic2TtpBnhAYDNh
iid4CQ4NVpAvG7HOCmE2VfcNZm9xeJB9kTH/euu9dqCbyVion2I=
=f7hJ
-----END PGP SIGNATURE-----

--XhNpWf/lHsbYrC4F--

