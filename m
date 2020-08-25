Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6BF525197B
	for <lists+linux-i2c@lfdr.de>; Tue, 25 Aug 2020 15:24:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726015AbgHYNYe (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 25 Aug 2020 09:24:34 -0400
Received: from sauhun.de ([88.99.104.3]:47888 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725792AbgHYNYb (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 25 Aug 2020 09:24:31 -0400
Received: from localhost (p54b33ab6.dip0.t-ipconnect.de [84.179.58.182])
        by pokefinder.org (Postfix) with ESMTPSA id C875F2C04D5;
        Tue, 25 Aug 2020 15:24:29 +0200 (CEST)
Date:   Tue, 25 Aug 2020 15:24:27 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Jaakko Laine <ext-jaakko.laine@vaisala.com>
Cc:     shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/2] i2c: xiic: Support forcing single-master in DT
Message-ID: <20200825132427.GB991@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Jaakko Laine <ext-jaakko.laine@vaisala.com>,
        shubhrajyoti.datta@gmail.com, linux-i2c@vger.kernel.org,
        michal.simek@xilinx.com, linux-arm-kernel@lists.infradead.org
References: <20200820100241.96866-1-ext-jaakko.laine@vaisala.com>
 <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="MfFXiAuoTsnnDAfZ"
Content-Disposition: inline
In-Reply-To: <20200820100241.96866-3-ext-jaakko.laine@vaisala.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--MfFXiAuoTsnnDAfZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 01:02:41PM +0300, Jaakko Laine wrote:
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

You could even initiate a recovery procedure if it is a device pulling
SDA low.

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

Again, looks good to me and matches what we discussed and prepared.
Let's see what Michal et al. think.

Happy hacking!


--MfFXiAuoTsnnDAfZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl9FEQsACgkQFA3kzBSg
KbblAxAAtkD1CjaP62bB9CyfxhUsBDN7XLAYpQCAgxh3K+EFaoGzk8eUYOqyX+h6
Yis6cnrrNEK5I817zwq4Jd50BfVYOpCmlfwEWbSIk2a4v9XHJszS86V1vFofwrRw
Mqc56uGfJ+laG/WbyrpdcjZ5Ia4vl1vW38Oljj6hILRYKJ7WIQwdOjxbOy8+y3Ei
QfdWzmVP/goQ1TxdCkOsyQLgiKdCpkQMilUi//t1yGczRFb1aKzTwrT79sYaYkvJ
qBiu7qmRXhidbrza35PR4StYqaPlBz7jbdE9wkKSYvVPdk1/DGEJGBsnRaH5o6RJ
pZOwK0ZYI7+LTGF6DW/36jCphrA+2BSDTfeEIEKtHi7ZlSzrka3IwqkbGiM8pyjr
g1u7l63aOkteJcnvRF1wDRswp5Dwf7iCHyQmZiGsr7iW/C2yt+a1r/J3XrDseOCE
u8tCXdo6kNjmI+e5A6WQUwWf2TUCnQJkQK50yH8FDqBShI2xFunS3Vwl2/O2LXi+
fNFQaUosKXuokYurEl982NS289jk3VWqbdM7e7aaEklfiPdDNsKZrWmcjtNrtr2G
2V0ZZRJD2W7GJrIMnvuPTL/W73E+gTzVKZvmYatZd8xjwHEj0yYSGvUYT0yzfI9h
VJWCGMNr4S23AoI7zWISJJv2jdjEjYWp8S5/VNoXiKXOmNuvYvE=
=Vwd4
-----END PGP SIGNATURE-----

--MfFXiAuoTsnnDAfZ--
