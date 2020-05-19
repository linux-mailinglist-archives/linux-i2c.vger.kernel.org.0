Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 474C21D907D
	for <lists+linux-i2c@lfdr.de>; Tue, 19 May 2020 08:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728183AbgESG7k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 19 May 2020 02:59:40 -0400
Received: from sauhun.de ([88.99.104.3]:50782 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726881AbgESG7k (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 19 May 2020 02:59:40 -0400
Received: from localhost (p5486ceca.dip0.t-ipconnect.de [84.134.206.202])
        by pokefinder.org (Postfix) with ESMTPSA id EE4542C1FA8;
        Tue, 19 May 2020 08:59:37 +0200 (CEST)
Date:   Tue, 19 May 2020 08:59:37 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: Re: [PATCH v14 2/2] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20200519065937.GD1094@ninjato>
References: <20200428061813.27072-1-bibby.hsieh@mediatek.com>
 <20200428061813.27072-3-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="2iBwrppp/7QCDedR"
Content-Disposition: inline
In-Reply-To: <20200428061813.27072-3-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--2iBwrppp/7QCDedR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 28, 2020 at 02:18:13PM +0800, Bibby Hsieh wrote:
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>=20
> We get and enable bulk regulator in i2c adapter device.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>
> ---
>  drivers/i2c/i2c-core-base.c | 82 +++++++++++++++++++++++++++++++++++++
>  include/linux/i2c.h         |  2 +
>  2 files changed, 84 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 5cc0b0ec5570..f81b42a4ed07 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -313,6 +313,7 @@ static int i2c_smbus_host_notify_to_irq(const struct =
i2c_client *client)
>  static int i2c_device_probe(struct device *dev)
>  {
>  	struct i2c_client	*client =3D i2c_verify_client(dev);
> +	struct i2c_adapter	*adap =3D client->adapter;

You are accessing client before the NULL pointer check.


> @@ -414,6 +421,7 @@ static int i2c_device_probe(struct device *dev)
>  static int i2c_device_remove(struct device *dev)
>  {
>  	struct i2c_client	*client =3D i2c_verify_client(dev);
> +	struct i2c_adapter      *adap =3D client->adapter;

Same here.

> +static int i2c_suspend_late(struct device *dev)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct i2c_adapter *adap =3D client->adapter;
> +	int err;
> +
> +	err =3D pm_generic_suspend_late(&client->dev);
> +	if (err)
> +		return err;
> +
> +	if (!pm_runtime_status_suspended(&client->dev))
> +		return regulator_disable(adap->bus_regulator);
> +
> +	return err;

Can be 'return 0'.


--2iBwrppp/7QCDedR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7Dg9kACgkQFA3kzBSg
KbbEaA//aDPbZIn0/zhZlvz6g+yUEF3zzA+ASkLuvd4U6ugOKHQO7mzlymPyC3PG
/bZcx0eAWi8KUcIf4A3/lJmKQKKpN9JKInLwFZLIOKV+i02g6szMyMhQIznCc+Sf
npxT/s291nt+ieI75VY1b7qjL8Bqxpx4QBgljaOUbbcktndY72xhudEYBL170+nc
rw7xzlMePpgiRgsVLq5/sXRWBj/0ra3o68oe4AqC6xdvtVE6ExQSE8dMvfUmUQTQ
//kqSLlEH5n/qSCykQQmx6SD0wHI7Y80r9Y9JK7+rfeFF2FGcaPaID1znBXJOK9n
cFi2LNtZVJLFflX93BHKi85DL/bxTPAQauPxFohvTM1tM5KvpC4Qxnak3I5/1krg
VwYHIGX8PvdHZvuSThN8wRGAX/gB7zFk7+zsSwmDsyPbuOQZ1zSBBrlqHIbO6TPF
gB9q76TU6+3mfvERv8x+5vYGq7dS0n+IGyBUTjiVZWU7nergXmtShG+aGnGzAjFA
o0Nx2R8hAuR4uG9ZKCq/kRdQJrS0tLailHAveN1SSJ2joR+uSmdgyyWjOkLbs0Dh
NZeHf7g8uHgQTiEkJzHs3ZBKIpbwYyjpg587xFydkN3XtPwSSZ56ULqKBK9ZsJJq
rmVM+1nBd46ped2END/YvvVAPKAKOy0LwFA+Q3vqJyf12Z2fncU=
=IwLv
-----END PGP SIGNATURE-----

--2iBwrppp/7QCDedR--
