Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E125F3E8485
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Aug 2021 22:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230295AbhHJUpD (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Aug 2021 16:45:03 -0400
Received: from sauhun.de ([88.99.104.3]:48968 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230181AbhHJUpD (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Aug 2021 16:45:03 -0400
Received: from localhost (p5486ce3a.dip0.t-ipconnect.de [84.134.206.58])
        by pokefinder.org (Postfix) with ESMTPSA id 725B22C00D7;
        Tue, 10 Aug 2021 22:44:38 +0200 (CEST)
Date:   Tue, 10 Aug 2021 22:44:38 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
Subject: Re: [PATCH 1/4] i2c: acpi: Add an i2c_acpi_client_count() helper
 function
Message-ID: <YRLlNh4MrHyVobvR@kunai>
Mail-Followup-To: Wolfram Sang <wsa@the-dreams.de>,
        Hans de Goede <hdegoede@redhat.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-acpi@vger.kernel.org
References: <20210803160044.158802-1-hdegoede@redhat.com>
 <20210803160044.158802-2-hdegoede@redhat.com>
 <YQlzzy933V9XMHqt@lahna>
 <9fbf0d6a-2df3-4765-ccf5-788b86994d71@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="XUVmFIGdhrbGtadj"
Content-Disposition: inline
In-Reply-To: <9fbf0d6a-2df3-4765-ccf5-788b86994d71@redhat.com>
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--XUVmFIGdhrbGtadj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> We have 3 files now which have the need to count the number of
> >> I2cSerialBus resources in an ACPI-device's resource-list.
> >>
> >> Currently all implement their own helper function for this,
> >> add a generic helper function to replace the 3 implementations.
> >>
> >> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> >=20
> > Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
>=20
> Thank you, Wolfram are you also ok with me merging this
> patch through the pdx86 tree?

Sure!

Acked-by: Wolfram Sang <wsa@kernel.org>


--XUVmFIGdhrbGtadj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmES5TUACgkQFA3kzBSg
KbaqcA/+PD08vkVwJP3H6+FYae3PadhO8O+PXXrjdZ4o4HT0gsn/SrSxO1Vcqntt
H1s6IfOlwKtfxwb7vH7SM/0XFpBISC0xnc2HKssRg2E0qV2A5M58QYOgGuiv+1y6
ozSOyA1T8AWRwIkujdYoGamTnDiyGMZdR59lm8TWFTgYfAebJWh5TTdiPOaMwv2N
1/yqbRSiCe9+6E0J2TAzHf24dPPj1uhLYBLkjluimoKZvHKt1UCet6hdQyVAhyL+
MPDKkmFZBY0PJNK3TV+bXihTpJg3Xc6ECkDTrUOYe4SX4aOWprB9cXgVdgxd0Kjy
AovrnIbUT5hgv5mpZbu4b5wwzv5cVyqC9rmp8KVTkVit2lGbw0iWbk1mU+Fl2HTU
asZ/zKHnDhYnw91fCiJY2OwrQhug3NmYY1Ax4b+70ZD9VUvXbERTV7mp75twjjMZ
z+4EQJKp5WtiHAzF7eBwf/8/W5ms0tLPwFjU/AVBN7XpibdLIODXfROyn8xKdUKh
BoIzcPwNqRa0XAL7L0rU4K89bv2S/HNd9nssqnH3kZIWuZ+prkFrsYry/u+O/swN
RcJbJ5l76ZrJe4gmM7jiQaJzkpEzpsWIgCc3dT0JwmAhoBq8grFNqc/wFAz5twBB
axB+fsVAStwSkgEoDntD9xWtgIw8xWf9WdQuyFylrTwzQsHVpXg=
=WnY9
-----END PGP SIGNATURE-----

--XUVmFIGdhrbGtadj--
