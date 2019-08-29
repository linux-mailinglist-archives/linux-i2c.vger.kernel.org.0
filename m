Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49193A2680
	for <lists+linux-i2c@lfdr.de>; Thu, 29 Aug 2019 20:52:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728493AbfH2Sw5 (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Thu, 29 Aug 2019 14:52:57 -0400
Received: from sauhun.de ([88.99.104.3]:42166 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727798AbfH2Sw5 (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Thu, 29 Aug 2019 14:52:57 -0400
Received: from localhost (p54B33070.dip0.t-ipconnect.de [84.179.48.112])
        by pokefinder.org (Postfix) with ESMTPSA id 362DD2C0021;
        Thu, 29 Aug 2019 20:52:56 +0200 (CEST)
Date:   Thu, 29 Aug 2019 20:52:55 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] i2c: bcm2835: Avoid clk stretch quirk for BCM2711
Message-ID: <20190829185255.GE3740@ninjato>
References: <1566925456-5928-1-git-send-email-wahrenst@gmx.net>
 <1566925456-5928-3-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+JUInw4efm7IfTNU"
Content-Disposition: inline
In-Reply-To: <1566925456-5928-3-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--+JUInw4efm7IfTNU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 27, 2019 at 07:04:15PM +0200, Stefan Wahren wrote:
> The I2C block on the BCM2711 isn't affected by the clk stretching bug.
> So there is no need to apply the corresponding quirk.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Reviewed-by: Eric Anholt <eric@anholt.net>

Applied to for-next, thanks!


--+JUInw4efm7IfTNU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl1oHwcACgkQFA3kzBSg
KbakKRAAsAY5xsvAvpGx6PZp0uRhtLlAPh4nNZEdWvXB1S/Sjc/S9+d1O7S3KgX3
vNHGjpeRfvFZmkzr7SU8z9CHlAyu+hf0shAeuZGsXM9yrnkpVJHpCMm48DzMAVr2
ud1G/bj6RvxzjyAuxtn3SL8GGsBaoDeIoz0a5GIkdDWMB2v8hBQgIWP3Ym8BRtE2
5Pq9h445Ol2jtSlxiVKbxLTicqccywapHyfIX4k3k6x7F80Savl8AuaBKCU5bznC
j/USjoIqbtf8nEN6OzZj8ig6M320aggv2PW3UbLAEsZ2M9uUtyIuwWcmGFiOucOP
0c3Hb6/mD2o+Shn/iS3Qp6+LIRVFOM0o/+aJawq2Aw8eAV6X5tzVE2RqvSff+X/p
MHwq5ikdcj+4/XKgg8Ab/d4DZ2tK8I8I0am3FcU4MeU0jjbFyut0+AdlND8Zw3oE
8p5ATq0GtMxWZ7YkbCvPG6uLmDdBQG/5uO/33TmkV+W6JuWaXk8jrf8/yChD2XY2
EajubuqcvJNzXemPOTBkk0cr26debd2eFa0V094fEZU05yn3CvonNA8bQOECS5ob
ZqG19+uOx8bP9DayagPKSxY7MPpuu/3xaofW+OgJD6LqhgoSGCOGsI9LJcx9K8RU
pxcJ0yEQPN/0H/ZfWOe3wZh9sBxH5UhcAVmkeAo1Jb9lr7F4RvE=
=MKy2
-----END PGP SIGNATURE-----

--+JUInw4efm7IfTNU--
