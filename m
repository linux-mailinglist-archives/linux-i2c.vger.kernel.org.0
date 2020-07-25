Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 455D622D9D8
	for <lists+linux-i2c@lfdr.de>; Sat, 25 Jul 2020 22:27:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726893AbgGYU1k (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 25 Jul 2020 16:27:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:49476 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726834AbgGYU1j (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 25 Jul 2020 16:27:39 -0400
Received: from localhost (p5486c508.dip0.t-ipconnect.de [84.134.197.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 80740206D8;
        Sat, 25 Jul 2020 20:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595708859;
        bh=Rlk0OrPrYUGz4CtQc/3pWURmeCJwxiy6dgHl1X4U7A0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qghJpyNyf723L7jxgRpHb4Z7Z4mCBp18vPfyWGerTV/Wqtymasm3/by/8F/vtbQLK
         Hk6o8JEVhSpJ6Rf8C9cpKH/SSW0hvdQ9L5dAOdOo3Y49Oi3EfUyEGPPMPhwGG/0vAz
         Nm+znu0kiw0BZ3nN30Ed9IHoBktLVnMy3Uje+q24=
Date:   Sat, 25 Jul 2020 22:27:33 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     pierre-yves.mordret@st.com, alexandre.torgue@st.com,
        linux-i2c@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 1/2] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200725202733.GA946@kunai>
References: <1593776168-17867-1-git-send-email-alain.volmat@st.com>
 <1593776168-17867-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gBBFr7Ir9EOA20Yy"
Content-Disposition: inline
In-Reply-To: <1593776168-17867-2-git-send-email-alain.volmat@st.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gBBFr7Ir9EOA20Yy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alain,

some more comments for this one. I hope to come to a conclusion with Rob
regarding the binding for patch 2, so we are then ready to go.

On Fri, Jul 03, 2020 at 01:36:07PM +0200, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
>=20
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
>=20
> This commit introduces two new core functions
>   * i2c_new_slave_host_notify_device
>   * i2c_free_slave_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
>  v2: identical to v1
>=20
>  drivers/i2c/i2c-core-smbus.c | 114 +++++++++++++++++++++++++++++++++++++=
++++++

I came to the conclusion that this code should be in i2c-smbus.c.
Because it is SMBus only. I agree that the current code layout is
confusing. I will try to move the whole host-notify support to i2c-smbus
in the next cycle.

Yes, that means that one needs to select I2C_SMBUS in the config, too
(unless you want to 'select' it with your driver). But most people won't
need it so they can compile it away. This is what I2C_SMBUS is for.

>  include/linux/i2c-smbus.h    |  12 +++++
>  2 files changed, 126 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index f5c9787992e9..23ab9dc5ac85 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -715,3 +715,117 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *ad=
apter)
>  }
>  EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
>  #endif
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +#define SMBUS_HOST_NOTIFY_LEN	3
> +struct i2c_slave_host_notify_status {
> +	u8 index;
> +	u8 addr;
> +};
> +
> +static int i2c_slave_host_notify_cb(struct i2c_client *client,
> +				    enum i2c_slave_event event, u8 *val)
> +{
> +	struct i2c_slave_host_notify_status *status =3D client->dev.platform_da=
ta;
> +	int ret;
> +

Can't we simplify 'index' handling similar to the testunit driver...

> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		status->index =3D 0;

=2E.. by removing this line...

> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/* We only retrieve the first byte received (addr)
> +		 * since there is currently no support to retrieve the data
> +		 * parameter from the client.
> +		 */
> +		if (status->index =3D=3D 0)
> +			status->addr =3D *val;
> +		if (status->index < U8_MAX)
> +			status->index++;
> +		break;
> +	case I2C_SLAVE_STOP:
> +		/* Handle host-notify if whole message received only */
> +		if (status->index !=3D SMBUS_HOST_NOTIFY_LEN) {
> +			status->index =3D U8_MAX;
> +			break;
> +		}
> +
> +		ret =3D i2c_handle_smbus_host_notify(client->adapter,
> +						   status->addr);
> +		if (ret < 0)
> +			return ret;
> +		status->index =3D U8_MAX;

=2E.. and handling the logic here like:

+		if (status->index =3D=3D SMBUS_HOST_NOTIFY_LEN)
+			i2c_handle_smbus_host_notify(client->adapter, status->addr);
+		status->index =3D 0;

Note that I2C_SLAVE_STOP doesn't return a retval, so we don't need to check
i2c_handle_smbus_host_notify().

> +		break;
> +	case I2C_SLAVE_READ_REQUESTED:
> +	case I2C_SLAVE_READ_PROCESSED:
> +		*val =3D 0xff;
> +		break;
> +	}
> +
> +	return 0;
> +}
> +
> +/**
> + * i2c_new_slave_host_notify_device - get a client for SMBus host-notify=
 support
> + * @adapter: the target adapter
> + * Context: can sleep
> + *
> + * Setup handling of the SMBus host-notify protocol on a given I2C bus s=
egment.
> + *
> + * Handling is done by creating a device and its callback and handling d=
ata
> + * received via the SMBus host-notify address (0x8)
> + *
> + * This returns the client, which should be ultimately freed using
> + * i2c_free_slave_host_notify_device(); or an ERRPTR to indicate an erro=
r.
> + */
> +struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *=
adapter)
> +{
> +	struct i2c_board_info host_notify_board_info =3D {
> +		I2C_BOARD_INFO("smbus_host_notify", 0x08),
> +		.flags  =3D I2C_CLIENT_SLAVE,
> +	};
> +	struct i2c_slave_host_notify_status *status;
> +	struct i2c_client *client;
> +	int ret;
> +
> +	status =3D kzalloc(sizeof(struct i2c_slave_host_notify_status),
> +			 GFP_KERNEL);
> +	if (!status)
> +		return ERR_PTR(-ENOMEM);
> +	status->index =3D U8_MAX;

This line could go, too, if my simplification above works.

> +
> +	host_notify_board_info.platform_data =3D status;
> +
> +	client =3D i2c_new_client_device(adapter, &host_notify_board_info);
> +	if (IS_ERR(client)) {
> +		kfree(status);
> +		return client;
> +	}
> +
> +	ret =3D i2c_slave_register(client, i2c_slave_host_notify_cb);
> +	if (ret) {
> +		i2c_unregister_device(client);
> +		kfree(status);
> +		return ERR_PTR(ret);
> +	}
> +
> +	return client;
> +}
> +EXPORT_SYMBOL_GPL(i2c_new_slave_host_notify_device);
> +
> +/**
> + * i2c_free_slave_host_notify_device - free the client for SMBus host-no=
tify
> + * support
> + * @client: the client to free
> + * Context: can sleep
> + *
> + * Free the i2c_client allocated via i2c_new_slave_host_notify_device
> + */
> +void i2c_free_slave_host_notify_device(struct i2c_client *client)
> +{
> +	i2c_slave_unregister(client);
> +	kfree(client->dev.platform_data);
> +	i2c_unregister_device(client);
> +}
> +EXPORT_SYMBOL_GPL(i2c_free_slave_host_notify_device);

