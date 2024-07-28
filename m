Return-Path: <linux-i2c+bounces-5073-lists+linux-i2c=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B628593E928
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 22:05:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 556831F2162E
	for <lists+linux-i2c@lfdr.de>; Sun, 28 Jul 2024 20:05:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 291FB55886;
	Sun, 28 Jul 2024 20:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="eQU+gg7x"
X-Original-To: linux-i2c@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C116E22071
	for <linux-i2c@vger.kernel.org>; Sun, 28 Jul 2024 20:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722197101; cv=none; b=S0E9qWMO1VduqwPpOjAH+/tJjhJMH+1fUt5WgvG6DldtD27p9bbuAT9otLgG0bjdTZubVh2kp0/SvRwybyXXS4Vw6IKuj/XntBEsYL+L5Es1tFgm9Ze0GiMl4sXEvN826rSZ5GW5FIewKMvaDqs4et12RCeRCaAP85SDmA7lBa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722197101; c=relaxed/simple;
	bh=Bsj0UcPfpB7hsVmHQPrCq7EkmORTzj6ABABBOiIL6PA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WNJ4u2JPmd7rJACXCY0g/UBoH562n7qS79OuDys0+uiCaMujmLpGBO/KUzDC6jeUWhzbRby13DPn+UrfUTb6OoCa0v7qG4OPlbpcTpZUQvqALwmDtPNVY82C6Co3lBVo8w9MFyc9mHUuCCbnwsU7WkPDdnbbeT95DVQO+thwjBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=eQU+gg7x; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=MCvo
	EexRWvzr5vwoIEx3DiejdjXigMU83QfwTn8Akzk=; b=eQU+gg7xBDtm1ujcr+iJ
	JMWH4PcWdQZvChMN6yRg6FRz8IJP/eQKH/HWYMusdRZjegszXDpJXr198nT3CvjP
	lungRmbJEmMzdtLAfsi7/TNTbR/O/Sy8uN+J+hLWEcE/BBxrKVOE9sUcMcSPKlBU
	pMOSgJPCEtz551LAWByu+cZwitJxRLQPkfYnRU3wTBCes1pn39NeAzhZNAAbdv1H
	uRU9mobrcdzPyRt9mp1fmyr+4r7R4pzpS8nVEBg0NrQu86Ynx4AiUiAogbRw8CfG
	HORoAtaXhjqrXzU01Nmycv1hPXsK+eESj4IfQOaFEK26jQ6DQvYODryAznHQXcX2
	3Q==
Received: (qmail 3889717 invoked from network); 28 Jul 2024 22:04:57 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 28 Jul 2024 22:04:57 +0200
X-UD-Smtp-Session: l3s3148p1@1QI0QlQeFo4ujnsv
Date: Sun, 28 Jul 2024 22:04:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Wolfram Sang <wsa@kernel.org>, Jean Delvare <khali@linux-fr.org>,
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] i2c: smbus: Send alert notifications to all devices
 if source not found
Message-ID: <ZqakaAn3f9Kg6Lgy@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Guenter Roeck <linux@roeck-us.net>, Wolfram Sang <wsa@kernel.org>,
	Jean Delvare <khali@linux-fr.org>, linux-i2c@vger.kernel.org,
	linux-kernel@vger.kernel.org
References: <20220110172857.2980523-1-linux@roeck-us.net>
 <20220110172857.2980523-3-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-i2c@vger.kernel.org
List-Id: <linux-i2c.vger.kernel.org>
List-Subscribe: <mailto:linux-i2c+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-i2c+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8IlNrYKcF1dSXsNz"
Content-Disposition: inline
In-Reply-To: <20220110172857.2980523-3-linux@roeck-us.net>


--8IlNrYKcF1dSXsNz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 10, 2022 at 09:28:57AM -0800, Guenter Roeck wrote:
> If a SMBUs alert is received and the originating device is not found,
> the reason may be that the address reported on the SMBus alert address
> is corrupted, for example because multiple devices asserted alert and
> do not correctly implement SMBus arbitration.
>=20
> If this happens, call alert handlers on all devices connected to the
> given I2C bus, in the hope that this cleans up the situation. Retry
> twice before giving up.

High level question: why the retry? Did you experience address
collisions going away on the second try? My guess is that they would be
mostly persistent, so we could call smbus_do_alert_force() right away?

