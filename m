Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 64789FCFD4
	for <lists+linux-i2c@lfdr.de>; Thu, 14 Nov 2019 21:48:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726613AbfKNUsS (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 14 Nov 2019 15:48:18 -0500
Received: from sauhun.de ([88.99.104.3]:44928 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726812AbfKNUsS (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 14 Nov 2019 15:48:18 -0500
Received: from localhost (x4dbf5278.dyn.telefonica.de [77.191.82.120])
        by pokefinder.org (Postfix) with ESMTPSA id 466512C03EE;
        Thu, 14 Nov 2019 21:48:16 +0100 (CET)
Date:   Thu, 14 Nov 2019 21:48:15 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org,
        youling 257 <youling257@gmail.com>
Subject: Re: [PATCH v2] i2c: acpi: Force bus speed to 400KHz if a Silead
 touchscreen is present
Message-ID: <20191114204815.GC7213@kunai>
References: <20191113182938.279299-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ghzN8eJ9Qlbqn3iT"
Content-Disposition: inline
In-Reply-To: <20191113182938.279299-1-hdegoede@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--ghzN8eJ9Qlbqn3iT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2019 at 07:29:38PM +0100, Hans de Goede wrote:
> Many cheap devices use Silead touchscreen controllers. Testing has shown
> repeatedly that these touchscreen controllers work fine at 400KHz, but for
> unknown reasons do not work properly at 100KHz. This has been seen on
> both ARM and x86 devices using totally different i2c controllers.
>=20
> On some devices the ACPI tables list another device at the same I2C-bus
> as only being capable of 100KHz, testing has shown that these other
> devices work fine at 400KHz (as can be expected of any recent I2C hw).
>=20
> This commit makes i2c_acpi_find_bus_speed() always return 400KHz if a
> Silead touchscreen controller is present, fixing the touchscreen not
> working on devices which ACPI tables' wrongly list another device on the
> same bus as only being capable of 100KHz.
>=20
> Specifically this fixes the touchscreen on the Jumper EZpad 6 m4 not
> working.
>=20
> Reported-and-tested-by: youling 257 <youling257@gmail.com>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Stable material, I'd say?

> +			dev_warn(dev, FW_BUG "DSDT wrongly sets I2C bus speed to %d, forcing =
it to %d\n",
> +				 lookup.min_speed, lookup.force_speed);

I have not a strong opinion here. However, does the DSDT really wrongly
set a bus speed when it is the touchscreen controller which cannot
handle lower speeds and other devies are specified to run at 100kHz?


--ghzN8eJ9Qlbqn3iT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3NvYsACgkQFA3kzBSg
KbYJCQ/9FqC8J9oFxbGEj51s5iUyX9BadmqLXv5/c/ndwbh+WmdO4tlHQQeE/L+S
wjx1ijKRkv41Scht+lEp+tCSN04TnRE7ODk76sZ4wbGyJ83b1n2VNRZ+VfDXpoxu
BnXeW/tthWuPInXhsTBEmzd/5B7AoV1xMWgTik4ALUshCE4MuxGG2w7lJBlD1EsI
u5LmGUdPEwPvXGdq6VVCqF5+pjMGitLumuo5bKa+/3JdQcqHZEkayDkRB8Eqy+L4
ZskpUWzEsL6NcZRIPcWXeHHgKPuAeF7EnlaecuzNos+Kh2EzsgL5L6CzzLCAhZuM
rKlliCxMPOJCMGaGTQ3MBogc8MMtvSkySmuVK3vU1x79Ze4axStbIi3i9GBVsk5g
AORxucKaJNZm/O4I0viSRoX3VovfJaTEiFwffEVwU2QjwbwgWNH8Q5ws0sSxrarA
bquNJnrDbK6igoLa0v4SWtg89p9CbaoWiAK2pihWMX8QBCvYtyrhQbGXi+DRbYXK
1KTokqs+OTZ1/jVYyPIry//o8VbC1JwZaETi49tKLEZw+141dFh9tdJC+b/meNBs
CQWDfWjz1AYyHcbr02J6KY4GeqsKhn/5WLgfKJjprAEKVC2JHZcs4xYGCyj+wENA
+9A1yT2HdXZeK87gLLsqJNqLnwCu0gKS/1sWIOQKzsgw7Kx82YQ=
=2fQO
-----END PGP SIGNATURE-----

--ghzN8eJ9Qlbqn3iT--
