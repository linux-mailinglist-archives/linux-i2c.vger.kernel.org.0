Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E040D2554C4
	for <lists+linux-i2c@lfdr.de>; Fri, 28 Aug 2020 09:03:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726644AbgH1HDA (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Fri, 28 Aug 2020 03:03:00 -0400
Received: from sauhun.de ([88.99.104.3]:51430 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725858AbgH1HC7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Fri, 28 Aug 2020 03:02:59 -0400
Received: from localhost (p54b3345c.dip0.t-ipconnect.de [84.179.52.92])
        by pokefinder.org (Postfix) with ESMTPSA id 306812C0209;
        Fri, 28 Aug 2020 09:02:58 +0200 (CEST)
Date:   Fri, 28 Aug 2020 09:02:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     ext-jaakko.laine@vaisala.com
Cc:     linux-i2c@vger.kernel.org, michal.simek@xilinx.com,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 3/3] i2c: xiic: Support forcing single-master in DT
Message-ID: <20200828070257.GC1343@ninjato>
References: <20200827144848.12107-1-ext-jaakko.laine@vaisala.com>
 <20200827144848.12107-4-ext-jaakko.laine@vaisala.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="raC6veAxrt5nqIoY"
Content-Disposition: inline
In-Reply-To: <20200827144848.12107-4-ext-jaakko.laine@vaisala.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--raC6veAxrt5nqIoY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 27, 2020 at 05:48:48PM +0300, ext-jaakko.laine@vaisala.com wrot=
e:
> From: Jaakko Laine <ext-jaakko.laine@vaisala.com>
>=20
> I2C master operating in multimaster mode can get stuck
> indefinitely if I2C start is detected on bus, but no master
> has a transaction going.
>=20
> This is a weakness in I2C standard, which defines no way
> to recover, since all masters are indefinitely disallowed
> from interrupting the currently operating master. A start
> condition can be created for example by an electromagnetic
> discharge applied near physical I2C lines. Or a already
> operating master could get reset immediately after sending
> a start.
>=20
> If it is known during device tree creation that only a single
> I2C master will be present on the bus, this deadlock of the
> I2C bus could be avoided in the driver by ignoring the
> bus_is_busy register of the xiic, since bus can never be
> reserved by any other master.
>=20
> This patch adds this support for detecting single-master flag
> in device tree and when provided, improves I2C reliability by
> ignoring the therefore unnecessary xiic bus_is_busy register.
>=20
> Error can be reproduced by pulling I2C SDA -line temporarily low
> by shorting it to ground, while linux I2C master is operating on
> it using the xiic driver. The application using the bus will
> start receiving linux error code 16: "Device or resource busy"
> indefinitely:
>=20
> kernel: pca953x 0-0020: failed writing register
> app: Error writing file, error: 16
>=20
> With multi-master disabled device will instead receive error
> code 5: "I/O error" while SDA is grounded, but recover normal
> operation once short is removed.
>=20
> kernel: pca953x 0-0020: failed reading register
> app: Error reading file, error: 5
>=20
> Signed-off-by: Jaakko Laine <ext-jaakko.laine@vaisala.com>

Applied to for-next, thanks!


--raC6veAxrt5nqIoY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9IrCEACgkQFA3kzBSg
KbazDw//T41/I1ZngKXPXT7w0I6sDxCIPHlevpaOVRTkfd9mMSETw5ZBx1BGDaeO
NAe8tJVdrnmAYHJCGdQMUhp5VAqCtUBNDk0bIs46Y/esBSfRRudjBCAJkBD5BYrY
39FmOyWitzNJy1ycNeEVp30PuwXM0JWQIb7IQ8SBeA7HcSLyepRpSoahyv8I38th
Aeq48fv+A+z/vHtmorOK9Pq7TmJzS7MqbG8lxAYwEX+2FwZrsUPH5QM6PMIqtM6e
G5luAXDXAytrD/1hTfTsK8YPIM4Zq6jnarHwQ17KFX7G3Y4dp9Qbl28Q2WPIbRBY
PSF6IJm3bVH0+DsziNuxw03Rh0BZfrtLrxTEu4QMXxfnKofHnxxh4ZbVaq8JFTES
Drt57nB21CvJvg2Hh3lKtHwifC3QzjvPZHU8GUQ7+qD3NZwAVld64yK78RYfAP8M
pcFP4YmpGJrjsx5vIdg0uWI8mneLT6y928+NCLVG2kv1JeQi5QeXuODahh7CcYG0
/7Agoe0kenJ6DuGXe0zGKa7xZiFXfKc46dBbx8uDupEDJBZWGEDL3lNrrrEcXwrX
GyusDRedVVXZM3HdFc45gUECJScNAO+mhNIRmKuhH+sMzN4+0vqTqeug9HyzsO92
Xk80/G/eB4pKIyLVRYMLtexI6GibE94QbAu9DAr29XOI8RFC2vU=
=+5f6
-----END PGP SIGNATURE-----

--raC6veAxrt5nqIoY--
