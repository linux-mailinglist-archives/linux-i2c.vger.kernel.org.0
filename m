Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76B39A445C
	for <lists+linux-i2c@lfdr.de>; Sat, 31 Aug 2019 14:13:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbfHaMNL (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 31 Aug 2019 08:13:11 -0400
Received: from sauhun.de ([88.99.104.3]:37720 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726296AbfHaMNK (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 31 Aug 2019 08:13:10 -0400
Received: from localhost (p5486C98B.dip0.t-ipconnect.de [84.134.201.139])
        by pokefinder.org (Postfix) with ESMTPSA id B88592C0093;
        Sat, 31 Aug 2019 14:13:08 +0200 (CEST)
Date:   Sat, 31 Aug 2019 14:13:08 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Eugen.Hristev@microchip.com
Cc:     peda@axentia.se, mark.rutland@arm.com,
        Ludovic.Desroches@microchip.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, pierre-yves.mordret@st.com,
        alexandre.belloni@bootlin.com, robh+dt@kernel.org,
        Nicolas.Ferre@microchip.com
Subject: Re: [PATCH v3 5/9] i2c: at91: add support for digital filtering
Message-ID: <20190831121308.GB1032@ninjato>
References: <1562678049-17581-1-git-send-email-eugen.hristev@microchip.com>
 <1562678049-17581-6-git-send-email-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="V0207lvV8h4k8FAm"
Content-Disposition: inline
In-Reply-To: <1562678049-17581-6-git-send-email-eugen.hristev@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--V0207lvV8h4k8FAm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> diff --git a/drivers/i2c/busses/i2c-at91-core.c b/drivers/i2c/busses/i2c-at91-core.c
> index a663a7a..62610af 100644
> --- a/drivers/i2c/busses/i2c-at91-core.c
> +++ b/drivers/i2c/busses/i2c-at91-core.c
> @@ -68,6 +68,7 @@ static struct at91_twi_pdata at91rm9200_config = {
>  	.has_unre_flag = true,
>  	.has_alt_cmd = false,
>  	.has_hold_field = false,
> +	.has_dig_filtr = false,

Hmm, 'false' is the default. Maybe not for this series, but it might
make sense to clean up the driver afterwards removing the superfluous
'false'. The precedence will make adding new properties much simpler.


> +	dev->enable_dig_filt = of_property_read_bool(pdev->dev.of_node,
> +						     "i2c-dig-filter");
> +

What do you think of the idea to introduce 'flags' to struct i2c_timings
and parse the bindings in the core, too? Then you'd have sth like:

	if (t->flags & I2C_TIMINGS_ANALOG_FILTER)

Would that be useful for you?


--V0207lvV8h4k8FAm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1qZFAACgkQFA3kzBSg
KbZy9Q/+INNWAz3JzNTnt9Wz4LY+CvF0A91qTijGhOFME8qnJRK/bGoupXNI66Nm
mhn3iko1RoOsrBzEI1U4bc86Y6O2dZZMscDU8Kn5GanaK9OzMf9WLnRlapIrKg35
HwC+M+XzDLTkwfFSGBAzA2m+Ud5bS9rzJ8svbrLBLov3x4dka8S+ZwLXH7mpW1b4
80vHk8nqtJ3CUI9wzfUSBqkPxoszergUiqXW39VI12UBmY0BWY7swIcVoehErLvh
o7hWyfuoKyhR+NQHkbcHfa4YAyzwILIzE+7OsYlyQXZvh4Wb2KgbMlyi3OldAvkw
8JFJRHEMAjH9HiLpUr1uV+yabhhi7AxWtx3WEFMc0+/QB4Ed4lSgWKNM9LJmUV4t
nJffamNfsMT6A9oNULQV3VaSYwM7G/f79h/SQLHIgmTjc9v4XXh9EOs5YhYEhfYE
8tWeTOG4Lzg1BCn2FcDBUIChJcp1YKD+e0nsskqt1Sk9GUE6MU64h075JqZ1iDYM
4wloxXGU09C6IahnAhx1HEFDi6Ym+oaWDGGhloqSh4cctuEOO75EaD0A01hEVgtk
o3Qf4dWCC72yeKC5zn7GwTkUTZc66G703dKCXUUnQJ1bljY/8Z4Js2YrDpizfbai
JmBYGOZw5ztqQt0x2N9QW78hvYoK3eotQ0bvwhHqPu59bbHVxbI=
=z8HE
-----END PGP SIGNATURE-----

--V0207lvV8h4k8FAm--
