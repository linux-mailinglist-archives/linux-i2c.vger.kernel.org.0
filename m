Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66DF617F49E
	for <lists+linux-i2c@lfdr.de>; Tue, 10 Mar 2020 11:12:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726224AbgCJKMc (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Tue, 10 Mar 2020 06:12:32 -0400
Received: from sauhun.de ([88.99.104.3]:46998 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgCJKMc (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Tue, 10 Mar 2020 06:12:32 -0400
Received: from localhost (p54B33196.dip0.t-ipconnect.de [84.179.49.150])
        by pokefinder.org (Postfix) with ESMTPSA id 321342C1EB6;
        Tue, 10 Mar 2020 11:12:30 +0100 (CET)
Date:   Tue, 10 Mar 2020 11:12:29 +0100
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Eric Anholt <eric@anholt.net>, dri-devel@lists.freedesktop.org,
        linux-rpi-kernel@lists.infradead.org,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        linux-i2c@vger.kernel.org
Subject: Re: [PATCH 03/89] i2c: brcmstb: Support BCM2711 HDMI BSC controllers
Message-ID: <20200310101229.GM1987@ninjato>
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <1ed75ec6dc9310afd768c0bbfd8e73268e8cdfa9.1582533919.git-series.maxime@cerno.tech>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="bPrm2PuLP7ysUh6c"
Content-Disposition: inline
In-Reply-To: <1ed75ec6dc9310afd768c0bbfd8e73268e8cdfa9.1582533919.git-series.maxime@cerno.tech>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--bPrm2PuLP7ysUh6c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 24, 2020 at 10:06:05AM +0100, Maxime Ripard wrote:
> The HDMI blocks in the BCM2771 have an i2c controller to retrieve the
> EDID. This block is split into two parts, the BSC and the AUTO_I2C,
> lying in two separate register areas.
>=20
> The AUTO_I2C block has a mailbox-like interface and will take away the
> BSC control from the CPU if enabled. However, the BSC is the actually
> the same controller than the one supported by the brcmstb driver, and
> the AUTO_I2C doesn't really bring any immediate benefit.
>=20
> Let's use the BSC then, but let's also tie the AUTO_I2C registers with a
> separate compatible so that we can enable AUTO_I2C if needed in the
> future.
>=20
> The AUTO_I2C is enabled by default at boot though, so we first need to
> release the BSC from the AUTO_I2C control.
>=20
> Cc: Kamal Dasu <kdasu.kdev@gmail.com>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Wolfram Sang <wsa@the-dreams.de>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-i2c@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Fixed the acked-by and applied to for-next, thanks!

FYI, cppcheck rightfully warned about this in the driver:

drivers/i2c/busses/i2c-brcmstb.c:319:7: warning: Condition 'CMD_RD' is alwa=
ys true [knownConditionTrueFalse]
 if ((CMD_RD || CMD_WR) &&
      ^
drivers/i2c/busses/i2c-brcmstb.c:319:17: warning: Condition 'CMD_WR' is alw=
ays false [knownConditionTrueFalse]
 if ((CMD_RD || CMD_WR) &&
                ^
drivers/i2c/busses/i2c-brcmstb.c:464:0: warning: Variable 'len' is assigned=
 a value that is never used. [unreadVariable]
 int len =3D 0;

Not related to this patch, but maybe one of you is interested...


--bPrm2PuLP7ysUh6c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl5naAkACgkQFA3kzBSg
Kba2JQ/9HdPkWxyj7kgAVp3iCcUbIkAtwDpmrhGYLSr9AUHb+mlfe6sB92mog9+X
P3ETy/m7Gs6cwIBqlhmQuR4E0S89dDTnC1zFk+sAyQvOp1deyoTW+P3xteUyiR9W
9Y72Z2nhdTS1LouythkJled4kCfJ1PF3lst9/o1umYF5Q68akoWIGRq20MMBz80K
eEXbI5+ZfvbIfzsuD220A3v3IH+KNI9rGx8Yj7ze+B/iwmTVQd7NnEkRQdD2eAxW
yfQK9TTn+fhJWUOEJ5PvYmkYd2zfEjQQdOIdqi93nqE4w9dZ43P1YcrlPQBGqv0c
TRXyls9o1HK2iw7ISd0tZgQBAytHuaxzST+RFHjCI8tvhU48AzplJLcc1BcXixI8
9tAcRvbud+1WeOLk43q6jA+mIuV19/E88iJt2oqGMoUWOxnalSgg9vvkYS5MumZY
XenAGha5oYmvszOd9tU/cDkktv+RdMNVzpOBa2gG8uiOyaEZfGLp1vaCBra7TJLw
BZg8EzpWi6iea304u43d8P9NLfuIlNmZFTcZ7sO7UPpy9fuwaeHXRPwmIj8DmGrW
o/TNxAnkSIOhRE/f/JnhOHHJ+BM9kuSydjAr0NHi0nnBUNTQw5J9YsPWGUSUEKHP
IatOEa4v1/N5hUB+jP9YLWGUiBYU3bpuHEF70XNtg6jQVYyCj6c=
=Dx35
-----END PGP SIGNATURE-----

--bPrm2PuLP7ysUh6c--
