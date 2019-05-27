Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52DE42BAA6
	for <lists+linux-i2c@lfdr.de>; Mon, 27 May 2019 21:22:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726837AbfE0TV7 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Mon, 27 May 2019 15:21:59 -0400
Received: from sauhun.de ([88.99.104.3]:36148 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726484AbfE0TV7 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Mon, 27 May 2019 15:21:59 -0400
Received: from localhost (p5486CF59.dip0.t-ipconnect.de [84.134.207.89])
        by pokefinder.org (Postfix) with ESMTPSA id 2F9372C04C2;
        Mon, 27 May 2019 21:21:57 +0200 (CEST)
Date:   Mon, 27 May 2019 21:21:56 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Jean Delvare <jdelvare@suse.de>,
        Jarkko Nikula <jarkko.nikula@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Vignesh R <vigneshr@ti.com>,
        Eddie James <eajames@linux.vnet.ibm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Ajay Gupta <ajayg@nvidia.com>,
        Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        Juergen Fitschen <jfi@ssv-embedded.de>,
        Elie Morisse <syniurge@gmail.com>,
        "open list:I2C SUBSYSTEM HOST DRIVERS" <linux-i2c@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] i2c: Allow selecting BCM2835 I2C controllers on
 ARCH_BRCMSTB
Message-ID: <20190527192156.GF8808@kunai>
References: <20190509210438.28223-1-f.fainelli@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="dWYAkE0V1FpFQHQ3"
Content-Disposition: inline
In-Reply-To: <20190509210438.28223-1-f.fainelli@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--dWYAkE0V1FpFQHQ3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 09, 2019 at 02:04:36PM -0700, Florian Fainelli wrote:
> From: Kamal Dasu <kdasu.kdev@gmail.com>
>=20
> ARCH_BRCMSTB platforms have the BCM2835 I2C controllers, allow
> selecting the i2c-bcm2835 driver on such platforms.
>=20
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to for-next, thanks!


--dWYAkE0V1FpFQHQ3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlzsONQACgkQFA3kzBSg
KbYiRQ//Rt13LD4OiH6Oi2ARvnFvTNUEFodH7gJfdfIQqEGg6uTRfRJMdh9pPFgN
SbhXmxB0Jy9J65kG06L1OZoPmsykZOvlxdcdXU8/OOUALe7Uz/P9UW4stPAb+PE6
Qpa7i50R/Sl8xaDxNFXw2pjHdOU/dO4zFkw+pGaGXB8YxxtiVp2ZBebBD3dtsgGv
PEDxTmcFwC2xv7eLBVXE+rEbpAu8QB5EwijobxMUdGjl7x0z3T0Adb2HRY0FviQH
TxX06BfENtqiZAiLKSLsGj4jxdb1YrrCVeleBZMu0nFpgrZmemVMrysfSPbm9EAB
GHcAG6QYx82EDuosRui3BcJ7ZKu5tDp9nlv04p8MCikem5PG0oNQYHSrt46ghvVb
ahSaT3qMC7VuzkRrJapraLKtjVaMfM4b8B/zyLOV1B9ZTMhO82o9R+XEUWRO0rXl
TpTF/Lk0hwj0ZtgQMB+uL2SqdwaxjRm/ZBbRyEalURESBJ28DjuBBd70S7Na5107
pDqZvCyC0dv3y8g/t1QL5Z5BAh+GvqtbXBLJJsSWftJl3/MscpeZiRk8xEENjPX5
rzeDtYUHab+XxCwG/rEiJXQNt3B7S5lAzQPASpzhootAjFxKy+qlroORnZ1tmy1S
fnzI/jTN4KIGJSWSV4RjW2dFeo+L4q2g5bglwqDJ6e+fI6DHils=
=wyGP
-----END PGP SIGNATURE-----

--dWYAkE0V1FpFQHQ3--
