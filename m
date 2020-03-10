Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1156A17F45F
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:07:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgCJKHU (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:07:20 -0400
Received: from sauhun.de ([88.99.104.3]:46930 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgCJKHU (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:07:20 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id ECB392C1EB6;
        Tue, 10 Mar 2020 11:07:17 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:07:17 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 02/89] dt-bindings: i2c: brcmstb: Add BCM2711
 BSC/AUTO-I2C binding
Message-ID: <20200310100717.GL1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline
In-Reply-To: <9e427ff22fa40b7146b44aee6468559499deb1f1.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:06:04AM +0100, Maxime Ripard wrote:
> The HDMI blocks in the BCM2771 have an i2c controller to retrieve the
> EDID. This block is split into two parts, the BSC and the AUTO_I2C,
> lying in two separate register areas.
>=20
> The AUTO_I2C block has a mailbox-like interface and will take away the
> BSC control from the CPU if enabled. However, the BSC is the actually
> the same controller than the one supported by the brcmstb driver, and
> the AUTO_I2C doesn't really bring any immediate benefit.
>=20
> We can model it in the DT as a single device with two register range,
> which will allow us to use or or the other in the driver without
> changing anything in the DT.
>=20
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Applied to for-next, thanks!


--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nZtUACgkQFA3kzBSg
KbaKNw/8CYeVSOJ+gtDDCflvUs0zsoYsuDzRuEZd7seZDfEDAjPRZea/tz9M16OB
rK81LXAyz3ngWvzob+kcqlJ8NIpW37yu5r/R5mkxemffvAy2Df4Dlx90Cuvnug1/
/D3QDqE7sgAbxdWEWI0/lF66XV2V0RRTIcNqN4e0Rp7Q48CZMA3itmrqLtv3B1M/
6EkTH6G77n4KAyCbN6PuCJJwNUgwsm2jUac2WRpCcaXuavYdMakDWyR0EdWcV08u
ukqFn8lFyh7BHdbFGfuBDKrqU9aca3HjImu1tNTGJZQsZMpohEM5N3Qc53ajWnFX
YWE3UigXavv68FTOElY+Eso4C5uZNJvtGH1bWsGG6DjX2x39vAlGVzAvKfRDQ1Fn
EJeEJ8yDdORfkQQRdu/79DXQ5UAdZkuxDz/2PBgXtE9o14NCZgr8ENDqR2MIWzfa
jpWaeOG272go1xg1z+/gUZRpxEFuVO4aZHyYEnbMB50VxMz+8RxsvldIOG/qfAAj
qLFryHVYg1dRVk2Fv0+Nw1RQ2tIdu/UdQbuatEgJ75PI7ucsL09jLXJvGndJ2ABS
EEzahmZ7hjGLbgarfYUHI9MMZMlofMliRzd8afzMg9PakdGzaayhHqhNcm8ID/GV
vTyMwl4s+XAYs8gLuOZub0lN6ZUBYAo1jLYHH/IKz/nDoBRHeU4=
=M9RT
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
