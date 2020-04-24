Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E93931B716D
	for <lists+linux-i2c@lfdr.de>; Fri, 24 Apr 2020 12:03:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726820AbgDXKDJ (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 24 Apr 2020 06:03:09 -0400
Received: from sauhun.de ([88.99.104.3]:45848 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726289AbgDXKDI (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 24 Apr 2020 06:03:08 -0400
Received: from localhost (p5486CE62.dip0.t-ipconnect.de [84.134.206.98])
        by pokefinder.org (Postfix) with ESMTPSA id A16892C1FE8;
        Fri, 24 Apr 2020 12:03:07 +0200 (CEST)
Date:   Fri, 24 Apr 2020 12:03:07 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     =?utf-8?B?QmrDtnJuIEFyZMO2?= <bjorn.ardo@axis.com>
Cc:     linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        patrick@stwcx.xyz, kernel@axis.com
Subject: Re: [PATCHv2] i2c: slave-eeprom: Make it possible to pre-load eeprom
 data
Message-ID: <20200424100307.GB1959@kunai>
References: <20200424090443.26316-1-bjorn.ardo@axis.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mxv5cy4qt+RJ9ypb"
Content-Disposition: inline
In-Reply-To: <20200424090443.26316-1-bjorn.ardo@axis.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mxv5cy4qt+RJ9ypb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 24, 2020 at 11:04:43AM +0200, Bj=C3=B6rn Ard=C3=B6 wrote:
> If the slave eeprom has a "firmware-name" in devicetree, then
> pre-load the data in the eeprom with this file. Otherwise we
> init the eeprom with 0xFF.
>=20
> Signed-off-by: Bj=C3=B6rn Ard=C3=B6 <bjorn.ardo@axis.com>

I like it a lot, thanks! Maybe we could add a SoB from Patrick for his
0xff-suggestion (but keeping you as the patch author).

Is this okay for everyone?

> ---
>  drivers/i2c/i2c-slave-eeprom.c | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-slave-eeprom.c b/drivers/i2c/i2c-slave-eepro=
m.c
> index cb415b10642f..c846c96c25c9 100644
> --- a/drivers/i2c/i2c-slave-eeprom.c
> +++ b/drivers/i2c/i2c-slave-eeprom.c
> @@ -18,6 +18,7 @@
>   */
> =20
>  #include <linux/bitfield.h>
> +#include <linux/firmware.h>
>  #include <linux/i2c.h>
>  #include <linux/init.h>
>  #include <linux/module.h>
> @@ -120,6 +121,26 @@ static ssize_t i2c_slave_eeprom_bin_write(struct fil=
e *filp, struct kobject *kob
>  	return count;
>  }
> =20
> +static int i2c_slave_init_eeprom_data(struct eeprom_data *eeprom, struct=
 i2c_client *client,
> +					 unsigned int size)
> +{
> +	const struct firmware *fw;
> +	const char *eeprom_data;
> +	int error =3D device_property_read_string(&client->dev, "firmware-name"=
, &eeprom_data);
> +
> +	if (!error) {
> +		int ret =3D request_firmware_into_buf(&fw, eeprom_data, &client->dev,
> +						    eeprom->buffer, size);
> +		if (ret)
> +			return ret;
> +		release_firmware(fw);
> +	} else {
> +		/* An empty eeprom typically has all bits set to 1 */
> +		memset(eeprom->buffer, 0xFF, size);
> +	}
> +	return 0;
> +}
> +
>  static int i2c_slave_eeprom_probe(struct i2c_client *client, const struc=
t i2c_device_id *id)
>  {
>  	struct eeprom_data *eeprom;
> @@ -138,6 +159,10 @@ static int i2c_slave_eeprom_probe(struct i2c_client =
*client, const struct i2c_de
>  	spin_lock_init(&eeprom->buffer_lock);
>  	i2c_set_clientdata(client, eeprom);
> =20
> +	ret =3D i2c_slave_init_eeprom_data(eeprom, client, size);
> +	if (ret)
> +		return ret;
> +
>  	sysfs_bin_attr_init(&eeprom->bin);
>  	eeprom->bin.attr.name =3D "slave-eeprom";
>  	eeprom->bin.attr.mode =3D S_IRUSR | S_IWUSR;
> --=20
> 2.11.0
>=20

--mxv5cy4qt+RJ9ypb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6iuVsACgkQFA3kzBSg
KbZgGRAAhiDjxEOOQhxG7MB/NoVtyB/L03khm7opUem0TQ/whkYlaPZs71KoMcoI
FFpC47PcWm9MdeHNx6TOB3nwR7tjwvvw2OoPjwV+SDovFohfEm0DiHIX2rv/+ewG
hcyVSxk8y2QdMfBD/NCsXGiAGEunPS8HjhiflKGsJwGAgaLzlVwZx92Wy1rMeJDj
QL9z2Y1kumkuaJ6h6KzlImUKthbwRpEBKpLlMNfVwIEwDwFtpceyQcHCz+dGK3Ts
JY2JplVGNjxRqbjBkys9QjHHG80JvBQ4eeZlkuf0c6IQCf1eYythVLYuFW06ofpw
oZ1GkmAhJHRIN5hUPds8dhLUbfwIM5RQ0GfjzCPN8WBqrbNdaQWP0JzwvWC3cSOe
C2WrjXvjEgSNt2rRYXXP/qzsjbjsdaUsolhwsRELF4nTvG+CunT94fkY2J1Iz01G
w4jvqSsXQliXpbRRukKVLoKJLsJ7sjVJSouLb9FUP1vfDQ78UMyTnnQGSyeR7Ovr
0IXujl07RICLOCeANRt6EdtJxPVFhZeXmm1qXJhKALKUl/caPL4Hj9c1xCDaxkpU
MlyldbvE00k7v69w6O8UUQixfJnZquKrL1DkLIE1ef6p7JX8Ujo4ZLzDXuoCU70N
mrgeKXKJtIG5DPNs3iFO7GRb09PN9lIkvTy96jiW/CaCx0NWET0=
=ayzE
-----END PGP SIGNATURE-----

--mxv5cy4qt+RJ9ypb--
