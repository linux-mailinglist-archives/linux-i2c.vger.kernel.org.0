Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598B3255697
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 10:38:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728630AbgH1Iii (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 04:38:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:37636 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726643AbgH1Iih (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 04:38:37 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 611A420791;
        Fri, 28 Aug 2020 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598603916;
        bh=6oEXqOj80NX5g/6826zo8bC4f0TOwNYvOYDpH7fMHVY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FTxXcGpfAMqHochDPGltth9hM/fvyJgR8SSDrI/UnUFX7LuxVPnTP9ZtO+h0VbqYA
         C+MWRipCxSq8kwe9mldzmP07cn7IZLAy1Hm/RijtO2/9G6nhDvW6TOaZwNCHm4HdC6
         ZUgXSAESW6EoKuKSVqpLsjkzd/yJTEpJHQjY4nQM=
Date:   Fri, 28 Aug 2020 10:38:32 +0200
From:   Wolfram Sang <wsa@kernel.org>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-i2c@vger.kernel.org, "Rafael J. Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, Bingbu Cao <bingbu.cao@intel.com>,
        linux-media@vger.kernel.org,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rajmohan.mani@intel.com, Tomasz Figa <tfiga@chromium.org>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: Re: [PATCH v6 1/6] i2c: Allow an ACPI driver to manage the device's
 power state during probe
Message-ID: <20200828083832.GE1343@ninjato>
References: <20200826115432.6103-1-sakari.ailus@linux.intel.com>
 <20200826115432.6103-2-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="5oH/S/bF6lOfqCQb"
Content-Disposition: inline
In-Reply-To: <20200826115432.6103-2-sakari.ailus@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--5oH/S/bF6lOfqCQb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sakari,

On Wed, Aug 26, 2020 at 02:54:27PM +0300, Sakari Ailus wrote:
> Enable drivers to tell ACPI that there's no need to power on a device for
> probe. Drivers should still perform this by themselves if there's a need
> to. In some cases powering on the device during probe is undesirable, and
> this change enables a driver to choose what fits best for it.
>=20
> Add a field called "flags" into struct i2c_driver for driver flags, and a
> flag I2C_DRV_FL_ALLOW_LOW_POWER_PROBE to tell a driver supports probe in
> low power state.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/i2c/i2c-core-base.c | 18 +++++++++++++++---
>  include/linux/i2c.h         | 14 ++++++++++++++
>  2 files changed, 29 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
> index 34a9609f256da..f2683790eb0d2 100644
> --- a/drivers/i2c/i2c-core-base.c
> +++ b/drivers/i2c/i2c-core-base.c
> @@ -436,6 +436,15 @@ static int i2c_smbus_host_notify_to_irq(const struct=
 i2c_client *client)
>  	return irq > 0 ? irq : -ENXIO;
>  }
> =20
> +static bool allow_low_power_probe(struct device *dev)
> +{
> +	struct i2c_driver *driver =3D to_i2c_driver(dev->driver);
> +
> +	return driver->flags & I2C_DRV_FL_ALLOW_LOW_POWER_PROBE &&
> +		is_acpi_node(dev_fwnode(dev)) &&
> +		device_property_present(dev, "allow-low-power-probe");

So, I wondered about potential DT usage and I read the discussion about
that in v5 which concluded that for the DT case, the drivers can make
use of the binding individually. I can agree to that, but then the name
of the binding is probably problematic. 'allow-*' sounds like
configuration but DT is for describing HW. So, I think something in the
range of 'keep-low-power' or so might be better suited. Grepping shows
there already is a generic binding "low-power-enable". Not sure, if it
really fits, because here it is more about 'keeping' rather than
enabling. Or?

> +/**
> + * enum i2c_driver_flags - Flags for an I2C device driver
> + *
> + * @I2C_DRV_FL_ALLOW_LOW_POWER_PROBE: Let the ACPI driver manage the dev=
ice's
> + *				      power state during probe and remove
> + */
> +enum i2c_driver_flags {
> +	I2C_DRV_FL_ALLOW_LOW_POWER_PROBE =3D BIT(0),
> +};
> +
>  /**
>   * struct i2c_driver - represent an I2C device driver
>   * @class: What kind of i2c device we instantiate (for detect)
> @@ -231,6 +242,7 @@ enum i2c_alert_protocol {
>   * @detect: Callback for device detection
>   * @address_list: The I2C addresses to probe (for detect)
>   * @clients: List of detected clients we created (for i2c-core use only)
> + * @flags: A bitmask of flags defined in &enum i2c_driver_flags
>   *
>   * The driver.owner field should be set to the module owner of this driv=
er.
>   * The driver.name field should be set to the name of this driver.
> @@ -289,6 +301,8 @@ struct i2c_driver {
>  	int (*detect)(struct i2c_client *client, struct i2c_board_info *info);
>  	const unsigned short *address_list;
>  	struct list_head clients;
> +
> +	unsigned int flags;

Here I wonder if all this is really I2C specific? I could imagine this
being useful for other busses as well, so maybe 'struct device_driver'
is a better place?

Thanks for this work!

All the best,

   Wolfram


--5oH/S/bF6lOfqCQb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IwoQACgkQFA3kzBSg
KbYFqA/+PgFHWc6sxcK2rs/URNTr2xkOqwl8fMvCWpGCQQ+XMGrmjyKOUvFvuDxr
/U/TxKdfMkQLkX2G4TgVfqGagI6oZwl6QHyxelKSlceIOdGtKZDpvV6XHwsLFLcR
9iXyy1IxLcLy9sYoXMkss/Leowzr63f+C9Hj9J/4nwrk+JLf5DCfZRU+xsrdrnr+
CUakuhocOTnqofD+X84vmx3eenE3EaGEMZPoCFJ0tT1+GvqUOwzTf3C8jJwFTVMM
eTLWXJE/Wvz/o9xti9KJnF4RlrbcseCkz+CbCxMtnOYb+yXEsD58n1ZctCHHujie
jryWSKoca6ZrxR7AFkHJYotJsegxujw8I0VBeGxz2rontNohxLJoSoB4LGFL8Txc
6I0WfASgE43pILBJB3SCUdQ4TC03kZKK0OQO88/AqQ58qFkjg3ku+8xkJg98l2LK
5Fuyvhvhfl1TBdts2ng5Ticfx9XkOly6bjYU5b/dItmSwrbX6a9ItfJRz0B5MuZi
clDduqd/mbNOE2yuBwKNMbC/8VqEw4qq6Kn+i3OA0SSrntqie1hhEFSnhH5HwaO0
hRB3lBIeVh6fn+LTzNk3T2SRrTySFv35vAu8nUxudh9t7qliNpDQKIHeEVERPjya
UMy+oRCu2mL+tl61dVJou/KKS64E2YSB5/hjfXuR0wUjxvpZl3Y=
=kCUk
-----END PGP SIGNATURE-----

--5oH/S/bF6lOfqCQb--
