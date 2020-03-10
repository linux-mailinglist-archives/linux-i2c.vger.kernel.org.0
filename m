Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1C20117F45D
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:07:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726295AbgCJKHP (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:07:15 -0400
Received: from sauhun.de ([88.99.104.3]:46918 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgCJKHP (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:07:15 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 1F2E72C1EC6;
        Tue, 10 Mar 2020 11:07:13 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:07:12 +0100
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
Subject: Re: [PATCH 01/89] dt-bindings: i2c: brcmstb: Convert the BRCMSTB
 binding to a schema
Message-ID: <20200310100712.GK1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Ah40dssYA/cDqAW1"
Content-Disposition: inline
In-Reply-To: <6649111e9c585f267762bb6c6dd96128e5cfb4ba.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Ah40dssYA/cDqAW1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:06:03AM +0100, Maxime Ripard wrote:
> Switch the DT binding to a YAML schema to enable the DT validation.
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


--Ah40dssYA/cDqAW1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5nZtAACgkQFA3kzBSg
KbY+NxAApOA0DgL9E18jKGCjbNUZdoNygycR8UoNEsGm7J/mGOUAW0bk9z4483Tr
b1Jpea0h2FsKT8Hi8CYLCF7A4Ak4CwDIOOjeFrgekBcrqopEXe9k6uJfHvlVs4CC
Qj9CfTKsCJNzmdmEF52LTD0PKQ2pQzlIzxv+R6NaCDXdg1ny5gLiJOYh3taZ3Zfv
g0hk64L428pj3g2BU5CHkMeTakLEc2wyZy4ooK7b0vtGCkGTEKCMwmOh4hpVnpk9
Q3q0m93ylVuPisnG7KQrKhVYcYJVQylHZeMshW2siLhMRJ99LbAKudsSLJonivHS
iXZciqZWNOKtwWc33Kc3cGlSYdqc/gFi5o8bxk9mJZO45SvGSbBxCWrb5+HLhORk
f0yZijL17mcJfnN1gJbFpZNPvEJyLfX/toxP1JAp8JbXuL1DsgOx0u1Icm2ktiH7
+63SvGtyq/970XG81VyKn8Pi05VDaO9Lc9KF+U4e9X4ogVvUF2MXyBQR2N/aufoc
VHrfcWZBkmx55YyW+T01gsKtdIElXC2MlXdianIcCVRJjGUgNr47JhoGX0kPK7On
WSrujQEyv3TE1GBFlQ4pcVC4IRysR7QNjx0qhGaDMBP7dvkWQvsNxFjPU0UiQAyH
D5eCaht02CFa0uQRlHue7QZrUP2JxhWSsW+bNxFeIiL9PSA5buw=
=aQAg
-----END PGP SIGNATURE-----

--Ah40dssYA/cDqAW1--
