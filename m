Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0F082F80D5
	for <lists+linux-i2c@lfdr.de>; Mon, 11 Nov 2019 21:10:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727020AbfKKUKX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 11 Nov 2019 15:10:23 -0500
Received: from sauhun.de ([88.99.104.3]:50026 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726845AbfKKUKX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 11 Nov 2019 15:10:23 -0500
Received: from localhost (x4db75ae4.dyn.telefonica.de [77.183.90.228])
        by pokefinder.org (Postfix) with ESMTPSA id 7993F2C0428;
        Mon, 11 Nov 2019 21:10:21 +0100 (CET)
Date:   Mon, 11 Nov 2019 21:10:21 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Patrick Williams <alpawi@amazon.com>
Cc:     Patrick Williams <patrick@stwcx.xyz>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Max Staudt <max@enpas.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        Ajay Gupta <ajayg@nvidia.com>, Stefan Roese <sr@denx.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>,
        Baolin Wang <baolin.wang@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Allison Randal <allison@lohutok.net>,
        linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: pxa: migrate to new i2c_slave APIs
Message-ID: <20191111201020.GI1608@kunai>
References: <20191001160001.2388-1-alpawi@amazon.com>
 <20191001160001.2388-2-alpawi@amazon.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="0XMZdl/q8hSSmFeD"
Content-Disposition: inline
In-Reply-To: <20191001160001.2388-2-alpawi@amazon.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--0XMZdl/q8hSSmFeD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 01, 2019 at 10:59:59AM -0500, Patrick Williams wrote:
> The i2c subsystem was enhanced circa 2015 to support operating as
> an i2c-slave device.  Prior to that, the i2c-pxa driver supported
> an i2c-slave but had its own APIs.  There are no existing in-kernel
> drivers or platforms that utilize the i2c-pxa APIs.
>=20
> Migrate the i2c-pxa driver to the general i2c-slave APIs so that
> existing drivers, such as the i2c-slave-eeprom, can be used.
>=20
> This has been tested with a Marvell EspressoBin, using i2c-pxa and
> i2c-slave-eeprom, acting as a slave, and a RaspeberryPi 3, using the
> at24 driver, acting as a master.
>=20
> Signed-off-by: Patrick Williams <alpawi@amazon.com>

Awesome! This was so needed but I always wondered if PXA was still
around...

Applied to for-next, thanks!


--0XMZdl/q8hSSmFeD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl3JwCwACgkQFA3kzBSg
KbbwFhAAnRbMIn70NdjtA9xRg78u7JLSD7YqapOMnxNsHCWg+sJnvpqhuRPh5Tp1
fvYSyKabNafDl6U5B4waKj2BtAfGawdgO6D3C6Wd0ejruHAafmFiqC00CL6G0+7m
HMDMcmXiYaUWWqWLqzBsm4ZIve6ZT219chFq+QIkEiDV6DGYWJqjS9zZ2ubQ7CBl
Aa30uaAOk4kdieVY5iVrSVzKVYClOYIHpUPqFIzOIwJZI9Htzo5zmOe3Iqw1Uwy9
onRbWVax2Rp5KwoYXa75TRyoanh7EemhY/JCdAHukEh/1zfRBV+eNPC5shf0vV21
sI6rXRGfhKb50DMEdXPOYXmkrhKlzwU0DSZWTjZ4kiGWrwzy8dkeBvZxX0URvQpL
Dth7F6T4LYgR9vPS3dqpajWukzCho1TD6JItcICetffs17AGDn22NEXYX8l5au8S
bHdDbWNirgY9/ubuzHqu6EDNgWQFooEAwuFf4CqFGndCl7UXMRMZVzpcMa51+WsD
mKTzLgA/0fedyJg7UYxkpNfJpJI7BfMhrtkwcepvWx8ZHvl3IElqSsOrBNz0VYWH
OwQktNTyh954yGpLWLRszNMXrPL/zTZKkYoBh94wveKLGuZ21WgTxwimXFugTuHZ
9O1E6BSXfNkSZ66mU3KBMtMrnrS/xa9MEBhvkO/E3XhgOB74NeU=
=COit
-----END PGP SIGNATURE-----

--0XMZdl/q8hSSmFeD--
