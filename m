Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AE13E2EA81B
	for <lists+linux-i2c@lfdr.de>; Tue,  5 Jan 2021 11:01:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725919AbhAEKAp (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 Jan 2021 05:00:45 -0500
Received: from sauhun.de ([88.99.104.3]:40936 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725831AbhAEKAp (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 Jan 2021 05:00:45 -0500
Received: from localhost (p5486cfc1.dip0.t-ipconnect.de [84.134.207.193])
        by pokefinder.org (Postfix) with ESMTPSA id E38C72C03EF;
        Tue,  5 Jan 2021 11:00:02 +0100 (CET)
Date:   Tue, 5 Jan 2021 11:00:01 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        linux-i2c@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [PATCH] i2c: core: Do not print duplicate error when failing to
 register an i2c-client from ACPI
Message-ID: <20210105100001.GB2000@ninjato>
References: <20201221191300.244648-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="gatW/ieO32f1wygP"
Content-Disposition: inline
In-Reply-To: <20201221191300.244648-1-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--gatW/ieO32f1wygP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 21, 2020 at 08:13:00PM +0100, Hans de Goede wrote:
> i2c_new_client_device() already prints an error when it fails. Some
> ACPI tables contain 2 ACPI devices describing the same i2c-client,
> leading to errors like this:
>=20
> [    1.620847] i2c i2c-4: Failed to register i2c client MAGN0001:00 at 0x=
1d (-16)
> [    1.620870] i2c i2c-4: failed to add I2C device MAGN0001:00 from ACPI
>=20
> There is nothing we can do about the first -EBUSY error being logged,
> but the second error does not really add any new information, so lets
> drop it.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Applied to for-next, thanks!


--gatW/ieO32f1wygP
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl/0OKEACgkQFA3kzBSg
KbZw6w//fNjx9Xc9pJHZp7Rhl6FfYMrELZpsPb/rZ6603Y3BhTD8+aStoOWYCW6C
DIZ4IQwqB6Y6/wU29clnMI3DvEx27yX+VwbECmqzixxQjihoDo8Y4PVUd05WTTOp
qSnaL1CqY0N7X7VbBG/jx+oqsrUHJmvoaqSlYu1uPnwydLMAIebBg2WLQ9IF2sp1
AJXhyxAvekjGw8OzKqFklSrH73omNZ8Aj/FhTBvkosPU/JMoZfacwxxzJrkfzfe/
9Gl9qwzXdfR3XfZnWz6985D82yGMM1NyoiqJlqZtezebTnt4cdFQMWsd0L4Bi/ub
4DdxL7N1+ex6aHdfnDRfi1c/j4WxcB/j/QXn3VRt6UfCa+M9IxVA1sij8CI3zRR4
Sf2ftB+nDRMSmdSsMVTYrhGpXmHnedXawdPcMK+GIuc0OBExSuwPkFKyETxdugDr
Gn492BvoWr6MkrrihRyP+t4wcnnkBuK23WkarJA3vSqeYN7b3hX+BtsvycbpY8wg
8gXjLgXEZcfkgZxwshA/nt328G4LBKDxzTeCxADIPKVJRSEJk072MClJ0Lhq7787
gAY3jx/therbs/7nLUbD66UDlnvilJkydMIK/yhGjWFZ6sJ9kMwh41iGwpKprv5C
9XkNl0/nEsfetGIz/l9gRFBKAu9uSe+/LT7MpWqFEBSqHnLSkVY=
=imiC
-----END PGP SIGNATURE-----

--gatW/ieO32f1wygP--
