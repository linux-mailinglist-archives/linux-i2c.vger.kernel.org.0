Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B5EB2109A8
	for <lists+linux-i2c@lfdr.de>; Wed,  1 Jul 2020 12:49:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729856AbgGAKtu (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 1 Jul 2020 06:49:50 -0400
Received: from mail.kernel.org ([198.145.29.99]:53132 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729791AbgGAKtt (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 1 Jul 2020 06:49:49 -0400
Received: from localhost (p54b334c2.dip0.t-ipconnect.de [84.179.52.194])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F12B20722;
        Wed,  1 Jul 2020 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593600589;
        bh=fBRyFwIDzERIG5z/DV53hFH9bjjSps7WeBweGXWWG4s=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ebE0Vf2T/zBLtKbZynYfabJnL5lBj/JDJU4CHge0TWuCuKWPH0US6US3G9F27OaDb
         B8mqvU3vdsAmEMt9dXkqf7fVZUvqewJmbstaFVitY/qSDSf6gpC+wGMUUTHdLiLxiH
         v7SBAZAPJSC8AZ3baoFZ3zEG1EteMkDqI3aCkFpY=
Date:   Wed, 1 Jul 2020 12:49:46 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Alain Volmat <alain.volmat@st.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com,
        pierre-yves.mordret@st.com, mcoquelin.stm32@gmail.com,
        alexandre.torgue@st.com, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        fabrice.gasnier@st.com
Subject: Re: [PATCH v2 1/4] i2c: smbus: add core function handling SMBus
 host-notify
Message-ID: <20200701104946.GH2261@ninjato>
References: <1593070769-9106-1-git-send-email-alain.volmat@st.com>
 <1593070769-9106-2-git-send-email-alain.volmat@st.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XIiC+We3v3zHqZ6Z"
Content-Disposition: inline
In-Reply-To: <1593070769-9106-2-git-send-email-alain.volmat@st.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XIiC+We3v3zHqZ6Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2020 at 09:39:26AM +0200, Alain Volmat wrote:
> SMBus Host-Notify protocol, from the adapter point of view
> consist of receiving a message from a client, including the
> client address and some other data.
>=20
> It can be simply handled by creating a new slave device
> and registering a callback performing the parsing of the
> message received from the client.
>=20
> This commit introduces two new core functions
>   * i2c_new_smbus_host_notify_device
>   * i2c_free_smbus_host_notify_device
> that take care of registration of the new slave device and
> callback and will call i2c_handle_smbus_host_notify once a
> Host-Notify event is received.
>=20
> Signed-off-by: Alain Volmat <alain.volmat@st.com>
> ---
> v2: remove useless dev_err message in case of hnotify handling error
>     prevent handling hnotify in case of a incomplete write

Okay, now I got it to work, I also noted a few more issues.

First, I'd suggest s/i2c_smbus_host_notify/i2c_slave_host_notify/g for
all occurences in this patch. This makes a stronger distinction between
the generic HostNotify support and the slave specific one.

Also, I wonder if this shouldn't go to i2c-smbus.c instead but I haven't
checked if we end up in dependency hell then. Second best thought: at
least move to i2c-core-slave.c, then we could save the #ifdeffery in the
c-file?

>=20
>  drivers/i2c/i2c-core-smbus.c | 110 +++++++++++++++++++++++++++++++++++++=
++++++
>  include/linux/i2c-smbus.h    |   2 +
>  2 files changed, 112 insertions(+)
>=20
> diff --git a/drivers/i2c/i2c-core-smbus.c b/drivers/i2c/i2c-core-smbus.c
> index 56bb840142e3..3a37664fb5f6 100644
> --- a/drivers/i2c/i2c-core-smbus.c
> +++ b/drivers/i2c/i2c-core-smbus.c
> @@ -708,3 +708,113 @@ int of_i2c_setup_smbus_alert(struct i2c_adapter *ad=
apter)
>  }
>  EXPORT_SYMBOL_GPL(of_i2c_setup_smbus_alert);
>  #endif
> +
> +#if IS_ENABLED(CONFIG_I2C_SLAVE)
> +struct i2c_smbus_host_notify_status {
> +	bool notify_start;
> +	u8 addr;
> +};
> +
> +static int i2c_smbus_host_notify_cb(struct i2c_client *client,
> +				    enum i2c_slave_event event, u8 *val)
> +{
> +	struct i2c_smbus_host_notify_status *status =3D client->dev.platform_da=
ta;
> +	int ret;
> +
> +	switch (event) {
> +	case I2C_SLAVE_WRITE_REQUESTED:
> +		status->notify_start =3D true;
> +		break;
> +	case I2C_SLAVE_WRITE_RECEIVED:
> +		/* We only retrieve the first byte received (addr)
> +		 * since there is currently no support to retrieve the data
> +		 * parameter from the client.
> +		 */
> +		if (!status->notify_start)
> +			break;
> +		status->addr =3D *val;
> +		status->notify_start =3D false;

So, we are safe if the message is too short. Otherwise, we capture the
first byte (=3D=3D address) only, right. Further bytes until STOP are
discarded. So, we don't check if the message is too long and contains
more than the status word. Maybe we should add that?

> +		break;
> +	case I2C_SLAVE_STOP:
> +		/* In case of incomplete write, don't handle host-notify */
> +		if (status->notify_start) {
> +			status->notify_start =3D false;
> +			break;
> +		}
> +
> +		ret =3D i2c_handle_smbus_host_notify(client->adapter,
> +						   status->addr);
> +		if (ret < 0)
> +			return ret;
> +		break;
> +	default:

The missing cases are mandatory. From my testunit driver:

        case I2C_SLAVE_READ_REQUESTED:
        case I2C_SLAVE_READ_PROCESSED:
                *val =3D 0xff;
                break;

> +		/* Only handle necessary events */
> +		break;
> +	}
> +
> +	return 0;
> +}
> +

=2E..

> --- a/include/linux/i2c-smbus.h
> +++ b/include/linux/i2c-smbus.h
> @@ -38,6 +38,8 @@ static inline int of_i2c_setup_smbus_alert(struct i2c_a=
dapter *adap)
>  	return 0;
>  }
>  #endif
> +struct i2c_client *i2c_new_smbus_host_notify_device(struct i2c_adapter *=
adapter);
> +void i2c_free_smbus_host_notify_device(struct i2c_client *client);

Those need to be guarded with I2C_SLAVE as well. And an #else branch
with empty/successful placeholders.

> =20
>  #if IS_ENABLED(CONFIG_I2C_SMBUS) && IS_ENABLED(CONFIG_DMI)
>  void i2c_register_spd(struct i2c_adapter *adap);
> --=20
> 2.7.4
>=20

--XIiC+We3v3zHqZ6Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl78akUACgkQFA3kzBSg
KbbHlRAAs1l3c2tSTqVOJVVbdpNSWj9cd9fgOQ5e7DrFZklEo+fWZusrPMYkSk9r
q8HIUFiiAiEACt4r46NMdLoJguvcXhm5Hqlpi3B7EDAgIH6/eieb2MsFFkwd8Lh3
HzdfVYY9fgsYmdpoXQlu+eXI7Q3U3kWaWfhFzWnTdOKgTSdflSDDpV+RJpqnXYAb
j53W1o4RZTxH+PlyQJA+1kxwb4ij4XTE26KpWDeI4yknN0vFx+IqHJzwaF1niYzU
6WsrXRBMmLOcBOdG0OQQFWCWH7YPORqqiUx7G9sgf21cZal/N3XfuVZdIZzgpaFi
qCvcLckqrt7E0rE8UrJQwQigZMlgQNn5KARaux6ZisiCbZ5ncLzd91DBByxh53Au
0FwKdnPWmmbU3OhFStt7JFXj64Q7kp28GPkASuW5fiGF0tpxBvDVtUYmKSx755qJ
1Z7vRyTR0FpiqOEiUov3bkRIHtoJP6NIzD8LBcJBYjRAV/zKsDqDIeZmRRT6XUsf
SxQKFTriO1xEXUXVnOI3YJrXwcyveTRxvq81LbDnDUZJ2wxhPVWMkUiDj80LJdm7
Yzi53x0nT9AtzDgRmYRVglLIc+/ZjD9h++NpVivZD8bCOrjOb1SCDks4hPOyaUqa
zWx9IDDq1g2VpATy+Erga6U6cSbrD5XxccOsgjunhoOdZLp8ZGE=
=ODPH
-----END PGP SIGNATURE-----

--XIiC+We3v3zHqZ6Z--
