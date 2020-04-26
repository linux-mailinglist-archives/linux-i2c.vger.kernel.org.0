Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C11751B8DFA
	for <lists+linux-i2c@lfdr.de>; Sun, 26 Apr 2020 10:36:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZIgm (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sun, 26 Apr 2020 04:36:42 -0400
Received: from sauhun.de ([88.99.104.3]:43722 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726108AbgDZIgm (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sun, 26 Apr 2020 04:36:42 -0400
Received: from localhost (p54B33954.dip0.t-ipconnect.de [84.179.57.84])
        by pokefinder.org (Postfix) with ESMTPSA id 053682C01E8;
        Sun, 26 Apr 2020 10:36:40 +0200 (CEST)
Date:   Sun, 26 Apr 2020 10:36:40 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Nishka Dasgupta <nishkadg.linux@gmail.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] i2c: iproc: add support for SMBUS quick cmd
Message-ID: <20200426083640.GL1262@kunai>
References: <20200322182322.32743-1-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="Mit9XoPEfICDqq/V"
Content-Disposition: inline
In-Reply-To: <20200322182322.32743-1-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--Mit9XoPEfICDqq/V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 22, 2020 at 11:53:22PM +0530, Rayagonda Kokatanur wrote:
> Add support for SMBUS quick command.
>=20
> SMBUS quick command passes single bit of information to the
> slave (target) device. Can be used to turn slave device on or off.
>=20
> By default i2c_detect tool uses the smbus quick cmd to try and
> detect devices. Without this support it will not detect some slaves.
>=20
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>

Applied to for-next, thanks!


--Mit9XoPEfICDqq/V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl6lSBgACgkQFA3kzBSg
KbYYOA/6AyrhSngSgj8qaJ4zJiG8bqKNM4s9VVcCvPx3Sjk/eBpJDsSRMqNcfSC6
v8QB725LmkMCWMVEmJNAkK5Al2T9PlXI65y9SyDmTPnPIK0orB57pMVFCMseagdO
xesQaZ88fH7jv/tdNAVvveM5OelxSnUQzBJXTXWdlNJhq9XcjInooCD6BhZD1w1x
Dmjh8F1agNuIsENeqDh1s8SraKIa2JJMehmJ99l3GtIr+z/MbSp6khJ7VSoXWOco
D65Oke8Y5r24qYIAQGxMpva4yWxsFvIZDKift2sogXVoVx9nEkwhkd0BtCPge6z/
tYF+WRy+4FU53zE5VLlRztRmXZd/RPGRkBk0dSFyPllfMH6dynVIPE+V3qWM+ZEw
R5/yvAr0JuvVrHOZJCqYyXV8jNTK9/8mcgj7UEk4Ywv2Iz79g3WnR7H/6fBMCNsW
0v5Xj14KMX359Zn3Msa2JbKR+q79JAXMcc5bFLPxMZ9MJP6GjmWyxPi2GyFx8jhB
MrCrnPrh96iOcg7IxoG4BfIvRg6ZMdyGU3WwzwpwRqcAl7TIYK2FJPqMPgdB+0+J
k1S/dW/u5JTd4AO4rTsGIOIvNuVDHJGNdOrWy84W0spnghOZKRq1IPZtlakL7kD3
2/9Hzd6UBjjtW8M3UPteVeUYmOAFCzMq+T2Q9H8e+djgAMETcwQ=
=YxWx
-----END PGP SIGNATURE-----

--Mit9XoPEfICDqq/V--
