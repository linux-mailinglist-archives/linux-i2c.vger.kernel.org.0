Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E1E0E1090DB
	for <lists+linux-i2c@lfdr.de>; Mon, 25 Nov 2019 16:16:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728527AbfKYPQW (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 25 Nov 2019 10:16:22 -0500
Received: from sauhun.de ([88.99.104.3]:55242 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728172AbfKYPQV (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 25 Nov 2019 10:16:21 -0500
Received: from localhost (x4e37056e.dyn.telefonica.de [78.55.5.110])
        by pokefinder.org (Postfix) with ESMTPSA id 596772C0456;
        Mon, 25 Nov 2019 16:16:19 +0100 (CET)
Date:   Mon, 25 Nov 2019 16:16:18 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, yuenn@google.com,
        venture@google.com, benjaminfair@google.com,
        avifishman70@gmail.com, joel@jms.id.au, tmaimon77@gmail.com,
        syniurge@gmail.com, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/2] i2c: npcm: Add Nuvoton NPCM I2C controller driver
Message-ID: <20191125151618.GE2412@kunai>
References: <20191121095350.158689-1-tali.perry1@gmail.com>
 <20191121095350.158689-3-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Lb0e7rgc7IsuDeGj"
Content-Disposition: inline
In-Reply-To: <20191121095350.158689-3-tali.perry1@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Lb0e7rgc7IsuDeGj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2019 at 11:53:50AM +0200, Tali Perry wrote:
> Add Nuvoton NPCM BMC i2c controller driver.
>=20
> Signed-off-by: Tali Perry <tali.perry1@gmail.com>

Looking at all this SMB_* naming of the registers and also the quirks,
this looks more like an SMBUS controller to me?

> +	// currently I2C slave IF only supports single byte operations.
> +	// in order to utilyze the npcm HW FIFO, the driver will ask for 16bytes
> +	// at a time, pack them in buffer, and then transmit them all together
> +	// to the FIFO and onward to the bus .
> +	// NACK on read will be once reached to bus->adap->quirks->max_read_len
> +	// sending a NACK whever the backend requests for it is not supported.

This for example...

> +static const struct i2c_adapter_quirks npcm_i2c_quirks =3D {
> +	.max_read_len =3D 32768,
> +	.max_write_len =3D 32768,
> +	.max_num_msgs =3D 2,
> +	.flags =3D I2C_AQ_COMB_WRITE_THEN_READ
> +};

=2E.. and this. Like SMBus with the only exception of being able to send
32K in a row. Or?


--Lb0e7rgc7IsuDeGj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3b8EIACgkQFA3kzBSg
Kbabdg//Vlk6yGrJ9uPwF66dwUUKyE2M66t+W5miyttrphuZsLZXK7MGI2sQlF0D
0ZTP0+fskh6L8uFpIK2eplGzHCyNHxz9yiGlluRMCohfL0HYVZw0TtLz08cKbg9p
35Mqs8JhklbBQ6EaO+FCd3WBAUA244fmekZa4ltRs66A7EZ+40kB8JEGJ9UF4yZl
AUop8BPaVGEJ9lw4x3n6DvsiNrGSuxbMJmmm2FU8HY2I31A2cUAv1B26xkjJ4NBW
We7ts4jy4tJv6Uo0KxvBbvCgaxle/zwPkl7s2dPvajxLbMEXfq/yOrCWEAX7mg/u
3ENhA7SETaZFcn4Yj3J0uVlbv/DIzPUcsGP499PW0DIsRY6i7dFl0JypETEceu8W
/QQJO62nl3vh13bLcv1Nl6HtQjOX5EtVmUBwakasELQ+HMWp3zt7dHu7FgKtPaIJ
eAL9AjrgCymz1v0kAzlXRx7KTi+285oWNUUVBtRedc76A60ONDmim7nsSkx+lmem
djPX2bSGT0v1gp16CAMe07ZOmCB7Wu8S6pIK9Yo639bi9MnhblsXYRlF7unpO4RX
8+xUos0Y2tLw28tU7g/pELYyBoKWoEDNCQrWy/3FHh41PFKGPRfOme0ZudIFgcPM
Vu12YjeAhb1fqMqRyEMs8uwjx+4PBqJS7dzJvobQSgZyc9tjW+k=
=Yu4F
-----END PGP SIGNATURE-----

--Lb0e7rgc7IsuDeGj--
