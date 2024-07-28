Return-Path: <linux-i2c+bounces-5072-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5796C93E927
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 22:01:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 978BE281831
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 20:01:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F17674429;
	Sun, 28 Jul 2024 20:01:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="H3Y6Ur5H"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96FEC8C07
	for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2024 20:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722196889; cv=none; b=GHKlWSln+yv+sE4ZVAioonhGBD5bBPKMqNsLPswxY6C3XaCmegG3t8r6HHVQ0+34XsiZl+WCO+uZVnxBAgvISnpXsDAG80U+cN9sov+iTi2nL+YZaZVhX0OT82xH+RjfJrmfylVAmYESdzWZqnroGEV/9UX6CPNJJud1mCEgUEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722196889; c=relaxed/simple;
	bh=zPSWUF8DIbtCzjRK9QyKoTnPDzXgvbR/9GHtQw41jfg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uG1X4yMIdt0Qxh2F9tGIZ4ZCDlkdSp9jANC3rDRkZtLoZdzLxx2k9HWjT9rxQD+VmuYHHx0v8sYIhNjySayc3XNojVX5u0WQ5JDDh0I6IW66ffoayI2uOHIPZroPUZArzGbawixcffQ8/2T7XInATXZ2jM/I+b8ZH0lHVbuUjtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=H3Y6Ur5H; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=pvmQ
	QaoSvTy7QHHigFoz0nPoAbE0wHPyo8o+AfL1TiI=; b=H3Y6Ur5H1qbToQCJLeXt
	pvdFy6EIQZTs8kTU+6xM0W9gN3GaZREngENgUKkrVjVgkBRsi9gzl177QMIIIlit
	pH+z9q/lm12Wkdxr8+ACa4F213nBJ9H4N/cu7T30KkYMH9Ymil6giWJSHFj10sxd
	cDQu4w8z6cVuUXaaM018ij6JM5F6S2zpRmxdklTYEBU8cnleD+ByukFxSxXpCMme
	DeQBQYpZBf9G2/QcjF+ABx6LenfqYzCdA6S1+1AYfaN83/p+WCoqTfwZdd4J68xO
	8+zcj6f/JOmnq5YEdyI3fWMl7kcnrq3YwJ6VwUoCHqpt1O/9ZTxsbSxYhTZMkxUQ
	9w==
Received: (qmail 3889073 invoked from network); 28 Jul 2024 22:01:23 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2024 22:01:23 +0200
X-UD-Smtp-Session: l3s3148p1@XmR0NVQeqocujnsv
Date: Sun, 28 Jul 2024 22:01:22 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: smbus: Improve handling of stuck alerts
Message-ID: <ZqajkhSiuJ23DCUP@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-2-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a5++JZhERmkMviZn"
Content-Disposition: inline
In-Reply-To: <20220110172857.2980523-2-linux@roeck-us.net>


--a5++JZhERmkMviZn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 09:28:56AM -0800, Guenter Roeck wrote:
> The following messages were observed while testing alert functionality
> on systems with multiple I2C devices on a single bus if alert was active
> on more than one chip.
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
>=20
> and:
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x28, flag 0
>=20
> Once it starts, this message repeats forever at high rate. There is no
> device at any of the reported addresses.
>=20
> Analysis shows that this is seen if multiple devices have the alert pin
> active. Apparently some devices do not support SMBus arbitration correctl=
y.
> They keep sending address bits after detecting an address collision and
> handle the collision not at all or too late.
> Specifically, address 0x0c is seen with ADT7461A at address 0x4c and
> ADM1021 at address 0x18 if alert is active on both chips. Address 0x28 is
> seen with ADT7483 at address 0x2a and ADT7461 at address 0x4c if alert is
> active on both chips.
>=20
> Once the system is in bad state (alert is set by more than one chip),
> it often only recovers by power cycling.
>=20
> To reduce the impact of this problem, abort the endless loop in
> smbus_alert() if the same address is read more than once and not
> handled by a driver.
>=20
> Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

It fixed the interrupt storm for me and I like the approach. I'd apply
it to for-current once rc1 is released. Two minor changes, though.

