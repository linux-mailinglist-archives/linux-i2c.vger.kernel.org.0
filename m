Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FFA182F2E
	for <lists+linux-i2c@lfdr.de>; Thu, 12 Mar 2020 12:30:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726044AbgCLLap (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 12 Mar 2020 07:30:45 -0400
Received: from sauhun.de ([88.99.104.3]:41382 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725268AbgCLLap (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 12 Mar 2020 07:30:45 -0400
Received: from localhost (p54B331A0.dip0.t-ipconnect.de [84.179.49.160])
        by pokefinder.org (Postfix) with ESMTPSA id 66DED2C1ECC;
        Thu, 12 Mar 2020 12:30:43 +0100 (CET)
Date:   Thu, 12 Mar 2020 12:30:43 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-i3c@lists.infradead.org,
        Kieran Bingham <kieran@ksquared.org.uk>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Subject: Re: [RFC PATCH 7/7] i2c: core: hand over reserved devices when
 requesting ancillary addresses
Message-ID: <20200312113042.GD1013@ninjato>
References: <20200220172403.26062-1-wsa+renesas@sang-engineering.com>
 <20200220172403.26062-8-wsa+renesas@sang-engineering.com>
 <CAMuHMdV-dfjukuSKiFg4vb4Ntn+XWU0XwHPxyoaWs1vtQVg4cw@mail.gmail.com>
 <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="rz+pwK2yUstbofK6"
Content-Disposition: inline
In-Reply-To: <dc831357-8545-6f6e-71a2-bef282e0bd94@lucaceresoli.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--rz+pwK2yUstbofK6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> >> +               strlcpy(reserved_client->name, I2C_DUMMY_DRV_NAME, siz=
eof(client->name));
>=20
> Any strong reason for not giving the device a more informative name?

Yes, sadly...

> Reading "dummy" in several /sys/bus/i2c/devices/?-????/name files is not
> helping. Using the 'name' string that is passed to
> i2c_new_ancillary_device() would be way better, perhaps prefixed by
> dev->name. But this opens the question of why not doing it in

=2E.. I never liked the plain "dummy" name as well. However, because
'name' is what we need to bind to a driver we can't have a more
descriptive or run-time generated name at that place.

> i2c_new_dummy_device() as well, which currently receives no "name"
> parameter.

I thought about it but discarded the idea because then you still have
no connection to the driver which created the dummy device. My
favourite idea so far is to advertise i2c_new_ancillary_device() instead
of i2c_new_dummy_device(), because there we already have access to the
client structure. With that, we could add another link in sysfs to the
main address and vice-versa.

> Of course this is not strictly related to this patch and can be done in
> a later step.

Exactly.


--rz+pwK2yUstbofK6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5qHWIACgkQFA3kzBSg
KbYqEA//dr8XFHEYXWhQXqlofteHQgPuqLLgw5ruq9PvVCpv51Scsz/RjoUKvanT
s3/CZjL+MvvHDvvpKjCpW6/ImDM2KSGalPy0ZAQ0GaOtS2aqaLvieLsnxGPF2FLl
QLBufHNjG6DOkO6PrQ44SLRFvpKw2iBMihmGyJBRjWWMtPrpgw5fO0omoM3IogPj
t+W0+Fou6p6dgiTYhGCIOYi8YHAHEZt+HPhBExDRHfbeF3K9IXGwA84m8uTCVEP6
2XZoR4mjO5fbXGMWp5uhB9EtXridUSmUTavnG/vOFki6i8Nw36bscICAgRVaHk3m
nhK4s53VEt1EB8dyW61ZUAfBqwwCHKfbmRneKpDtytOi7PS2eHrSTC1hCioparvh
ifGDynlbyaEbJtxmmp2ukgSxLiO9V3r4HgHnnU7L+yUMUApcVX6o7ftRgMjKK4oj
rYOnylcJyC151MOY4T+2fSl9VCmkcBsz8K5LoU/iN0TF6/x0W3OQ6Nv1p+t1k2oe
105gZoZ/9d+7ja7MfJB23p0neb8SE0BVgkFtvLkJyvpyEw3f/JMdE1g3fjCAlb4u
dB0enc8/ncA+yoGOTtN2ADXCPvteTcfK+GC9/Tlmd1HJwWlIWu24IVYJFAg6a4Ln
HTILjLrr6L9HRNaemVxKdq1c/fTAPMFJB2ReDoHJokKjoTPULn0=
=WKGM
-----END PGP SIGNATURE-----

--rz+pwK2yUstbofK6--
