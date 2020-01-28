Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B5C414AFD5
	for <lists+linux-i2c@lfdr.de>; Tue, 28 Jan 2020 07:36:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725799AbgA1Ggj (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 28 Jan 2020 01:36:39 -0500
Received: from sauhun.de ([88.99.104.3]:50054 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725797AbgA1Ggj (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 28 Jan 2020 01:36:39 -0500
Received: from localhost (p54B33410.dip0.t-ipconnect.de [84.179.52.16])
        by pokefinder.org (Postfix) with ESMTPSA id 5AE2D2C0718;
        Tue, 28 Jan 2020 07:36:36 +0100 (CET)
Date:   Tue, 28 Jan 2020 07:36:33 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Bibby Hsieh <bibby.hsieh@mediatek.com>
Cc:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-i2c@vger.kernel.org, tfiga@chromium.org,
        drinkcat@chromium.org, srv_heupstream@mediatek.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v10 4/4] i2c: core: support bus regulator controlling in
 adapter
Message-ID: <20200128063633.GA1088@ninjato>
References: <20200116025637.3524-1-bibby.hsieh@mediatek.com>
 <20200116025637.3524-5-bibby.hsieh@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="UugvWAfsgieZRqgk"
Content-Disposition: inline
In-Reply-To: <20200116025637.3524-5-bibby.hsieh@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--UugvWAfsgieZRqgk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 16, 2020 at 10:56:37AM +0800, Bibby Hsieh wrote:
> Although in the most platforms, the bus power of i2c
> are alway on, some platforms disable the i2c bus power
> in order to meet low power request.
>=20
> We get and enable bulk regulator in i2c adapter device.
>=20
> Signed-off-by: Bibby Hsieh <bibby.hsieh@mediatek.com>

=2E..

> +#ifdef CONFIG_PM_SLEEP
> +static int i2c_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct i2c_adapter *adap =3D client->adapter;
> +	int err;
> +
> +	if (pm_runtime_status_suspended(&adap->dev)) {
> +		err =3D regulator_enable(adap->bus_reg);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_resume(dev);
> +}
> +
> +static int i2c_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct i2c_adapter *adap =3D client->adapter;
> +	int err;
> +
> +	if (!pm_runtime_status_suspended(&adap->dev)) {
> +		err =3D regulator_disable(adap->bus_reg);
> +		if (err)
> +			return err;
> +	}
> +
> +	return pm_generic_suspend(dev);
> +}
> +#endif
> +
> +#ifdef CONFIG_PM
> +static int i2c_runtime_resume(struct device *dev)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct i2c_adapter *adap =3D client->adapter;
> +	int err;
> +
> +	err =3D regulator_enable(adap->bus_reg);
> +	if (err)
> +		return err;
> +
> +	return pm_generic_runtime_resume(dev);
> +}
> +
> +static int i2c_runtime_suspend(struct device *dev)
> +{
> +	struct i2c_client *client =3D i2c_verify_client(dev);
> +	struct i2c_adapter *adap =3D client->adapter;
> +	int err;
> +
> +	err =3D pm_generic_runtime_suspend(dev);
> +	if (err)
> +		return err;
> +
> +	return regulator_disable(adap->bus_reg);
> +}
> +#endif
> +
> +static const struct dev_pm_ops i2c_device_pm =3D {
> +	SET_SYSTEM_SLEEP_PM_OPS(i2c_suspend, i2c_resume)
> +	SET_RUNTIME_PM_OPS(i2c_runtime_suspend, i2c_runtime_resume, NULL)
> +};
> +

It looks good to me, yet I am not a PM expert. An ack from someone more
into that topic would be great, if possible.

