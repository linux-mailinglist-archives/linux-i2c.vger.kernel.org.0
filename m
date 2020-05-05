Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9169E1C5ABF
	for <lists+linux-i2c@lfdr.de>; Tue,  5 May 2020 17:12:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729530AbgEEPM6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 5 May 2020 11:12:58 -0400
Received: from sauhun.de ([88.99.104.3]:34206 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729332AbgEEPM6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 5 May 2020 11:12:58 -0400
Received: from localhost (p54B335A1.dip0.t-ipconnect.de [84.179.53.161])
        by pokefinder.org (Postfix) with ESMTPSA id 7F2872C0892;
        Tue,  5 May 2020 17:12:56 +0200 (CEST)
Date:   Tue, 5 May 2020 17:12:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Codrin Ciubotariu <codrin.ciubotariu@microchip.com>
Cc:     linux-gpio@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        ludovic.desroches@microchip.com, nicolas.ferre@microchip.com,
        alexandre.belloni@bootlin.com, kamel.bouhara@bootlin.com,
        linux@armlinux.org.uk, linus.walleij@linaro.org, alan@softiron.com
Subject: Re: [RFC PATCH] i2c: at91: Fix pinmux after devm_gpiod_get() for bus
 recovery
Message-ID: <20200505151256.GF2468@ninjato>
References: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="twz1s1Hj1O0rHoT0"
Content-Disposition: inline
In-Reply-To: <20200415070643.23663-1-codrin.ciubotariu@microchip.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--twz1s1Hj1O0rHoT0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 10:06:43AM +0300, Codrin Ciubotariu wrote:
> devm_gpiod_get() usually calls gpio_request_enable() for non-strict pinmux
> drivers. These puts the pins in GPIO mode, whithout notifying the pinctrl
> driver. At this point, the I2C bus no longer owns the pins. To mux the
> pins back to the I2C bus, we use the pinctrl driver to change the state
> of the pins to GPIO, before using devm_gpiod_get(). After the pins are
> received as GPIOs, we switch theer pinctrl state back to the default
> one,
>=20
> Fixes: d3d3fdcc4c90 ("i2c: at91: implement i2c bus recovery")
> Signed-off-by: Codrin Ciubotariu <codrin.ciubotariu@microchip.com>

Applied to for-current, thanks!

This will do for 5.7. For 5.8 or 5.9, I can imagine to take the two
pinctrl_state pointers into bus_recovery_info and handle all this in the
core. I will try this later this week if noone is super-eager to try it
out before.


--twz1s1Hj1O0rHoT0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6xgnQACgkQFA3kzBSg
KbbY+xAArfL/iEHhieAsZoajJ8HCWqBjKMu523a4uPpmSCk4jP9UIqOQqtUac4tK
wUCJg3LXJvbT8pfvfxAcSTHYjgVIvh0br6N44vO5zWz6uTlyEH0LXrg8NP9qrECb
B5HHfsFxVWhTMuFTgcqRHel1qHzhd3rWCebhfdiFrBcHpM6xmeB9VlYyXoq4/qx5
p3/5LwgKJW4xo4AT2J3PCfX5h/zVdIzeWW9qPX+xyUtCJ0MpCxsVxStpUXwudIH2
rJahIU7t0NL0MtKLa4Waf8PjQULKShZc1vrQ/QQhi50kLicGkPwQSJnkFe+lLnjS
aMGEKiJajucG8tz1nqsg8A2CsXpUC70f7bwQP7kGlUVPqEPp13soeor9qoKIClfX
LleANdq18XOlIIRKGtcLKvg/abHXk1/OQ9efNx8Aa4G30im3rozCwbR+Fpn+mLZC
oANKeX7VJ+DmuYqiWaD23Iz/j3M2skgBmUeuzAMYvA+OX6lERmWWnBqEMAqb0si2
nngZTQcBg1s8HEbeDMkH7N9zu47bEdXAARoFE9ys16uZK3A7RRNnv46NSjZAph1b
uepFxAB8QGm9a+sLjLY4Ym/G6vBAv9CRh5FCLDxZ1ODzYZfEiPtt3umtz7DFfGKp
/9wolNpCGqYXQHYwgmakJq5f9MEASvhl4GNag81Qi1AHgRJeDqs=
=kQ/H
-----END PGP SIGNATURE-----

--twz1s1Hj1O0rHoT0--
