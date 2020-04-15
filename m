Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 284641A993A
	for <lists+linux-i2c@lfdr.de>; Wed, 15 Apr 2020 11:47:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2895788AbgDOJrC (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 15 Apr 2020 05:47:02 -0400
Received: from sauhun.de ([88.99.104.3]:50536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2895787AbgDOJrA (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 15 Apr 2020 05:47:00 -0400
Received: from localhost (p54B33507.dip0.t-ipconnect.de [84.179.53.7])
        by pokefinder.org (Postfix) with ESMTPSA id 5E9472C1F58;
        Wed, 15 Apr 2020 11:46:57 +0200 (CEST)
Date:   Wed, 15 Apr 2020 11:46:57 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Kieran Bingham <kieran@ksquared.org.uk>
Cc:     Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-i3c@lists.infradead.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Rob Herring <robh@kernel.org>
Subject: Re: [RFC PATCH v2 2/6] i2c: allow DT nodes without 'compatible'
Message-ID: <20200415094656.GE1141@ninjato>
References: <20200318150059.21714-1-wsa+renesas@sang-engineering.com>
 <20200318150059.21714-3-wsa+renesas@sang-engineering.com>
 <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="SNIs70sCzqvszXB4"
Content-Disposition: inline
In-Reply-To: <74aa4084-588f-1b6f-2256-44588c48edf6@bingham.xyz>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--SNIs70sCzqvszXB4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > Sometimes, we have unknown devices in a system and still want to block
> > their address. For that, we allow DT nodes with only a 'reg' property.
> > These devices will be bound to the "dummy" driver but with the name
> > "reserved". That way, we can distinguish them and even hand them over to
> > the "dummy" driver later when they are really requested using
> > i2c_new_ancillary_device().
>=20
> Oh how I long to be able to give these 'identifiable names' within the
> system, but that will probably mess up all the driver matching and
> binding, so would be quite tricky perhaps.

I haven't found a way yet to use 'name' to give more meaningful
descriptions to dummies. My best bet so far is to use additional links
in sysfs.


--SNIs70sCzqvszXB4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6W2AwACgkQFA3kzBSg
KbZ74Q//XCUnM5Uqs3MGl93+zlEkU9qid076otxKrc7nkRrR4PlkbIAd6KTkD74F
ElytalAQei2cjwYeI6rj6gNh1QgIFn5Fp7VE3cmu/QGVGksVNkPlonP+gjsxbvSp
j+UWFHfi5FxKDgFPdj+0N9UjqsnhLu1zOyAiLw6IXJOSd8uyEX87MWx3Ga60tzwN
QlZ1B/7Yn1Ysg0Xxtxmr1xtBm+9BzJh0zlBbgSvswju+qLzAVVImbT+WeNloVilz
PPoynShY7BhHHxMyPX8cXUYD6z8x2OqCDhPQn4Z+rsnq78Oqx+zLr2k/4RylC1BZ
xSYjqa77r79swX/pn42ycef9pWfuS3tKnja0hFEt3FdIFTW1bJwGDsV1/Q7HFrSL
+z/ZB/+6EP5oHq95lKtWyaUohGSRjZiMTi2l5EuYW6hS5RyYBYMpHWjG22EwfqK/
XiH/cPlD0FpEHem9TeiadOhH7DRKzZziLNLI9bNIL29jzQ3xu2LcPZUHp3zJvXD6
aZoRH7JYWHoyXNrbS/EbPVNW7k4Q1ebgk3oTqz//BUjzqAciLnj6ZMWgqvDGt2ig
XV1SMC20tyS2NlR6gvGt2tj9y3PEnAUJMHJgIXCv9tIvCRUmBsSBO5BRuc3hc5sO
+0+tMY/luasA3dfosRj5qwt46+zTB0YKYMRumDhBKmpFB1K5hvU=
=XY5W
-----END PGP SIGNATURE-----

--SNIs70sCzqvszXB4--