>  static void i2c_device_shutdown(struct device *dev)
>  {
>  	struct i2c_client *client =3D i2c_verify_client(dev);
> @@ -488,6 +563,7 @@ struct bus_type i2c_bus_type =3D {
>  	.probe		=3D i2c_device_probe,
>  	.remove		=3D i2c_device_remove,
>  	.shutdown	=3D i2c_device_shutdown,
> +	.pm		=3D &i2c_device_pm,
>  };
>  EXPORT_SYMBOL_GPL(i2c_bus_type);
> =20
> @@ -1351,6 +1427,11 @@ static int i2c_register_adapter(struct i2c_adapter=
 *adap)
>  		goto out_reg;
> =20
>  	dev_dbg(&adap->dev, "adapter [%s] registered\n", adap->name);
> +	adap->bus_reg =3D devm_regulator_get(&adap->dev, "bus");
> +	if (IS_ERR(adap->bus_reg)) {
> +		res =3D PTR_ERR(adap->bus_reg);
> +		goto out_reg;
> +	}
> =20
>  	pm_runtime_no_callbacks(&adap->dev);
>  	pm_suspend_ignore_children(&adap->dev, true);
> diff --git a/include/linux/i2c.h b/include/linux/i2c.h
> index d2f786706657..833b81a680da 100644
> --- a/include/linux/i2c.h
> +++ b/include/linux/i2c.h
> @@ -15,6 +15,7 @@
>  #include <linux/device.h>	/* for struct device */
>  #include <linux/sched.h>	/* for completion */
>  #include <linux/mutex.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/rtmutex.h>
>  #include <linux/irqdomain.h>		/* for Host Notify IRQ */
>  #include <linux/of.h>		/* for struct device_node */
> @@ -330,6 +331,7 @@ struct i2c_client {
>  	int init_irq;			/* irq set at initialization	*/
>  	int irq;			/* irq issued by device		*/
>  	struct list_head detected;
> +
>  #if IS_ENABLED(CONFIG_I2C_SLAVE)
>  	i2c_slave_cb_t slave_cb;	/* callback for slave mode	*/
>  #endif
> @@ -723,6 +725,7 @@ struct i2c_adapter {
>  	const struct i2c_adapter_quirks *quirks;
> =20
>  	struct irq_domain *host_notify_domain;
> +	struct regulator *bus_reg;

"bus_regulator" please. "reg" is ambigious with "register".

And what Tomasz said, of course.


--UugvWAfsgieZRqgk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4v1m0ACgkQFA3kzBSg
KbagQA/+IZ8vQXOi/aW3viz1Ndl5IrlZMPUTUNNFPSJKpFCnkvKKDN7/xgLGbl7t
3bjoDBkL3Eovtm1WIVNxWTJK5LMgrC0W/wARoHYn1Vwjnf6tAQ/eA5WNKwT4yBat
caQuDjD5JqqN/2vCFxFNSCu8lTSKtTdyGryb8Ib8qU4bBSpekE7UdhXYjLLegEsi
PZ60ja+N/Na6Uh7yWXexrj7QrR3FyxVT5fG5MySaRvHQ8BuGP89QbF7ggkB69sMq
x5RZvzLke38kYz4QQIxGfRkxmrz+eZihn8Cg1ma+Ua+OfB4ohtRJrtcq85xSbe97
7KvJAPSVWcYf8n/fxqN5+NAb/+WtCX/7E1YQKdS6YrNfj3v8PUzAHM2J0GTRnuUQ
xBVVLcEoPlYxRfiq2Oos8KAOMHORERoxZX99SSQ48NAeQ2PfVfGeLod0eZXqAPQW
Gi3jFj91vh41i7DzAa7cc44zUFigHfEfA97fL9Ogtod4GvvNJGZoVT8qJ556Y5nI
gVo5uBRa5X2p4YlOihMbP8lmIRbZGta/qEaipAi355/dxZjr0b8NO+C4rtBmmW0t
KwqTe4zFunJ6mkJ641k/UIoDMfOI5KCWENDRtvz9LyFlQuYLVJulaLToM2ubP1bo
QeTlnDkEqTzz1HJen6d9ThGIFtTgCszf9ZIVNH2z5WL8+m5X1zo=
=mJrs
-----END PGP SIGNATURE-----

--UugvWAfsgieZRqgk--
