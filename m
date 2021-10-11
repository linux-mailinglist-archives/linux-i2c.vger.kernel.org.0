Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A9A9428670
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Oct 2021 07:50:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbhJKFwX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Oct 2021 01:52:23 -0400
Received: from sauhun.de ([88.99.104.3]:49536 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229986AbhJKFwW (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Oct 2021 01:52:22 -0400
Received: from localhost (p54b3315a.dip0.t-ipconnect.de [84.179.49.90])
        by pokefinder.org (Postfix) with ESMTPSA id 5F6122C00A6;
        Mon, 11 Oct 2021 07:50:20 +0200 (CEST)
Date:   Mon, 11 Oct 2021 07:50:16 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v3 02/11] i2c: acpi: Use acpi_dev_ready_for_enumeration()
 helper
Message-ID: <YWPQmGKI0YzMnm35@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Hans de Goede <hdegoede@redhat.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20211010185707.195883-1-hdegoede@redhat.com>
 <20211010185707.195883-3-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="kpSW/TDc2ClihKjN"
Content-Disposition: inline
In-Reply-To: <20211010185707.195883-3-hdegoede@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--kpSW/TDc2ClihKjN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 10, 2021 at 08:56:58PM +0200, Hans de Goede wrote:
> The clk and regulator frameworks expect clk/regulator consumer-devices
> to have info about the consumed clks/regulators described in the device's
> fw_node.
>=20
> To work around cases where this info is not present in the firmware table=
s,
> which is often the case on x86/ACPI devices, both frameworks allow the
> provider-driver to attach info about consumers to the clks/regulators
> when registering these.
>=20
> This causes problems with the probe ordering wrt drivers for consumers
> of these clks/regulators. Since the lookups are only registered when the
> provider-driver binds, trying to get these clks/regulators before then
> results in a -ENOENT error for clks and a dummy regulator for regulators.
>=20
> To ensure the correct probe-ordering the ACPI core has code to defer the
> enumeration of consumers affected by this until the providers are ready.
>=20
> Call the new acpi_dev_ready_for_enumeration() helper to avoid
> enumerating / instantiating i2c-clients too early.
>=20
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

If the ACPI and I2C-ACPI maintainers are happy, I am fine with this,
too:

Acked-by: Wolfram Sang <wsa@kernel.org>


--kpSW/TDc2ClihKjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmFj0JEACgkQFA3kzBSg
KbYxJhAApjIf+9ZpThQuo57RPJf7E3JLEg8Zt4yCTURtmLlTlc9cX9xyZpaUulfV
STyFose+JW+221p99KOlw5o3TIVQkXUdNEz2wLOrr3uorLpjYYcc4H2BAm+M7+4v
Mn1LKckOrCCvoS3fGuHmJRfNId/GBLDHoyWVt3YYsW+2P7xQ3elEe9nm/sKdETIg
1vmyq7ad5aAezhN2/qflYHCtR1WZWRbA0a4BrXGGg30t3bx1u34b0mG+Q7XqXb6s
8MnRdT8EmU+2XKIvBUHFSR8BftmwjAbJvzHtGBVHnWgjJHlwJpPQnTRRMgNJSmq6
OyXgEu506tF+8urV7Q3Iwh9T6B3avMD6+KwnFl1HqVI9dCwrsZTwLrUgA/h5MPkp
dXleThz8PeJusOIZuNEbvwIwIBndHRS9yDT5Xt6pXPTEcwP7k4VDsNAhPMVMo5kH
nJguFJ9EDlgxxayoD5R4zSKnDYW+6EJxVEOrRyMQHbjUQQWrXqOJBmqgCzswk8gR
J5cBOF5deBidKRmS9uikQ+v3PzbSdQLRVa2houbQs7TOex3LJ7+r2aaRbkSAaJ/k
G/vd9HqA8okfGxpDtm76bjyeEpigSY5xi+0VgWDgkGiud5MvUiiWy/NbmSllEpGx
zP7glXE7ggCCr6Fc8ydZFp3sSL6hFJeb6tDsg9ev+juPlw8TCu0=
=mBFk
-----END PGP SIGNATURE-----

--kpSW/TDc2ClihKjN--
