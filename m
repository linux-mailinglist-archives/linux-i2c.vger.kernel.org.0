Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E399923E9CC
	for <lists+linux-i2c@lfdr.de>; Fri,  7 Aug 2020 11:08:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726835AbgHGJId (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 7 Aug 2020 05:08:33 -0400
Received: from mail.kernel.org ([198.145.29.99]:43542 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726721AbgHGJId (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 7 Aug 2020 05:08:33 -0400
Received: from localhost (hotsplots-fix3-ip188.cust.syseleven.net [176.74.57.188])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0F50F2177B;
        Fri,  7 Aug 2020 09:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1596791312;
        bh=WijHsodHqtnCP5/rgxNo/ZjMXudI1XgmV8xvUB+T1K0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KX5bhMY1f6m04DEyivCfBRu249ZQoVzGPGLD45+TbMf9NQxd4SvEID3DIhsfS9Ew6
         5SAQxrtGyMzwALMyqBC7i90aImmyvU743HqxKVNlkA2+Kbc5CW9zJUCwd05FEuBISa
         U37apypEz9NqCiFCubPEMrdMigoKpzahJs7lPZz0=
Date:   Fri, 7 Aug 2020 11:08:19 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Stephen Kitt <steve@sk2.org>
Cc:     Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon/pmbus: use simple i2c probe function
Message-ID: <20200807090819.GA1178@kunai>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
        Stephen Kitt <steve@sk2.org>, Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200807074526.14334-1-steve@sk2.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="jI8keyz6grp/JLjh"
Content-Disposition: inline
In-Reply-To: <20200807074526.14334-1-steve@sk2.org>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--jI8keyz6grp/JLjh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 07, 2020 at 09:45:26AM +0200, Stephen Kitt wrote:
> pmbus_do_probe doesn't use the id information provided in its second
> argument, so this can be removed, which then allows using the
> single-parameter i2c probe function ("probe_new") for probes.
>=20
> This avoids scanning the identifier tables during probes.
>=20
> Drivers which didn't use the id are converted as-is; drivers which did
> are modified as follows:
>=20
> * if the information in i2c_client is sufficient, that's used instead
>   (client->name);
> * configured v. probed comparisons are performed by comparing the
>   configured name to the detected name, instead of the ids; this
>   involves strcmp but is still cheaper than comparing all the device
>   names when scanning the tables;
> * anything else is handled by calling i2c_match_id() with the same
>   level of error-handling (if any) as before.
>=20
> Signed-off-by: Stephen Kitt <steve@sk2.org>

I haven't checked the patch in detail, just saying that the bulk move to
probe_new is much appreciated, so:

Acked-by: Wolfram Sang <wsa@kernel.org>

One thing hit my eye, though:

>  	if (md)
>  		vs =3D (enum versions)md;
> -	else if (id)
> -		vs =3D (enum versions)id->driver_data;
> +	else {
> +		id =3D i2c_match_id(ibm_cffps_id, client);
> +		if (id)
> +			vs =3D (enum versions)id->driver_data;
> +	}

Missing braces in the if-block here. 'checkpatch --strict' warns about
it:

CHECK: Unbalanced braces around else statement
#230: FILE: drivers/hwmon/pmbus/ibm-cffps.c:490:
+	else {


--jI8keyz6grp/JLjh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8tGf8ACgkQFA3kzBSg
KbZtdQ//b6QcvjufNTyaIcrB11DAmaaNphofvN8pX8/NguRQq15dYnf4wb6AYQvI
dOGzvZUET9zP0F/uAaIdJ1fa9BhlGWyqOSLJtvenNl9hun6qvt9TxwD6JawGM4Rz
Nq0GLUHQyXU/h7T15KdcB3aPZFML6cxdMLejWQwjdyHQQlYPywacja2yD+L/cESv
pr+++u+k/HAAbQYoJzZswh0Q64g4mDoi06xmRhEYqMsqXGyXqDzyjEku4MNa/zpQ
g+Rm4aKcrLUuhxl/s2jTO777C4pUYa8Spufzaa/BCxaZn2xF9kHU2JY3lJ0toY2l
plnnbRyGrcJW/Vt1BEX1AJ8WHiMAW43ZkYAlNkbj3SlCJh40Dji8CiQEPRfxrhrb
yPXght7ikhLcRHy9kMOkhzeprFEVsVpUArqSoujGdvRwfAOSRtGFyUN1ruMnJB6B
911z2L72UcLHqn0O487n9T1YtOSrOSLGQ0kiZ64ADIrg7G8A68A8M5DQt2C3tYNm
TPYA1Q3++tsvV/3F0zrZ2edsgh2N68V2+OCA/TQFVtu7mY7hGXr1hKy33guSKenI
NGF7ERGKqe6Md+AF8ULADG37RbAKDM1EJtZ4KO5vQOfcGl7xRrE5uKPNcFKkisEy
0ONOHdwPmNkBhYs6e2K+x64WIZg8hJAwS5NSbSl9pPq3gcV0dTk=
=9cuk
-----END PGP SIGNATURE-----

--jI8keyz6grp/JLjh--
