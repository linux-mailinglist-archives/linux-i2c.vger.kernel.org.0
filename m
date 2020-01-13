Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B02D3139C43
	for <lists+linux-i2c@lfdr.de>; Mon, 13 Jan 2020 23:15:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728945AbgAMWPf (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 13 Jan 2020 17:15:35 -0500
Received: from sauhun.de ([88.99.104.3]:43198 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728943AbgAMWPf (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 13 Jan 2020 17:15:35 -0500
Received: from localhost (p54B332D5.dip0.t-ipconnect.de [84.179.50.213])
        by pokefinder.org (Postfix) with ESMTPSA id 2B8B32C06DA;
        Mon, 13 Jan 2020 23:15:33 +0100 (CET)
Date:   Mon, 13 Jan 2020 23:15:32 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-i2c@vger.kernel.org, linux-amlogic@lists.infradead.org,
        khilman@baylibre.com, narmstrong@baylibre.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        b.galvani@gmail.com, jian.hu@amlogic.com
Subject: Re: [PATCH] i2c: meson: implement the master_xfer_atomic callback
Message-ID: <20200113221532.GC2689@ninjato>
References: <20200107232901.891177-1-martin.blumenstingl@googlemail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <20200107232901.891177-1-martin.blumenstingl@googlemail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 08, 2020 at 12:29:01AM +0100, Martin Blumenstingl wrote:
> Boards with some of the 32-bit SoCs (mostly Meson8 and Meson8m2) use a
> Ricoh RN5T618 PMU which acts as system power controller. The driver for
> the system power controller may need to the I2C bus just before shutting
> down or rebooting the system. At this stage the interrupts may be
> disabled already.
>=20
> Implement the master_xfer_atomic callback so the driver for the RN5T618
> PMU can communicate properly with the PMU when shutting down or
> rebooting the board. The CTRL register has a status bit which can be
> polled to determine when processing has completed. According to the
> public S805 datasheet the value 0 means "idle" and 1 means "running".
>=20
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

Applied to for-next, thanks!


--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl4c7AQACgkQFA3kzBSg
KbbuRRAAnOvYecXtAAQlFI9kpCVUGmLW8USmChX+JFEbpguc3uyPI0jnz7hPjLsx
664PGVOPwfaMIfcClLCVM8abtgjyUpbX4AmLrM0mGq5xgYATUCnV85hjcqXIvEKM
ecfAR522mRm3ZVSUEJO5UPzwjDY1QxON7BEgY6iRa9F4wLEAXdV3MYXBLkMKK7YR
IvX92X/SX30jqLIYfihH1T/5Livk08f3M70GQH8Ngcr1HMK5clSyrVxp2mT4L4o+
Y9RoB7hdhEv96O+oaEfXmeGowe5co+d2JGTbCPT9/Fuo0Curv+ScNbKMrf8dMqW2
+/Qz1EQDsIGd4uh1w/DMmFHslQcVYX3lfKLZASk0rcPs1ofoja5uXEzKvTTCrsgI
GImOvyV9hxSFEbpL5ZUY8PHIplRsqpRnMOpeXiK6xmPTQPAE1Tk2eng2uCuvJk1V
0EhFNVHR3pNMw966d+kw+oFOC3hFSR+s4rw7CiOpOI/Cgl6AhLCvrqpqWRF4asfX
DvuqSGCH2Z5Li9xuFJHU5kLR8MLX5Y6yeVOPMFCgqhBr22cV5JInznSODpg56WjH
V7kmPJOm3HIwgk93ZySC7g5eCOX/h14xK7EWRM42cxv8otcmJfJ85YRxSKAfKjYV
ptAxuxClf+v9HsFRGD4ZSMb00igmwTiW9y/E0TiMw4Q01tUtYWY=
=pX3/
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