> ---
>  drivers/i2c/i2c-smbus.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index d3d06e3b4f3b..533c885b99ac 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -34,6 +34,7 @@ static int smbus_do_alert(struct device *dev, void *add=
rp)
>  	struct i2c_client *client =3D i2c_verify_client(dev);
>  	struct alert_data *data =3D addrp;
>  	struct i2c_driver *driver;
> +	int ret;
> =20
>  	if (!client || client->addr !=3D data->addr)
>  		return 0;
> @@ -47,16 +48,21 @@ static int smbus_do_alert(struct device *dev, void *a=
ddrp)
>  	device_lock(dev);
>  	if (client->dev.driver) {
>  		driver =3D to_i2c_driver(client->dev.driver);
> -		if (driver->alert)
> +		if (driver->alert) {
>  			driver->alert(client, data->type, data->data);
> -		else
> +			ret =3D -EBUSY;
> +		} else {
>  			dev_warn(&client->dev, "no driver alert()!\n");
> -	} else
> +			ret =3D -EOPNOTSUPP;
> +		}
> +	} else {
>  		dev_dbg(&client->dev, "alert with no driver\n");
> +		ret =3D -ENODEV;
> +	}
>  	device_unlock(dev);
> =20
>  	/* Stop iterating after we find the device */

I moved this comment up where -EBUSY is assigned to 'ret'.

> -	return -EBUSY;
> +	return ret;
>  }
> =20
>  /*
> @@ -67,6 +73,7 @@ static irqreturn_t smbus_alert(int irq, void *d)
>  {
>  	struct i2c_smbus_alert *alert =3D d;
>  	struct i2c_client *ara;
> +	unsigned short prev_addr =3D 0;	/* Not a valid address */

I used I2C_CLIENT_END as an invalid address. We use it for the same
purpose in other parts of the core as well.

> =20
>  	ara =3D alert->ara;
> =20
> @@ -94,8 +101,19 @@ static irqreturn_t smbus_alert(int irq, void *d)
>  			data.addr, data.data);
> =20
>  		/* Notify driver for the device which issued the alert */
> -		device_for_each_child(&ara->adapter->dev, &data,
> -				      smbus_do_alert);
> +		status =3D device_for_each_child(&ara->adapter->dev, &data,
> +					       smbus_do_alert);
> +		/*
> +		 * If we read the same address more than once, and the alert
> +		 * was not handled by a driver, it won't do any good to repeat
> +		 * the loop because it will never terminate.
> +		 * Bail out in this case.
> +		 * Note: This assumes that a driver with alert handler handles
> +		 * the alert properly and clears it if necessary.
> +		 */
> +		if (data.addr =3D=3D prev_addr && status !=3D -EBUSY)
> +			break;
> +		prev_addr =3D data.addr;
>  	}
> =20
>  	return IRQ_HANDLED;
> --=20
> 2.33.0
>=20

--a5++JZhERmkMviZn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmamo5IACgkQFA3kzBSg
KbaRVhAAnNX1M4WY3qpvS+VfmfeXldzGYw1YbUTj58Y/s84jrUHP+cx9P1OUnsu8
dgUSuoa0p75/x5MYOzKqgogCIqwua/7Lc5gRKe7dt8DcRigb/FfBWiU9ePYeJTCW
wbIsBcyq2iv6U6Qwg/jM6rDE2a3JyxO3EuDx7oFh9Hu/aJLjB5RsDICAHqXSOncQ
CkKtNyOIIl/7XnfCLu5FOCWgDFCaEiWsfYlJShZC9g1CnSVwE0vNonSvwoTIdG9T
l6kGuiAG30zgeD2yxIOcl8rloo5mLDfIGXG+/8pFeRzZsJxb2H0v1aRsqVFVLXVl
jjxU66O2ZbQ8IddteM7Mu8UMgtg+6oBddskye21Y9Qf4pltm5cORcnrBZy9W8hCQ
sCsu8pYKjgxUbw5fbrCkQq/VNOiEIJnPoSTB3J+7Wpqp65aX2amIZCRLC76g0va+
pcIeZSaBmH2CD4+m0ca2WAfswrr58lByTdQdtFNxCE1drWB686Plx0tS2TLY8cwT
zpaFksloRDrn4yZFHVUrg9Q5Uyky01opREy1HvglTCdeds3QGYc7iMyWafldkSr3
jQa8ViuQB4m8F78+RPp9zH4eyH7xxxFZYb+0R1Uzj/4Pb1Xq7eYj2zTMC6pHwn1O
ISEz+eXsR7rfxICet6i6rKOy3UcFZgpePb7DNHL8R1KNf5pcOcg=
=pjGw
-----END PGP SIGNATURE-----

--a5++JZhERmkMviZn--

