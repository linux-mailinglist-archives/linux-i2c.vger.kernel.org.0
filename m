Return-Path: <linux-i2c-owner@vger.kernel.org>
X-Original-To: lists+linux-i2c@lfdr.de
Delivered-To: lists+linux-i2c@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 30EB8C11B9
	for <lists+linux-i2c@lfdr.de>; Sat, 28 Sep 2019 20:23:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726155AbfI1SXv (ORCPT <rfc822;lists+linux-i2c@lfdr.de>);
        Sat, 28 Sep 2019 14:23:51 -0400
Received: from sauhun.de ([88.99.104.3]:36574 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726026AbfI1SXv (ORCPT <rfc822;linux-i2c@vger.kernel.org>);
        Sat, 28 Sep 2019 14:23:51 -0400
Received: from localhost (unknown [46.183.103.17])
        by pokefinder.org (Postfix) with ESMTPSA id D75272C0489;
        Sat, 28 Sep 2019 20:23:48 +0200 (CEST)
Date:   Sat, 28 Sep 2019 20:23:43 +0200
From:   Wolfram Sang <wsa@the-dreams.de>
To:     Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
Cc:     Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        Michael Cheng <ccheng@broadcom.com>,
        Shreesha Rajashekar <shreesha.rajashekar@broadcom.com>,
        Lori Hikichi <lori.hikichi@broadcom.com>,
        linux-i2c@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Icarus Chau <icarus.chau@broadcom.com>,
        Ray Jui <ray.jui@broadcom.com>,
        Shivaraj Shetty <sshetty1@broadcom.com>
Subject: Re: [PATCH v2 1/1] i2c: iproc: Add i2c repeated start capability
Message-ID: <20190928181910.GB12219@kunai>
References: <1569472808-15284-1-git-send-email-rayagonda.kokatanur@broadcom.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="yLVHuoLXiP9kZBkt"
Content-Disposition: inline
In-Reply-To: <1569472808-15284-1-git-send-email-rayagonda.kokatanur@broadcom.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-i2c-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-i2c.vger.kernel.org>
X-Mailing-List: linux-i2c@vger.kernel.org


--yLVHuoLXiP9kZBkt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 26, 2019 at 10:10:08AM +0530, Rayagonda Kokatanur wrote:
> From: Lori Hikichi <lori.hikichi@broadcom.com>
>=20
> Enable handling of i2c repeated start. The current code
> handles a multi msg i2c transfer as separate i2c bus
> transactions. This change will now handle this case
> using the i2c repeated start protocol. The number of msgs
> in a transfer is limited to two, and must be a write
> followed by a read.
>=20
> Signed-off-by: Lori Hikichi <lori.hikichi@broadcom.com>
> Signed-off-by: Rayagonda Kokatanur <rayagonda.kokatanur@broadcom.com>
> Signed-off-by: Icarus Chau <icarus.chau@broadcom.com>
> Signed-off-by: Ray Jui <ray.jui@broadcom.com>
> Signed-off-by: Shivaraj Shetty <sshetty1@broadcom.com>
> ---
> changes from v1:
>  - Address code review comment from Wolfram Sang

No, sorry, this is not a proper changelog. I review so many patches, I
can't recall what I suggested to do for every patch. Please describe
what changes you actually made. It is also better when digging through
mail archives.


--yLVHuoLXiP9kZBkt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAl2PpSwACgkQFA3kzBSg
KbadWBAAsEsPbvgqUxIfN2/lLOcJlf8l/MNqDio3L5sdrExhkEckEd879vd65rgh
rw+dKI3vJMG2SDDa32bM0HZrqLLEhOa0aQQr0KFQeO3mPA/drLlz/9djjJOJNeE3
EorXS2QIIKzWZDXF7MSbQ2d60fXUmKEEwm0K+uHO+bzyrlh7WPeri2k4DNnYRmDn
uLqggb4V1mmXpZ24npue0GYXJY8hyIWbWtXXHFFJHvBa3ngZIb3n7xrgBsFbCvdN
u3xjTT/DVgQf/RyVY/Fz7CNBkdqRm4jHTl+4wWC3EsULkV1fsOwS62JQynmfc99u
AJJYoUGUtaDKAqVdwOfzfnUdQD5v7hkLVZfMKtNZum84+JLXwMC6RdvIhvoaBTSt
6MpQtFufIcHHovxFUfg9vpU+qZNOpDEaQO6Aw+gzax1zi6qUvgW4TE4Ow8vfvmYP
xYkERkVaSL7BtyPsLQkRwW3AeT50kA0ZbuzUZf4/0yKBCKmSy4BdA7tin8AbvIQS
z8+IluQjP2lKJIdZPMEH/R7X8gr+pcHRsaF/Bp/SLcU0+TADW4nCUmLiyxsO9Mba
Kr0WHFtoITKyHkXgE+cTSFpHQsZPAF2jqacyN6TblPIFYo6RAjJ+KsWaY52gFY4M
lVjKa3uSSS3hCwwA3gHzr7bMFpghhOTdIipU+zefg00lPxyVYEg=
=9s1s
-----END PGP SIGNATURE-----

--yLVHuoLXiP9kZBkt--
