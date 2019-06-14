Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3707F46BFF
	for <lists+linux-i2c@lfdr.de>; Fri, 14 Jun 2019 23:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726297AbfFNVkK (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 14 Jun 2019 17:40:10 -0400
Received: from sauhun.de ([88.99.104.3]:57478 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725809AbfFNVkJ (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 14 Jun 2019 17:40:09 -0400
Received: from localhost (p5486CF81.dip0.t-ipconnect.de [84.134.207.129])
        by pokefinder.org (Postfix) with ESMTPSA id AA8282CF690;
        Fri, 14 Jun 2019 23:40:06 +0200 (CEST)
Date:   Fri, 14 Jun 2019 23:40:05 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Roese <sr@denx.de>
Cc:     linux-i2c@vger.kernel.org, devicetree@vger.kernel.org,
        Jan Breuer <jan.breuer@jaybee.cz>,
        John Crispin <john@phrozen.org>,
        =?utf-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 2/2 v3] i2c: mt7621: Add MediaTek MT7621/7628/7688 I2C
 driver
Message-ID: <20190614214005.GK17899@ninjato>
References: <20190604113407.8948-1-sr@denx.de>
 <20190604113407.8948-2-sr@denx.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ZG5hGh9V5E9QzVHS"
Content-Disposition: inline
In-Reply-To: <20190604113407.8948-2-sr@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ZG5hGh9V5E9QzVHS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Tue, Jun 04, 2019 at 01:34:07PM +0200, Stefan Roese wrote:
> This patch adds a driver for the I2C controller found on the MediaTek
> MT7621/7628/7688 SoC's. The base version of this driver was done by
> Steven Liu (according to the copyright and MODULE_AUTHOR lines). It
> can be found in the OpenWRT repositories (v4.14 at the time I looked).
>=20
> The base driver had many issues, which are disccussed here:
>=20
> https://en.forum.labs.mediatek.com/t/openwrt-15-05-loads-non-working-i2c-=
kernel-module-for-mt7688/1286/3
>=20
> From this link an enhanced driver version (complete rewrite, mayor
> changes: support clock stretching, repeated start, ACK handling and
> unlimited message length) from Jan Breuer can be found here:
>=20
> https://gist.github.com/j123b567/9b555b635c2b4069d716b24198546954
>=20
> This patch now adds this enhanced I2C driver to mainline.
>=20
> Changes by Stefan Roese for upstreaming:
> - Add devicetree bindings
> - checkpatch clean
> - Use module_platform_driver()
> - Minor cosmetic enhancements
> - Removed IO warpped functions
> - Use readl_relaxed_poll_timeout() and drop poll_down_timeout()
> - Removed superfluous barrier() in mtk_i2c_reset()
> - Use i2c_8bit_addr_from_msg()
> - Added I2C_FUNC_PROTOCOL_MANGLING
> - Removed adap->class =3D I2C_CLASS_HWMON | I2C_CLASS_SPD;
>=20
> Signed-off-by: Stefan Roese <sr@denx.de>

Mostly good, really minor nits left.

> +config I2C_MT7621
> +	tristate "MT7621/MT7628 I2C Controller"
> +	depends on (RALINK && (SOC_MT7620 || SOC_MT7621)) || COMPILE_TEST
> +	select OF_I2C

OF_I2C is gone since 2013. Didn't Kconfig complain?

> +
> +#define MT76XX_I2C_INPUT_CLOCK	40000000

Add a comment here explaining that this is a temporary solution until
proper clock support is added?

> +	ret =3D readl_relaxed_poll_timeout(i2c->base + REG_SM0CTL1_REG,
> +					 val, !(val & SM0CTL1_TRI),
> +					 10, TIMEOUT_MS * 1000);

Yay, much better.

> +	if (i2c->bus_freq =3D=3D 0) {
> +		dev_warn(i2c->dev,
> +			 "clock-frequency 0 not supported, using 1\n");
> +		i2c->bus_freq =3D 1;
> +	}

A bus frequency of 1 Hz does neither make much sense. -EINVAL because
there is surely something broken then?

> +MODULE_AUTHOR("Steven Liu <steven_liu@mediatek.com>");

His address is known to be broken!

Regards,

   Wolfram


--ZG5hGh9V5E9QzVHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl0EFDUACgkQFA3kzBSg
KbaYmA/+Pk6EKiOklBWcrEM5rmp8OdZhk8Ay7VVs38Pb1pA/qvkrfmDt8EIFdFoB
ysgnrGUCARrMMYfU1xxOay5C2ZedQq0hT8y+aB5YVYRE+cOL54Y76YmzvH4+0/Qf
16za7WVLKalegbM216SHbh+uitHY8JMB/Lwl1AwCyK75ZTZRwLfsmqFSPXqkwaG/
q3hSVWSRAx7z4dELYAbKfgwPwhJ7G9uFq7bn3mNFXWZ0tMv/MN3FZFmNEvhGWwry
ZQC9zCUstll30i/BaELNqlFTlGKN2JWPLlS+DQSbcFd2CwzS/x/m5ddS2C35KU5X
vWrOJCPmAnxrioR45zYfEtqaKJTuXY+tf52BPolrIRpYef8Boa0T+uEhKe+yYNRW
ohc6AOxW8ocRiS/+ZyWldY6QPUnEAj1mjd0D92QoiR4nF9xjYJxnfkNVZ6OvWkn/
9Atr1jSExJpnxqXDKAQHmMBjwK2WVPkSwIz4wHDi/yBi2xYQzQZxZqHRRwO5cHA5
t5463LR4f1wDFzl3N3V7cxH+aapBUueRLlpeRmzal6RwNfwPNExPklwZS0iiz/32
VbocpSRk6SV7iOIQW/NhJZpWOV6GrpTBwZ2PLM/Ff8oQ7mb+YzaSb82zzTVMgS8S
MJ/7b8ZxR4gEtSM/7q4/i+ttK4BFGqn7jCtIm6Cd8eZ2WOCo1T8=
=uD5t
-----END PGP SIGNATURE-----

--ZG5hGh9V5E9QzVHS--