Sidenote: With my recent series "i2c: slave: improve sanity checks when
un-/registering" this code became NULL-safe (and IS_ERR safe, too).

> +#endif
> diff --git a/include/linux/i2c-smbus.h b/include/linux/i2c-smbus.h
> index 1e4e0de4ef8b..52e62f398f1c 100644
> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -38,6 +38,18 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_=
adapter *adap)
>  	return 0;
>  }
>  #endif
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +struct i2c_client *i2c_new_slave_host_notify_device(struct i2c_adapter *=
adapter);
> +void i2c_free_slave_host_notify_device(struct i2c_client *client);
> +#else
> +static inline struct i2c_client *i2c_new_slave_host_notify_device(struct=
 i2c_adapter *adapter)
> +{
> +	return NULL;

return ERR_PTR(-ENOSYS);

As the docs say, this function either returns a valid client or an
ERR_PTR.

> +}
> +static inline void i2c_free_slave_host_notify_device(struct i2c_client *=
client)
> +{
> +}
> +#endif
> =20
>  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
>  void i2c_register_spd(struct i2c_adapter *adap);
> --=20
> 2.7.4
>=20

--gBBFr7Ir9EOA20Yy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl8clbEACgkQFA3kzBSg
KbaohA//fnoEf8bs2SJ75/dhPfK0aWiKuRgHah5l/irv/QhAmyA7/cmuo8KsfFzl
Zhy0cOC6ZbQmjBRYDbYb4ODhyHVjSNRn2hJSgPgSIvThgJR0RT/dXEkHx3PDe2Wx
ZIrDqdj9DcsvPk+t9eQUQ56vikrp+q0kiuvq1/xpkqa4NpcNRhy9DFQ2bn9/2upP
9M6oOfavzVjSwAzKZy4f2+FTLEDbu6xXJu4tlNKzc1Bht+PVh7KNTezYMuSmDgdF
ragaMkwXKPSLP+ssRj50GAp1rdAyUfZaKsfPZhAIRmd77o/t8SY/qMfyg7jqMOT6
Egfhxj4SfIANrYjprXcQZDtIiTWJ36JoL6Isg53wbRwcIbNLQRi1iMnSlo1cxBvU
MM3T7vVl/9+hOYbOHHroV61Nr9DCoeLZo1bymkpzr4COSsKUI5akdtL9JbbN2wFG
sohF8QE9S1+KFEpMIQstEKxpTj6VvspAcTth701StqtHDOCj1xvzz5X2pwyaJs49
ZjRyDqiCib2/z+SPiHTIS0FNbm1wnxVbQXAaTTgiL6EAeDRljSMZgH4igMF7p3jI
cWWI6CN8Xf1G8MnZIcx+xz0uYM1WLRPVORRopc72IiEitcH3h4GTc9aNMEstB+26
BsSFtBOo99sHkwbh2DPRxacAlUi2ubQ7eE8q+K2ojhtaZHww3bI=
=zzMS
-----END PGP SIGNATURE-----

--gBBFr7Ir9EOA20Yy--
