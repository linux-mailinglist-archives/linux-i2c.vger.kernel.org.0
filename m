Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC3FFA9546
	for <lists+linux-i2c@lfdr.de>; Wed,  4 Sep 2019 23:37:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729640AbfIDVhs (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 4 Sep 2019 17:37:48 -0400
Received: from sauhun.de ([88.99.104.3]:46500 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727125AbfIDVhs (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 4 Sep 2019 17:37:48 -0400
Received: from localhost (p54B337F1.dip0.t-ipconnect.de [84.179.55.241])
        by pokefinder.org (Postfix) with ESMTPSA id E8DCE2C08C3;
        Wed,  4 Sep 2019 23:37:45 +0200 (CEST)
Date:   Wed, 4 Sep 2019 23:37:45 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Ray Jui <ray.jui@broadcom.com>
Cc:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-i2c@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        bcm-kernel-feedback-list@broadcom.com,
        Florian Fainelli <f.fainelli@gmail.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Icarus Chau <icarus.chau@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v1 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20190904213745.GG23608@ninjato>
References: <1565150941-27297-1-git-send-email-rayagonda.kokatanur@broadcom.com>
 <20190830125626.GC2870@ninjato>
 <3e70fa7e-de13-4edd-2e17-b7c56e91d220@broadcom.com>
 <20190831094940.GA1138@kunai>
 <540c4e2d-0dd5-5260-30b2-e1589b279d71@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="EDJsL2R9iCFAt7IV"
Content-Disposition: inline
In-Reply-To: <540c4e2d-0dd5-5260-30b2-e1589b279d71@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--EDJsL2R9iCFAt7IV
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> I think you are right that the controller does not seem to support
> additional I2C features in addition to SMBUS.
>=20
> However, my concern of switching to the smbus_xfer API is:
>=20
> 1) Some customers might have used I2C_RDWR based API from i2cdev. Changing
> from master_xfer to smbus_xfer may break the existing applications that a=
re
> already developed.

Well, given that you add new quirks in the original patch here, you are
kind of breaking it already. Most transfers which are not SMBus-alike
transfers would now be rejected. For SMBus-alike transfers which are
sent via I2C_RDWR (which is ugly), I have to think about it.

> 2) The sound subsystem I2C regmap based implementation seems to be using
> i2c_ based API instead of smbus_ based API. Does this mean this will also
> break most of the audio codec drivers with I2C regmap API based usage?

I don't think so. If you check regmap_get_i2c_bus() then it checks the
adapter functionality and chooses the best transfer option then. I may
be missing something but I would wonder if the sound system does
something special and different.


--EDJsL2R9iCFAt7IV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1wLqkACgkQFA3kzBSg
KbbdPBAAsHYbJFSjXbArIzGj/6rYqzbUnvYeKqVHK/C1E7C1/89RAeVkba81NFsu
PjHeTsrPaMQ6lK5Df79WK8I0EDf++K1Imv1edG64CamFTHqc60rVShO3ifPnQf8P
XrOEAUxLEsoXjAqsUy9Nl2xU9roZxcglRdSSg+rlDsN6WRJ8bq0xg7I/7pPs0t/m
DU+77rOjrqcj3mKJsMvcH/ay4tAYQGwXKalqLwkRuy6u5bQ98G/z9mPdGRwBXxx7
2lg61m1t05rmuU8PQZnnD1xB8syyt3/ivq4VWVs/9ghtAoTirMGtkhWu0SIQ17M5
KePWtCxia4A4rHQeEF6vdrbuZAcPqFy8ttnoccsUBBXLy4KYs2zguxiss0EXq95t
QHW83RzcyxpPqqbVPAgtoQONVcFBLvJ3p5LDIHi/kgosLcTyyjTfre1vzRcG8j9S
j/q++XaORKmfJ4evfK5AdbexTLnXGlUyXcRj0vQElOHxVOwk2PbjYAAq58XKsY9W
95LmlBMR2kDB/GCdZWGdTt29hyyhLgde4temx2eBCAqafAhAsPdFp8sFA2mEkaC4
h5rby01u7yD66c8hpI/4q5psgoj1j7fRctKsdtxb/S8P2sHcKZ6HygntSmmEb+WG
BGd+gabtDbQBSHrOxqYrYBZVQFNf3YABNMFvC5LuvgMs3Ek59iM=
=s2Lx
-----END PGP SIGNATURE-----

--EDJsL2R9iCFAt7IV--
