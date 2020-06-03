Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 845B51ED751
	for <lists+linux-i2c@lfdr.de>; Wed,  3 Jun 2020 22:26:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725992AbgFCUZ6 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Wed, 3 Jun 2020 16:25:58 -0400
Received: from sauhun.de ([88.99.104.3]:50126 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725961AbgFCUZ6 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Wed, 3 Jun 2020 16:25:58 -0400
Received: from localhost (p5486cfa5.dip0.t-ipconnect.de [84.134.207.165])
        by pokefinder.org (Postfix) with ESMTPSA id 116E32C1FE2;
        Wed,  3 Jun 2020 22:25:55 +0200 (CEST)
Date:   Wed, 3 Jun 2020 22:25:53 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Tali Perry <tali.perry1@gmail.com>
Cc:     ofery@google.com, brendanhiggins@google.com,
        avifishman70@gmail.com, tmaimon77@gmail.com, kfting@nuvoton.com,
        venture@google.com, yuenn@google.com, benjaminfair@google.com,
        robh+dt@kernel.org, andriy.shevchenko@linux.intel.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        openbmc@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v14 0/3] i2c: npcm7xx: add NPCM i2c controller driver
Message-ID: <20200603202553.GB7684@kunai>
References: <20200527200820.47359-1-tali.perry1@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="DBIVS5p969aUjpLe"
Content-Disposition: inline
In-Reply-To: <20200527200820.47359-1-tali.perry1@gmail.com>
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--DBIVS5p969aUjpLe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2020 at 11:08:17PM +0300, Tali Perry wrote:
> This patch set adds i2c controller support=20
> for the Nuvoton NPCM Baseboard Management Controller (BMC).
>=20
> NPCM7xx includes 16 I2C controllers. This driver operates the controller.
> This module also includes a slave mode.
>=20
> ---
> v14 -> v13:
> 	- Fix yaml example: add missing include.
> 	- Replace all udelay to usleep_range, except one which is called from
> 	  irq.
> 	- Fix compilation error (module_platfrom_init conflict).
> 	- debugfs counters always updated. Counting till max value,
> 	  then stop counting.
> 	- Rename bus-frequency to clock-frequency.
> 	- Remove unused variables.

I don't have time for a deeper review, but from what I can tell this
driver is good to go and we can fix things incrementally from now on.

Applied to for-next (will go into 5.8), thanks!


--DBIVS5p969aUjpLe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl7YB1EACgkQFA3kzBSg
KbZmVw//dD5ttj+RhzDcyUcRJ9NMb6dXctKo/EQYXzZfQlKOJqL36iVqKjy8rmFM
S2F42QY95jaNRdUHEGaFzDazxEUhy7J+07z0XPHk1CrGUDBVVtRf28dsEAXS7UTm
o8pq67KgL+rr4PcKVd92OnBF0Sdi5d6HlVYah9W7dlnR/crg95cd9JUdwn1THmFw
/PEmw4XRnYk/+GC4D+hai+W/E86RPpMzCU9YbOCfgnTWC+L7b9W4hS3j9+xtv62V
HD2GagLUGpBiKENxUSS0NJ7agC31Eea7gi9Gn5P8OfxYr4VtPSagnchKwCoohFbU
EySi0qXRd5+hWMOjg2DcGqC8mo/FC2ZDSKlLYWiicTgyZjP4vkRpMHqqtwS9u+23
EFQv0Gy+QjePWEJdjYHP+TxuKw0+2OqMfSr/mkB49sgcKe1Fd7EFlCJbnDmIoZc1
loO0x9MGK9bl/hlVWUpTorkAJGJygdstxTVk9jFJAEFvUXz6ZNk7HKdb0yOqvZcu
hRqp1nOCL3fSUjtNPfE3ovaEQBiJO/FcGPf4bSgKycnfeFEbnJy+lYhCvsTV6x6A
fUy85pKXZad4b51OFi9Hgo+a59ocTopYQRPvAiTcD+e9x2WagmMJCdNjTFsKCUy0
kprWATccn3TZJ3pSZpqlPX9FvP8u3mZOywM4WXtpX8xvT6qXqys=
=fEJK
-----END PGP SIGNATURE-----

--DBIVS5p969aUjpLe--
