Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8D3D71B8DBD
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:01:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZIBX (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:01:23 -0400
Received: from sauhun.de ([88.99.104.3]:43070 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726112AbgDZIBX (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:01:23 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 5199A2C01E8;
        Sun, 26 Apr 2020 10:01:21 +0200 (CEST)
Date:   Sun, 26 Apr 2020 10:01:21 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Kamal Dasu <kdasu.kdev@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        bcm-kernel-feedback-list@broadcom.com, linux-i2c@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: [PATCH] i2c: brcmstb: Fix handling of optional interrupt
Message-ID: <20200426080121.GG1262@kunai>
References: <1587850687-23675-1-git-send-email-stefan.wahren@i2se.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="JbKQpFqZXJ2T76Sg"
Content-Disposition: inline
In-Reply-To: <1587850687-23675-1-git-send-email-stefan.wahren@i2se.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--JbKQpFqZXJ2T76Sg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 25, 2020 at 11:38:07PM +0200, Stefan Wahren wrote:
> From: Dave Stevenson <dave.stevenson@raspberrypi.com>
>=20
> If there is no interrupt defined then an error is logged due
> to the use of platform_get_irq. The driver handles not having
> the interrupt by falling back to polling, therefore make
> the appropriate call when claiming it.
>=20
> Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Applied to for-next, thanks!


--JbKQpFqZXJ2T76Sg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lP9AACgkQFA3kzBSg
KbZ7iBAAjYBS14DsJeRROcVmhMYxiz/wh3pq/aNyN2EI+5xwzBolb/pXu30Y+8dZ
tQwRgKlsBHyWN5qoxYXGh76KFA4joX3p7biO5BiltTMVmumC1OvSsk9V0+7dcUeT
mnzEHmPRTa3cqNQvOy+EraIQbH+NnMLmOLSZ1Ot542bcn/pNB3GOrkfP7vsoIGzd
GwGnPsJMHTx7sUXjGy1j4Zn0YFstyImNG/ie1EetWZaQgTaxnjCTKBVQqeaYKYvU
Nr+y0j7JKaxSw2KEI1V6JGAEm8f4ZcjeJd7VvKxfj6dii/8egghskY1l6AAsIXib
vNgmqyhXPTXluNjQL50HAI1FRr6DUx8+uEOgmR5VVmcS2L2NAlfy8wjcFhmyDqN4
SOpPPLbHTSHlCcPXYKV6YWDwBLMR5SxHXTalbkkO1kBA8zYyeFN9dxRh3NFkClBP
9DCtXcN2v9qKcmDd88ZH8ZW3bT0AvqyEFrPOGCYcz+53m7izoTWG9sasX8GoqtaX
1Zh8yV1gHPFyyXI+ImAFhPVkd7kKHxcn8cOKPibO6+MuqwJKOJL/OZfS00/f+o8a
qr8esQzZPu2cMMuNiJRksBpK8E8OkpVk71HNXJIbocTYFOCng4VIhcrRsBmqqd3t
PbskfWvLXn6vWcKAevg2QmFdP6/bzLa/wey3yJ60h6nzE99IdhA=
=HQQR
-----END PGP SIGNATURE-----

--JbKQpFqZXJ2T76Sg--