>=20
> This change reliably fixed the problem on a system with multiple devices
> on a single bus. Example log where the device on address 0x18 (ADM1021)
> and on address 0x4c (ADM7461A) both had the alert line asserted:
>=20
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
> smbus_alert 3-000c: SMBALERT# from dev 0x0c, flag 0
> smbus_alert 3-000c: no driver alert()!
> lm90 3-0018: temp1 out of range, please check!
> lm90 3-0018: Disabling ALERT#
> lm90 3-0029: Everything OK
> lm90 3-002a: Everything OK
> lm90 3-004c: temp1 out of range, please check!
> lm90 3-004c: temp2 out of range, please check!
> lm90 3-004c: Disabling ALERT#
>=20
> Fixes: b5527a7766f0 ("i2c: Add SMBus alert support")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/i2c/i2c-smbus.c | 38 ++++++++++++++++++++++++++++++++++++--
>  1 file changed, 36 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-smbus.c b/drivers/i2c/i2c-smbus.c
> index 533c885b99ac..f48cec19db41 100644
> --- a/drivers/i2c/i2c-smbus.c
> +++ b/drivers/i2c/i2c-smbus.c
> @@ -65,6 +65,32 @@ static int smbus_do_alert(struct device *dev, void *ad=
drp)
>  	return ret;
>  }
> =20
> +/* Same as above, but call back all drivers with alert handler */
> +
> +static int smbus_do_alert_force(struct device *dev, void *addrp)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct alert_data *data =3D addrp;
> +	struct i2c_driver *driver;
> +
> +	if (!client || (client->flags & I2C_CLIENT_TEN))
> +		return 0;
> +
> +	/*
> +	 * Drivers should either disable alerts, or provide at least
> +	 * a minimal handler. Lock so the driver won't change.
> +	 */
> +	device_lock(dev);
> +	if (client->dev.driver) {
> +		driver =3D to_i2c_driver(client->dev.driver);
> +		if (driver->alert)
> +			driver->alert(client, data->type, data->data);
> +	}
> +	device_unlock(dev);
> +
> +	return 0;
> +}
> +
>  /*
>   * The alert IRQ handler needs to hand work off to a task which can issue
>   * SMBus calls, because those sleeping calls can't be made in IRQ contex=
t.
> @@ -74,6 +100,7 @@ static irqreturn_t smbus_alert(int irq, void *d)
>  	struct i2c_smbus_alert *alert =3D d;
>  	struct i2c_client *ara;
>  	unsigned short prev_addr =3D 0;	/* Not a valid address */
> +	int retries =3D 0;
> =20
>  	ara =3D alert->ara;
> =20
> @@ -111,8 +138,15 @@ static irqreturn_t smbus_alert(int irq, void *d)
>  		 * Note: This assumes that a driver with alert handler handles
>  		 * the alert properly and clears it if necessary.
>  		 */
> -		if (data.addr =3D=3D prev_addr && status !=3D -EBUSY)
> -			break;
> +		if (data.addr =3D=3D prev_addr && status !=3D -EBUSY) {
> +			/* retry once */
> +			if (retries++)
> +				break;
> +			device_for_each_child(&ara->adapter->dev, &data,
> +					      smbus_do_alert_force);
> +		} else {
> +			retries =3D 0;
> +		}
>  		prev_addr =3D data.addr;
>  	}
> =20
> --=20
> 2.33.0
>=20

--8IlNrYKcF1dSXsNz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmampGgACgkQFA3kzBSg
KbarNRAAhWYjGkjFtwzTbgUtNhqIATHVLIeMeWA7bhONRowH4/pbEA6JNyjJrC82
JN4ai+YA7v8dEohlyEqRmUWcNGbDR5JmkIHG8uPMP0c19FwgrgVjmdSRsCvXODg0
AcWAsUi8uXdCdxKRVIYtnUOqgF/u9/dq6sHw8+kccZR6ZXhJkN46UJinwGXGPprt
vV53P4h1eaMjOwtnWV69SxZ/xj7wxVdWkYXSmsx1fuFBp2dy8mHikWNsqcRix7Ll
XS8U+To92H4CzV6jE9oP2wROOC0z/wmtVnQnceU1C7VVP3/Jr7GG5qoHIXw4KfAC
21vdRVptUB8e6VWEzx/dhDx4ChziILDl25FFAzd/oy2dFOaqcWTfs0i63g/galVb
hjhVLHk8xdayovt8n0XJcRvTwC+S6Ks8rc9CxwXmCXUj1A9QiR61Dgf4yKHwbsqF
95q6NtSvtK8BNS3yEAg1TOyEVKP9Zzl3thoewNZblvVgFML3O7do3waw/CK+eehE
VAIqd4gEaXD7+xft81GD6Va0VVwxQHARTAxsPfTsQ92mmKAqgDkcyV4KXs3ykrek
wubj5YvaGb0+4jy+1mB3vHNcQ2GiWv0gRQA9cN3zi6tRnMpRJ/OB4PEHNOVsqxAe
Nriy8sHbVLTH494ohgZKuGJcUXbuPQ5+rsmrHEy0HiQ+xJJi3UY=
=tMwr
-----END PGP SIGNATURE-----

--8IlNrYKcF1dSXsNz--

