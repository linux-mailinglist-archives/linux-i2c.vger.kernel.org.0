Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5767DB6C
	for <lists+linux-i2c@lfdr.de>; Thu,  1 Aug 2019 14:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729653AbfHAM1i (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 1 Aug 2019 08:27:38 -0400
Received: from sauhun.de ([88.99.104.3]:52378 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728903AbfHAM1i (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 1 Aug 2019 08:27:38 -0400
Received: from localhost (p54B333D2.dip0.t-ipconnect.de [84.179.51.210])
        by pokefinder.org (Postfix) with ESMTPSA id 026C62C2817;
        Thu,  1 Aug 2019 14:27:35 +0200 (CEST)
Date:   Thu, 1 Aug 2019 14:27:35 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
        rafael@kernel.org, linux-arm-kernel@lists.infradead.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        linux-spi@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH v3 5/7] drivers: Introduce device lookup variants by
 ACPI_COMPANION device
Message-ID: <20190801122735.GD1659@ninjato>
References: <20190723221838.12024-1-suzuki.poulose@arm.com>
 <20190723221838.12024-6-suzuki.poulose@arm.com>
 <20190726202353.GA963@kunai>
 <20190801115856.GS23480@smile.fi.intel.com>
 <20190801120830.GA1659@ninjato>
 <20190801122106.GU23480@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="n2Pv11Ogg/Ox8ay5"
Content-Disposition: inline
In-Reply-To: <20190801122106.GU23480@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--n2Pv11Ogg/Ox8ay5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> It's again not Cc'ed to all parties.
> But OK, looks good to me.
> Tough may be Jarkko can test all this.

To be fair, only Mika is listed as I2C ACPI maintainer. Feel free to add
more :) I assume Mika doesn't mind.


--n2Pv11Ogg/Ox8ay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1C2rcACgkQFA3kzBSg
KbbC7g/+JDJ/wQtaEgLwko1svAEbCfU6wxRadTwM0jWd4adQgIpPuwceKEDRV5ap
sdqUoIDjY4UInI7HeUYLRTY/VUIaOmQ4C0VkWvgYFnAsZoAU/GWKrGVnJ74C34oK
L1n76meYZVFj1+kuOPce8PKPbZ1N6t2N0H5VHChczypiPldel2s/UiW5Myk18T5v
ZBt/xDU/C+vn2IPRKu5ybKFWzsSGIeAq0D/LvrnsO6q7z3bu8nmOL8rNTQCOVVwl
vG1B3arBO1jwtT5kVA3/1hQZDoDucaXlFNw/8oL/jSHCajH2kKf/Ux0D4gAjK18y
XWexgt84CLU9Q1MIwuYoJ+yuB8jyeJVdWAEkDSBVS6qUSZRx+00arhni5AJKWKGG
aXe/UHiDv1FAgyqekJDwerz3pRRULCqtiGTZ3H3IOlLc1FtTibJ5VJeDZ8dH/+4z
+TeZiW+iLpNDufs3x8Sf6I+StIUB0bDWlvWyY2rdcL0YqozlUMYlQLvRfjOJLf9t
3C1S9F4JB8pf9XOxPHKMIUgXpruGuWSLKm2m+rX7X49kQ3Ey4YRAhhVGT8PT9e3B
1YtgOqFwsdaexAc3Y1LoVutgoLEARcqZ4q30pao5uIVzy7reLFmM/u3NRJDTKurR
UxJH+EIkqg6UzLXABaZ5mTPYOFeiNDbjRAvLF7yBFENM9bBw2ZY=
=K7Ly
-----END PGP SIGNATURE-----

--n2Pv11Ogg/Ox8ay5--
