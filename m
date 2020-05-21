Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87B2B1DD881
	for <lists+linux-i2c@lfdr.de>; Thu, 21 May 2020 22:38:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730016AbgEUUiB (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 21 May 2020 16:38:01 -0400
Received: from sauhun.de ([88.99.104.3]:53672 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729550AbgEUUiB (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 21 May 2020 16:38:01 -0400
Received: from localhost (p5486ce13.dip0.t-ipconnect.de [84.134.206.19])
        by pokefinder.org (Postfix) with ESMTPSA id 7F7B02C1FCF;
        Thu, 21 May 2020 22:37:58 +0200 (CEST)
Date:   Thu, 21 May 2020 22:37:58 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Tali Perry <tali.perry1@gmail.com>,
        Ofer Yehielli <ofery@google.com>,
        Brendan Higgins <brendanhiggins@google.com>,
        avifishman70@gmail.com, Tomer Maimon <tmaimon77@gmail.com>,
        kfting@nuvoton.com, Patrick Venture <venture@google.com>,
        Nancy Yuen <yuenn@google.com>,
        Benjamin Fair <benjaminfair@google.com>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 2/3] i2c: npcm7xx: Add Nuvoton NPCM I2C controller
 driver
Message-ID: <20200521203758.GA20150@ninjato>
References: <20200521110910.45518-1-tali.perry1@gmail.com>
 <20200521110910.45518-3-tali.perry1@gmail.com>
 <20200521142340.GM1634618@smile.fi.intel.com>
 <20200521143100.GA16812@ninjato>
 <CAHb3i=vcVLWHjdiJoNZQrwJCqzszpOL7e9SAjqObsZCRH4ifwg@mail.gmail.com>
 <20200521145347.GO1634618@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20200521145347.GO1634618@smile.fi.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> > > I wondered also about DEBUG_FS entries. I can see their value when
> > > developing the driver. But since this is done now, do they really hel=
p a
> > > user to debug a difficult case? I am not sure, and then I wonder if we
> > > should have that code in upstream. I am open for discussion, though.
> >=20
> > The user wanted to have health monitor implemented on top of the driver.
> > The user has 16 channels connected the multiple devices. All are operat=
ed
> > using various daemons in the system. Sometimes the slave devices are po=
wer down.
> > Therefor the user wanted to track the health status of the devices.
>=20
> Ah, then there are these options I have in mind (Wolfram, FYI as well!):
> 1) push with debugfs as a temporary solution and convert to devlink healt=
h protocol [1];
> 2) drop it and develop devlink_health solution;
> 3) push debugfs and wait if I=C2=B2C will gain devlink health support

No need for 2). We can push it now and convert it later. That being
said, I wonder if [1] is suitable for this driver? Things like NACKs and
timeouts happen regularly on an I2C bus and are not a state of bad
health.


--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7G5qEACgkQFA3kzBSg
KbYDmQ/+OTWXWz2QGQFX0uxtaXhfs432/2BO3z/AA7ZJn7t6OCSyyvDL9L26maBs
Hu/S78wYqdLY6l58jtz8iUHsMwqL+zcQSTjOlo8mqj99T10GpZiwzJlSVB7AxT28
jmlxqN+z9fNUDQDujV+Y8UVvi7+UZ8Y37nYewtOz3AMskTx90HflDt4OHUBQsG7p
1bj1wtPmUfOy8su9FZrPN6SdhzO24XXaqVJgNg2FWqiuNoZ6Kdo8ekQAc3bjvNiO
PbEjpRw9QFE8pY9bWyHHJ7pFfpUvwe1bCXAA+Dj19LY2R+29lOxwaRZ3teTWxhG1
ArYFtxWrvCwYezyEKZEPozzfOYwd9LZE28c30aDC/8gfeAP1Gz8C9jySYRid6/Zp
RglnDBJKcR3V71fjLTLIXIkPd7kMbxK9A9MQkwlPeLbqlkiLbZflr9ceusirhxmU
IP98Ma6w8fob0ntpPGBD0j42rCebhN1d6PG2HHnvbQqj7hpjCUvVNAerGY38enaJ
+kNWO8/Y+Hwry7VLp/l5cQ23BeVJpeh8nGME+t6rJhWIP69oP6GEQNGWdzYCElD5
X3l4OOSdFAw1ZFjfj0K8wtMEHno/wDglPsrGxjReFI5YCQyKSKi3NtqONSEPiVrn
40cpX2SNefM4PjPQwRSVKuYNlAvmzo9cQKpkgg2YluT2V+JFJVo=
=jcCF
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
